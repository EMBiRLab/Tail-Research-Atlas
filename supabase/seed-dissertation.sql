-- seed-dissertation.sql — 23 tail-related citations from Xun Fu's 2024 dissertation.
-- Run ONCE in the Supabase SQL editor (service role). Safe to re-run: duplicates by DOI are skipped.

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Hickman (1979)', 1979, '10.1111/j.1365-2907.1979.tb00252.x', 'The mammalian tail: a review of functions', 'Hickman', 'https://doi.org/10.1111/j.1365-2907.1979.tb00252.x', 'Mammal Review', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 1.0, ARRAY['morphology','behavior']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Rigby et al. (1959)', 1959, '10.1085/jgp.43.2.265', 'The Mechanical Properties of Rat Tail Tendon', 'Rigby', 'https://doi.org/10.1085/jgp.43.2.265', 'Journal of General Physiology', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['biomechanics','morphology']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Jusufi et al. (2008)', 2008, '10.1073/pnas.0711944105', 'Active tails enhance arboreal acrobatics in geckos', 'Jusufi', 'https://doi.org/10.1073/pnas.0711944105', 'PNAS', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['biomechanics']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Jusufi et al. (2010)', 2010, '10.1088/1748-3182/5/4/045001', 'Righting and turning in mid-air using appendage inertia: reptile tails, analytical models and bio-inspired robots', 'Jusufi', 'https://doi.org/10.1088/1748-3182/5/4/045001', 'Bioinspiration & Biomimetics', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.23856062735983122, ARRAY['biomechanics','engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('O''Connor et al. (2014)', 2014, '10.1098/rsbl.2014.0381', 'The kangaroo''s tail propels and powers pentapedal locomotion', 'O''Connor', 'https://doi.org/10.1098/rsbl.2014.0381', 'Biology Letters', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['biomechanics']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Bishop et al. (2021)', 2021, '10.1126/sciadv.abi7348', 'Predictive simulations of running gait reveal a critical dynamic role for the tail in bipedal dinosaur locomotion', 'Bishop', 'https://doi.org/10.1126/sciadv.abi7348', 'Science Advances', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['biomechanics','evolution']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('van Bijlert et al. (2021)', 2021, '10.1098/rsos.201441', 'Natural Frequency Method: estimating the preferred walking speed of <i>Tyrannosaurus rex</i> based on tail natural frequency', 'van', 'https://doi.org/10.1098/rsos.201441', 'Royal Society Open Science', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['biomechanics','evolution']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Chang-Siu et al. (2011)', 2011, '10.1109/iros.2011.6094658', 'A lizard-inspired active tail enables rapid maneuvers and dynamic stabilization in a terrestrial robot', 'Chang-Siu', 'https://doi.org/10.1109/iros.2011.6094658', 'IEEE/RSJ IROS 2011', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Briggs et al. (2012)', 2012, '10.1109/iros.2012.6386240', 'Tails in biomimetic design: Analysis, simulation, and experiment', 'Briggs', 'https://doi.org/10.1109/iros.2012.6386240', 'IEEE/RSJ IROS 2012', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Pullin et al. (2012)', 2012, '10.1109/icra.2012.6225261', 'Dynamic turning of 13 cm robot comparing tail and differential drive', 'Pullin', 'https://doi.org/10.1109/icra.2012.6225261', 'IEEE ICRA 2012', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Casarez et al. (2013)', 2013, '10.1109/icra.2013.6631361', 'Using an inertial tail for rapid turns on a miniature legged robot', 'Casarez', 'https://doi.org/10.1109/icra.2013.6631361', 'IEEE ICRA 2013', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Patel & Braae (2013)', 2013, '10.1109/iros.2013.6697154', 'Rapid turning at high-speed: Inspirations from the cheetah''s tail', 'Patel', 'https://doi.org/10.1109/iros.2013.6697154', 'IEEE/RSJ IROS 2013', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Patel & Braae (2014)', 2014, '10.1109/icra.2014.6906945', 'Rapid acceleration and braking: Inspirations from the cheetah''s tail', 'Patel', 'https://doi.org/10.1109/icra.2014.6906945', 'IEEE ICRA 2014', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Zhao et al. (2015)', 2015, '10.1109/tmech.2015.2411513', 'MSU Tailbot: Controlling Aerial Maneuver of a Miniature-Tailed Jumping Robot', 'Zhao', 'https://doi.org/10.1109/tmech.2015.2411513', 'IEEE/ASME Transactions on Mechatronics', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Rone & Ben-Tzvi (2016)', 2016, '10.1115/1.4033103', 'Dynamic Modeling and Simulation of a Yaw-Angle Quadruped Maneuvering With a Planar Robotic Tail', 'Rone', 'https://doi.org/10.1115/1.4033103', 'J. Dynamic Systems, Measurement, and Control', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Saab et al. (2019)', 2019, '10.1109/tmech.2019.2897885', 'Design and Integration of a Novel Spatial Articulated Robotic Tail', 'Saab', 'https://doi.org/10.1109/tmech.2019.2897885', 'IEEE/ASME Transactions on Mechatronics', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Singh et al. (2019)', 2019, '10.1109/icra.2019.8793948', 'Rapid Inertial Reorientation of an Aerial Insect-sized Robot Using a Piezo-actuated Tail', 'Singh', 'https://doi.org/10.1109/icra.2019.8793948', 'IEEE ICRA 2019', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Liu & Ben-Tzvi (2020)', 2020, '10.1115/1.4045842', 'Design, Analysis, and Integration of a New Two-Degree-of-Freedom Articulated Multi-Link Robotic Tail Mechanism', 'Liu', 'https://doi.org/10.1115/1.4045842', 'Journal of Mechanisms and Robotics', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Norby et al. (2021)', 2021, '10.1109/tro.2020.3045644', 'Enabling Dynamic Behaviors With Aerodynamic Drag in Lightweight Tails', 'Norby', 'https://doi.org/10.1109/tro.2020.3045644', 'IEEE Transactions on Robotics', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Pressgrove et al. (2022)', 2022, '10.1115/detc2022-90500', 'Design and Implementation of a Power-Dense, Modular, and Compact Serpentine Articulated Tail', 'Pressgrove', 'https://doi.org/10.1115/detc2022-90500', 'ASME IDETC 2022', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Chu et al. (2023)', 2023, '10.1109/lra.2023.3322079', 'Combining Tail and Reaction Wheel for Underactuated Spatial Reorientation in Robot Falling With Quadratic Programming', 'Chu', 'https://doi.org/10.1109/lra.2023.3322079', 'IEEE Robotics and Automation Letters', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Yang et al. (2023)', 2023, '10.1109/iros55552.2023.10342384', 'Proprioception and Tail Control Enable Extreme Terrain Traversal by Quadruped Robots', 'Yang', 'https://doi.org/10.1109/iros55552.2023.10342384', 'IEEE/RSJ IROS 2023', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;

with p as (
  insert into papers (label, year, doi, title, first_author, link, blurb, seed, author_name, author_id)
  values ('Huang et al. (2024)', 2024, '10.1109/icra57147.2024.10610049', 'Manipulator as a Tail: Promoting Dynamic Stability for Legged Locomotion', 'Huang', 'https://doi.org/10.1109/icra57147.2024.10610049', 'IEEE ICRA 2024 (arXiv:2305.01648, 2023)', true, 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70')
  on conflict do nothing
  returning id
)
insert into suggestions (paper_id, x, y, categories, author_name, author_id)
select id, 0.5, 0.0, ARRAY['engineering']::text[], 'seed', '873910fb-308e-4f59-8ed3-2d5bcfca3a70' from p;
