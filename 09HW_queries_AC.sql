--1)
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM public."Employees" e
JOIN public."Salaries" s
ON (e.emp_no = s.emp_no);


--2)
SELECT *
FROM public."Employees" e
WHERE e.hire_date LIKE '1986%';

--3)List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, f.from_date, f.to_date
FROM public."Dept_manager" m
JOIN public."Departments" d
ON (m.dept_no = d.dept_no)
JOIN public."Employees" e
ON (m.emp_no = e.emp_no)
JOIN public."Dept_emp" f
ON (m.emp_no = f.emp_no);


--4)List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Employees" e
JOIN public."Dept_emp" f
ON (e.emp_no = f.emp_no)
JOIN public."Departments" d
ON (f.dept_no = d.dept_no);

--5)List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM public."Employees" e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';


--6)List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Employees" e
JOIN public."Dept_emp" f
ON (e.emp_no = f.emp_no)
JOIN public."Departments" d
ON (f.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';



--7)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Employees" e
JOIN public."Dept_emp" f
ON (e.emp_no = f.emp_no)
JOIN public."Departments" d
ON (f.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';


--8)In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name, COUNT(e.last_Name)  AS "last name count"
FROM public."Employees" e
GROUP BY e.last_Name
ORDER BY "last name count" DESC;


