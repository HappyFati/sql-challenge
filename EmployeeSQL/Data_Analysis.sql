--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no AS "Employee Number", e.last_name AS "Last Name",e.first_name AS "First Name",e.gender AS "Gender",s.salary AS "Salary"
		from employees e
		left join salaries s ON e.emp_no = s.emp_no;
		
--2. List employees who were hired in 1986.

select * from employees where extract(YEAR from hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select d.dept_no , d.dept_name , dm.emp_no , e.last_name ,e.first_name ,dm.from_date ,dm.to_date 
		from departments d left join dept_manager dm ON d.dept_no=dm.dept_no AND extract(year from to_date)=9999 left join employees e ON dm.emp_no=e.emp_no;
		
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no ,e.last_name,e.first_name,d.dept_name from employees e left join dept_emp de ON e.emp_no=de.emp_no AND extract(year from to_date)=9999
		right join departments d ON de.dept_no=d.dept_no;
		
--5. List all employees whose first name is "Hercules" and last names begin with "B."

select * from employees where first_name='Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select de.emp_no ,e.last_name ,e.first_name ,d.dept_name from dept_emp de inner join employees e ON de.emp_no=e.emp_no AND extract(year from de.to_date)=9999
		inner join departments d ON de.dept_no=d.dept_no AND d.dept_name='Sales';
		
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select de.emp_no ,e.last_name ,e.first_name ,d.dept_name from dept_emp de inner join employees e ON de.emp_no=e.emp_no AND extract(year from de.to_date)=9999
		inner join departments d ON de.dept_no=d.dept_no AND d.dept_name IN ('Sales','Development');
		
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name , count(last_name) from employees e group by last_name order by "count" DESC;
