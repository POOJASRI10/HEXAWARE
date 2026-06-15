-- HOSPITAL MANAGEMENT CAPSTONE PROJECT

-- Create Database
CREATE DATABASE hospital_capstone_db;

-- Use Database
USE hospital_capstone_db;

-- PATIENTS TABLE

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    phone VARCHAR(15)
);

-- DEPARTMENTS TABLE

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- DOCTORS TABLE

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    department_id INT,
    consultation_fee DECIMAL(10,2)
);

-- APPOINTMENTS TABLE

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_status VARCHAR(30)
);

-- TREATMENTS TABLE

CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    appointment_id INT,
    treatment_name VARCHAR(100),
    treatment_cost DECIMAL(10,2)
);

-- BILLS TABLE

CREATE TABLE bills (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    appointment_id INT,
    bill_date DATE,
    total_amount DECIMAL(10,2),
    bill_status VARCHAR(30)
);

-- PAYMENTS TABLE

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    bill_id INT,
    payment_mode VARCHAR(30),
    paid_amount DECIMAL(10,2),
    payment_status VARCHAR(30)
);

-- FOREIGN KEYS

ALTER TABLE doctors
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

ALTER TABLE appointments
ADD CONSTRAINT fk_patient
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);

ALTER TABLE appointments
ADD CONSTRAINT fk_doctor
FOREIGN KEY (doctor_id)
REFERENCES doctors(doctor_id);

ALTER TABLE treatments
ADD CONSTRAINT fk_appointment
FOREIGN KEY (appointment_id)
REFERENCES appointments(appointment_id);

ALTER TABLE bills
ADD CONSTRAINT fk_bill_patient
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);

ALTER TABLE bills
ADD CONSTRAINT fk_bill_appointment
FOREIGN KEY (appointment_id)
REFERENCES appointments(appointment_id);

ALTER TABLE payments
ADD CONSTRAINT fk_payment_bill
FOREIGN KEY (bill_id)
REFERENCES bills(bill_id);

-- VERIFY TABLES

SHOW TABLES;

DESCRIBE patients;
DESCRIBE departments;
DESCRIBE doctors;
DESCRIBE appointments;
DESCRIBE treatments;
DESCRIBE bills;
DESCRIBE payments;