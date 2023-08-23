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
