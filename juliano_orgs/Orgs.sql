INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_pearl', 'Pearl', 1);

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('pearl', 'Pearl', 1);

INSERT INTO `datastore` (name, label, shared) VALUES 
    ('pearl', 'Pearl', 1);

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  ('pearl', 'Pearl', 1);

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('pearl', 0, 'new', 'Membro', 300, '{}', '{}'),
  ('pearl', 1, 'member', 'Membro Avançado', 400, '{}', '{}'),
  ('pearl', 2, 'viceboss', 'Braço-Direito', 500, '{}', '{}'),
  ('pearl', 3, 'boss', 'Patrão', 600, '{}', '{}');