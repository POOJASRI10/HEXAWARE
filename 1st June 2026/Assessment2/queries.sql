USE hospital_capstone_db;

-- Part 1: Basic Queries

-- 1. Display all patients
SELECT * FROM patients;

-- 2. Display all doctors
SELECT * FROM doctors;

-- 3. Find patients from Hyderabad
SELECT *
FROM patients
WHERE city = 'Hyderabad';

-- 4. Find doctors from Cardiology department
SELECT d.*
FROM doctors d
JOIN departments dp
ON d.department_id = dp.department_id
WHERE dp.department_name = 'Cardiology';

-- 5. Find appointments scheduled after 2026-01-01
SELECT *
FROM appointments
WHERE appointment_date > '2026-01-01';

-- 6. Find cancelled appointments
SELECT *
FROM appointments
WHERE appointment_status = 'Cancelled';

-- 7. Find bills where total amount > ₹5000
SELECT *
FROM bills
WHERE total_amount > 5000;

-- 8. Find payments made using UPI
SELECT *
FROM payments
WHERE payment_mode = 'UPI';

-- 9. Display patients aged between 30 and 50
SELECT *
FROM patients
WHERE age BETWEEN 30 AND 50;

-- 10. Display doctors with consultation fee above ₹800
SELECT *
FROM doctors
WHERE consultation_fee > 800;



-- Part 2: Aggregate Queries

-- 1. Count total patients
SELECT COUNT(*) AS total_patients
FROM patients;

-- 2. Count total doctors
SELECT COUNT(*) AS total_doctors
FROM doctors;

-- 3. Count total appointments
SELECT COUNT(*) AS total_appointments
FROM appointments;

-- 4. Average consultation fee
SELECT AVG(consultation_fee) AS average_fee
FROM doctors;

-- 5. Highest treatment cost
SELECT MAX(treatment_cost) AS highest_treatment_cost
FROM treatments;

-- 6. Total billing amount
SELECT SUM(total_amount) AS total_billing
FROM bills;

-- 7. Total paid amount
SELECT SUM(paid_amount) AS total_paid
FROM payments;

-- 8. Count patients by city
SELECT city,
       COUNT(*) AS patient_count
FROM patients
GROUP BY city;

-- 9. Count doctors by specialization
SELECT specialization,
       COUNT(*) AS doctor_count
FROM doctors
GROUP BY specialization;

-- 10. Count appointments by status
SELECT appointment_status,
       COUNT(*) AS appointment_count
FROM appointments
GROUP BY appointment_status;



-- Part 3: Joins

-- 1. Patient name with appointment date and status
SELECT p.patient_name,
       a.appointment_date,
       a.appointment_status
FROM patients p
JOIN appointments a
ON p.patient_id = a.patient_id;

-- 2. Doctor name with department name
SELECT d.doctor_name,
       dp.department_name
FROM doctors d
JOIN departments dp
ON d.department_id = dp.department_id;

-- 3. Patient name, doctor name and appointment date
SELECT p.patient_name,
       d.doctor_name,
       a.appointment_date
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id;

-- 4. Appointment ID with treatment name and cost
SELECT a.appointment_id,
       t.treatment_name,
       t.treatment_cost
FROM appointments a
JOIN treatments t
ON a.appointment_id = t.appointment_id;

-- 5. Bill ID with patient name and total amount
SELECT b.bill_id,
       p.patient_name,
       b.total_amount
FROM bills b
JOIN patients p
ON b.patient_id = p.patient_id;

-- 6. Bill ID with payment details
SELECT b.bill_id,
       p.payment_mode,
       p.paid_amount,
       p.payment_status
FROM bills b
JOIN payments p
ON b.bill_id = p.bill_id;

-- 7. Full Appointment Report
SELECT p.patient_name,
       d.doctor_name,
       dp.department_name,
       a.appointment_date,
       a.appointment_status,
       t.treatment_name,
       t.treatment_cost,
       b.total_amount,
       pay.payment_status
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
JOIN departments dp
ON d.department_id = dp.department_id
LEFT JOIN treatments t
ON a.appointment_id = t.appointment_id
LEFT JOIN bills b
ON a.appointment_id = b.appointment_id
LEFT JOIN payments pay
ON b.bill_id = pay.bill_id;



-- Part 4: GROUP BY and HAVING

-- 1. Count appointments by doctor
SELECT doctor_id,
       COUNT(*) AS total_appointments
FROM appointments
GROUP BY doctor_id;

-- 2. Count appointments by department
SELECT dp.department_name,
       COUNT(*) AS total_appointments
FROM appointments a
JOIN doctors d
ON a.doctor_id = d.doctor_id
JOIN departments dp
ON d.department_id = dp.department_id
GROUP BY dp.department_name;

-- 3. Total revenue by department
SELECT dp.department_name,
       SUM(b.total_amount) AS revenue
FROM bills b
JOIN appointments a
ON b.appointment_id = a.appointment_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
JOIN departments dp
ON d.department_id = dp.department_id
GROUP BY dp.department_name;

-- 4. Total treatment cost by treatment name
SELECT treatment_name,
       SUM(treatment_cost) AS total_cost
FROM treatments
GROUP BY treatment_name;

