use employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) as Name
FROM employees as e
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
    );

SELECT e.first_name as 'Aamods'
FROM employees as e
WHERE e.first_name = 'Aamod';

SELECT t.title as Title
FROM titles as t
WHERE emp_no IN (
    SELECT e.emp_no
    FROM employees as e
    WHERE e.first_name = 'Aamod'
    );

SELECT e.first_name, e.last_name
FROM employees as e
WHERE e.gender = 'f'
AND emp_no IN (
    SELECT dm.emp_no
    FROM dept_manager as dm
    WHERE dm.to_date > CURDATE()
    );

SELECT d.dept_name as Departments
FROM departments as d
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender = 'f'
        )
    AND to_date > CURDATE()
    );

SELECT e.first_name as 'First Name', e.last_name as 'Last Name'
FROM employees as e
WHERE emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE salary = (SELECT MAX(salary) FROM salaries)
    );


