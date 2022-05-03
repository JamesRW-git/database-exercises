use employees;

SELECT *
from employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya'
AND gender = 'Male';

SELECT *
from employees
WHERE last_name LIKE 'e%'
AND last_name like '%e';

SELECT *
from employees
WHERE last_name LIKE '%q%';

SELECT *
from employees
WHERE last_name LIKE '%q%'
AND NOT last_name LIKE '%qu%';
