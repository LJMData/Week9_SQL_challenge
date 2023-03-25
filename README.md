## SQL-Challenge

# Context

It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

# Process 
Step 1: Data Modeling

Six comma-separated value (CSV) files were provided, each of which was carefully examined to create an entity-relationship diagram (ERD) using QuickDBD. The ERD diagram depicts the interrelationships between the files, including the identification of primary keys and the classification of relationships, such as one-to-many.

Step 2: Data Engineering 

With the aid of PgAdmin, six tables were established to effectively store the data. These tables were crafted and populated with CSV data in a deliberate sequence to ensure the veracity of each relationship. Here is an exemplar of the utilized code:

```ruby 
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
```
The source data did not have a standardised format for the dates so these needed to be convert to the correct format to ensure that searches could be performed. 

```ruby 
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
```
Step 3: Data Analysis 

A list of questions was provided to and queries were written to query the tables. As not all the infomration was provided in the same table some joins were used. 

```ruby 
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dp.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_manager dp
JOIN employees e
ON dp.emp_no = e.emp_no
JOIN departments d
ON dp.dept_no = d.dept_no
ORDER BY e.emp_no ASC;
```
