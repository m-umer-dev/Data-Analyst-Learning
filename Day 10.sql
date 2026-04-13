SELECT COUNT(*) as total_employees
from employees;

SELECT SUM(salary) as total_salary_bill
from employees
where salary is not NULL;

SELECT AVG(salary) as average_salary
from employees
WHERE salary is NOT NULL;

SELECT
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary,
    MAX(salary) - MIN(salary) AS salary_gap
FROM employees;

SELECT
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary_cost,
    ROUND(AVG(salary), 2) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees
WHERE salary IS NOT NULL;

SELECT
    COUNT(*) AS sales_employees,
    SUM(salary) AS sales_salary_cost,
    ROUND(AVG(salary), 2) AS sales_avg_salary
FROM employees
WHERE department = 'Sales'
AND salary IS NOT NULL;

SELECT 
	department,
	COUNT(*) as employee_count
from employees
GROUP by department
order by employee_count desc;

SELECT 
	department,
    AVG(salary) as average_salary
FROM employees
where salary is not NULL
GROUP by department
ORDER by average_salary DESC;

SELECT
    city,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary_cost
FROM employees
WHERE city IS NOT NULL
GROUP BY city
ORDER BY employee_count DESC;

SELECT
    performance,
    COUNT(*) AS employee_count,
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE performance IS NOT NULL
GROUP BY performance
ORDER BY avg_salary DESC;

SELECT
    city,
    department,
    COUNT(*) AS headcount,
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE city IS NOT NULL
GROUP BY city, department
ORDER BY city ASC, avg_salary DESC;

SELECT 
	department,
	COUNT(*) as employee_count
FROM employees
GROUP by department
HAVING employee_count > 2
ORDER BY employee_count DESC;

SELECT
    city,
    COUNT(*) AS employee_count,
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE salary IS NOT NULL
AND city IS NOT NULL
GROUP BY city
HAVING AVG(salary) > 68000
ORDER BY avg_salary DESC;

SELECT
    department,
    COUNT(*) AS excellent_count,
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE performance = 'Excellent'
GROUP BY department
HAVING COUNT(*) >= 2
ORDER BY avg_salary DESC;

SELECT
    department AS "Department",
    COUNT(*) AS "Total Employees",
    ROUND(AVG(salary), 2) AS "Avg Monthly Salary",
    SUM(salary) AS "Total Monthly Cost",
    MAX(salary) AS "Highest Salary",
    MIN(salary) AS "Lowest Salary"
FROM employees
WHERE salary IS NOT NULL
AND city IS NOT NULL
GROUP BY department
HAVING COUNT(*) >= 2
ORDER BY "Avg Monthly Salary" DESC;