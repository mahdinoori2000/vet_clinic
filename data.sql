/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

-- Insert Animals data into animals table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
                           VALUES('Agumon', '2020-02-05', 0, TRUE, 10.23), 
                           VALUES('Gabumon', '2018-11-15', 2, TRUE, 8), 
                                 ('Pikachu', '2021-01-07', 1, FALSE, 15.04), 
                                 ('Devimon', '2017-05-12', 5, TRUE, 11);
                                 
-- Insert Animals data into animals table
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Charmander', '2020-02-08', 0, FALSE, -11),
('Plantmon', '2021-11-15', 2, TRUE, -5.7),
('Squirtle', '1993-04-02', 3, FALSE, -12.13),
('Angemon', '2005-06-12', 1, TRUE, -45),
('Boarmon', '2005-06-07', 7, TRUE, 20.4),
('Blossom', '1998-10-13', 3, TRUE, 17),
('Ditto', '2022-05-14', 4, TRUE, 22);

 -- Query Multiple Tables
 
--Insert the following data into the owners table:
INSERT INTO owners(full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Insert the following data into the species table:
INSERT INTO species(name)
VALUES('Pokemon'), ('Digimon');

-- Modify your inserted animals so it includes the species_id value:
 UPDATE animals
SET species_id = species.id
FROM species WHERE animals.name LIKE '%mon' AND species.name = 'Digimon';

UPDATE animals
SET species_id = species.id
FROM species WHERE animals.name NOT LIKE '%mon' AND species.name = 'Pokemon';

-- Modify your inserted animals to include owner information (owner_id):
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE (animals.name = 'Agumon' AND owners.full_name = 'Sam Smith')
OR (animals.name IN ('Gabumon', 'Pikachu') AND owners.full_name = 'Jennifer Orwell')
OR (animals.name IN ('Devimon', 'Plantmon') AND owners.full_name = 'Bob')
OR (animals.name IN ('Charmander', 'Squirtle', 'Blossom') AND owners.full_name = 'Melody')
OR (animals.name IN ('Angemon', 'Boarmon') AND owners.full_name = 'Dean Winchester');
