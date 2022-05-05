use employees;

SELECT *
from employees
WHERE (first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya')
  AND gender = 'M'
ORDER BY last_name DESC, first_name DESC;

SELECT *
from employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no DESC;

SELECT *
from employees
WHERE last_name LIKE '%q%';

SELECT *
from employees
WHERE last_name LIKE '%q%'
  AND NOT last_name LIKE '%qu%';

