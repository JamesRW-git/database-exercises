use employees;

SELECT DISTINCT title
FROM titles;

SELECT e.first_name, e.last_name
FROM employees e
WHERE e.last_name LIKE '%e'
AND e.last_name LIKE 'e%'
GROUP BY e.first_name, e.last_name;

SELECT COUNT(*), e.last_name FROM employees e
WHERE e.last_name LIKE '%q%'
AND e.last_name NOT LIKE '%qu%'
GROUP BY e.last_name;

SELECT COUNT(*), e.gender
FROM employees e
WHERE (e.first_name = 'Irena'
    OR e.first_name = 'Vidya'
    OR e.first_name = 'Maya')
GROUP BY e.gender;