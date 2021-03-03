-- Create tables to import csv files

CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR REFERENCES titles(title_id),
	birthdate DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY REFERENCES employees(emp_no),
	salary NUMERIC
);

CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR  
);

CREATE TABLE dept_manager(
	dept_no VARCHAR REFERENCES departments(dept_no),
	emp_no INT PRIMARY KEY REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
	emp_no INT REFERENCES employees(emp_no),
	dept_no VARCHAR REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- View tables after importing csv files
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;