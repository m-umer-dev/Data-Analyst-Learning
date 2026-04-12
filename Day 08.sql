CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT,
    department TEXT,
    salary INTEGER,
    performance TEXT
);

INSERT INTO employees VALUES (1, 'Ahmed Khan', 'Lahore', 'Sales', 75000, 'Excellent');
INSERT INTO employees VALUES (2, 'Sara Ali', 'Karachi', 'Marketing', 65000, 'Good');
INSERT INTO employees VALUES (3, 'Ali Raza', 'Islamabad', 'Sales', 80000, 'Excellent');
INSERT INTO employees VALUES (4, 'Fatima Malik', 'Lahore', 'HR', 55000, 'Good');
INSERT INTO employees VALUES (5, 'Usman Tariq', 'Karachi', 'Sales', 70000, 'Average');
INSERT INTO employees VALUES (6, 'Ayesha Khan', 'Lahore', 'Marketing', 68000, 'Excellent');
INSERT INTO employees VALUES (7, 'Bilal Ahmed', 'Islamabad', 'HR', 52000, 'Good');
INSERT INTO employees VALUES (8, 'Hamza Sheikh', 'Karachi', 'Sales', 85000, 'Excellent');
INSERT INTO employees VALUES (9, 'Zara Hussain', 'Lahore', 'Marketing', 72000, 'Good');
INSERT INTO employees VALUES (10, 'Omar Farooq', 'Islamabad', 'Sales', 78000, 'Average');

SELECT * FROM employees;

SELECT name, city, salary
FROM employees;

SELECT name, city, salary
FROM employees
WHERE city = 'Lahore';

SELECT name, salary, department
FROM employees
WHERE salary > 70000;

SELECT name, department, performance
FROM employees
WHERE performance = 'Excellent';

SELECT name, city, salary
FROM employees
WHERE city = 'Lahore'
AND salary > 65000;

SELECT name, city, department
FROM employees
WHERE city = 'Lahore'
OR city = 'Karachi';