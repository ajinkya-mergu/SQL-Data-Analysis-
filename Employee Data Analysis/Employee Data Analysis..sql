select * from employee;

/*Write a query to find the first name and salary of the employee whose salary is higher than
 the employee with the last name Kumar from the employee table.*/
select f_name,salary from employee
where salary > (select salary from employee where l_name='kumar');


/*Write a query to display the employee id and last name of the employee
 whose salary is greater than the average salary from the employee table.*/
 select emp_id,l_name,salary from employee
 where salary > (select avg(salary) from employee);
 
 /*Write a query to display the employee id, first name, 
 and salary of the employees who earn a salary that is higher than the salary
 of all the shipping clerks (JOB_ID = HP122). Sort the results of the salary in ascending order.*/
select emp_id,f_name,salary from employee
where salary > (select job_id from employee where job_id='hp122')
order by salary asc;


/*Write a query to display the first name, employee id, and salary of the first three employees with highest salaries.*/
select f_name , emp_id , salary from employee
order by salary desc
limit 3;