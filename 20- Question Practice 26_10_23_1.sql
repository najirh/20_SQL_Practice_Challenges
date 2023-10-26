-- Practie 30 SQL Question 261023


-- Creating an employees table to practice 

SHOW DATABASES;

-- Creating a new Database

CREATE DATABASE My_DB;

-- checking database

SHOW DATABASEs;

-- Creating a new Employee Table 

CREATE TABLE Employees(
					EmployeeID INT auto_increment primary key not null,
                    FirstName char(50),
                    LastName char(50),
                    DOJ date,
                    Nationality char(25),
                    Department char(30),
                    Salary float,
                    Status bool
                    );
                    
-- Checking the table description

DESC Employees;

-- inserting 2 data points 

INSERT INTO Employees  (FirstName, LastName, DOJ, Nationality, Department, Salary, Status)

					VALUES	('Najir', 'Hussain', '2022-08-29', 'India', 'IT', 47500.500, TRUE),
                            ('Deepti', 'Khasa', '2022-09-12', 'India', 'IT', 47500.500, TRUE)
                            ;
                            
                            
-- Q1. Selecting Everything from the table Employees            

SELECT *
FROM Employees;                
							
-- Adding 50 new records from chatgpt

INSERT INTO Employees (FirstName, LastName, DOJ, Nationality, Department, Salary, Status)
VALUES
    ('John', 'Doe', '2023-10-26', 'US', 'Sales', 50000, 1),
    ('Alice', 'Smith', '2023-10-27', 'US', 'HR', 45000, 1),
    ('Michael', 'Johnson', '2023-10-28', 'UK', 'Engineering', 55000, 1),
    -- Add more records here
    ('Sarah', 'Brown', '2023-11-10', 'Canada', 'Marketing', 48000, 1),
    ('David', 'Lee', '2023-11-11', 'US', 'IT', 60000, 1),
    ('Catherine', 'Martin', '2023-11-12', 'US', 'Finance', 52000, 1),
    -- Add more records here
    ('Richard', 'Harris', '2023-11-25', 'UK', 'Engineering', 56000, 1),
    ('Laura', 'Wilson', '2023-11-26', 'US', 'Sales', 49000, 1),
    ('Thomas', 'Clark', '2023-11-27', 'US', 'HR', 46000, 1),
    -- Add more records here
    ('James', 'Walker', '2023-12-10', 'Canada', 'Marketing', 49000, 1),
    ('Emily', 'Evans', '2023-12-11', 'US', 'IT', 61000, 1),
    ('Daniel', 'Turner', '2023-12-12', 'US', 'Finance', 53000, 1),
    -- Add more records here
    ('Olivia', 'Parker', '2023-12-25', 'UK', 'Engineering', 57000, 1),
    ('Robert', 'Green', '2023-12-26', 'US', 'Sales', 51000, 1),
    ('Sophia', 'Baker', '2023-12-27', 'US', 'HR', 47000, 1),
    -- Add more records here
    ('William', 'Cook', '2024-01-10', 'Canada', 'Marketing', 50000, 1),
    ('Ava', 'Adams', '2024-01-11', 'US', 'IT', 62000, 1),
    ('Mason', 'Hill', '2024-01-12', 'US', 'Finance', 54000, 1),
    -- Add more records here
    ('Emma', 'Wright', '2024-01-25', 'UK', 'Engineering', 58000, 1),
    ('Liam', 'Hall', '2024-01-26', 'US', 'Sales', 52000, 1),
    ('Lily', 'Garcia', '2024-01-27', 'US', 'HR', 48000, 1),
    -- Add more records here
    ('Benjamin', 'Adams', '2024-02-10', 'Canada', 'Marketing', 52000, 1),
    ('Chloe', 'Fisher', '2024-02-11', 'US', 'IT', 63000, 1),
    ('Ethan', 'Butler', '2024-02-12', 'US', 'Finance', 55000, 1);
    -- Add more records here
                            
                            
SELECT *
FROM Employees                           
;                     
                    
                    
-- Q.2 Retrieve the distinct values in the "department" column of the "employees" table.

SELECT DISTINCT Department
FROM Employees;    


-- Q.3 Retrieve the number of employees in each department.

SELECT 
	Department,
    COUNT(EmployeeID) as Total_No_Emp
FROM Employees
GROUP BY Department
ORDER BY Total_No_Emp DESC;



