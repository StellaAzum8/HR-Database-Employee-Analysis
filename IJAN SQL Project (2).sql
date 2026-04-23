select * from countries;
select * from departments;
select * from employees;
select * from job_history;
select * from jobs;
select * from locations;
select * from regions;


-- 1. return query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000
select 
concat(FIRST_NAME, ' ',LAST_NAME ) as FULL_NAME,
SALARY
from employees
where SALARY not between 10000 and 15000;

-- 2. Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.
select 
concat(FIRST_NAME, ' ',LAST_NAME ) as FULL_NAME,
DEPARTMENT_ID
from employees
where DEPARTMENT_ID in (30,100)
order by DEPARTMENT_ID ASC;

/* 3. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in 
department 30 or 100*/
select 
concat(FIRST_NAME, ' ',LAST_NAME ) as FULL_NAME,
SALARY,
DEPARTMENT_ID
from employees
where SALARY not between 10000 and 15000
and DEPARTMENT_ID in (30,100);

-- 4. Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987. 
select 
concat(FIRST_NAME, ' ',LAST_NAME ) as FULL_NAME,
HIRE_DATE
from employees
where year(HIRE_DATE)= 1987;

-- 5. Write a query to display the first_name of all employees who have both "b" and "c" in their first name. 
select 
FIRST_NAME
from employees
where FIRST_NAME like '%b%'
 and FIRST_NAME like '%c%';
 
 /* 6. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to 
$4,500, $10,000, or $15,000.*/
select E.LAST_NAME,
J.JOB_TITLE,
E.SALARY
from employees as E
inner join jobs as J
on E.JOB_ID = J.JOB_ID
where J.JOB_TITLE in ('Programmer', 'Shipping Clerk')
and E.SALARY not in  (4500, 10000, 15000);

-- 7. Write a query to display the last name of employees whose names have exactly 6 characters.
select LAST_NAME
from employees
where LAST_NAME like '______';

 -- 8. Write a query to display the last name of employees having 'e' as the third character.
 select LAST_NAME
from employees
where LAST_NAME like '__e%';

-- 9. Write a query to display the jobs/designations available in the employees table 
select 
distinct J.JOB_TITLE
from jobs as J
inner join employees as E
on E.JOB_ID = J.JOB_ID;

-- 10. Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees. 
select 
concat(FIRST_NAME, ' ',LAST_NAME ) as FULL_NAME,
SALARY,
SALARY * 0.15 as PF
from employees;

-- 11. Write a query to list the number of jobs available in the employees table.
select
count(distinct J.JOB_TITLE) as num_jobs
from employees as E
join jobs as J
on E.JOB_ID = J.JOB_ID;

-- 12. Write a query to get the total salaries payable to employees.
select 
sum(SALARY) as Total_Salary
from employees;

-- 13. Write a query to get the minimum salary from employees table.
select 
min(SALARY) as Min_Salary
from employees;

-- 14. Write a query to get the maximum salary of an employee working as a Programmer.
select E.LAST_NAME,
J.JOB_TITLE,
max(E.SALARY)
from employees as E
inner join jobs as J
on E.JOB_ID = J.JOB_ID
where J.JOB_TITLE in ('Programmer')
group by LAST_NAME,JOB_TITLE,SALARY;

-- 15. Write a query to get the average salary and number of employees working the department 90.
select
(avg(SALARY)) as Average_Salary,
count(*) as Num_Employees
from employees
where DEPARTMENT_ID = 90
group by SALARY;

-- 16. Write a query to get the highest, lowest, sum, and average salary of all employees.
select
max(salary) AS highest_salary,
min(salary) AS lowest_salary,
sum(salary) AS total_salary,
avg(salary) AS average_salary
from employees;

-- 17. Write a query to get the number of employees with the same job.
select
J.JOB_TITLE,
count(E.EMPLOYEE_ID) as Num_Employees
from employees as E
inner join jobs  as J
on J.JOB_ID = E.JOB_ID
group by J.JOB_TITLE;

-- 18. Write a query to get the difference between the highest and lowest salaries.
select
max(salary) - min(salary) as Salary_difference
from employees;

-- 19. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager. 
select 
D.MANAGER_ID,
min(E.SALARY) as Lowest_paid_employee
from employees as E
inner join departments as D
on D.MANAGER_ID = E.MANAGER_ID
group by D.MANAGER_ID,E.SALARY
order by Lowest_paid_employee
limit 1; 

