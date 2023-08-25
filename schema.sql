/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    name varchar(100)
);

-- Create Database:
CREATE DATABASE vet_clinic;

-- Going into vet_clinic table:
\c vet_clinic

-- Create Table
# CREATE TABLE animals(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 name VARCHAR(50),
 date_of_birth DATE NOT NULL,
 escape_attempts INT,
 neutered BOOLEAN,
 weight_kg DECIMAL(10,2)
 );

 -- Add column called species
 ALTER TABLE animals ADD COLUMN species VARCHAR(50);
 
 -- Query Multiple Tables

 --Create a table named owners:
CREATE TABLE owners(
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
full_name VARCHAR(50),
age INT);

 --Create a table named species:
CREATE TABLE species(
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(50)
);

--Modify animals table:
ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id integer REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id integer REFERENCES owners(id);

-- Create table vets
CREATE TABLE vets (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(50),
age INT,
date_of_graduation DATE);

-- Create a "join table" called specializations
CREATE TABLE specializations (
vet_id INT REFERENCES vets(id),
species_id INT REFERENCES species(id),
PRIMARY KEY (vet_id, species_id)
);

--  Create a "join table" called visits , it should also keep track of the date of the visit.
vCREATE TABLE visits (
animal_id INT REFERENCES animals(id),
vet_id INT REFERENCES vets(id),
visit_date DATE,
PRIMARY KEY (animal_id, vet_id, visit_date)
);
