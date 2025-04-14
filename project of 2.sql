INSERT INTO employee_analytics VALUES (1, 'Alice', 'Marketing', 'North', 55000, TO_DATE('10-01-2021', 'DD-MM-YYYY'), 130000);
INSERT INTO employee_analytics VALUES (2, 'Bob', 'Marketing', 'North', 54000, TO_DATE('20-03-2021', 'DD-MM-YYYY'), 125000);
INSERT INTO employee_analytics VALUES (3, 'Charlie', 'Sales', 'East', 60000, TO_DATE('15-05-2020', 'DD-MM-YYYY'), 200000);
INSERT INTO employee_analytics VALUES (4, 'David', 'Sales', 'East', 62000, TO_DATE('30-07-2019', 'DD-MM-YYYY'), 210000);
INSERT INTO employee_analytics VALUES (5, 'Eve', 'Tech', 'West', 75000, TO_DATE('05-11-2021', 'DD-MM-YYYY'), 180000);
INSERT INTO employee_analytics VALUES (6, 'Frank', 'Tech', 'West', 74000, TO_DATE('18-02-2022', 'DD-MM-YYYY'), 175000);
COMMIT;
SELECT 
  id, name, salary,
  LAG(salary) OVER (ORDER BY hire_date) AS prev_salary,
  LEAD(salary) OVER (ORDER BY hire_date) AS next_salary,
  CASE 
    WHEN LAG(salary) OVER (ORDER BY hire_date) IS NULL THEN 'NO PREVIOUS'
    WHEN salary > LAG(salary) OVER (ORDER BY hire_date) THEN 'HIGHER'
    WHEN salary < LAG(salary) OVER (ORDER BY hire_date) THEN 'LOWER'
    ELSE 'EQUAL'
  END AS compare_with_prev
FROM employee_analytics;
SELECT 
  name, department, salary,
  RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank,
  DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank
FROM employee_analytics;
SELECT * FROM (
  SELECT 
    id, name, department, salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
  FROM employee_analytics
)
WHERE rnk <= 3;
SELECT * FROM (
  SELECT 
    id, name, department, hire_date,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY hire_date ASC) AS rn
  FROM employee_analytics
)
WHERE rn <= 2;
SELECT 
  id, name, department, sales_amount,
  MAX(sales_amount) OVER (PARTITION BY department) AS max_per_dept,
  MAX(sales_amount) OVER () AS overall_max
FROM employee_analytics;
