## 📌 Project Overview

This project demonstrates applied SQL skills using a classic **Human Resources (HR) database** — a relational dataset commonly used in data analytics training. It covers a wide range of SQL concepts, from basic filtering and string manipulation to multi-table joins, subqueries, aggregate functions, and date/time operations.

The project was completed as part of my data analysis training at **Ijan Africa**, and showcases my ability to write clean, purposeful queries that answer real business questions from structured data.

---

## 🗃️ Database Structure

The HR database consists of **7 interrelated tables**:

| Table | Description |
|---|---|
| `employees` | Core employee records — names, salary, job, department, hire date |
| `departments` | Department names, IDs, manager and location references |
| `jobs` | Job titles with min and max salary ranges |
| `job_history` | Historical records of employee job changes |
| `locations` | Office addresses tied to departments |
| `countries` | Country names linked to locations |
| `regions` | Regional groupings for countries |

---




# Insights & Recommendations — HR SQL Analysis
**Derived from 50 SQL Queries on the HR Database**

---

> Writing queries is only half the job. The other half is knowing what the data is telling you — and what to do about it. This document translates the SQL findings into actionable business insights.

---

## 1. 💸 Salary Distribution is Heavily Skewed

### Insight
Queries 1, 3, 16, and 18 collectively reveal that employee salaries span a very wide range. A large portion of the workforce falls **outside** the $10,000–$15,000 mid-range band, and the gap between the highest and lowest earners is significant. This suggests pay is not clustered around a central grade but is stretched across extremes.

### Recommendation
> HR should conduct a **salary equity audit** — particularly examining whether employees within the same job grade or department are being compensated consistently. A large max-min salary gap (Query 18) within a single department is a red flag for pay inequity that could affect morale and retention.

---

## 2. 🏢 Department 90 Carries Disproportionate Salary Weight

### Insight
Queries 15, 22, and 31 repeatedly focus on Department 90. It has a high average salary, a small headcount, and frequent representation in job history records. This strongly suggests it houses **senior leadership or executive-level staff**.

### Recommendation
> The organisation should **benchmark Department 90 salaries against industry standards** to ensure competitiveness for talent retention at the top. Additionally, reviewing whether the department's output justifies its salary expenditure relative to other departments would surface potential inefficiencies.

---

## 3. 👻 Several Departments Have Zero Employees

### Insight
Query 30 uses a `LEFT JOIN` to include all departments — even those with no current staff. The fact that empty departments appear in results means structural units exist on paper but are completely unstaffed.

### Recommendation
> Management should audit these ghost departments and classify each as: **newly created (unfilled), dormant (abandoned), or budgeted-but-frozen**. Unresolved empty departments distort headcount reporting and inflate perceived organisational scale in workforce planning models.

---

## 4. ⏳ Tenure is Unevenly Distributed — Succession Risk is Real

### Insight
Query 4 shows a notable cluster of employees hired in **1987**, and Query 37 identifies managers with over 15 years of experience. Combined, these findings suggest a significant cohort of long-tenured employees — many of whom may be nearing retirement age simultaneously.

### Recommendation
> The organisation faces a **succession planning gap**. If a large wave of senior staff exits within a short window, institutional knowledge and leadership capacity could collapse at the same time. A **formal succession and mentorship programme** should be initiated now, before attrition becomes urgent.

---

## 5. 📋 Job Title Distribution Reveals an Operationally Heavy Workforce

### Insight
Queries 9, 11, and 17 show which job titles exist and how many employees hold each. Roles like Programmer and Shipping Clerk (seen in Query 6) appear to represent significant headcount, pointing to an organisation heavily weighted toward **operational and technical execution**.

### Recommendation
> Compare the ratio of operational staff to strategic, analytical, and managerial roles. If decision-support functions (analysts, planners, strategists) are underrepresented, the organisation may be **under-investing in the capacity to interpret its own data** — a common bottleneck as companies scale.

---

## 6. 🌍 London Office May Have a Salary Retention Risk

### Insight
Query 27 explicitly filters employees working in **London** — indicating it is a meaningful geographic cluster in the dataset. Multi-location organisations frequently have salary inconsistencies across regions, whether by design or oversight.

### Recommendation
> Run a **location-adjusted salary comparison** between London-based employees and counterparts in other cities doing equivalent roles. London's cost of living is significantly higher than most locations. If salaries are not adjusted accordingly, the organisation faces an above-average **voluntary turnover risk** in that office specifically.

---

## 7. 🔒 Salary-to-Job-Minimum Gap Signals Pay Compression

### Insight
Query 35 calculates the difference between each employee's actual salary and the minimum salary defined for their job. If many employees are earning only slightly above the floor — regardless of tenure or performance — this is a classic indicator of **pay compression**: a situation where newer hires earn almost as much as long-serving staff.

### Recommendation
> HR should flag all employees with a low salary-above-minimum ratio and cross-reference with tenure data. **Pay compression is one of the leading causes of voluntary turnover among experienced employees** — those who feel their years of contribution are not being financially recognised will leave for organisations that do.

---

## 8. 🔄 Multi-Role Employees Are an Underutilised Asset

### Insight
Query 36 surfaces employees who have job history records (i.e., they've held more than one role) and are currently earning above $10,000. This group has both **institutional experience and demonstrated adaptability** — two qualities that are expensive to replace.

### Recommendation
> These employees are strong candidates for **internal promotion pipelines, mentorship roles, or cross-functional project leadership**. Organisations that fail to visibly reward multi-role experience often lose their most versatile people to competitors who recognise it faster.

---

## ✅ Overall Strategic Summary

| Theme | Risk Level | Priority Action |
|---|---|---|
| Salary inequity across grades | 🔴 High | Conduct full salary equity audit |
| Department 90 cost concentration | 🟡 Medium | Benchmark against industry |
| Ghost/empty departments | 🟡 Medium | Audit and classify all empty units |
| Succession planning gap | 🔴 High | Launch mentorship programme now |
| Operational vs. strategic imbalance | 🟡 Medium | Review hiring strategy |
| London salary gap risk | 🟡 Medium | Location-adjust compensation |
| Pay compression | 🔴 High | Flag and review low-margin earners |
| Underutilised experienced staff | 🟢 Low | Build internal promotion pipeline |

---



*This analysis was conducted as part of a SQL data analytics project at Ijan Africa.*
*All insights are derived from structured queries on the HR relational database.*
