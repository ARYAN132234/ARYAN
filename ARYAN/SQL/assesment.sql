                       # ASSESSMENT 1
                       
/*1. Write an SQL query to print all Worker details from the Worker table 
order by FIRST_NAME Ascending and DEPARTMENT Descending. */

SELECT * FROM Worker 
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;    

/*2.Write an SQL query to print details for Workers with the first names 
“Vipul” and “Satish” from the Worker table. */                  

SELECT * FROM WORKERS WHERE FIRST_NAME IN ("VIPUL","SATISH");

/*3. Write an SQL query to print details of the Workers whose FIRST_NAME 
ends with ‘h’ and contains six alphabets.*/

SELECT * FROM WORKERS WHERE FIRST_NAME LIKE "_____H" ;

/*4. Write an SQL query to print details of the Workers whose SALARY 
lies between 1*/

SELECT * FROM WORKER WHERE SALARY = 1 ;

/*5. Write an SQL query to fetch duplicate records having matching data in 
some fields of a table.*/

SELECT * FROM Worker
WHERE (FIRST_NAME, LAST_NAME, DEPARTMENT) IN (
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT FROM Worker
GROUP BY FIRST_NAME, LAST_NAME, DEPARTMENT
HAVING COUNT(*) > 1);

/*6. Write an SQL query to show the top 6 records of a table. */

SELECT * FROM WORKER LIMIT 6;

/*7. Write an SQL query to fetch the departments that have less than five 
people in them.*/

SELECT DEPARTMENT
FROM Worker GROUP BY DEPARTMENT HAVING COUNT(*) < 5;

/*8. Write an SQL query to show all departments along with the number of 
people in there. */

SELECT DEPARTMENT, COUNT(*) AS Number_of_People FROM Worker
GROUP BY DEPARTMENT;

/*9. Write an SQL query to print the name of employees having the 
highest salary in each department.*/

SELECT FIRST_NAME,LAST_NAME,MAX(SALARY) FROM WORKER
GROUP BY DEPARTMENT ;


                     # ASSESSMENT 2  

# 1 To display all the records form STUDENT table.

 SELECT * FROM student ; 
 
# 2. To display any name and date of birth from the table STUDENT.

 SELECT StdName, DOB FROM student ;  
 
/*3. To display all students record where percentage is greater of equal to 
80 FROM student table. */

SELECT * FROM student WHERE percentage >= 80; 
 
/*4. To display student name, stream and percentage where percentage 
of student is more than 80 */

SELECT StdName, Stream, Percentage WHERE percentage > 80;
  
/*5. To display all records of science students whose percentage is more 
than 75 form student table.*/ 

SELECT * FROM student WHERE stream = ‘Science’ AND percentage > 75;



















