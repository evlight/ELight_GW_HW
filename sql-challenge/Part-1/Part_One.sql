CREATE TABLE departments(
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

CREATE TABLE dept_emp(
	emp_no INT NOT null,
	dept_no VARCHAR(30) NOT null,
	from_date date NOT null,
	to_date date NOT null,
	PRIMARY KEY (emp_no, 
				 dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(30) NOT null,
	emp_no INT NOT null, 
	from_date date NOT null,
	to_date date NOT null,
	PRIMARY KEY (emp_no, 
				 dept_no)
);

CREATE TABLE employees(
	emp_no INT NOT null, 
	birth_date date NOT null,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR(30) NOT NULL, 
	hire_date date NOT null,
	PRIMARY KEY (emp_no)
);

CREATE TABLE salaries(
	emp_no INT NOT null,
	salary INT NOT null, 
	from_date date NOT null,
	to_date date NOT null,
	PRIMARY KEY (emp_no, 
				 from_date)
);

CREATE TABLE titles(
	emp_no INT NOT null, 
	title VARCHAR(30) NOT null,
	from_date date NOT null,
	to_date date NOT null
);

---	Listing employee number, names, gender 
--salaries.
SELECT emp.emp_no,
	emp.birth_date,
	emp.first_name,
	emp.last_name, 
	emp.gender,
	emp.hire_date,
	sal.salary
FROM employees AS emp
	LEFT JOIN salaries AS sal
	ON (emp.emp_no=sal.emp_no)
ORDER BY emp.emp_no; 

--List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name,
	dm.from_date,
	dm.to_date
FROM dept_manager AS dm
	INNER JOIN departments as d
		ON (dm.dept_no=d.dept_no)
	INNER JOIN employees as e
		ON(dm.emp_no=e.emp_no);

--List the department of each employee with 
--the following information: employee number, 
--last name, first name, and department name.
SELECT empl.emp_no,
	empl.last_name,
	empl.first_name, 
	d.dept_name
FROM employees AS empl
	INNER JOIN dept_emp AS de
		ON(empl.emp_no=de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
ORDER BY empl.emp_no;

--List all employees whose first name is "Hercules" 
--and last names begin with "B."

SELECT employees.first_name,
	employees.last_name
FROM employees;

SELECT (first_name, last_name)
FROM employees
WHERE first_name LIKE 'Hercules'
AND employees.last_name LIKE 'B%';

--List all employees in the Sales department, 
--including their employee number, last name, 
--first name, and department name.
SELECT emp.emp_no,
	emp.first_name,
	emp.last_name,
	d.dept_no
	d.dept_name,
	de.emp_no,
	de.dept.no
FROM employees AS emp
--FROM dept_emp as de
	INNER JOIN employees 
		ON (emp.emp_no=de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY emp.emp_no;

--List all employees in the Sales and Development 
--departments, including their employee number, 
--last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
	FROM departments
WHERE departments.dept_name = ('Sales', 'Development')
ORDER BY emp.emp_no;

--In descending order, list the frequency count 
--of employee last names, i.e., how many employees 
--share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

SELECT * FROM departments;
DROP TABLE departments;

SELECT * FROM dept_emp;
DROP TABLE dept_emp;

SELECT * FROM titles;
DROP TABLE titles;

SELECT * FROM salaries;
DROP TABLE salaries;

SELECT * FROM employees;
DROP TABLE employees;

SELECT * FROM dept_manager;
DROP TABLE dept_manager;
