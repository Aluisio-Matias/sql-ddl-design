DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE patients (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    insurance TEXT NOT NULL,
    birthday DATE NOT NULL
);

CREATE TABLE diseases (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE visits (
    id INTEGER PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors (id),
    patient_id INTEGER REFERENCES patients (id),
    date TIMESTAMP NOT NULL
);

CREATE TABLE diagnoses (
    id INTEGER PRIMARY KEY,
    visit_id INTEGER REFERENCES visits (id),
    disease_id INTEGER REFERENCES diseases (id),
    notes TEXT NOT NULL
);
