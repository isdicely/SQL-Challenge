-- Use when needing to drop tables
-- Tables in order of contrains
-- DROP TABLE dept_emp;
-- DROP TABLE dept_manager;
-- DROP TABLE departments;
-- DROP TABLE salaries;
-- DROP TABLE employees;
-- DROP TABLE titles;

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

-- DATA ANALYSIS:
-- 	1. List the following details of each employee: employee number, last name, first name, sex, and salary.
CREATE VIEW employee_information AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
-- Select inner join exclude emp_no without salary information
INNER JOIN salaries s
ON (e.emp_no = s.emp_no);
-- READ employee_information
SELECT * FROM employee_information;

-- 	2. List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW employee_information_1986 AS
SELECT first_name, last_name, hire_date FROM employees 
WHERE  
DATE_PART('year', hire_date::date) = 1986;
-- READ employee_information_1986
SELECT * FROM employee_information_1986;

-- 3. List the manager of each department with the following information: 
-- 	department number, department name, the manager's employee number, last name, first name.
CREATE VIEW department_managers_information AS
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
	FROM employees e
	JOIN dept_manager dm
	ON (e.emp_no = dm.emp_no)
		JOIN departments d
		ON (d.dept_no = dm.dept_no);
SELECT * FROM department_managers_information;

-- 4. List the department of each employee with the following information: 
--	employee number, last name, first name, and department name.
CREATE VIEW employee_department AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employees e
	JOIN dept_emp de
	ON (e.emp_no = de.emp_no)
		JOIN departments d
		ON (d.dept_no = de.dept_no);
SELECT * FROM employee_department;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW Hercules_B_employees AS
SELECT last_name, first_name
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';
SELECT * FROM Hercules_B_employees;

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW sales_department_personnel AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employees e
	JOIN dept_emp de
	ON (e.emp_no = de.emp_no)
		JOIN departments d
		ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales';
SELECT * FROM sales_department_personnel;

-- 7. List all employees in the Sales and Development departments: 
-- including their employee number, last name, first name, and department name.
CREATE VIEW sales_development_department_personnel AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employees e
	JOIN dept_emp de
	ON (e.emp_no = de.emp_no)
		JOIN departments d
		ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales'
	OR dept_name = 'Development';
SELECT * FROM sales_development_department_personnel;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW employee_last_name_freq AS
SELECT last_name, COUNT(*) 
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;
SELECT * FROM employee_last_name_freq;


