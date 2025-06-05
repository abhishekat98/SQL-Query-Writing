SELECT * FROM e.employee;
/*
1.Find the average salary of all employees.
Output: AverageSalary
*/
SELECT(SELECT AVG(Salary) FROM e.employee) AS AverageSalary ;
/*
2.List employees who earn more than the company's average salary.
Output: ID, Salary
*/
Select ID, Salary
from e.employee
where Salary >=( select AVG(Salary) from e.employee);
/*
3.Find the youngest employee(s) in the company.
Output: ID, Age
*/
select ID, Age from e.employee
where Age=(select MIN(Age) from e.employee);
/*
4.Retrieve employees whose salary is equal to the second-highest salary in the company.
Output: ID, Salary
*/
select ID, Salary
from e.employee
where Salary = (select Salary
 from e.employee
 order by Salary DESC
 Limit 1 offset 1);
/*
5.Find employees who have more experience than the company’s average experience.
Output: ID, Experience_Years
*/
select ID,Experience_Years from e.employee
where Experience_Years>(select avg(Experience_Years) from e.employee);
/*
6.Retrieve employees who earn the lowest salary in the company.
Output: ID, Salary
*/
select ID,Salary
from e.employee
where Salary=(select MIN(Salary)from e.employee);
/*
7.Find employees who are older than the average age of all employees.
Output: ID, Age
*/
select ID, Age
from e.employee
where Age >(select avg(Age) from e.employee);
/*
8.List employees who earn more than a specific employee (e.g., the employee with ID = 5).
Output: ID, Salary
*/
select ID, Salary
from e.employee
where Salary>(select Salary from e.employee where ID=7); 
/*
9.Find employees who have the same salary as the youngest employee in the company.
Output: ID, Salary
*/
select ID, Salary 
from e.employee
where Age=(select MIN(Age) from e.employee);
/*
10.Retrieve employees whose experience is above the company's average and salary is below the company's average.
Output: ID, Experience_Years, Salary
*/
Select ID,Experience_Years,Salary from e.employee
where
Experience_Years >(select avg(Experience_Years) from e.employee) AND Salary <(select avg(Salary) from e.employee);

/*
11.Find employees with the second-lowest salary in the company.
Output: ID, Salary
*/
select  ID, Salary from e.employee
where Salary=(select Salary from e.employee
order by Salary DESC
LIMIT 1 OFFSET 1); 
/*
12.Find employees older than any employee who has the highest salary.
Output: ID, Age
*/
select ID, Age
FROM e.employee
WHERE Age > (
    SELECT MIN(Age)
    FROM e.employee
    WHERE Salary = (SELECT MAX(Salary) FROM e.employee)
);
/*
Find the employee(s) with the highest experience but earning less than the average salary.
Output: ID, Experience_Years, Salary
*/
 SELECT ID, (Age - 22) AS Experience_Years, Salary
FROM e.employee
WHERE (Age - 22) = (
    SELECT MAX(Age - 22) FROM e.employee
)
AND Salary < (
    SELECT AVG(Salary) FROM e.employee
);
/*
Find the employee with the highest salary among those who have experience less than the company’s average experience.
Output: ID, Experience_Years, Salary
*/
SELECT ID, (Age - 22) AS Experience_Years, Salary
FROM e.employee
WHERE (Age - 22) < (
    SELECT AVG(Age - 22) FROM e.employee
)
ORDER BY Salary DESC
LIMIT 1;

