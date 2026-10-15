/* ============================================================================
 * data.js — Research fields, the species-breadth scale, and seed papers
 *
 * TAIL RESEARCH ATLAS — a circular map of biological research on tails.
 *
 * Angular axis : research field (one sector per field, below).
 * Radial axis  : taxonomic breadth on a LOG scale. A single-species study sits
 *                at the rim; broad comparative studies sit toward the center.
 *
 * Storage note: each classification stores y = log-normalized species count
 * (0 = 1 species at the rim, 1 = SPECIES_MAX+ at the center) and a set of
 * field tags. `x` is unused (kept at 0.5) so the data layer and database
 * views are unchanged from the original atlas. A paper's radius is the mean
 * of its classifications' y (= geometric mean of species counts).
 * ==========================================================================*/

(function (global) {
  "use strict";

  // ---- species-breadth scale (log) ----------------------------------------
  const SPECIES_MAX = 100; // 100+ species maps to the exact center
  function speciesToY(n) {
    n = Number(n);
    if (!isFinite(n) || n < 1) n = 1;
    return Math.max(0, Math.min(1, Math.log10(n) / Math.log10(SPECIES_MAX)));
  }
  function yToSpecies(y) {
    y = Math.max(0, Math.min(1, Number(y) || 0));
    return Math.round(Math.pow(10, y * Math.log10(SPECIES_MAX)));
  }

  const AXES = {
    x: { label: "Research field", low: "", high: "" },
    y: { label: "Species per study (log)", low: "1 (rim)", high: "100+ (center)" },
  };

  // ---- The six research fields (sector order, clockwise from 12 o'clock) ---
  const CATEGORIES = [
    { id: "morphology", name: "Comparative anatomy & morphology", short: "Morphology", color: "#2F6DB5",
      blurb: "Descriptive and comparative anatomy of tail skeleton, musculature and soft tissue across taxa." },
    { id: "evolution", name: "Evolution & paleontology", short: "Evolution", color: "#7B5EA7",
      blurb: "Macroevolution of tail form and function; fossil and phylogenetic comparative studies." },
    { id: "development", name: "Development", short: "Development", color: "#2E7D5B",
      blurb: "Embryology of the tail bud, somitogenesis, axial elongation and tail regression." },
    { id: "biomechanics", name: "Biomechanics & locomotion", short: "Biomechanics", color: "#E07B39",
      blurb: "Tail function in balance, righting, leaping, climbing and other locomotor tasks." },
    { id: "behavior", name: "Behavior & experimental manipulation", short: "Behavior & experiment", color: "#C0397A",
      blurb: "Behavioral roles of the tail and experimental manipulations such as tail removal." },
    { id: "engineering", name: "Bio-inspired engineering", short: "Engineering", color: "#4FA3A5",
      blurb: "Robotic and engineered systems informed by tail anatomy and function." },
  ];
  const CATEGORY_BY_ID = {};
  CATEGORIES.forEach((c) => (CATEGORY_BY_ID[c.id] = c));

  // ---- Seed papers ----------------------------------------------------------
  // p(id, label, year, fields, speciesCount, doi, title, blurb)
  // Species counts are seed ESTIMATES (1 = single species); the community can
  // revise them. Entries without a DOI say so — edit the paper to add it.
  const NO = "Seed entry — DOI not yet confirmed; edit this paper to add it.";
  function p(id, label, year, cats, species, doi, title, blurb) {
    return {
      id, label, year,
      doi: doi || "", title: title || "",
      firstAuthor: label.split(/[ (&,]/)[0],
      link: doi ? "https://doi.org/" + doi : "",
      blurb: blurb || (doi ? "" : NO),
      seed: true,
      seedSuggestion: { x: 0.5, y: speciesToY(species), categories: cats },
    };
  }

  const SEED_PAPERS = [
    // --- Comparative anatomy & morphology ---
    p("flower1876", "Flower (1876)", 1876, ["morphology"], 20, "", "An Introduction to the Osteology of the Mammalia", "Book, 2nd ed., Macmillan & Co., London. No DOI (add an ISBN of a reprint if you like)."),
    p("schmidt1886", "Schmidt (1886)", 1886, ["morphology"], 20),
    p("ankel1965", "Ankel (1965)", 1965, ["morphology"], 20, "10.1159/000155038", "Der Canalis Sachaus Als Indikator F\u00fcr Die L\u00e4nge Der Caudalregion Der Primaten", "Folia Primatologica"),
    p("ankel1972", "Ankel (1972)", 1972, ["morphology"], 20, "", "Vertebral morphology of fossil and extant primates", "Chapter in The Functional and Evolutionary Biology of Primates (R. Tuttle, ed.), Aldine-Atherton, pp. 223\u2013240. No DOI."),
    p("hildebrand1974", "Hildebrand (1974)", 1974, ["morphology"], 20, "", "Analysis of Vertebrate Structure", "Textbook, Wiley (1st ed. 1974; later editions exist). No DOI \u2014 add the ISBN of your edition."),
    p("german1982", "German (1982)", 1982, ["morphology"], 20, "10.1002/ajpa.1330580414", "The functional morphology of caudal vertebrae in new world monkeys", "American Journal of Physical Anthropology"),
    p("shapiro1993", "Shapiro (1993)", 1993, ["morphology"], 20, "", "Functional morphology of the vertebral column in primates", "Chapter in Postcranial Adaptation in Nonhuman Primates (D. Gebo, ed.), Northern Illinois Univ. Press, pp. 121\u2013149. No DOI."),
    p("lemelin1995", "Lemelin (1995)", 1995, ["morphology"], 5, "10.1002/jmor.1052240308",
      "Comparative and functional myology of the prehensile tail in New World monkeys", "J. Morphology"),
    p("argot2003", "Argot (2003)", 2003, ["morphology"], 10, "10.1002/jmor.10062", "Functional\u2010adaptive anatomy of the axial skeleton of some extant marsupials and the paleobiology of the paleocene marsupials <i>mayulestes ferox</i> and <i>pucadelphys andinus</i>", "Journal of Morphology"),
    p("schmitt2005", "Schmitt et al. (2005)", 2005, ["morphology", "biomechanics"], 4, "10.1002/ajpa.20075",
      "Role of the prehensile tail during ateline locomotion: Experimental and comparative evidence", "Am. J. Phys. Anthropol."),
    p("russo2011", "Russo & Young (2011)", 2011, ["morphology"], 1, "10.1002/ajpa.21617",
      "Tail growth tracks the ontogeny of prehensile tail use in capuchin monkeys", "Am. J. Phys. Anthropol."),
    p("russo2015", "Russo et al. (2015)", 2015, ["morphology", "biomechanics"], 2, "10.1002/jez.1948",
      "Tail function during arboreal quadrupedalism in squirrel monkeys and tamarins", "J. Exp. Zool. (Young, Russo et al.)"),
    p("mincer2020", "Mincer & Russo (2020)", 2020, ["morphology", "evolution"], 100, "10.1098/rspb.2019.2885",
      "Substrate use drives the macroevolution of mammalian tail length diversity", "Proc. R. Soc. B"),
    p("weichert1970", "Weichert (1970)", 1970, ["morphology"], 1, "", "Anatomy of the Chordates", "Textbook, 4th ed., McGraw-Hill (cited for the pangolin / scaly anteater tail). No DOI \u2014 add the ISBN."),

    // --- Evolution & paleontology ---
    p("organ2007", "Organ (2007)", 2007, ["evolution"], 20, "", "The functional anatomy of prehensile and nonprehensile tails of the Platyrrhini (Primates) and Procyonidae (Carnivora)", "PhD dissertation, Johns Hopkins University School of Medicine. No DOI."),
    p("organ2009", "Organ et al. (2009)", 2009, ["evolution", "morphology"], 8, "10.1002/ar.20886",
      "Functional correlates of fiber architecture of the lateral caudal musculature in prehensile and nonprehensile tails", "Anat. Rec."),
    p("organ2010", "Organ et al. (2010)", 2010, ["evolution"], 20, "10.1002/ar.21132",
      "From Head to Tail: New models and approaches in primate functional anatomy and biomechanics", "Anat. Rec."),

    // --- Development ---
    p("schoenwolf1984", "Schoenwolf (1984)", 1984, ["development"], 1, "10.1002/aja.1001690402", "Histological and ultrastructural studies of secondary neurulation in mouse embryos", "American Journal of Anatomy"),
    p("deutsch1988", "Deutsch (1988)", 1988, ["development"], 1, "10.1016/0092-8674(88)90577-6", "Pax 1, a member of a paired box homologous murine gene family, is expressed in segmented structures during development", "Cell"),
    p("fan1994", "Fan (1994)", 1994, ["development"], 1, "10.1016/0092-8674(94)90009-4", "Patterning of mammalian somites by surface ectoderm and notochord: Evidence for sclerotome induction by a hedgehog homolog", "Cell"),
    p("johnson1994", "Johnson (1994)", 1994, ["development"], 1, "10.1016/0092-8674(94)90008-6", "Ectopic expression of Sonic hedgehog alters dorsal-ventral patterning of somites", "Cell"),
    p("fan1995", "Fan (1995)", 1995, ["development"], 1, "10.1016/0092-8674(95)90398-4", "Long-range sclerotome induction by sonic hedgehog: Direct role of the amino-terminal cleavage product and modulation by the cyclic AMP signaling pathway", "Cell"),
    p("ebensperger1995", "Ebensperger (1995)", 1995, ["development"], 1, "10.1007/bf00534682", "Pax-1, a regulator of sclerotome development is induced by notochord and floor plate signals in avian embryos", "Anatomy and Embryology"),
    p("muller1996", "Muller (1996)", 1996, ["development"], 1, "", "", "Likely: M\u00fcller et al., 'Expression of avian Pax1 and Pax9 in the sclerotome\u2026', Dev. Biol. 178:403\u2013417 (1996) \u2014 title from memory, please verify."),
    p("mcmahon1998", "McMahon (1998)", 1998, ["development"], 1, "10.1101/gad.12.10.1438", "Noggin-mediated antagonism of BMP signaling is required for growth and patterning of the neural tube and\u2009somite", "Genes &amp; Development"),
    p("christ2004", "Christ et al. (2004)", 2004, ["development"], 1, "10.1016/j.ydbio.2004.03.016",
      "Wnt 6 regulates the epithelialisation process of the segmental plate mesoderm", "Dev. Biol. (Schmidt, Christ et al.)"),
    p("williams2019", "Williams et al. (2019)", 2019, ["development"], 1, "10.1016/bs.ctdb.2018.11.018", "Development of the axial skeleton and intervertebral disc", "Current Topics in Developmental Biology"),
    p("tani2020", "Tani et al. (2020)", 2020, ["development"], 1, "10.1038/s12276-020-0482-1", "Understanding paraxial mesoderm development and sclerotome specification for skeletal repair", "Experimental &amp; Molecular Medicine"),
    p("draga2023", "Draga & Scaal (2023)", 2023, ["development"], 1),

    // --- Biomechanics & locomotion ---
    p("bartholomew1951", "Bartholomew & Caswell (1951)", 1951, ["biomechanics"], 1, "10.2307/1375371", "Locomotion in Kangaroo Rats and Its Adaptive Significance", "Journal of Mammalogy"),
    p("kane1969", "Kane & Scher (1969)", 1969, ["biomechanics"], 1, "10.1016/0020-7683(69)90086-9",
      "A dynamical explanation of the falling cat phenomenon", "Int. J. Solids Struct."),
    p("dunbar1988", "Dunbar (1988)", 1988, ["biomechanics"], 2, "10.1002/ajp.1350160402",
      "Aerial maneuvers of leaping lemurs: The physics of whole-body rotations while airborne", "Am. J. Primatol."),
    p("arabyan1998", "Arabyan & Tsai (1998)", 1998, ["biomechanics"], 1, "10.1007/s004220050488",
      "A distributed control model for the air-righting reflex of a cat", "Biol. Cybern."),
    p("shinohara1999", "Shinohara (1999)", 1999, ["biomechanics", "morphology"], 1, "10.2535/ofaj1936.76.4_157",
      "The musculature of the mouse tail is characterized by metameric arrangements", "Okajimas Folia Anat. Jpn."),
    p("essner2002", "Essner (2002)", 2002, ["biomechanics"], 3, "10.1242/jeb.205.16.2469",
      "Three-dimensional launch kinematics in leaping, parachuting and gliding squirrels", "J. Exp. Biol."),
    p("whitford2017", "Whitford et al. (2017)", 2017, ["biomechanics"], 1, "10.1016/j.anbehav.2017.06.004", "Avoiding the serpent's tooth: predator\u2013prey interactions between free-ranging sidewinder rattlesnakes and desert kangaroo rats", "Animal Behaviour"),
    p("fukushima2021", "Fukushima et al. (2021)", 2021, ["biomechanics"], 1, "10.1093/icb/icab023",
      "Inertial tail effects during righting of squirrels in unexpected falls", "Integr. Comp. Biol."),
    p("fu2025", "Fu (2025)", 2025, ["biomechanics"], 1),

    // --- Behavior & experimental manipulation ---
    p("buck1925", "Buck et al. (1925)", 1925, ["behavior", "biomechanics"], 1, "10.2307/1373415",
      "The tail as a balancing organ in mice", "J. Mammalogy"),
    p("horner1954", "Horner (1954)", 1954, ["behavior"], 1, "", "Arboreal adaptations of Peromyscus, with special reference to use of the tail", "Contributions from the Laboratory of Vertebrate Biology, University of Michigan, no. 61, pp. 1\u201385. No DOI."),
    p("siegel1970", "Siegel (1970)", 1970, ["behavior", "biomechanics"], 1, "10.1002/ajpa.1330330113",
      "The tail, locomotion and balance in mice", "Am. J. Phys. Anthropol. — mice with tails removed"),
    p("igarashi1981", "Igarashi et al. (1981)", 1981, ["behavior"], 1, "10.3109/00016488109138525",
      "Volumetric and dimensional measurements of vestibular structures in the squirrel monkey",
      "Verify: this match may be the vestibular paper rather than the tail-manipulation study."),
    p("hamada2012", "Hamada et al. (2012)", 2012, ["behavior", "morphology"], 2, "10.1007/s10329-012-0317-3",
      "Variability of tail length in hybrids of the Japanese macaque and the Taiwanese macaque", "Primates"),

    // --- Bio-inspired engineering ---
    p("miyamae2026", "Miyamae et al. (2026)", 2026, ["engineering", "morphology"], 1, "10.64898/2026.06.21.733634",
      "Specializations in tail anatomy of the lesser Egyptian jerboa", "bioRxiv preprint"),
  ];

  global.BID = global.BID || {};
  global.BID.AXES = AXES;
  global.BID.CATEGORIES = CATEGORIES;
  global.BID.CATEGORY_BY_ID = CATEGORY_BY_ID;
  global.BID.SEED_PAPERS = SEED_PAPERS;
  global.BID.SPECIES_MAX = SPECIES_MAX;
  global.BID.speciesToY = speciesToY;
  global.BID.yToSpecies = yToSpecies;
})(window);
