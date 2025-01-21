DROP SEQUENCE patient_seq;
DROP SEQUENCE staff_seq;
DROP SEQUENCE appointment_seq;
DROP SEQUENCE service_seq;
DROP SEQUENCE billing_seq;
DROP TABLE Billing CASCADE CONSTRAINTS;
DROP TABLE Services CASCADE CONSTRAINTS;
DROP TABLE Appointments CASCADE CONSTRAINTS;
DROP TABLE MedicalStaff CASCADE CONSTRAINTS;
DROP TABLE Patients CASCADE CONSTRAINTS;

-- Create tables

CREATE TABLE Patients (
    patient_id NUMBER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(20),
    zip VARCHAR(10),
    phone VARCHAR(10),
    email VARCHAR(100)
);


CREATE TABLE MedicalStaff (
    staff_id NUMBER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    phone VARCHAR(10),
    email VARCHAR(100)
);


CREATE TABLE Appointments (
    appointment_id  NUMBER PRIMARY KEY,
    patient_id NUMBER,
    staff_id NUMBER,
    appointment_date DATE,
    appointment_time TIMESTAMP,
    purpose VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (staff_id) REFERENCES MedicalStaff(staff_id)
);


CREATE TABLE Services (
    service_id NUMBER PRIMARY KEY,
    service_name VARCHAR(100),
    service_description VARCHAR(255),
    fee DECIMAL(10, 2)
);


