--CREATED BY HAND:
DROP DATABASE IF EXISTS medical_db;

CREATE DATABASE medical_db;

\c medical_db;

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT NOT NULL,
    years INT
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL,
    address TEXT,
    phone_num TEXT
);

CREATE TABLE diseases (
    disease_id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL
);

CREATE TABLE visit (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    date DATE NOT NULL
);

CREATE TABLE Vist_info (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visit ON DELETE CASCADE,
    diseases_id INTEGER REFERENCES diseases ON DELETE CASCADE
);

CREATE INDEX doctor_first_name_idx ON doctors (first_name);
CREATE INDEX doctor_last_name_idx ON doctors (last_name);
CREATE INDEX patients_first_name_idx ON patients (first_name);
CREATE INDEX patients_last_name_idx ON patients (last_name);


-- -- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- -- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- -- Modify this code to update the DB schema diagram.
-- -- To reset the sample schema, replace everything with
-- -- two dots ('..' - without quotes).

-- CREATE TABLE "Doctors" (
--     "doctor_id" int   NOT NULL,
--     "first_name" string   NOT NULL,
--     "last_name" string   NOT NULL,
--     "specialty" string   NOT NULL,
--     "years" string   NULL,
--     CONSTRAINT "pk_Doctors" PRIMARY KEY (
--         "doctor_id"
--      )
-- );

-- CREATE TABLE "Patients" (
--     "patient_id" int NOT NULL,
--     "first_name" string   NOT NULL,
--     "last_name" string   NOT NULL,
--     "address" string   NOT NULL,
--     "phone_num" string   NOT NULL,
--     CONSTRAINT "pk_Patients" PRIMARY KEY (
--         "patient_id"
--      )
-- );

-- CREATE TABLE "Diseases" (
--     "disease_id" int   NOT NULL,
--     "disease" string   NOT NULL,
--     CONSTRAINT "pk_Diseases" PRIMARY KEY (
--         "disease_id"
--      )
-- );

-- CREATE TABLE "Visit" (
--     "id" int   NOT NULL,
--     "doctor_id" int   NOT NULL,
--     "patient_id" int   NOT NULL,
--     "date" date   NOT NULL,
--     CONSTRAINT "pk_Visit" PRIMARY KEY (
--         "id"
--      )
-- );

-- CREATE TABLE "Visit_info" (
--     "id" int   NOT NULL,
--     "visit_id" int   NOT NULL,
--     "diseases_id" int   NOT NULL,
--     CONSTRAINT "pk_Visit_info" PRIMARY KEY (
--         "id"
--      )
-- );

-- ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_doctor_id" FOREIGN KEY("doctor_id")
-- REFERENCES "Doctors" ("doctor_id");

-- ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_patient_id" FOREIGN KEY("patient_id")
-- REFERENCES "Patients" ("patient_id");

-- ALTER TABLE "Visit_info" ADD CONSTRAINT "fk_Visit_info_visit_id" FOREIGN KEY("visit_id")
-- REFERENCES "Visit" ("id");

-- ALTER TABLE "Visit_info" ADD CONSTRAINT "fk_Visit_info_diseases_id" FOREIGN KEY("diseases_id")
-- REFERENCES "Diseases" ("disease_id");

-- CREATE INDEX "idx_Doctors_first_name"
-- ON "Doctors" ("first_name");

-- CREATE INDEX "idx_Doctors_last_name"
-- ON "Doctors" ("last_name");

-- CREATE INDEX "idx_Patients_first_name"
-- ON "Patients" ("first_name");

-- CREATE INDEX "idx_Patients_last_name"
-- ON "Patients" ("last_name");

