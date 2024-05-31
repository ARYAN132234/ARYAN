Create database Hr ;

Use Hr ;

                          # 	PAGE 1

-- 1. Display all information in the tables EMP and DEPT.
Select * from empl ;

select * from department_dataset ;

-- 2. Display only the hire date and employee name for each employee. 
select HIRE_DATE, FIRST_NAME , LAST_NAME From empl ;

/* 3. Display the ename concatenated with the job ID, separated by a comma and space, 
and name the column Employee and Title */


Select CONCAT('FIRST_NAME', ',', ' ', 'JOB_ID', ',', ' ') 
From empl  Employeetitle ;

-- 4. Display the hire date, name and department number for all clerks. 

Select HIRE_DATE, FIRST_NAME , DEPARTMENT_ID From empl 
WHERE JOB_ID = 'PU_CLERK' ;

/*5. Create a query to display all the data from the EMP table. 
  Separate each column by a comma. Name the column THE OUTPUT */

SELECT concat_ws(',', EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, 
  SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) AS 'THE OUTPUT'FROM EMPLOYEES;
  
--  6. Display the names and salaries of all employees with a salary greater than 2000.

Select FIRST_NAME, SALARY From employees WHERE SALARY > 2000  ;

/* 7 . Display the names and dates of employees with the column headers "Name" and "Start 
Date" */

select FIRST_NAME AS "Name" , HIRE_DATE AS "Start Date" from employees ;

--  8.Display the names and hire dates of all employees in the order they were hired

select FIRST_NAME , HIRE_DATE from employees order by HIRE_DATE ;

-- 9. Display the names and salaries of all employees in reverse salary order

select FIRST_NAME , SALARY from employees order by salary DESC ;

/* 10. Display 'ename" and "deptno" who are all earned commission 
and display salary in reverse order */

SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
FROM employees
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY salary DESC;

-- 11. Display the last name and job title of all employees who do not have a manager 

select LAST_NAME , JOB_ID from empl where MANAGER_ID is not null ;

/* 12. Display the last name, job, and salary for all employees whose job is sales representative 
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000 */

select LAST_NAME, JOB_ID, SALARY from employees 
where JOB_ID = "FI_ACCOUNT" OR "PU_CLERK" AND salary NOT IN (2500, 3500, 5000);
select * from empl where FIRST_NAME LIKE "a%" ;
select * from empl where FIRST_NAME like "c_o%" ;

                             # 2 PAGE

/* 1. Display the maximum, minimum and average salary and commission earmed.*/

select max(SALARY) from empl ;
select min(SALARY) from empl ;
select avg(SALARY) from empl ;
select max(COMMISSION_PCT) from empl ;
select min(COMMISSION_PCT) from empl ;
select avg(COMMISSION_PCT) from empl ;

/* 2.Display the department number, total salary payout and total commission
 payout for each department. */

select Dept_id,salary, commission from depart ;
 
 # 3.Display the department number and number of employees in each department
 
 select Dept_id ,no_of_emp from depart ;
 
 /* 4.Display the depatment number and total salary of employees in
  each department.*/
  
  select Dept_id ,salary from depart ;
  
  # 5. Display the employee's name who doesn't earn a commission. 
  
  select * from empl where COMMISSION_PCT = ' - ';
  
 /* 6. Display the employees name, department id and commission. */
 
 select FIRST_NAME,LAST_NAME,DEPARTMENT_ID, Commission_p from empl ;
 
# 7.Display the employee's name, salary and commission multiplied by 2. 

select FIRST_NAME,LAST_NAME,SALARY,Commission_p from empl
where 2 * Commission_p ;

/* 8.Display the enployee's name, department id who have the first name same as
 another employee in the same department */
 
 SELECT e1.name, department_id
FROM employees e1
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e1.first_name = e2.first_name
    AND e1.department_id = e2.department_id
    AND e1.employee_id <> e2.employee_id
);
 
# 9. Display the sum of salaries of the employees working under each Manager.

select sum(SALARY) from empl group by MANAGER_ID ;

/*10.Select the Managers name, the count of employees working under and the department 
ID of the manager. */

