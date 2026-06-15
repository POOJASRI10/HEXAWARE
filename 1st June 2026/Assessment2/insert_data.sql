USE hospital_capstone_db;

-- Patients

INSERT INTO patients VALUES
(1,'Rahul Sharma','Male',35,'Hyderabad','9876543210'),
(2,'Priya Singh','Female',42,'Chennai','9876543211'),
(3,'Amit Kumar','Male',28,'Bangalore','9876543212'),
(4,'Sneha Reddy','Female',31,'Hyderabad','9876543213'),
(5,'Kiran Rao','Male',45,'Pune','9876543214'),
(6,'Meera Patel','Female',38,'Ahmedabad','9876543215'),
(7,'Arjun Nair','Male',29,'Kochi','9876543216'),
(8,'Anjali Gupta','Female',50,'Delhi','9876543217'),
(9,'Vikram Shah','Male',55,'Mumbai','9876543218'),
(10,'Pooja Verma','Female',33,'Chennai','9876543219'),
(11,'Rohan Das','Male',40,'Hyderabad','9876543220'),
(12,'Neha Joshi','Female',27,'Pune','9876543221');

-- Departments

INSERT INTO departments VALUES
(1,'Cardiology'),
(2,'Neurology'),
(3,'Orthopedics'),
(4,'Pediatrics'),
(5,'General Medicine');

-- Doctors

INSERT INTO doctors VALUES
(101,'Dr. Rajesh','Cardiologist',1,1200),
(102,'Dr. Kavitha','Neurologist',2,1500),
(103,'Dr. Arjun','Orthopedic',3,1000),
(104,'Dr. Meena','Pediatrician',4,800),
(105,'Dr. Suresh','General Physician',5,700),
(106,'Dr. Ramesh','Cardiologist',1,1300),
(107,'Dr. Anita','Neurologist',2,1400),
(108,'Dr. Karthik','Orthopedic',3,1100);

-- Appointments

INSERT INTO appointments VALUES
(1001,1,101,'2026-01-05','Completed'),
(1002,2,102,'2026-01-06','Completed'),
(1003,3,103,'2026-01-07','Completed'),
(1004,4,101,'2026-01-08','Cancelled'),
(1005,5,104,'2026-01-09','Completed'),
(1006,6,105,'2026-01-10','Pending'),
(1007,7,106,'2026-01-11','Completed'),
(1008,8,107,'2026-01-12','Completed'),
(1009,9,108,'2026-01-13','Completed'),
(1010,10,101,'2026-01-14','Pending'),
(1011,11,102,'2026-01-15','Completed'),
(1012,12,103,'2026-01-16','Completed'),
(1013,1,104,'2026-01-17','Completed'),
(1014,2,105,'2026-01-18','Pending'),
(1015,3,106,'2026-01-19','Completed'),
(1016,4,107,'2026-01-20','Completed'),
(1017,5,108,'2026-01-21','Completed'),
(1018,6,101,'2026-01-22','Cancelled'),
(1019,7,102,'2026-01-23','Completed'),
(1020,8,103,'2026-01-24','Completed');

-- Treatments

INSERT INTO treatments VALUES
(1,1001,'Heart Checkup',5000),
(2,1002,'Brain Scan',7000),
(3,1003,'Knee Treatment',6000),
(4,1005,'Child Vaccination',2000),
(5,1007,'Cardiac Test',5500),
(6,1008,'Neuro Consultation',6500),
(7,1009,'Bone Therapy',4500),
(8,1011,'MRI Scan',8000),
(9,1012,'Joint Treatment',5000),
(10,1013,'Vaccination',1500),
(11,1015,'Heart Surgery Review',9000),
(12,1016,'Brain Therapy',7500),
(13,1017,'Bone Surgery Review',8500),
(14,1019,'Neuro Checkup',6000),
(15,1020,'Orthopedic Review',5500);

-- Bills

INSERT INTO bills VALUES
(1,1,1001,'2026-01-05',6200,'Paid'),
(2,2,1002,'2026-01-06',8500,'Paid'),
(3,3,1003,'2026-01-07',7000,'Paid'),
(4,5,1005,'2026-01-09',2800,'Paid'),
(5,7,1007,'2026-01-11',6800,'Paid'),
(6,8,1008,'2026-01-12',8200,'Paid'),
(7,9,1009,'2026-01-13',5600,'Pending'),
(8,11,1011,'2026-01-15',9500,'Paid'),
(9,12,1012,'2026-01-16',6200,'Paid'),
(10,1,1013,'2026-01-17',2300,'Paid'),
(11,3,1015,'2026-01-19',11000,'Paid'),
(12,4,1016,'2026-01-20',9200,'Paid'),
(13,5,1017,'2026-01-21',9800,'Pending'),
(14,7,1019,'2026-01-23',7400,'Paid'),
(15,8,1020,'2026-01-24',6600,'Paid');

-- Payments

INSERT INTO payments VALUES
(1,1,'UPI',6200,'Success'),
(2,2,'Card',8500,'Success'),
(3,3,'UPI',7000,'Success'),
(4,4,'Cash',2800,'Success'),
(5,5,'UPI',6800,'Success'),
(6,6,'Card',8200,'Success'),
(7,7,'UPI',3000,'Pending'),
(8,8,'Net Banking',9500,'Success'),
(9,9,'UPI',6200,'Success'),
(10,10,'Cash',2300,'Success'),
(11,11,'Card',11000,'Success'),
(12,12,'UPI',9200,'Success'),
(13,13,'UPI',4000,'Pending'),
(14,14,'Card',7400,'Success'),
(15,15,'UPI',6600,'Success');