-- 20. Write a query to get the department ID and the total salary payable in each department. 
select 
D.DEPARTMENT_ID,
D.DEPARTMENT_NAME,
sum(E.SALARY) as Total_Salary
from employees as E
inner join departments as D
on D.DEPARTMENT_ID = E.DEPARTMENT_ID
group by D.DEPARTMENT_ID;

-- 21. Write a query to get the average salary for each job ID excluding programmer.
select 
J.JOB_ID,
avg(E.SALARY) as AVG_SALARY
from employees as E
inner join jobs as J
on J.JOB_ID = E.JOB_ID
where JOB_TITLE not like 'programmer'
group by E.JOB_ID;

-- 22. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
select 
JOB_ID,
DEPARTMENT_ID,
sum(SALARY) as TOTAL_SALARY,
max(SALARY) as MAXIMUM_SALARY,
min(SALARY) as MINIMUM_SALARY,
avg(SALARY) as AVERAGE_SALARY
from employees
where DEPARTMENT_ID = 90
group by JOB_ID;

-- 23. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000. 
select
JOB_ID,
max(SALARY) as MAX_SALARY
from employees
group by JOB_ID
having MAX_SALARY >= 4000;

-- 24. Write a query to get the average salary for all departments employing more than 10 employees.
select 
DEPARTMENT_ID,
avg(SALARY) as AVERAGE_SALARY
from employees
group by DEPARTMENT_ID
having count(EMPLOYEE_ID) > 10;

-- 25. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. Go to the editor
select
D.DEPARTMENT_ID,
L.LOCATION_ID,
L.STREET_ADDRESS,
L.CITY,
L.STATE_PROVINCE,
C.COUNTRY_NAME
from departments as D
inner join locations as L
on D.LOCATION_ID = L.LOCATION_ID
inner join countries as C
on L.COUNTRY_ID = C.COUNTRY_ID;

-- 26. Write a query to find the name (first_name, last name), department ID and name of all the employees.
select 
concat(FIRST_NAME, ' ',LAST_NAME ) as FULL_NAME,
DEPARTMENT_ID
from employees;

-- 27. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London. 
select 
concat(E.FIRST_NAME, ' ',E.LAST_NAME ) as FULL_NAME,
D.DEPARTMENT_ID,
D.DEPARTMENT_NAME,
J.JOB_TITLE
from employees as E
inner join jobs as J
on J.JOB_ID = E.JOB_ID
inner join departments as D
on D.DEPARTMENT_ID = E.DEPARTMENT_ID
inner join locations as L
on L.LOCATION_ID = D.LOCATION_ID
where CITY = 'London';

-- 28. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name). 
select 
E1.EMPLOYEE_ID,
E1.LAST_NAME,
E1.MANAGER_ID,
E2.LAST_NAME as MANAGER_NAME
from employees as E1
join employees as E2
on E1.MANAGER_ID = E2.MANAGER_ID;

-- 29. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'. 
select 
concat(FIRST_NAME, ' ',LAST_NAME ) as FULL_NAME,
HIRE_DATE
from employees
where HIRE_DATE > ( select HIRE_DATE from employees where LAST_NAME = 'jones');

-- 30. Write a query to get the department name and number of employees in the department. 
select
D.DEPARTMENT_NAME,
count(E.EMPLOYEE_ID) as NUM_EMPLOYEES
from departments as D
left join employees as E
on D.DEPARTMENT_ID = E.DEPARTMENT_ID
group by D.DEPARTMENT_NAME;

-- 31. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
select 
E.EMPLOYEE_ID,
J.JOB_TITLE,
datediff(JH.END_DATE, JH.START_DATE) as DAYS_WORKED
from employees as E
inner join jobs as J
on E.JOB_ID = J.JOB_ID
inner join job_history as JH
on JH.DEPARTMENT_ID = E.DEPARTMENT_ID
where E.DEPARTMENT_ID = 90;

-- 32. Write a query to display the department ID and name and first name of manager.
select 
D.DEPARTMENT_ID,
D.DEPARTMENT_NAME,
E.FIRST_NAME
from departments as D
inner join employees as E
on D.MANAGER_ID = E.EMPLOYEE_ID;