select Dept_id,  no_of_emp,manager_name from depart ;

/* 11.Select the employee name, department id, and the salary. Group the result with the 
manager name and the employee last name should have second letter 'a! */

SELECT e.employee_name, e.department_id, e.salary, m.manager_name
FROM empl
JOIN managers m ON e.manager_id = m.manager_id
WHERE SUBSTRING(e.employee_last_name, 2, 1) = 'a'
GROUP BY m.manager_name, e.employee_last_name;

/* 12.Display the average of sum of the salaries and group the result with the 
department id. Order the result with the department id.*/

select DEPARTMENT_ID,avg(SALARY) from empl group by DEPARTMENT_ID order by DEPARTMENT_ID ;

/*13.Select the maximum salary of each department along with the department id */

select Dept_id,max(salary) from depart group by Dept_id;

/*  14.Display the commission, if not null display 10% of salary, if null display a default
 value 1 */
 
 SELECT 
    CASE 
	WHEN Commission_p IS NOT NULL THEN salary * 0.10 
	ELSE 1 
    END AS commission_value
FROM empl ;

                                    #3

/*.1. Write a query that displays the employee's last names only from the string's 
2-5th position with the first letter capitalized and all other letters lowercase,
 Give each column an appropriate label.*/

SELECT UPPER(SUBSTRING(LAST_NAME, 2, 4)) AS modified_last_name
FROM empl;

/*2.Write a query that displays the employee's first name and last name along with 
a" in between for e.g: first name : Ram; last name : Kumar then Ram-Kumar.
 Also displays the month on which the employee has joined. */
 
 SELECT CONCAT(FIRST_NAME, ' "', LAST_NAME, '"') AS full_name,MONTH(HIRE_DATE) 
 AS join_month FROM empl ;
 
/* 3.Write a query to display the employee's last name and if half of the salary 
is greater than ten thousand then increase the salary by 10% else by 11.5% along
 with the bonus amount of 1500 each. Provide each column an appropriate label. */
 
SELECT last_name,
    CASE 
	WHEN salary * 0.5 > 10000 THEN salary * 1.10 
	ELSE salary * 1.115 
    END AS adjusted_salary,
    1500 AS bonus_amount
FROM empl;

 /*4. Display the employee ID by Appending two zeros after 2nd digit
 and '"E' in the end, department id, salary and the manager name all in Upper
 case, if the Manager name consists of z' replace it with '$!*/

SELECT 
    CONCAT(SUBSTRING(employee_id, 1, 2), '00', '"E') AS modified_employee_id,
    department_id,salary,
    UPPER(REPLACE(FIRST_NAME, 'z', '$!')) AS modified_manager_name
FROM empl;

/* 5.Write a query that displays the employee's last narmes with the first letter 
capitalized and all other letters lowercase, and the length of the names, for all 
employees whose name starts with J, A, or M. Give each column an appropriate label.
 Sort the results by the employees' last names*/
 
 SELECT UPPER(SUBSTRING(LAST_NAME, 1, 1)) || LOWER(SUBSTRING(LAST_NAME, 2)) 
 AS modified_last_name,LENGTH(last_name) AS name_length
FROM empl
WHERE LAST_NAME LIKE 'J%' or LAST_NAME like 'A%' or LAST_NAME like 'M%';

/*  6.Createa query to display the last name and salary for all employees. Format
 the salary to be 15 characters long, left-padded with $. Label the column SALARY */
 
 SELECT LAST_NAME , LPAD(CONCAT('$', salary), 15, '$') AS SALARY
 from empl;

# 7.Display the employee's name if it is a palindrome

SELECT first_name FROM empl
WHERE BINARY first_name = REVERSE(first_name);

#8. Display First names of all employees with initcaps. 

select inticap(FIRST_NAME) as BB from empl;