-- Q.4 List the names and salaries of employees in the "sales" department and order it ASC

SELECT
	concat(FirstName, ' ', LastName) as Names_of_emp,
    Salary
FROM Employees
WHERE Department = 'Sales'
ORDER BY Salary
;


-- Q.5 Find the highest salary in the "employees" table.

SELECT
    MAX(Salary) as Highest_Salary
FROM Employees;

-- Q. 6 Calculate the average salary of employees and round the result to 4 DECIMAL

SELECT
	ROUND(AVG(Salary), 4) as Average_salary
FROM Employees;

-- Q.7 Retrieve the employees who earn more than the average salary.

SELECT *
FROM Employees
WHERE Salary > (SELECT AVG(Salary)
				FROM Employees)
;                

-- Thing more about using Sub Query //Break into small queries it has to be under ()


-- Q.8 List the employees who were hired in the year 2022.

SELECT *
FROM Employees
WHERE YEAR(DOJ) = 2022;


SELECT *
FROM Employees
WHERE EXTRACT(YEAR FROM DOJ) = 2022; 


-- Q. 9 Count the number of employees in each department and sort the result by the department name.

SELECT 
	Department,
    COUNT(Department) as Total_Emp
FROM Employees
GROUP BY Department
ORDER BY Department;

-- Q.10 Retrieve the employees with the top 5 salaries.

SELECT *
FROM Employees
ORDER BY Salary DESC
LIMIT 5;


-- Q.11 Calculate the total salary expense for the company.

SELECT 
	SUM(Salary) as Total_Salary_Exp
FROM Employees;


-- Q. 12 List the employees who have a salary between $40,000 and $50,000.
SELECT *
FROM Employees
WHERE Salary BETWEEN 40000 AND 50000
ORDER BY Salary DESC;


-- Q. 13 Retrieve the employees with the lowest salary in each department.

SELECT *
FROM Employees
WHERE Salary = (SELECT MIN(Salary)
				FROM Employees)
;                

-- CROSS VALIDATING

SELECT * 
FROM Employees
ORDER BY Salary ASC
LIMIT 1;

-- Q. 14 Find the department with the highest average salary.
             
-- Department , avg salary

SELECT 
	Department, AVG(Salary) as Average_salary
FROM Employees
GROUP BY Department
ORDER BY Average_salary DESC
LIMIT 1;


-- Q. 15 Calculate the total number of employees in the "IT" department.
SELECT
	COUNT(*) as Total_No_Emp_in_IT
FROM Employees
WHERE Department = 'IT'
;

-- Additional Task

ALTER TABLE Employees
ADD COLUMN Manager CHAR(25);

-- Renaming the Column Name to ManagerID

ALTER TABLE Employees
RENAME COLUMN Manager to ManagerID;

-- MODIFYIG Date type in COLUMN


ALTER TABLE Employees
MODIFY COLUMN ManagerID CHAR(15); 



-- Adding new rows with ManagerID for each emp

ALTER TABLE Employees
ADD COLUMN ManagerID INT;

-- Adding ManagerID for few emp

UPDATE Employees
SET ManagerID = 101
WHERE EmployeeID IN (1, 2, 3, 4, 5, 6, 7);

UPDATE Employees
SET ManagerID = 102
WHERE EmployeeID IN (8,9,10,11,12, 14, 15)
;

-- Q.16 Find the second-highest salary in the "employees" table.

SELECT 
	Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;  -- We use OFFSET to skip highest salary 


-- Q. 17 Retrieve the employees who don't have a manager.

SELECT *
FROM Employees
WHERE ManagerID IS NULL;
                
-- Q. 18 Calculate the difference in years between the current date and the hire date for each employee.

SELECT
	*,
	YEAR(current_date()) - YEAR(DOJ) as Year_From_DOJ
FROM Employees;    

-- Q. 19. List the employees with names starting with "A."
SELECT *
FROM Employees
WHERE FirstName LIKE 'a%';


--  Retrieve the employees with the same salary as "Deepti' as firt name

SELECT *
FROM Employees
WHERE Salary = (SELECT Salary
				FROM Employees
                WHERE FirstName = 'Deepti')
                ;


-- Q. 20 Find the departments with more than 6 employees.

SELECT Department, COUNT(*) as Emp_count
FROM Employees
GROUP BY Department
HAVING Emp_count > 6;


DELETE FROM Employees
WHERE FirstName IS NULL;





