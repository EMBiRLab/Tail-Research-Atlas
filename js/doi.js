/* ============================================================================
 * doi.js — Identifier validation + metadata lookup (DOI via Crossref, ISBN via
 * Open Library). Both APIs are free, keyless, and CORS-friendly.
 *
 * Exposes BID.doi = { normalizeDoi, normalizeIsbn, parseIdentifier,
 *                     identifierLink, lookupDoi, lookupIsbn, makeLabel }.
 * ==========================================================================*/

(function (global) {
  "use strict";

  const MAILTO = "taliaym@umich.edu";

  // Bare DOI, "doi:" prefix, or doi.org URL -> "10.xxxx/..." or null.
  function normalizeDoi(s) {
    s = String(s || "").trim();
    s = s.replace(/^\s*doi:\s*/i, "");
    s = s.replace(/^https?:\/\/(dx\.)?doi\.org\//i, "");
    s = s.trim();
    return /^10\.\d{4,9}\/\S+$/.test(s) ? s : null;
  }

  // ISBN-10 or ISBN-13; tolerates hyphens, spaces and an "ISBN:" prefix.
  function normalizeIsbn(s) {
    s = String(s || "").trim().replace(/^\s*isbn[-:\s]*/i, "").replace(/[-\s]/g, "").toUpperCase();
    if (/^\d{13}$/.test(s)) return s;
    if (/^\d{9}[\dX]$/.test(s)) return s;
    return null;
  }

  // Free-form identifier -> { kind: "doi"|"isbn", value } or null.
  function parseIdentifier(s) {
    const d = normalizeDoi(s); if (d) return { kind: "doi", value: d };
    const i = normalizeIsbn(s); if (i) return { kind: "isbn", value: i };
    return null;
  }

  function identifierLink(doi, isbn) {
    if (doi) return "https://doi.org/" + doi;
    if (isbn) return "https://openlibrary.org/isbn/" + isbn;
    return "";
  }

  // Compact citation label, e.g. "Kriegman et al. (2020)".
  function makeLabel(firstAuthor, year, authorCount) {
    const a = String(firstAuthor || "").trim();
    if (!a) return year ? "(" + year + ")" : "Untitled";
    const etal = authorCount === 1 ? "" : " et al.";
    return a + etal + (year ? " (" + year + ")" : "");
  }

  async function lookupDoi(rawDoi) {
    const doi = normalizeDoi(rawDoi);
    if (!doi) throw new Error("That doesn't look like a DOI (expected e.g. 10.1234/abcd).");
    const url = "https://api.crossref.org/works/" + encodeURIComponent(doi) + "?mailto=" + encodeURIComponent(MAILTO);
    let res;
    try { res = await fetch(url, { headers: { Accept: "application/json" } }); }
    catch (e) { throw new Error("Could not reach the DOI service (offline?). You can type the details in manually."); }
    if (res.status === 404) throw new Error("No paper found for that DOI. Check it, or type the details in manually.");
    if (!res.ok) throw new Error("DOI lookup failed (HTTP " + res.status + "). Try again, or type the details in manually.");
    const m = (await res.json()).message || {};
    const authors = (m.author || []).map((a) => ({ family: a.family || "", given: a.given || "", seq: a.sequence }));
    const first = authors.filter((a) => a.seq === "first")[0] || authors[0];
    const dp = (m.issued && m.issued["date-parts"] && m.issued["date-parts"][0]) ||
      (m.published && m.published["date-parts"] && m.published["date-parts"][0]) ||
      (m["published-print"] && m["published-print"]["date-parts"] && m["published-print"]["date-parts"][0]) || [];
    return { doi, isbn: "", title: (m.title && m.title[0]) || "", firstAuthor: first ? (first.family || first.given || "") : "",
      year: dp[0] || null, journal: (m["container-title"] && m["container-title"][0]) || "", authorCount: authors.length, type: m.type || "" };
  }

  async function lookupIsbn(rawIsbn) {
    const isbn = normalizeIsbn(rawIsbn);
    if (!isbn) throw new Error("That doesn't look like an ISBN (10 or 13 digits).");
    const url = "https://openlibrary.org/api/books?bibkeys=ISBN:" + isbn + "&format=json&jscmd=data";
    let res;
    try { res = await fetch(url, { headers: { Accept: "application/json" } }); }
    catch (e) { throw new Error("Could not reach Open Library (offline?). You can type the details in manually."); }
    if (!res.ok) throw new Error("ISBN lookup failed (HTTP " + res.status + "). Type the details in manually.");
    const b = (await res.json())["ISBN:" + isbn];
    if (!b) throw new Error("No book found for that ISBN. Check it, or type the details in manually.");
    const authors = b.authors || [];
    const full = authors[0] ? String(authors[0].name || "").trim() : "";
    const yearM = String(b.publish_date || "").match(/\d{4}/);
    return { doi: "", isbn, title: b.title || "", firstAuthor: full ? full.split(/\s+/).pop() : "",
      year: yearM ? Number(yearM[0]) : null, journal: (b.publishers && b.publishers[0] && b.publishers[0].name) || "",
      authorCount: authors.length, type: "book" };
  }

  global.BID = global.BID || {};
  global.BID.doi = { normalizeDoi, normalizeIsbn, parseIdentifier, identifierLink, lookupDoi, lookupIsbn, makeLabel };
})(window);