/* 9.From LOCATIONS table, extract the word between first and second space from the 
STREET ADDRESS column.*/

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(dept_location , ' ', 2), ' ', -1)
 from location ;
 
 /*10.Extract first letter from First Name column and append it with the Last Name.
 Also add "@systechusa.com" at the end. Name the column as e-mail address. All 
 characters should be in lower case. Display this along with their First Name */
 
 SELECT first_name,CONCAT(LOWER(SUBSTRING(first_name, 1, 1)), last_name,
 '@systechusa.com') Email_adress from   empl ;
 
 /* 11.Display the names and job titles of all employees with the same job as Trenna*/
 
 SELECT first_name,last_name,JOB_ID
FROM empl WHERE JOB_ID = PU_MAN ;

/*12. Display the names and department name of all employees working in the same 
city as Trenna.*/

SELECT e.first_name,e.last_name,e.JOB_ID
FROM empl e
JOIN depart d ON e.DEPARTMENT_ID= d.Dept_id ;

# .13. Display the name of the employee whose salary is the lowest.

SELECT first_name, last_name
FROM empl WHERE salary = (SELECT MIN(salary) FROM empl);

# 14. Display the names of all employees except the lowest paid. 

SELECT first_name, last_name FROM empl
WHERE salary > (SELECT MIN(salary) FROM empl);

                              #4

/*1.Write a query to display the last name, department number, department name
 for all employees. */
 
 SELECT last_name, DEPARTMENT_ID,JOB_ID FROM empl;

/*2.Create a unique list of all jobs that are in department 4. Include the location of the 
department in the output. */

SELECT DISTINCT j.job_title, d.department_location
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id = 4;

/*3.Write a query to display the employee last name,department name,location id and city of 
all employees who earn commission.*/

SELECT e.last_name, d.department_name, l.location_id, l.city
FROM empl e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN job_history jh ON e.employee_id = jh.employee_id
WHERE jh.commission_pct IS NOT NULL;

/*.4. Display the employee last name and department name of all employees who
 have an 'a' in their last name */
 
 SELECT e.last_name,e.JOB_ID
FROM empl e
JOIN depart d ON e.DEPARTMENT_ID = d.Dept_id
WHERE e.last_name LIKE '%a%';

/* 5.Write a query to display the last name,job,department number and 
department name for all employees who work in ATLANTA.*/

SELECT e.last_name, j.job_title, e.department_id, d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'ATLANTA';

/*.6. Display the employee last name and employee number along with their 
manager's last name and manager number. */

SELECT e.last_name AS employee_last_name, e.employee_id AS employee_number,
m.last_name AS manager_last_name, e.manager_id  manager_number FROM 
employees e LEFT JOIN employees m ON e.manager_id = m.employee_id;

/*7.Display the employee last name and employee number along with their 
manager's last name and manager number (including the employees who have
no manager). */

SELECT e.last_name AS employee_last_name, e.employee_id AS employee_number,
COALESCE(m.last_name, 'No Manager') AS manager_last_name,
e.manager_id AS manager_number FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

/*.8. Create a query that displays employees last name,department number,and
 all the employees who work in the same department as a given employee. */

SELECT e1.last_name AS employee_last_name, e1.department_id,
e2.last_name AS colleague_last_name FROM employees e1
JOIN employees e2 ON e1.department_id = e2.department_id ;

/*9. Create a query that displays the name,job,department name,salary,grade for all 
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=c) */

SELECT e.last_name AS employee_name,j.job_title,d.department_name,e.salary,
	CASE
	WHEN e.salary >= 50000 THEN 'A'
	WHEN e.salary >= 30000 THEN 'B'
	ELSE 'C'
	END AS grade
FROM empl e JOIN jobs j ON e.job_id = j.job_id
JOIN depart d ON e.department_id = d.department_id;

/*.10. Display the names and hire date for all employees who were hired before their 
managers along withe their manager names and hire date. Label the columns as Employee 
name, emp hire date,manager name,man hire date */

SELECT emp.last_name AS "Employee name", emp.hire_date AS "emp hire date",
mgr.last_name AS "Manager name", mgr.hire_date AS "man hire date"
FROM employees emp
JOIN employees mgr ON emp.manager_id = mgr.employee_id
WHERE emp.hire_date < mgr.hire_date;

                                         #5

