--List the employee number, last name, first name, sex, and salary of each employee: 
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" e
JOIN "Salaries" s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986:
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC;

--List the manager of each department along with their department number, department name, employee number, last name, and first name:
SELECT m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM "Dept_Manager" m
JOIN "Employees" e
ON m.emp_no = e.emp_no
JOIN "Departments" d
ON m.dept_no = d.dept_no
ORDER BY m.dept_no ASC;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name:
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_Emp" de
JOIN "Employees" e
ON de.emp_no = e.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no
ORDER BY de.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B:
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name ASC;

--List each employee in the Sales department, including their employee number, last name, and first name:
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM "Employees" e
JOIN "Dept_Emp" de
ON e.emp_no = de.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name:
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" e
JOIN "Dept_Emp" de
ON e.emp_no = de.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name):
SELECT last_name, COUNT(emp_no) AS num_employees_with_same_last_name
FROM "Employees"
GROUP BY last_name
ORDER BY num_employees_with_same_last_name DESC;