-- 33. Write a query to display the department name, manager name, and city.
select
D.DEPARTMENT_NAME,
E.FIRST_NAME,
L.CITY
from departments as D
inner join employees as E
on D.MANAGER_ID = E.EMPLOYEE_ID
inner join locations as L
on D.LOCATION_ID = L.LOCATION_ID;

-- 34. Write a query to display the job title and average salary of employees.
select 
J.JOB_TITLE,
avg(E.SALARY) as AVERAGE_SALARY
from employees as E
inner join jobs as J
on J.JOB_ID = E.JOB_ID
group by J.JOB_TITLE;

-- 35. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
select
J.JOB_TITLE,
concat(E.FIRST_NAME, ' ',E.LAST_NAME ) as FULL_NAME,
E.SALARY - J.MIN_SALARY as SALARY_DIFFERENCE
from employees as E
inner join jobs as J
on J.JOB_ID = E.JOB_ID;

-- 36. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
select 
JH.EMPLOYEE_ID,
J.JOB_TITLE,
JH.START_DATE,
JH.END_DATE
from job_history as JH
inner join jobs as J
on JH.JOB_ID = J.JOB_ID
inner join employees as E
on JH.EMPLOYEE_ID = E.EMPLOYEE_ID
where E.SALARY > 10000;

-- 37. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
select 
D.DEPARTMENT_NAME,
concat(E.FIRST_NAME, ' ',E.LAST_NAME ) as FULL_NAME,
E.HIRE_DATE,
E.SALARY
from employees as E
inner join departments as D
on D.MANAGER_ID = E.EMPLOYEE_ID
where datediff(curdate(),E.HIRE_DATE) / 365>15;

-- 38. Write a query to calculate the age in year. Go to the editor
/*select
concat(E.FIRST_NAME, ' ',E.LAST_NAME ) as FULL_NAME,
year(curdate()- year()) - (dayofyear(curdate()) < dayofyear()) as AGE
from employees;*/

/* 39. Write a query to get the current date in the following format.
Sample date : 2014-09-04
Output : September 4, 2014*/
select
date_format(curdate(), '%M %d, %Y') as 'CURRENT_DATE';

/* 40. Write a query to get the current date in Thursday September 2014 format. Go to the editor
Thursday September 2014*/
select 
date_format(curdate(), '%W %M %Y') as 'CURRENT DATE';

-- 41. Write a query to extract the year from the current date. Go to the editor
select 
year(curdate()) as 'CURRENT_DATE';

-- 42. Write a query to get the DATE value from a given day (number in N).
select from_days(727000) AS DATE_VALUE
from dual;

-- 43. Write a query to get the employee id, email id (discard the last three characters).
select
EMPLOYEE_ID,
left(EMAIL, length(EMAIL) - 3) as TRUNCATED_EMAIL
from employees;

-- 44. Write a query to find all employees where first names are in upper case.
select
EMPLOYEE_ID,
FIRST_NAME,
LAST_NAME
from employees
where binary FIRST_NAME = upper(FIRST_NAME);

-- 45. Write a query to extract the last 4 character of phone numbers.
select
EMPLOYEE_ID,
right(PHONE_NUMBER, 4) as LAST_FOUR_DIGITS
from employees;

-- 46. Write a query to get the last word of the street address.
select
substring_index(trim(STREET_ADDRESS), ' ', -1) as LAST_WORD
from locations;

-- 47. Write a query to get the locations that have minimum street length. 
select
locations.*
from locations
where length(STREET_ADDRESS) =( select min(length(STREET_ADDRESS))
from locations );

-- 48. Write a query to display the first word from those job titles which contains more than one words.
select substring_index(JOB_TITLE, ' ', 1) as FIRST_word
from jobs
where instr(JOB_TITLE, ' ') > 0;

-- 49. Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position.
select distinct
EMPLOYEE_ID,
FIRST_NAME,
length(FIRST_NAME) as FIRST_NAME_LENGTH
from employees
where locate('c', LAST_NAME) > 2;

/* 50. Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each 
column an appropriate label. Sort the results by the employees' first names.*/
select 
FIRST_NAME as 'EMPLOYEE NAME',
length(FIRST_NAME) as 'NAME_LENGTH'
from employees
where FIRST_NAME like 'A%' or FIRST_NAME like 'J%' or FIRST_NAME like 'M%'
order by FIRST_NAME;





