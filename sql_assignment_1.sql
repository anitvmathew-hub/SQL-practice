/*1.Table Creation (CREATE)*/


create database Employee;
use Employee;

create table Departments 
(department_id int PRIMARY KEY, department_name varchar(100) );

create table location 
(location_id int PRIMARY KEY, location varchar(30) );

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) ,
    gender ENUM('M','F'),
    age INT ,
    hire_date DATE ,
    designation VARCHAR(100),
    department_id INT , FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),
    location_id INT,FOREIGN KEY (location_id)
        REFERENCES location(location_id),
    salary decimal(10,2)
    
);
INSERT INTO Departments (department_id, department_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

INSERT INTO location (location_id, location)
VALUES
(1, 'New York'),
(2, 'Texas'),
(3, 'California'),
(4, 'Florida'),
(5, 'Chicago');

INSERT INTO Employees
(employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary)
VALUES
(101, 'John Smith', 'M', 25, '2023-01-15', 'Data Analyst', 1, 2, 60000.00),
(102, 'Anita Thomas', 'F', 28, '2023-02-8','HR Executive', 2, 1, 55000.00),
(103, 'Michael Brown', 'M', 32,'2025-04-23', 'Financial Analyst', 3, 3, 75000.00),
(104, 'Sarah Wilson', 'F', 27, '2026-05-18','Marketing Executive', 4, 4, 58000.00),
(105, 'David Miller', 'M', 35, '2024-03-11','Sales Manager', 5, 5, 70000.00);

select * from employees;
select * from location;
select * from departments;


/*2. Table Alteration (ALTER)*/


ALTER TABLE Employees ADD COLUMN email VARCHAR(100);
ALTER TABLE Employees MODIFY COLUMN designation VARCHAR(200); 
ALTER TABLE employees DROP COLUMN age; 
Alter TABLE Employees Rename column hire_date to date_of_joining;

SET SQL_SAFE_UPDATES = 0;
UPDATE Employees
SET email = 'john.smith@gmail.com'
WHERE employee_id = 101;

UPDATE Employees
SET email = 'anita.thomas@gmail.com'
WHERE employee_id = 102;

UPDATE Employees
SET email = 'michael.brown@gmail.com'
WHERE employee_id = 103;

UPDATE Employees
SET email = 'sarah.wilson@gmail.com'
WHERE employee_id = 104;

UPDATE Employees
SET email = 'david.miller@gmail.com'
WHERE employee_id = 105;

select * from employees;

/*3. Table Renaming (RENAME)*/

rename table Departments to Departments_Info;
select * from Departments_Info;

rename table location to Locations;
select * from Locations;

/*4. Table Truncation (TRUNCATE)*/

TRUNCATE TABLE Employees;
select * from Employees;

/*5. Database & Table Dropping (DROP)*/

drop table Employees;
drop database employee;

/*Constraints*/
/*1. Database Recreation*/

create database employee;
use employee;


/*2. Departments Table*/
create table Departments 
(department_id int PRIMARY KEY, department_name varchar(100) NOT NULL UNIQUE);

/*3. Location Table*/
CREATE TABLE Location 
(location_id INT AUTO_INCREMENT PRIMARY KEY,location_name VARCHAR(30) NOT NULL UNIQUE);

/*4. Employees TablE */
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    department_id INT,FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    location_id INT, FOREIGN KEY (location_id) REFERENCES Location(location_id),
	salary decimal(10,2)    
);
alter table Employees add column designation varchar(100);

INSERT INTO Departments (department_id, department_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

INSERT INTO location (location_id, location_name)
VALUES
(1, 'New York'),
(2, 'Texas'),
(3, 'California'),
(4, 'Florida'),
(5, 'Chicago');

INSERT INTO Employees
(employee_id, employee_name, gender, age, hire_date, department_id, location_id, salary,designation)
VALUES
(101, 'John Smith', 'M', 25, '2023-01-15', 1, 2, 60000.00,'Data Analyst'),
(102, 'Anita Thomas', 'F', 28, '2023-02-8', 2, 1, 55000.00,'HR Executive'),
(103, 'Michael Brown', 'M', 32,'2025-04-23', 3, 3, 75000.00, 'Financial Analyst'),
(104, 'Sarah Wilson', 'F', 27, '2026-05-18', 4, 4, 58000.00,'Marketing Executive'),
(105, 'David Miller', 'M', 35, '2024-03-11', 5, 5, 70000.00,'Sales Manager');
select * from Employees;