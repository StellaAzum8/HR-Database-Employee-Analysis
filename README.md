

README.md

# HR Database Employee Analysis

## 📌 Overview
This project showcases **50 SQL queries** written to analyze an HR database, which contains information about employees, departments, jobs, job history, locations, countries, and regions.

The analysis demonstrates:
- Filtering and sorting data
- Aggregating and grouping
- Joining multiple tables
- Date and string manipulation
- Subqueries and advanced SQL concepts

---

## 1️⃣ Data Structure
The HR database contains the following tables:
- **employees** – Personal and job-related information about each employee
- **departments** – Department names and manager IDs
- **jobs** – Job titles and salary ranges
- **job_history** – Employee work history
- **locations** – Office locations
- **countries** – Countries where offices are located
- **regions** – Regions grouping countries

---

## 2️⃣ Tools & Setup
The queries were written using:
- **MySQL** (but compatible with most relational databases)
- Any SQL client (e.g., MySQL Workbench, DBeaver, or pgAdmin for PostgreSQL)

**To run the queries:**
1. Download the HR sample database and import it into your SQL environment.
2. Open the `.sql` files in the `queries/` folder.
3. Run them sequentially or by category.

---

## 3️⃣ Example Queries & Outputs

### 1. Employees outside salary range of $10,000–$15,000
```sql
SELECT 
    CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME,
    SALARY
FROM employees
WHERE SALARY NOT BETWEEN 10000 AND 15000;

Insight: Helps identify employees earning significantly above or below the target salary range.

⸻

2. Top Departments by Salary Total

SELECT 
    D.DEPARTMENT_NAME,
    SUM(E.SALARY) AS TOTAL_SALARY
FROM employees AS E
INNER JOIN departments AS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;

Insight: Useful for budget allocation and payroll planning.

⸻

3. Average Salary by Job Title (Excluding Programmers)

SELECT 
    J.JOB_TITLE,
    AVG(E.SALARY) AS AVG_SALARY
FROM employees AS E
INNER JOIN jobs AS J
ON E.JOB_ID = J.JOB_ID
WHERE J.JOB_TITLE NOT LIKE 'Programmer'
GROUP BY J.JOB_TITLE;

Insight: Allows management to benchmark salaries across job roles.

⸻

4️⃣ Key Skills Demonstrated
	•	Basic SQL: SELECT, WHERE, ORDER BY
	•	Joins: INNER JOIN, LEFT JOIN
	•	Aggregations: SUM, COUNT, AVG, MIN, MAX
	•	Grouping & Filtering: GROUP BY, HAVING
	•	String Functions: CONCAT, LENGTH, SUBSTRING
	•	Date Functions: YEAR, DATEDIFF, CURDATE
	•	Subqueries

⸻

5️⃣ Project Files

HR-Database-Employee-Analysis/
│
├── README.md
├── queries/
│   ├── basic_selects.sql
│   ├── joins.sql
│   ├── aggregations.sql
│   ├── date_functions.sql
│   ├── string_functions.sql
│   ├── advanced_queries.sql
└── hr_schema_diagram.png


⸻

📊 Conclusion

This SQL analysis provides deep insights into employee demographics, salaries, departmental distribution, and job roles. It is an excellent example of how relational databases can be queried to support HR decision-making.

⸻


---

If you want, I can prepare **all the `.sql` files + README.md + schema diagram** for you so you can just upload them straight to GitHub, the same way your YouTube example is already GitHub-ready.  

Do you want me to make that full ready-to-upload package for you?