/*1. Write a query to display employee numbers and employee name (first name, last name) 
of all the sales employees who received an amount of 2000 in bonus.*/

SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name FROM empl e
JOIN job_history jh ON e.employee_id = jh.employee_id
JOIN jobs j ON jh.job_id = j.job_id
WHERE j.job_title = 'Sales Representative' AND jh.bonus = 2000;

/*. 2.Fetch address details of employees belonging to the state CA. If address is nul, 
provide default value N/A. */

SELECT e.employee_id, COALESCE(a.address, 'N/A') AS address,
COALESCE(a.city, 'N/A') AS city,COALESCE(a.state, 'N/A') AS state,
COALESCE(a.country, 'N/A') AS country,COALESCE(a.postal_code, 'N/A') AS postal_code
FROM employees e LEFT JOIN addresses a ON e.address_id = a.address_id
WHERE a.state = 'CA' OR a.state IS NULL;

/*3. Write a query that displays all the products along with the Sales Orderl D even if
 an order has never been placed for that product. */
 
 SELECT p.product_id, p.product_name, so.order_id AS Sales_Order_ID FROM products p
LEFT JOIN sales_orders so ON p.product_id = so.product_id;

#  4 .Find the subcategories that have at least two different prices less than $15.

SELECT subcategory_id FROM 
(SELECT subcategory_id, price FROM products WHERE price < 15) AS sub_prices
GROUP BY subcategory_id
HAVING COUNT(DISTINCT price) >= 2;

/*  5.A. Write a query to display employees and their manager details. Fetch employee id, 
employee first name, and manager id, manager name. 
B. Display the employee id and employee name of employees who do not have manager.*/

SELECT e.employee_id AS employee_id,
e.first_name AS employee_first_name,
m.employee_id AS manager_id,
m.first_name || ' ' || m.last_name AS manager_name
FROM empl e LEFT JOIN employees m ON e.manager_id = m.employee_id;

/*6. A. Display the names of all products of a particular subcategory 15 and the names of their 
vendors. 
B. Find the products that have more than one vendor. */

SELECT product_id,COUNT(DISTINCT vendor_id) AS num_vendors FROM products
GROUP BY product_id HAVING COUNT(DISTINCT vendor_id) > 1;

# 7. Find all the customers who do not belong to any store.

SELECT c.* FROM customers c
LEFT JOIN stores s ON c.customer_id = s.customer_id
WHERE s.customer_id IS NULL;

/*.8. Find sales prices of product 718 that are less than the list price recommended 
for that product. */

SELECT sales_price FROM products
WHERE product_id = 718 AND sales_price < list_price;

# 9. Display product number, description and sales of each product in the year 2001. 
 
 SELECT p.product_number, p.description, s.sales FROM products p
JOIN sales s ON p.product_id = s.product_id
WHERE EXTRACT(YEAR FROM s.sales_date) = 2001;

/* 10.Build the logic on the above question to extract sales for each category by year. 
Fetch Product Name, Sales_2001, Sales_2002, Sales _2003.*/

SELECT p.product_name,
SUM(CASE WHEN EXTRACT(YEAR FROM s.sales_date) = 2001 THEN s.sales ELSE 0 END) AS Sales_2001,
SUM(CASE WHEN EXTRACT(YEAR FROM s.sales_date) = 2002 THEN s.sales ELSE 0 END) AS Sales_2002,
SUM(CASE WHEN EXTRACT(YEAR FROM s.sales_date) = 2003 THEN s.sales ELSE 0 END) AS Sales_2003
FROM products p JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_name;

                                #6

/*1.Write a query to display the last name and hire date of any employee in the same 
department as SALES. */

SELECT last_name, hire_date FROM employees
WHERE department = (SELECT department FROM employees WHERE department = 'SALES' LIMIT 1);

/* 2. Create a query to display the employee numbers and last names of all employees who 
eam more than the average salary. Sort the results in ascending order of salary.*/

SELECT employee_number, last_name FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees) ORDER BY salary ASC;

/* 3. Write a query that displays the employee numbers and last names of all employees who 
work in a department with any employee whose last name contains a' u */

