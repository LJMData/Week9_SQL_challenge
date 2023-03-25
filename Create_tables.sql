-- Create titles Table
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(50)
);

-- Create Employees table
CREATE TABLE employees (
  emp_no INTEGER PRIMARY KEY,
  emp_title_id VARCHAR(10) REFERENCES titles(title_id),
  birth_date VARCHAR,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  sex VARCHAR(1),
  hire_date VARCHAR
);

-- Create Departments Table
CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(50)
);


-- Create Department Managers Table
CREATE TABLE dept_manager (
	dept_no VARCHAR (10) REFERENCES departments(dept_no),
	emp_no INTEGER REFERENCES employees(emp_no)
);


--Create Department Employees Table
CREATE TABLE dept_emp (
	emp_no INTEGER REFERENCES employees(emp_no),
	dept_no VARCHAR (10) REFERENCES departments(dept_no)
);

--Create Salaries table
CREATE TABLE salaries(
	emp_no INTEGER REFERENCES employees(emp_no),
	salary INTEGER
);

-- Convert the dates to the correct format in the employees table
-- Change the birth date
SELECT * FROM employees;

ALTER TABLE employees ADD birth_date_2 DATE;

SELECT * FROM employees;

UPDATE employees SET birth_date_2 = TO_DATE(birth_date, 'MM-DD-%Y');

SELECT * FROM employees;

-- Remove the old colum and rename the new one
ALTER TABLE employees DROP birth_date;
ALTER TABLE employees RENAME COLUMN birth_date_2 TO birth_date;
SELECT * FROM employees;

-- Change the hire date
SELECT * FROM employees;

ALTER TABLE employees ADD hire_date_2 DATE;

SELECT * FROM employees;

UPDATE employees SET hire_date_2 = TO_DATE(hire_date, 'MM-DD-%Y');

SELECT * FROM employees;

-- Remove the old colum and rename the new one
ALTER TABLE employees DROP hire_date;
ALTER TABLE employees RENAME COLUMN hire_date_2 TO hire_date;
SELECT * FROM employees;