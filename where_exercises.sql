use employees;

SELECT *
from employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

SELECT *
from employees
WHERE last_name LIKE 'e%';

SELECT *
from employees
WHERE last_name LIKE '%q%';