SELECT employee_number, last_name FROM employees
WHERE department IN (SELECT department FROM employees
WHERE last_name LIKE '%u%') ORDER BY last_name;

/* 4. Display the last name, department number, and job ID of all employees whose 
department location is ATLANTA. */

SELECT e.last_name, d.department_number, e.job_id FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.location_name = 'ATLANTA';

/* 5. Display the last name and salary of every employee who reports to FILLMORE.*/

SELECT e.last_name, e.salary FROM employees e
JOIN employees manager ON e.manager_id = manager.employee_id
WHERE manager.last_name = 'FILLMORE';

/*6. Display the depatment number, last name, and job ID for every employee in the 
OPERATIONS department.*/

SELECT d.department_number, e.last_name, e.job_id FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'OPERATIONS';

/*7. Modify the above query to display the employee numbers, last names, and salaries of all 
employees who eam more than the average salary and who work in a department with any 
employee with a 'u'in their name.*/

SELECT e.employee_number, e.last_name, e.salary FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees)
AND e.department_id IN (SELECT department_idFROM employees
WHERE last_name LIKE '%u%');

/*8. Display the names of all employees whose job title is the same as anyone in the sales 
dept.*/

SELECT e.last_name FROM employees e
WHERE e.job_title IN (SELECT DISTINCT e2.job_title
FROM employees e1 JOIN employees e2 ON e1.job_title = e2.job_title
WHERE e1.department_id = (SELECT department_idFROM departments
WHERE department_name = 'Sales'));

/*9. Write a compound query to produce a list of employees showing raise percentages, 
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
jven a 15% raise, and enployees in department 6 are not given a raise.*/

-- Employees in department 1 and 3 (5% raise)
SELECT employee_id, salary, 5 AS raise_percentage
FROM employees
WHERE department_id IN (1, 3)
UNION ALL
-- Employees in department 2 (10% raise)
SELECT employee_id, salary, 10 AS raise_percentage
FROM employees
WHERE department_id = 2
UNION ALL
-- Employees in departments 4 and 5 (15% raise)
SELECT employee_id, salary, 15 AS raise_percentage
FROM employees
WHERE department_id IN (4, 5)
UNION ALL
-- Employees in department 6 (no raise)
SELECT employee_id, salary, 0 AS raise_percentage
FROM employees
WHERE department_id = 6;

/*10. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
names and salaries. */

SELECT last_name, salary FROM employees
ORDER BY salary DESC LIMIT 3;

/*11. Display the names of all employees with their salary and commission earmed. Employees 
with a null commission should have O in the commission colunn*/

SELECT last_name, salary, COALESCE(commission, 0) AS commission_earned
FROM employees;

/*12. Display the Managers (narne) with top three salaries along with their salaries and 
department information.*/

SELECT m.last_name AS manager_name, e.salary, d.department_name
FROM employees e JOIN employees m ON e.manager_id = m.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE e.job_id LIKE '%MAN%' -- Assuming the job_id for managers contains 'MAN'
ORDER BY e.salary DESC LIMIT 3;

                        #7
                        
/* 1. Find the date difference between the hire date and resignation date for all the 
employees. Display in no. of days, months and year(1 year 3 months 5 days). 
Emp ID Hire Date Resignation Date 
1 //200o 7/1o/2013 
2 4/12/2003 3/8/2017 
3 22/9/2012 21/6/2015 
4 13/4/2015 NULL 
5 03/06/2016 NULL 
6 08/08/2017 NULL 
7 13/11/2016 NULL   */     


SELECT Emp_ID, Hire_Date, Resignation_Date,
CONCAT(FLOOR(DATEDIFF(Resignation_Date, Hire_Date) / 365), ' years ',
FLOOR((DATEDIFF(Resignation_Date, Hire_Date) % 365) / 30), ' months ',
(DATEDIFF(Resignation_Date, Hire_Date) % 365) % 30, ' days'
) AS Time_Difference FROM Employees;
               
 /*2) Format the hire date as mm/dd/yyyy(o9/22/20o3) and resignation 
 date as mon dd, */                       
                        
