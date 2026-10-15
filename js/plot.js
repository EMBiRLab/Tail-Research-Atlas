/* ============================================================================
 * plot.js — The circular research map (dependency-free SVG)
 *
 * Angular axis : research field — each field owns one sector of the circle.
 *                A paper sits in the sector of its top-voted field (with a
 *                stable jitter so dots don't stack).
 * Radial axis  : taxonomic breadth on a LOG scale. A single-species study sits
 *                at the rim; broad comparative studies sit toward the center.
 *                The stored value is `position.y` in [0,1] = log-normalized
 *                species count (see BID.speciesToY / BID.yToSpecies in data.js),
 *                so r = R * (1 - y).
 * ==========================================================================*/

(function (global) {
  "use strict";

  const SVGNS = "http://www.w3.org/2000/svg";
  const VIEW = { w: 840, h: 700 }; // wider than tall so long side labels never clip
  const CX = VIEW.w / 2, CY = VIEW.h / 2;
  const R = 240;             // rim radius
  const LABEL_R = R + 28;    // field labels sit just outside the rim
  const START = -Math.PI / 2; // first sector begins at 12 o'clock, clockwise
  const RING_N = [1, 3, 10, 30, 100]; // species-count guide rings

  function el(name, attrs, text) {
    const n = document.createElementNS(SVGNS, name);
    if (attrs) for (const k in attrs) n.setAttribute(k, attrs[k]);
    if (text != null) n.textContent = text;
    return n;
  }
  function polar(a, r) { return { x: CX + r * Math.cos(a), y: CY + r * Math.sin(a) }; }
  // stable 0..1 jitter from a string id (so a paper never jumps between renders)
  function hash01(s) {
    let h = 0;
    for (let i = 0; i < s.length; i++) h = (h * 31 + s.charCodeAt(i)) | 0;
    return (h >>> 0) / 4294967295;
  }
  function escapeHtml(s) {
    return String(s == null ? "" : s).replace(/&/g, "&amp;").replace(/</g, "&lt;")
      .replace(/>/g, "&gt;").replace(/"/g, "&quot;");
  }

  const Plot = {
    render(container, papers, opts) {
      opts = opts || {};
      const cats = global.BID.CATEGORIES;
      const catById = global.BID.CATEGORY_BY_ID;
      const n = cats.length, sw = (2 * Math.PI) / n;

      container.innerHTML = "";
      container.style.position = "relative";
      const svg = el("svg", { viewBox: "0 0 " + VIEW.w + " " + VIEW.h, class: "bid-plot-svg",
        role: "img", "aria-label": "Circular map of tail research by field and taxonomic breadth" });

      // background disk + rim FIRST so nothing drawn later gets painted over
      svg.appendChild(el("circle", { cx: CX, cy: CY, r: R, class: "bid-plot-frame", fill: "none" }));
      const dividers = [];
      // --- sectors (one per field): light wedge fill, divider, outer label ---
      cats.forEach((c, i) => {
        const a0 = START + i * sw, a1 = a0 + sw;
        const p0 = polar(a0, R), p1 = polar(a1, R);
        svg.appendChild(el("path", {
          d: "M" + CX + "," + CY + " L" + p0.x + "," + p0.y +
             " A" + R + "," + R + " 0 0 1 " + p1.x + "," + p1.y + " Z",
          fill: c.color, "fill-opacity": "0.07", stroke: "none",
        }));
        dividers.push(el("line", { x1: CX, y1: CY, x2: p0.x, y2: p0.y, stroke: "#c9ced6", "stroke-width": "1.2" }));
        const lp = polar(a0 + sw / 2, LABEL_R);
        // anchor labels away from the circle so they don't overlap the rim
        const cos = Math.cos(a0 + sw / 2);
        const anchor = Math.abs(cos) < 0.25 ? "middle" : cos > 0 ? "start" : "end";
        svg.appendChild(el("text", { x: lp.x, y: lp.y + 4, class: "bid-cat-label", fill: c.color,
          "text-anchor": anchor, style: "opacity:0.9;font-size:15px" }, (c.short || c.name)));
      });

      dividers.forEach((d) => svg.appendChild(d)); // on top of the wedge tints
      // --- concentric guide rings = species count (log scale) ---
      RING_N.forEach((N) => {
        const r = R * (1 - global.BID.speciesToY(N));
        if (r > 2) svg.appendChild(el("circle", { cx: CX, cy: CY, r: r, stroke: "#c9ced6", "stroke-width": "1.2", fill: "none" }));
        const lab = N === 1 ? "1 species" : N === 100 ? "100+" : String(N);
        // ring ticks run up the 12 o'clock spoke (a sector boundary, so no label collisions)
        svg.appendChild(el("text", { x: CX + 6, y: CY - r - 4, class: "bid-axis-end", "text-anchor": "start", style: "font-size:12px" }, lab));
      });
      svg.appendChild(el("text", { x: CX, y: VIEW.h - 8, class: "bid-axis-title", "text-anchor": "middle" },
        "Radius = species per study (log scale): single species at the rim, broad comparative at the center"));

      // --- tooltip ---
      const tip = document.createElement("div");
      tip.className = "bid-plot-tip"; tip.style.display = "none";
      container.appendChild(tip);
      function showTip(html, cx, cy) {
        tip.innerHTML = html; tip.style.display = "block";
        const rect = svg.getBoundingClientRect();
        tip.style.left = cx * (rect.width / VIEW.w) + 12 + "px";
        tip.style.top = cy * (rect.height / VIEW.h) - 10 + "px";
      }
      function hideTip() { tip.style.display = "none"; }

      // --- dots ---
      papers.filter((p) => p.position).forEach((p) => {
        const fi = Math.max(0, cats.findIndex((c) => c.id === p.topCategory));
        const color = p.topCategory ? catById[p.topCategory].color : "#999";
        const a = START + fi * sw + sw / 2 + (hash01(p.id) - 0.5) * sw * 0.72;
        const r = Math.max(0, Math.min(R, R * (1 - p.position.y)));
        const pos = polar(a, r);
        const rad = 6 + Math.min(6, (p.suggestionCount - 1) * 1.2);
        const dot = el("circle", { cx: pos.x, cy: pos.y, r: rad, fill: color,
          class: "bid-dot" + (opts.selectedId === p.id ? " is-selected" : ""),
          "data-id": p.id, tabindex: "0", role: "button", "aria-label": p.label });
        const topName = p.topCategory ? catById[p.topCategory].name : "unclassified";
        const sp = global.BID.yToSpecies(p.position.y);
        const tipHtml = "<strong>" + escapeHtml(p.label) + "</strong><br>" +
          '<span style="color:' + color + '">&#9679;</span> ' + escapeHtml(topName) +
          "<br><span class='bid-tip-meta'>~" + sp + " species &middot; " + p.suggestionCount +
          " classification" + (p.suggestionCount === 1 ? "" : "s") + " &middot; " +
          p.commentCount + " comment" + (p.commentCount === 1 ? "" : "s") + "</span>";
        dot.addEventListener("mouseenter", () => showTip(tipHtml, pos.x, pos.y));
        dot.addEventListener("mousemove", () => showTip(tipHtml, pos.x, pos.y));
        dot.addEventListener("mouseleave", hideTip);
        dot.addEventListener("click", () => { hideTip(); if (opts.onSelect) opts.onSelect(p.id); });
        dot.addEventListener("keydown", (e) => {
          if (e.key === "Enter" || e.key === " ") { e.preventDefault(); if (opts.onSelect) opts.onSelect(p.id); }
        });
        svg.appendChild(dot);
      });

      container.appendChild(svg);
    },
  };

  global.BID = global.BID || {};
  global.BID.Plot = Plot;
})(window);
