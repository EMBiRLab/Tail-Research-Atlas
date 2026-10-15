/* ============================================================================
 * config.js — Backend selection for the TAIL atlas
 *
 * Leave these EMPTY and the app runs on browser localStorage (the prototype).
 * Fill BOTH in and the app switches to a shared Supabase database and enables
 * Google sign-in. This atlas needs its OWN Supabase project — do not reuse the
 * bio-inspired atlas's credentials, or the two databases would be mixed.
 *
 * Supabase dashboard → Project Settings → API:
 *   Project URL -> supabaseUrl      "anon public" key -> supabaseAnonKey
 * The anon key is safe to ship in client code (row-level security protects data).
 * ==========================================================================*/

window.BID_CONFIG = {
  supabaseUrl: "https://dzyehzuwntqgspdryiui.supabase.co",
  supabaseAnonKey: "sb_publishable_btA4K3SXgvFdC5CwN4N5wQ_GRrD08R3",
};