SELECT Emp_ID, 
DATE_FORMAT(Hire_Date, '%m/%d/%Y') AS Formatted_Hire_Date, 
DATE_FORMAT(Resignation_Date, '%b %d, %Y') AS Formatted_Resignation_Date,
CONCAT(FLOOR(DATEDIFF(Resignation_Date, Hire_Date) / 365), ' years ',
FLOOR((DATEDIFF(Resignation_Date, Hire_Date) % 365) / 30), ' months ',
(DATEDIFF(Resignation_Date, Hire_Date) % 365) % 30, ' days') AS Time_Difference
FROM Employees;

/*3) Calcuate experience of the employee till date in Years and months
(example 1 year and 3 months)*/

SELECT Emp_ID, 
CONCAT(FLOOR(DATEDIFF(NOW(), Hire_Date) / 365), ' years ',
FLOOR((DATEDIFF(NOW(), Hire_Date) % 365) / 30), ' months') AS Experience
FROM Employees;

# Use Getdate() as input date for the below three questions. 

/*4) Display the count of days in the previous quarter*/

SELECT DATEDIFF(DAY, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()) - 1, 0), 
DATEADD(DAY, -1, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()), 0))) + 1
 AS DaysInPreviousQuarter;

# 5) Fetch the previous Quarter's second week's first day's date

SET @StartOfPreviousQuarter = DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()) - 1, 0);
SET @EndOfPreviousQuarter = DATEADD(DAY, -1, DATEADD(QUARTER,
 DATEDIFF(QUARTER, 0, GETDATE()), 0));
SET @SecondWeekFirstDay = DATEADD(WEEK, 1, DATEADD(DAY, 1 - DATEPART
(WEEKDAY, DATEADD(DAY, 1, @StartOfPreviousQuarter)), @StartOfPreviousQuarter));
SELECT @SecondWeekFirstDay AS PreviousQuarterSecondWeekFirstDay;

# 6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)

SET @FinancialYearStart = DATEADD(YEAR, CASE WHEN MONTH(GETDATE()) < 4 
THEN -1 ELSE 0 END, DATEFROMPARTS(YEAR(GETDATE()), 4, 1));
SET @FinancialYearEnd = DATEADD(DAY, -1, DATEADD(YEAR, 1, @FinancialYearStart));
SET @StartDateOfWeek15 = DATEADD(WEEK, 14, @FinancialYearStart);
SET @EndDateOfWeek15 = DATEADD(DAY, 6, @StartDateOfWeek15);
SELECT FORMAT(@StartDateOfWeek15, 'ddd MMM dd yyyy') AS StartDateOfWeek15,
FORMAT(@EndDateOfWeek15, 'ddd MMM dd yyyy') AS EndDateOfWeek15;

/*7) Find out the date that corresponds to the last Saturday of January, 
2015 using with clause. */


SELECT CAST('2015-01-01' AS DATE) AS Date -- Start from the first day of January 2015 
UNION ALL SELECT DATEADD(DAY, 1, Date) 
FROM Calendar WHERE MONTH(Date) = 1 -- Select dates only from calender
FROM Calendar
WHERE DATENAME(WEEKDAY, Date) = 'Saturday'; -- Filter only Saturdays

# Use Airport database for the below two question:

# 8) Find the number of days elapsed between first and last flights of a passenger.

SELECT PassengerID,DATEDIFF(DAY, MIN(FlightDate), MAX(FlightDate)) AS DaysElapsed
FROM Flights GROUP BY PassengerID;

/*9) Find the total duration in minutes and in seconds of the flight from Rostov
 to Moscow.*/
 
SELECT SUM(DATEDIFF(MINUTE, DepartureTime, ArrivalTime)) AS TotalMinutes,
SUM(DATEDIFF(SECOND, DepartureTime, ArrivalTime)) AS TotalSeconds
FROM Flights
WHERE DepartureAirport = 'Rostov' AND ArrivalAirport = 'Moscow';


























































 
 
 
 
 
 
 
 
 
 



























































 
 
 
 


