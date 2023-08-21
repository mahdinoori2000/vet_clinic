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