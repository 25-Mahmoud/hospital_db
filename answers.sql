-- Creating hospital_db database
create database hospital_db;
-- use hospital_db database
 use hospital_db;
-- creating patients table 
CREATE TABLE patients (
patient_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
date_of_birth date not null,
gender varchar(10) NOT NULL,
language varchar(20) NOT NULL);
-- CREATING PROVIDERS TABLE 
CREATE TABLE providers(
provider_id int primary key auto_increment,
first_name varchar(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
provider_speciality VARCHAR(50) NOT NULL,
email_address VARCHAR(100),
phone_number varchar(50),
date_joined date NOT NULL);
-- CREATING VISITS TABLE
CREATE TABLE visits (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    provider_id INT,
    date_of_visit DATE NOT NULL,
    date_scheduled DATE NOT NULL,
    visit_department_id INT NOT NULL,
    visit_type VARCHAR(50) NOT NULL,
    blood_pressure_systolic INT,
    blood_pressure_diastolic INT,
    pulse DECIMAL(5, 2),
    visit_status VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);
-- CREATING ED_VISITS TABLE
CREATE TABLE ed_visits (
    ed_visit_id INT AUTO_INCREMENT PRIMARY KEY,
    visit_id INT,
    patient_id INT,
    acuity INT NOT NULL,
    reason_of_visit VARCHAR(255) NOT NULL,
    disposition VARCHAR(100) NOT NULL,
    FOREIGN KEY (visit_id) REFERENCES visits(visit_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
-- CREATING ADMISSIONS TALBLE
CREATE TABLE admissions (
    admission_id INT AUTO_INCREMENT PRIMARY KEY,
    admission_date DATE NOT NULL,
    discharge_date DATE NOT NULL,
    discharge_disposition VARCHAR(100) NOT NULL,
    service VARCHAR(100) NOT NULL,
    primary_diagnosis VARCHAR(255) NOT NULL,
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
-- CREATING DISCHARGES TABLE
CREATE TABLE discahrges(
discharge_id INT auto_increment PRIMARY KEY,
admission_id INT,
patient_id INT,
discharge_date DATE NOT NULL,
discharge_diposition VARCHAR(255) NOT NULL,
foreign key(admission_id) REFERENCES admissions(admission_id),
foreign key(patient_id) references patients(patient_id)
);


