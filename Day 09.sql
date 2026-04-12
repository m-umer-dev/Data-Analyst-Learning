SELECT name, salary, department
FROM employees
ORDER BY salary ASC;

SELECT name, salary, department
FROM employees
ORDER BY salary DESC;

SELECT name, salary, department
FROM employees
ORDER BY salary DESC
LIMIT 3;

SELECT name, city, salary
FROM employees
ORDER BY name ASC;

SELECT name, city, salary
FROM employees
ORDER BY city ASC, salary DESC;

SELECT name, department, salary
FROM employees
WHERE department = 'Sales'
ORDER by salary DESC
LIMIT 5;

SELECT DISTINCT city
FROM employees;

SELECT DISTINCT department
FROM employees;

SELECT DISTINCT city, department
FROM employees
ORDER BY city ASC;

SELECT name
FROM employees
WHERE name LIKE 'A%';

SELECT name
FROM employees
WHERE name LIKE '%ah%';

SELECT name, salary, department
FROM employees
WHERE salary BETWEEN 65000 AND 80000
order by salary DESC;

SELECT name, city, salary
FROM employees
WHERE name LIKE '%a%'
AND salary BETWEEN 60000 AND 75000;

SELECT name, city
FROM employees
WHERE city NOT LIKE 'L%';

INSERT INTO employees VALUES
(11, 'Nadia Khan', NULL, 'Sales', 73000, 'Good');
INSERT INTO employees VALUES
(12, 'Tariq Mir', 'Peshawar', 'Marketing', NULL, 'Excellent');

SELECT name, city, department
FROM employees
where city IN ('Lahore','Karachi');

SELECT name, department, salary
FROM employees
WHERE department not in ('HR')
order by salary desc;

SELECT name, city, department
FROM employees
WHERE city IS NULL;

SELECT
    name AS "Employee Name",
    city AS "Location",
    department AS "Department",
    salary AS "Monthly Salary"
FROM employees
ORDER BY salary DESC;

SELECT
    name AS "Employee Name",
    salary AS "Monthly Salary",
    salary * 12 AS "Annual Salary",
    salary * 0.1 AS "10% Bonus"
FROM employees
WHERE salary IS NOT NULL
ORDER BY salary DESC;

SELECT
    name AS "Employee Name",
    city AS "Location",
    department AS "Department",
    salary AS "Monthly Salary",
    salary * 12 AS "Annual Salary"
FROM employees
where department in ('Sales','Marketing')
and salary is not NULL
and salary BETWEEN 65000 AND 85000
ORDER BY salary DESC
LIMIT 5;