CREATE TABLE Billing (
    billing_id NUMBER PRIMARY KEY,
    patient_id NUMBER,
    service_id NUMBER,
    billed_amount DECIMAL(10, 2),
    payment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

-- Create sequences
CREATE SEQUENCE patient_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE staff_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE appointment_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE service_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE billing_seq START WITH 1 INCREMENT BY 1;



-- Insert data into tables
-- Insert into Patients table
INSERT INTO Patients (patient_id, first_name, last_name, dob, address, city, state, zip, phone, email)
VALUES (patient_seq.NEXTVAL, 'John', 'Andrews', TO_DATE('1985-05-01','YYYY-MM-DD'), '123 Main St', 'Charlstone', 'CA', '4452', '555-1234', 'johnandrews@gmail.com');
INSERT INTO Patients (patient_id, first_name, last_name, dob, address, city, state, zip, phone, email)
VALUES (patient_seq.NEXTVAL, 'Jane', 'Foster', TO_DATE('1990-07-15','YYYY-MM-DD'), '456 Oak Ave', 'Soho', 'CA', '67890', '555-56755', 'jane.foster@gmail.com');
INSERT INTO Patients (patient_id, first_name, last_name, dob, address, city, state, zip, phone, email)
VALUES (patient_seq.NEXTVAL, 'Bob', 'Smith', TO_DATE('1970-12-10','YYYY-MM-DD'), '789 Maple St', 'Mow-Town', 'CA', '54321', '555-999', 'bob.smith@gmail.com');
INSERT INTO Patients (patient_id, first_name, last_name, dob, address, city, state, zip, phone, email)
VALUES (patient_seq.NEXTVAL, 'Alice', 'Johnson', TO_DATE('1982-03-25','YYYY-MM-DD'), '321 Pine Ave', 'Penthos', 'CA', '98765', '555-4321', 'alice.johnson@hornport.com');
INSERT INTO Patients (patient_id, first_name, last_name, dob, address, city, state, zip, phone, email)
VALUES (patient_seq.NEXTVAL, 'Robert', 'Lee', TO_DATE('1995-11-11','YYYY-MM-DD'), '2345 Grove St', 'Motelda', 'CA', '67891', '555-6789', 'robert.lee@gmail.com');

-- Insert into MedicalStaff table
INSERT INTO MedicalStaff (staff_id, first_name, last_name, specialization, phone, email)
VALUES (staff_seq.NEXTVAL, 'Sarah', 'Johnson', 'Cardiologist', '555-2468', 'sarah.johnson@mortihispital.com');
INSERT INTO MedicalStaff (staff_id, first_name, last_name, specialization, phone, email)
VALUES (staff_seq.NEXTVAL, 'Mike', 'Lee', 'Neurosurgeon', '555-1357', 'mike.lee@mortihispital.com');
INSERT INTO MedicalStaff (staff_id, first_name, last_name, specialization, phone, email)
VALUES (staff_seq.NEXTVAL, 'Anna', 'Kim', 'Pediatrician', '555-8642', 'anna.kim@mortihispital.com');
INSERT INTO MedicalStaff (staff_id, first_name, last_name, specialization, phone, email)
VALUES (staff_seq.NEXTVAL, 'Tom', 'Brown', 'Oncologist', '555-3579', 'tom.brown@mortihispital.com');
INSERT INTO MedicalStaff (staff_id, first_name, last_name, specialization, phone, email)
VALUES (staff_seq.NEXTVAL, 'Julia', 'Davis', 'Dermatologist', '555-4682', 'julia.davis@mortihispital.com');

-- Insert into Appointments table
INSERT INTO Appointments (appointment_id, patient_id, staff_id, appointment_date, appointment_time, purpose)
VALUES (appointment_seq.NEXTVAL, 1, 1, TO_DATE('2023-04-20', 'YYYY-MM-DD'), TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'), 'Follow up');
INSERT INTO Appointments (appointment_id, patient_id, staff_id, appointment_date, appointment_time, purpose)
VALUES (appointment_seq.NEXTVAL, 2, 2, TO_DATE('2023-04-25', 'YYYY-MM-DD'), TO_TIMESTAMP('13:45:00', 'HH24:MI:SS'), 'Checkup');
INSERT INTO Appointments (appointment_id, patient_id, staff_id, appointment_date, appointment_time, purpose)
VALUES (appointment_seq.NEXTVAL, 3, 3, TO_DATE('2023-04-28', 'YYYY-MM-DD'), TO_TIMESTAMP('11:00:00', 'HH24:MI:SS'), 'Consultation');
INSERT INTO Appointments (appointment_id, patient_id, staff_id, appointment_date, appointment_time, purpose)
VALUES (appointment_seq.NEXTVAL, 4, 4, TO_DATE('2023-05-03', 'YYYY-MM-DD'), TO_TIMESTAMP('15:30:00', 'HH24:MI:SS'), 'Vaccination');
INSERT INTO Appointments (appointment_id, patient_id, staff_id, appointment_date, appointment_time, purpose)
VALUES (appointment_seq.NEXTVAL, 5, 5, TO_DATE('2023-05-06', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), 'Checkup');

-- Insert into Services table
INSERT INTO Services (service_id, service_name, service_description, fee)
VALUES (service_seq.NEXTVAL, 'Consultation', 'General consultation with a doctor', 100.00);
INSERT INTO Services (service_id, service_name, service_description, fee)
VALUES (service_seq.NEXTVAL, 'Checkup', 'General health checkup with a doctor', 150.00);
INSERT INTO Services (service_id, service_name, service_description, fee)
VALUES (service_seq.NEXTVAL, 'Vaccination', 'Routine vaccination for children and adults', 50.00);
INSERT INTO Services (service_id, service_name, service_description, fee)
VALUES (service_seq.NEXTVAL, 'Follow up', 'Follow up appointment with a doctor', 75.00);
INSERT INTO Services (service_id, service_name, service_description, fee)
VALUES (service_seq.NEXTVAL, 'Surgery', 'Surgical procedure performed by a specialist', 1000.00);

-- Insert into Billing table
INSERT INTO Billing (billing_id, patient_id, service_id, billed_amount, payment_status)
VALUES (billing_seq.NEXTVAL, 1, 1, 100.00, 'Paid');
INSERT INTO Billing (billing_id, patient_id, service_id, billed_amount, payment_status)
VALUES (billing_seq.NEXTVAL, 2, 2, 150.00, 'Unpaid');
INSERT INTO Billing (billing_id, patient_id, service_id, billed_amount, payment_status)
VALUES (billing_seq.NEXTVAL, 3, 3, 50.00, 'Unpaid');
INSERT INTO Billing (billing_id, patient_id, service_id, billed_amount, payment_status)
VALUES (billing_seq.NEXTVAL, 4, 4, 150.00, 'Paid');
INSERT INTO Billing (billing_id, patient_id, service_id, billed_amount, payment_status)
VALUES (billing_seq.NEXTVAL, 5, 5, 100.00, 'Unpaid');

COMMIT;

SELECT DISTINCT P.patient_id, P.first_name, P.last_name, P.dob, P.address, P.city, P.state, P.zip, P.phone, P.email 
FROM Patients P 
JOIN Appointments A ON P.patient_id = A.patient_id 
WHERE A.appointment_date BETWEEN TRUNC(SYSDATE + 7) AND TRUNC(SYSDATE + 14);


SELECT staff_id, first_name, last_name, phone, email 
FROM MedicalStaff 
WHERE specialization = 'Cardiologist';

SELECT service_id, service_name, service_description, fee 
FROM Services;

SELECT A.appointment_id, P.first_name || ' ' || P.last_name AS patient_name, A.appointment_date, A.appointment_time, A.purpose 
FROM Appointments A 
JOIN Patients P ON A.patient_id = P.patient_id 
WHERE A.staff_id = 1;

