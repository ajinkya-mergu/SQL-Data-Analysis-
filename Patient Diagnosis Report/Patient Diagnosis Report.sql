create table patient(
date date,
patient_id varchar(20),
patient_name varchar(20),
age int,
weight int,
gender varchar(10),
location varchar(20),
phone_number int,
disease varchar(20),
doctor_name varchar(20),
doctor_id int
);
select * from patient;


UPDATE patient SET date = STR_TO_DATE(date, '%d-%m-%Y');

INSERT INTO patient (patient_id, patient_name, age, weight, gender, location, phone_number, disease, doctor_name, doctor_id, date)
VALUES
('AP2021', 'Sarath', 67, 76, 'Male', 'chennai', 5462829, 'Cardiac', 'Mohan', 21, STR_TO_DATE('15-06-2019', '%d-%m-%Y')),
('AP2022', 'John', 62, 80, 'Male', 'banglore', 1234731, 'Cancer', 'Suraj', 22, STR_TO_DATE('13-02-2019', '%d-%m-%Y')),
('AP2023', 'Henry', 43, 65, 'Male', 'Kerala', 9028320, 'Liver', 'Mehta', 23, STR_TO_DATE('01-08-2018', '%d-%m-%Y')),
('AP2024', 'Carl', 56, 72, 'Female', 'Mumbai', 9293829, 'Asthma', 'Karthik', 24, STR_TO_DATE('02-04-2020', '%d-%m-%Y')),
('AP2025', 'Shikar', 55, 71, 'Male', 'delhi', 7821281, 'Cardiac', 'Mohan', 21, STR_TO_DATE('15-09-2017', '%d-%m-%Y')),
('AP2026', 'Piysuh', 47, 59, 'Male', 'Haryana', 8912819, 'Cancer', 'Suraj', 22, STR_TO_DATE('22-07-2018', '%d-%m-%Y')),
('AP2027', 'Stephen', 69, 55, 'Male', 'Gujarat', 8888211, 'Liver', 'Mehta', 23, STR_TO_DATE('25-03-2017', '%d-%m-%Y')),
('AP2028', 'Aaron', 75, 53, 'Male', 'Banglore', 9012192, 'Asthma', 'Karthik', 24, STR_TO_DATE('22-04-2019', '%d-%m-%Y'));


/*Write a query to display the total number of patients in the table.*/
select count(*) as total_patient from patient;


/*Write a query to display the patient id, patient name, gender, 
and disease of the patient whose age is maximum.*/

select patient_id,patient_name,gender,disease,age from patient
where age=(select max(age) from patient);

/*Write a query to display patient id and patient name with the current date.*/
select patient_id,patient_name ,now() as current_date_time from patient;

/*Write a query to display the old patient’s name and new patient's name in uppercase.*/

/*Write a query to display the patient’s name along with the length of their name.*/
select patient_name ,length(patient_name) as name_length from patient;

/*Write a query to display the patient’s name, and the gender of the patient must
 be mentioned as M or F.*/
select patient_name, case gender
when 'Male' then 'M'
when 'Female' then'F'
end as gender
 from patient;

/*Write a query to combine the names of the patient and the doctor in a new column. */
select concat(patient_name, '-' , doctor_name) as patient_doctor_name from patient;

/*Write a query to display the patients’ age along with the logarithmic value (base 10) of their age.*/
select patient_name, age ,log10(age) as log_age from patient;

/*Write a query to extract the year from the given date in a separate column.*/
select year(date) as year_date ,
monthname(date) as year_date,
day(date) as year_date
from patient;


/*Write a query to return NULL if the patient’s name and doctor’s name are similar 
else return the patient’s name.*/
select patient_name,doctor_name, case
when patient_name=doctor_name then 'null'
else patient_name 
end as not_similar
from patient;

/*return only result*/
SELECT IF(patient_name = doctor_name, NULL, patient_name) AS result FROM patient;


/*Write a query to return Yes if the patient’s age is greater than 40 else return No.*/
select age,case
when age > 40 then 'YES'
else 'No'
end as result
from patient;


/*Write a query to display the doctor’s duplicate name from the table.*/
select doctor_name 
from patient
group by doctor_name
having count(doctor_name) > 1;