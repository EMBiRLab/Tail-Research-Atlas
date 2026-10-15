-- seed.sql — one-time seed of the TAIL RESEARCH ATLAS database (67 papers).
-- Run in the Supabase SQL editor AFTER schema.sql (runs as service role, bypasses RLS).
-- DOI is NULL when unconfirmed so the unique-DOI index is not tripped by blanks.

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Flower (1876)', 1876, null, '', 'Flower', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.6505149978319906, ARRAY['morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Schmidt (1886)', 1886, null, '', 'Schmidt', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.6505149978319906, ARRAY['morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Ankel (1965)', 1965, null, '', 'Ankel', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.6505149978319906, ARRAY['morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Ankel (1972)', 1972, null, '', 'Ankel', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.6505149978319906, ARRAY['morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Hildebrand (1974)', 1974, null, '', 'Hildebrand', '', 'Analysis of Vertebrate Structure (book) — comparative tail morphology.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.6505149978319906, ARRAY['morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('German (1982)', 1982, null, '', 'German', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.6505149978319906, ARRAY['morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Shapiro (1993)', 1993, null, '', 'Shapiro', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.6505149978319906, ARRAY['morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Lemelin (1995)', 1995, '10.1002/jmor.1052240308', 'Comparative and functional myology of the prehensile tail in New World monkeys', 'Lemelin', 'https://doi.org/10.1002/jmor.1052240308', 'J. Morphology', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.34948500216800943, ARRAY['morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Argot (2003)', 2003, null, '', 'Argot', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.5, ARRAY['morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Schmitt et al. (2005)', 2005, '10.1002/ajpa.20075', 'Role of the prehensile tail during ateline locomotion: Experimental and comparative evidence', 'Schmitt', 'https://doi.org/10.1002/ajpa.20075', 'Am. J. Phys. Anthropol.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.3010299956639812, ARRAY['morphology','biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Russo & Young (2011)', 2011, '10.1002/ajpa.21617', 'Tail growth tracks the ontogeny of prehensile tail use in capuchin monkeys', 'Russo', 'https://doi.org/10.1002/ajpa.21617', 'Am. J. Phys. Anthropol.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Russo et al. (2015)', 2015, '10.1002/jez.1948', 'Tail function during arboreal quadrupedalism in squirrel monkeys and tamarins', 'Russo', 'https://doi.org/10.1002/jez.1948', 'J. Exp. Zool. (Young, Russo et al.)', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.1505149978319906, ARRAY['morphology','biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Mincer & Russo (2020)', 2020, '10.1098/rspb.2019.2885', 'Substrate use drives the macroevolution of mammalian tail length diversity', 'Mincer', 'https://doi.org/10.1098/rspb.2019.2885', 'Proc. R. Soc. B', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 1, ARRAY['morphology','evolution']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Weichert (1970)', 1970, null, '', 'Weichert', '', 'Scaly anteater (pangolin) tail. Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Organ (2007)', 2007, null, '', 'Organ', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.6505149978319906, ARRAY['evolution']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Organ et al. (2009)', 2009, '10.1002/ar.20886', 'Functional correlates of fiber architecture of the lateral caudal musculature in prehensile and nonprehensile tails', 'Organ', 'https://doi.org/10.1002/ar.20886', 'Anat. Rec.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.45154499349597177, ARRAY['evolution','morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Organ et al. (2010)', 2010, '10.1002/ar.21132', 'From Head to Tail: New models and approaches in primate functional anatomy and biomechanics', 'Organ', 'https://doi.org/10.1002/ar.21132', 'Anat. Rec.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.6505149978319906, ARRAY['evolution']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Schoenwolf (1984)', 1984, null, '', 'Schoenwolf', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Deutsch (1988)', 1988, null, '', 'Deutsch', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Fan (1994)', 1994, null, '', 'Fan', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Johnson (1994)', 1994, null, '', 'Johnson', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Fan (1995)', 1995, null, '', 'Fan', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Ebensperger (1995)', 1995, null, '', 'Ebensperger', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Muller (1996)', 1996, null, '', 'Muller', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('McMahon (1998)', 1998, null, '', 'McMahon', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Christ et al. (2004)', 2004, '10.1016/j.ydbio.2004.03.016', 'Wnt 6 regulates the epithelialisation process of the segmental plate mesoderm', 'Christ', 'https://doi.org/10.1016/j.ydbio.2004.03.016', 'Dev. Biol. (Schmidt, Christ et al.)', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Williams et al. (2019)', 2019, null, '', 'Williams', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Tani et al. (2020)', 2020, null, '', 'Tani', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Draga & Scaal (2023)', 2023, null, '', 'Draga', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['development']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Bartholomew & Caswell (1951)', 1951, null, '', 'Bartholomew', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Kane & Scher (1969)', 1969, '10.1016/0020-7683(69)90086-9', 'A dynamical explanation of the falling cat phenomenon', 'Kane', 'https://doi.org/10.1016/0020-7683(69)90086-9', 'Int. J. Solids Struct.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Dunbar (1988)', 1988, '10.1002/ajp.1350160402', 'Aerial maneuvers of leaping lemurs: The physics of whole-body rotations while airborne', 'Dunbar', 'https://doi.org/10.1002/ajp.1350160402', 'Am. J. Primatol.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.1505149978319906, ARRAY['biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Arabyan & Tsai (1998)', 1998, '10.1007/s004220050488', 'A distributed control model for the air-righting reflex of a cat', 'Arabyan', 'https://doi.org/10.1007/s004220050488', 'Biol. Cybern.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Shinohara (1999)', 1999, '10.2535/ofaj1936.76.4_157', 'The musculature of the mouse tail is characterized by metameric arrangements', 'Shinohara', 'https://doi.org/10.2535/ofaj1936.76.4_157', 'Okajimas Folia Anat. Jpn.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['biomechanics','morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Essner (2002)', 2002, '10.1242/jeb.205.16.2469', 'Three-dimensional launch kinematics in leaping, parachuting and gliding squirrels', 'Essner', 'https://doi.org/10.1242/jeb.205.16.2469', 'J. Exp. Biol.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.23856062735983122, ARRAY['biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Whitford et al. (2017)', 2017, null, '', 'Whitford', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Fukushima et al. (2021)', 2021, '10.1093/icb/icab023', 'Inertial tail effects during righting of squirrels in unexpected falls', 'Fukushima', 'https://doi.org/10.1093/icb/icab023', 'Integr. Comp. Biol.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Fu (2025)', 2025, null, '', 'Fu', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Buck et al. (1925)', 1925, '10.2307/1373415', 'The tail as a balancing organ in mice', 'Buck', 'https://doi.org/10.2307/1373415', 'J. Mammalogy', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['behavior','biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Horner (1954)', 1954, null, '', 'Horner', '', 'Seed entry — DOI not yet confirmed; edit this paper to add it.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['behavior']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Siegel (1970)', 1970, '10.1002/ajpa.1330330113', 'The tail, locomotion and balance in mice', 'Siegel', 'https://doi.org/10.1002/ajpa.1330330113', 'Am. J. Phys. Anthropol. — mice with tails removed', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['behavior','biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Igarashi et al. (1981)', 1981, '10.3109/00016488109138525', 'Volumetric and dimensional measurements of vestibular structures in the squirrel monkey', 'Igarashi', 'https://doi.org/10.3109/00016488109138525', 'Verify: this match may be the vestibular paper rather than the tail-manipulation study.', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['behavior']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Hamada et al. (2012)', 2012, '10.1007/s10329-012-0317-3', 'Variability of tail length in hybrids of the Japanese macaque and the Taiwanese macaque', 'Hamada', 'https://doi.org/10.1007/s10329-012-0317-3', 'Primates', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.1505149978319906, ARRAY['behavior','morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Miyamae et al. (2026)', 2026, '10.64898/2026.06.21.733634', 'Specializations in tail anatomy of the lesser Egyptian jerboa', 'Miyamae', 'https://doi.org/10.64898/2026.06.21.733634', 'bioRxiv preprint', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0, ARRAY['engineering','morphology']::text[], 'seed' from p;


-- From Xun Fu (2024) dissertation bibliography
with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Hickman (1979)', 1979, '10.1111/j.1365-2907.1979.tb00252.x', 'The mammalian tail: a review of functions', 'Hickman', 'https://doi.org/10.1111/j.1365-2907.1979.tb00252.x', 'Mammal Review', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 1.0, ARRAY['morphology','behavior']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Rigby et al. (1959)', 1959, '10.1085/jgp.43.2.265', 'The Mechanical Properties of Rat Tail Tendon', 'Rigby', 'https://doi.org/10.1085/jgp.43.2.265', 'Journal of General Physiology', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['biomechanics','morphology']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Jusufi et al. (2008)', 2008, '10.1073/pnas.0711944105', 'Active tails enhance arboreal acrobatics in geckos', 'Jusufi', 'https://doi.org/10.1073/pnas.0711944105', 'PNAS', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Jusufi et al. (2010)', 2010, '10.1088/1748-3182/5/4/045001', 'Righting and turning in mid-air using appendage inertia: reptile tails, analytical models and bio-inspired robots', 'Jusufi', 'https://doi.org/10.1088/1748-3182/5/4/045001', 'Bioinspiration & Biomimetics', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.23856062735983122, ARRAY['biomechanics','engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('O''Connor et al. (2014)', 2014, '10.1098/rsbl.2014.0381', 'The kangaroo''s tail propels and powers pentapedal locomotion', 'O''Connor', 'https://doi.org/10.1098/rsbl.2014.0381', 'Biology Letters', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['biomechanics']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Bishop et al. (2021)', 2021, '10.1126/sciadv.abi7348', 'Predictive simulations of running gait reveal a critical dynamic role for the tail in bipedal dinosaur locomotion', 'Bishop', 'https://doi.org/10.1126/sciadv.abi7348', 'Science Advances', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['biomechanics','evolution']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('van Bijlert et al. (2021)', 2021, '10.1098/rsos.201441', 'Natural Frequency Method: estimating the preferred walking speed of <i>Tyrannosaurus rex</i> based on tail natural frequency', 'van', 'https://doi.org/10.1098/rsos.201441', 'Royal Society Open Science', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['biomechanics','evolution']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Chang-Siu et al. (2011)', 2011, '10.1109/iros.2011.6094658', 'A lizard-inspired active tail enables rapid maneuvers and dynamic stabilization in a terrestrial robot', 'Chang-Siu', 'https://doi.org/10.1109/iros.2011.6094658', 'IEEE/RSJ IROS 2011', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Briggs et al. (2012)', 2012, '10.1109/iros.2012.6386240', 'Tails in biomimetic design: Analysis, simulation, and experiment', 'Briggs', 'https://doi.org/10.1109/iros.2012.6386240', 'IEEE/RSJ IROS 2012', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Pullin et al. (2012)', 2012, '10.1109/icra.2012.6225261', 'Dynamic turning of 13 cm robot comparing tail and differential drive', 'Pullin', 'https://doi.org/10.1109/icra.2012.6225261', 'IEEE ICRA 2012', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Casarez et al. (2013)', 2013, '10.1109/icra.2013.6631361', 'Using an inertial tail for rapid turns on a miniature legged robot', 'Casarez', 'https://doi.org/10.1109/icra.2013.6631361', 'IEEE ICRA 2013', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Patel & Braae (2013)', 2013, '10.1109/iros.2013.6697154', 'Rapid turning at high-speed: Inspirations from the cheetah''s tail', 'Patel', 'https://doi.org/10.1109/iros.2013.6697154', 'IEEE/RSJ IROS 2013', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Patel & Braae (2014)', 2014, '10.1109/icra.2014.6906945', 'Rapid acceleration and braking: Inspirations from the cheetah''s tail', 'Patel', 'https://doi.org/10.1109/icra.2014.6906945', 'IEEE ICRA 2014', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Zhao et al. (2015)', 2015, '10.1109/tmech.2015.2411513', 'MSU Tailbot: Controlling Aerial Maneuver of a Miniature-Tailed Jumping Robot', 'Zhao', 'https://doi.org/10.1109/tmech.2015.2411513', 'IEEE/ASME Transactions on Mechatronics', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Rone & Ben-Tzvi (2016)', 2016, '10.1115/1.4033103', 'Dynamic Modeling and Simulation of a Yaw-Angle Quadruped Maneuvering With a Planar Robotic Tail', 'Rone', 'https://doi.org/10.1115/1.4033103', 'J. Dynamic Systems, Measurement, and Control', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Saab et al. (2019)', 2019, '10.1109/tmech.2019.2897885', 'Design and Integration of a Novel Spatial Articulated Robotic Tail', 'Saab', 'https://doi.org/10.1109/tmech.2019.2897885', 'IEEE/ASME Transactions on Mechatronics', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Singh et al. (2019)', 2019, '10.1109/icra.2019.8793948', 'Rapid Inertial Reorientation of an Aerial Insect-sized Robot Using a Piezo-actuated Tail', 'Singh', 'https://doi.org/10.1109/icra.2019.8793948', 'IEEE ICRA 2019', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Liu & Ben-Tzvi (2020)', 2020, '10.1115/1.4045842', 'Design, Analysis, and Integration of a New Two-Degree-of-Freedom Articulated Multi-Link Robotic Tail Mechanism', 'Liu', 'https://doi.org/10.1115/1.4045842', 'Journal of Mechanisms and Robotics', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Norby et al. (2021)', 2021, '10.1109/tro.2020.3045644', 'Enabling Dynamic Behaviors With Aerodynamic Drag in Lightweight Tails', 'Norby', 'https://doi.org/10.1109/tro.2020.3045644', 'IEEE Transactions on Robotics', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Pressgrove et al. (2022)', 2022, '10.1115/detc2022-90500', 'Design and Implementation of a Power-Dense, Modular, and Compact Serpentine Articulated Tail', 'Pressgrove', 'https://doi.org/10.1115/detc2022-90500', 'ASME IDETC 2022', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Chu et al. (2023)', 2023, '10.1109/lra.2023.3322079', 'Combining Tail and Reaction Wheel for Underactuated Spatial Reorientation in Robot Falling With Quadratic Programming', 'Chu', 'https://doi.org/10.1109/lra.2023.3322079', 'IEEE Robotics and Automation Letters', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Yang et al. (2023)', 2023, '10.1109/iros55552.2023.10342384', 'Proprioception and Tail Control Enable Extreme Terrain Traversal by Quadruped Robots', 'Yang', 'https://doi.org/10.1109/iros55552.2023.10342384', 'IEEE/RSJ IROS 2023', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name)
  values ('Huang et al. (2024)', 2024, '10.1109/icra57147.2024.10610049', 'Manipulator as a Tail: Promoting Dynamic Stability for Legged Locomotion', 'Huang', 'https://doi.org/10.1109/icra57147.2024.10610049', 'IEEE ICRA 2024 (arXiv:2305.01648, 2023)', true, 'seed')
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed' from p;
