# Tail Research Atlas

A community-curated database, discussion board, and **circular map** of
biological research on tails. Built from the same code as the Bio-Inspired
Design Atlas, with a different plot:

- **Around the circle — research field.** Six sectors: Comparative anatomy &
  morphology · Evolution & paleontology · Development · Biomechanics &
  locomotion · Behavior & experimental manipulation · Bio-inspired engineering.
  Edit the list in `js/data.js` (`CATEGORIES`).
- **Toward the center — taxonomic breadth (log scale).** A single-species study
  sits at the rim; the more species a paper compares, the closer to the center
  (100+ species = center). Each classification records **how many species the
  paper studied**; a paper's radius is the geometric mean across all its
  classifications.

Submissions take a **DOI or an ISBN** (books), or neither for older works that have no identifier; duplicates are caught on whichever identifier is given.

Everything else — DOI/ISBN-checked submissions, Reddit-style discussion, voting,
owner-only editing, Google sign-in — works as in the first atlas.

## Run it
- Double-click **`standalone.html`** (single file, no server), or
- `python3 -m http.server 8124` in this folder → http://localhost:8124

Starts with **67 seed papers**: the lab's reading list (44) plus 23 tail-related
citations from Xun Fu's 2024 dissertation. Most have confirmed DOIs/titles (via
Crossref); a few older or ambiguous citations are seeded by label
with a *"DOI not yet confirmed"* note — open the paper → **Edit** → add the DOI.
Species counts on seeds are estimates; revise them the same way.

## Make it shared (Supabase) — this atlas needs its OWN project
Do **not** reuse the bio-inspired atlas's credentials; the databases would mix.
1. Create a new Supabase project. SQL Editor → run `supabase/schema.sql`, then
   `supabase/seed.sql` (the tail seeds), then the GRANT block at the end of
   schema.sql is already included.
2. Paste the project URL + anon key into `js/config.js`.
3. Authentication → Providers → Google (same setup as before; this project has
   its own callback URL).
4. Authentication → URL Configuration → add your site URL.

## Deploy
Push this folder to its own GitHub repo → Settings → Pages → `main` / root.
`.gitignore` and `.nojekyll` are included. Bump `?v=N` on every asset in
`index.html` whenever you change CSS/JS, then `python3 build-standalone.py`.
