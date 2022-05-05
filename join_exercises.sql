USE employees;

#Gives us all the departments with associated department manager through employee number on dept_manager and
#employee number on employees
SELECT d.dept_name                            AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
         JOIN dept_manager dm on e.emp_no = dm.emp_no
         JOIN departments AS d ON d.dept_no = dm.dept_no
WHERE dm.to_date > CURDATE();

#Same as above, but only employees whose gender is female
SELECT d.dept_name                            AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
         JOIN dept_manager dm on e.emp_no = dm.emp_no
         JOIN departments AS d ON d.dept_no = dm.dept_no
WHERE dm.to_date > CURDATE()
  AND e.gender = 'f';

SELECT t.title as 'Title', COUNT(*) as 'Total'
FROM dept_emp as de
         JOIN employees as e on de.emp_no = e.emp_no
         JOIN departments as d on de.dept_no = d.dept_no
         JOIN titles as t on e.emp_no = t.emp_no
WHERE d.dept_no = 'd009'
  AND t.to_date > CURDATE()
  AND de.to_date > CURDATE()
GROUP BY Title;

SELECT d.dept_name                            as 'Departments',
       CONCAT(e.first_name, ' ', e.last_name) as 'Department Manager',
       s.salary                               as 'Salary'
FROM employees as e
         JOIN dept_manager dm on e.emp_no = dm.emp_no
         JOIN dept_emp de on e.emp_no = de.emp_no
         JOIN departments d on de.dept_no = d.dept_no
         JOIN salaries s on e.emp_no = s.emp_no
WHERE dm.to_date > CURDATE()
  AND s.to_date > CURDATE();
