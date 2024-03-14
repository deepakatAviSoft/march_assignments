-- 1. Find the addresses of all departments.
USE test1;

SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name 
FROM locations l 
JOIN countries c ON l.country_id = c.country_id;

-- 2. Find the names and department details of all employees.
SELECT e.first_name, e.last_name, d.department_id, d.department_name 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id;

-- 3. Find the names, job, and department details of employees working in London.
SELECT e.first_name, e.last_name, d.department_id, d.department_name 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
WHERE e.location_id = 2400;

-- 4. Find employee IDs, names, manager IDs, and manager names.
SELECT e1.employee_id, e1.last_name AS employee, e1.manager_id AS mgr_id, e2.last_name AS manager 
FROM employees e1 
JOIN employees e2 ON e1.manager_id = e2.employee_id;