-- 5. Total billing by city
SELECT p.city,
       SUM(b.total_amount) AS total_billing
FROM bills b
JOIN patients p
ON b.patient_id = p.patient_id
GROUP BY p.city;

-- 6. Doctors having more than 2 appointments
SELECT doctor_id,
       COUNT(*) AS total_appointments
FROM appointments
GROUP BY doctor_id
HAVING COUNT(*) > 2;

-- 7. Departments generating revenue > 20000
SELECT dp.department_name,
       SUM(b.total_amount) AS revenue
FROM bills b
JOIN appointments a
ON b.appointment_id = a.appointment_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
JOIN departments dp
ON d.department_id = dp.department_id
GROUP BY dp.department_name
HAVING SUM(b.total_amount) > 20000;

-- 8. Cities having more than 2 patients
SELECT city,
       COUNT(*) AS patient_count
FROM patients
GROUP BY city
HAVING COUNT(*) > 2;



-- Part 5: Subqueries

-- 1. Patients who have appointments
SELECT *
FROM patients
WHERE patient_id IN
(
SELECT patient_id
FROM appointments
);

-- 2. Patients who never booked appointments
SELECT *
FROM patients
WHERE patient_id NOT IN
(
SELECT patient_id
FROM appointments
);

-- 3. Doctors who have no appointments
SELECT *
FROM doctors
WHERE doctor_id NOT IN
(
SELECT doctor_id
FROM appointments
);

-- 4. Bills greater than average bill amount
SELECT *
FROM bills
WHERE total_amount >
(
SELECT AVG(total_amount)
FROM bills
);

-- 5. Patient with highest bill amount
SELECT patient_name
FROM patients
WHERE patient_id =
(
SELECT patient_id
FROM bills
ORDER BY total_amount DESC
LIMIT 1
);

-- 6. Doctors whose fee is above average
SELECT *
FROM doctors
WHERE consultation_fee >
(
SELECT AVG(consultation_fee)
FROM doctors
);

-- 7. Patients who visited Cardiology
SELECT DISTINCT p.patient_name
FROM patients p
JOIN appointments a
ON p.patient_id = a.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
JOIN departments dp
ON d.department_id = dp.department_id
WHERE dp.department_name = 'Cardiology';

-- 8. Unpaid bills
SELECT *
FROM bills
WHERE bill_status <> 'Paid';

-- 9. Appointments that have treatments
SELECT *
FROM appointments
WHERE appointment_id IN
(
SELECT appointment_id
FROM treatments
);

-- 10. Patients whose billing is above average
SELECT p.patient_name,
       SUM(b.total_amount) AS total_bill
FROM patients p
JOIN bills b
ON p.patient_id = b.patient_id
GROUP BY p.patient_name
HAVING SUM(b.total_amount) >
(
SELECT AVG(patient_total)
FROM
(
SELECT SUM(total_amount) AS patient_total
FROM bills
GROUP BY patient_id
) avg_table
);



-- Part 6: Data Quality Checks

-- 1. Appointments without treatment
SELECT *
FROM appointments
WHERE appointment_id NOT IN
(
SELECT appointment_id
FROM treatments
);

-- 2. Bills without payment
SELECT *
FROM bills
WHERE bill_id NOT IN
(
SELECT bill_id
FROM payments
);

-- 3. Payments with NULL or zero amount
SELECT *
FROM payments
WHERE paid_amount IS NULL
OR paid_amount = 0;

-- 4. Cancelled appointments with bills
SELECT a.appointment_id,
       a.appointment_status,
       b.bill_id
FROM appointments a
JOIN bills b
ON a.appointment_id = b.appointment_id
WHERE a.appointment_status = 'Cancelled';

-- 5. Paid bills where payment < bill amount
SELECT b.bill_id,
       b.total_amount,
       p.paid_amount
FROM bills b
JOIN payments p
ON b.bill_id = p.bill_id
WHERE p.paid_amount < b.total_amount;

-- 6. Doctors with invalid department ID
SELECT d.*
FROM doctors d
LEFT JOIN departments dp
ON d.department_id = dp.department_id
WHERE dp.department_id IS NULL;

-- 7. Appointments with invalid patient or doctor IDs
SELECT a.*
FROM appointments a
LEFT JOIN patients p
ON a.patient_id = p.patient_id
LEFT JOIN doctors d
ON a.doctor_id = d.doctor_id
WHERE p.patient_id IS NULL
OR d.doctor_id IS NULL;



-- Final Report 1: Patient Billing Report

SELECT
    p.patient_name,
    p.city,
    COUNT(DISTINCT a.appointment_id) AS total_appointments,
    COALESCE(SUM(b.total_amount),0) AS total_bill_amount,
    COALESCE(SUM(pay.paid_amount),0) AS total_paid_amount,
    COALESCE(SUM(b.total_amount),0) -
    COALESCE(SUM(pay.paid_amount),0) AS pending_amount
FROM patients p
LEFT JOIN appointments a
ON p.patient_id = a.patient_id
LEFT JOIN bills b
ON a.appointment_id = b.appointment_id
LEFT JOIN payments pay
ON b.bill_id = pay.bill_id
GROUP BY p.patient_id,
         p.patient_name,
         p.city;