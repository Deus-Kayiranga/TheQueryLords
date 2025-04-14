# 🧠 QueryLords: SQL Window Function Explorers 🚀
Welcome to our project on sql window function!

**Team members**:

1.Kayiranga Deus(ID:26699)

2.Imena Vicky(ID:)

**🔗Course**: Database Development with PL/SQL 

**👥 Instructor Collaborator**: ericmaniraguha 

**🔗Repository Name**: QueryLords

## 🎯 Objective

The objective of this assignment is to explore and demonstrate the use of SQL **Window Functions** to perform advanced analytical queries. These functions allow for comparing rows, ranking within partitions, and aggregating data without collapsing rows—key features in modern data analysis. This hands-on project showcases the real-world applications of functions like `LAG()`, `LEAD()`, `RANK()`, `DENSE_RANK()`, and `ROW_NUMBER()`.

## 📊 Dataset Description
We chose a dataset of **Employees** which includes fields like:
- Employee_ID
- Name
- Department
- Salary
- Region
- Hire_Date
- Sales_amount
  
  ![WhatsApp Image 2025-04-12 at 13 06 33_f73f8d91](https://github.com/user-attachments/assets/1508461b-ffe4-4c06-968c-e4b3b985e3d3)

 ## 📊 Sample data inserted

 ![WhatsApp Image 2025-04-12 at 13 06 39_a1532d17](https://github.com/user-attachments/assets/46037826-3d70-4ab3-b47e-81cf10d2dcbc)


  


This dataset allows us to analyze salaries, rankings, and joining trends using window functions.

---

## 🔍 Queries & Explanations
### 1. Compare Values with Previous or Next Records

- **Functions Used**: `LAG()`, `LEAD()`
- **Goal**: Check whether an employee's salary is HIGHER, LOWER, or EQUAL to the previous one.
```sql
SELECT 
  Name, 
  Salary,
  LAG(Salary) OVER (ORDER BY Salary) AS Previous_Salary,
  CASE 
    WHEN Salary > LAG(Salary) OVER (ORDER BY Salary) THEN 'HIGHER'
    WHEN Salary < LAG(Salary) OVER (ORDER BY Salary) THEN 'LOWER'
    ELSE 'EQUAL'
  END AS Comparison
FROM Employees;

```


### 🥇 Ranking Salaries Per Department – RANK() vs DENSE_RANK()

```sql

RANK() OVER (PARTITION BY department ORDER BY salary DESC)

DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC)

```

**📌 Purpose**: Identify top earners in each department.

**🧠 Use Case**: For bonuses, performance reviews.

### 🏆 Top 3 Salaries Per Department

![WhatsApp Image 2025-04-12 at 13 06 34_363a1586](https://github.com/user-attachments/assets/8db962cf-ea7b-41c6-a96f-31e881956b63)

![WhatsApp Image 2025-04-12 at 13 06 34_435167ba](https://github.com/user-attachments/assets/c3ae9046-3cb3-4d31-be0e-b5082bf7930e)

![WhatsApp Image 2025-04-12 at 13 06 39_34a5acd9](https://github.com/user-attachments/assets/276e6d04-5735-4694-be08-a593131a34ab)

![WhatsApp Image 2025-04-12 at 13 06 39_555ceca8](https://github.com/user-attachments/assets/ea74728e-716c-4ad1-b5d1-ec485bce8ac0)

**📌 Purpose**: Determine the earliest hires per department.

**🧠 Use Case**: HR loyalty tracking or retirement planning.

## 📊 Aggregation: MAX() in Group vs Overall
```sql
MAX(salary) OVER (PARTITION BY department) AS max_in_dept
MAX(salary) OVER () AS overall_max

```

**📌 Purpose**: Compare employee salary against departmental and company-wide max.

**🧠 Use Case**: Benchmarking and identifying outliers.

## 🌍 Real-Life Applications

📌HR Analytics: Employee performance and compensation tracking

📌Sales Monitoring: Rank top sales per region

📌Student Progress: Evaluate academic trends

📌Inventory Insights: Identify top-moving products


**Thank you! We had fun exploring SQL Window Functions! 🧩🎯**






