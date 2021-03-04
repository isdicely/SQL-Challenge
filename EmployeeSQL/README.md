This repository contains the tools needed for a research project on employees of the Pewlett Hackard corporation from the 1980s and 1990s. 
Six CSV files were provided to build an SQL database and perform data Analysis.

Data Engineering
Data base created using postgresql, along the data base an ERD was created using http://www.quickdatabasediagrams.com

Data Analysis
The following queries were created and saved in views
employee_information: employee number, last name, first name, sex, and salary.
employee_information_1986: first first name, last name, and hire date for employees who were hired in 1986.
department_managers_information: department number, department name, the manager's employee number, last name, first name.
employee_department: employee number, last name, first name, and department name.
hercules_b_employees: List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
sales_department_personnel: all employees in the Sales department, including their employee number, last name, first name, and department name.
sales_development_department_personnel: all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
employee_last_nme_freq: list the frequency count of employee last names, in decending order

Bonus analysis:
Done in pandas
Histogram to visualize the most common salary ranges for employees
Bar graph of average salary by title
