use employees;

SELECT DISTINCT last_name from employees.employees
ORDER BY last_name DESC
LIMIT 10;

SELECT emp_no
from employees.salaries
ORDER BY salary DESC
LIMIT 5 OFFSET 50;