--1. List the following details of each employee: employee number, last name, 
--   first name, gender, and salary.

SELECT Employees.emp_no,Employees.first_name,Employees.last_name,Employees.gender,Salaries.salary 
FROM Employees
INNER JOIN Salaries ON Salaries.emp_no=Employees.emp_no;

-- 2. List employees who were hired in 1986.

SELECT Employees.first_name, Employees.last_name, Employees.hire_date
FROM Employees
WHERE hire_date between '1986-01-01' and '1986-12-31'

--3. List the manager of each department with the following information: 
--   department number, department name, the manager's employee number, 
--   last name, first name, and start and end employment dates.

SELECT dm.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name,dm.from_date,dm.to_date
FROM Dept_manager dm
INNER JOIN Employees e ON dm.emp_no=e.emp_no
INNER JOIN Departments d ON dm.dept_no=d.dept_no;

--4. List the department of each employee with the following information: 
--   employee number, last name, first name, and department name.

SELECT de.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp de
INNER JOIN departments d on de.dept_no=d.dept_no
INNER JOIN employees e on de.emp_no=e.emp_no;

--5. List all employees whose first name is "Hercules" and last names 
--   begin with "B".

SELECT e.first_name,e.last_name
FROM employees e  
WHERE first_name ='Hercules' 
AND last_name LIKE 'B%'

--6. List all employees in the Sales department, including their 
--   employee number, last name, first name, and department name.

SELECT de.emp_no,e.last_name,e.first_name,de.dept_no
FROM dept_emp de
INNER JOIN employees e ON e.emp_no=de.emp_no
INNER JOIN departments d ON d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, 
--   including their employee number, last name, first name, and 
--   department name.

SELECT de.emp_no,e.last_name,e.first_name,de.dept_no
FROM dept_emp de
INNER JOIN employees e ON e.emp_no=de.emp_no
INNER JOIN departments d ON d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

--8. In descending order, list the frequency count of employee 
--   last names, i.e., how many employees share each last name.

SELECT e.last_name, COUNT(e.last_name) 
FROM employees e
GROUP BY last_name
ORDER BY COUNT(e.last_name) desc;