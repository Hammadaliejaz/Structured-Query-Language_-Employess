DROP TABLE dept_manager;
CREATE TABLE dept_manager(
	dept_no varchar,
	emp_no int,
	from_date date,
	to_date date );
	
	SELECT * FROM dept_manager
	
DROP TABLE employees	
CREATE TABLE employees(
	emp_no int,
	birth_date date,
	first_name varchar,
	last_name varchar,
	gender varchar,
	hire_date date
);

SELECT* FROM employees;

DROP TABLE salaries

CREATE TABLE salaries(
	emp_no int,
	salary int,
	from_date date,
	to_date date
);

SELECT * FROM salaries

DROP TABLE titles; 

CREATE TABLE titles(
	emp_no int, 
	title varchar,
	from_date date,
	to_date date
);

SELECT * FROM titles;

SELECT * FROM dept_manager;

SELECT employees.emp_no, last_name, first_name, gender, salary
FROM employees
LEFT JOIN salaries ON employees.emp_no=salaries.emp_no;
	 
SELECT *
FROM employees
WHERE hire_date BETWEEN '%1986-01-01' AND '%1986-12-31';

SELECT dept_manager.dept_no,departments.dept_name,dept_manager.emp_no,employees.last_name,employees.first_name,from_date,to_date
FROM dept_manager
LEFT JOIN departments ON dept_manager.dept_no=departments.dept_no
LEFT JOIN employees ON dept_manager.emp_no=employees.emp_no;

SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM employees
LEFT JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
LEFT JOIN departments ON dept_emp.dept_no=departments.dept_no;

SELECT *
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';


SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM employees
LEFT JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
LEFT JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE dept_name='Sales';

SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM employees
LEFT JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
LEFT JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE dept_name='Sales' OR dept_name='Development';

SELECT last_name,COUNT(last_name) AS lname_count
FROM employees
GROUP BY last_name
ORDER BY lname_count DESC
