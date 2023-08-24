/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg >10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

--Vet clinic database: query and update animals table
-- 1st query
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

-- 2nd query | Update the species
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

-- 3rd query | Delete all records
BEGIN;
DELETE FROM animals;
ROLLBACK;

-- 4rd query | Using save point to update the weight of animals and multiply them by -1
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT born;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO born;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- Queries for questions
--How many animals are there?
SELECT COUNT(*) FROM animals;
--How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
--What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, MAX(escape_attempts)
FROM Animals
GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, MAX(weight_kg) FROM animals GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;

-- Write queries (using JOIN) to answer the following questions:
-- 1- What animals belong to Melody Pond?
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- 2- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name 
FROM animals 
JOIN species ON animals.species_id = species.id 
WHERE species.name = 'Pokemon';

-- 3-List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name
FROM animals RIGHT JOIN owners
ON animals.id = owners.id
UNION
SELECT NULL, animals.name
FROM animals WHERE owner_id IS NULL;

-- 4-How many animals are there per species?
SELECT species.name, COUNT(animals.id)
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

-- 5- List all Digimon owned by Jennifer Orwell.
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- 6- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0

-- 7 - Who owns the most animals?
SELECT owners.full_name, COUNT(animals.id) AS animal_count
FROM owners
JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY animal_count DESC
LIMIT 3;