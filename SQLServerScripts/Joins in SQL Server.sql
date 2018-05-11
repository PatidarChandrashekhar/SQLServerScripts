--What is join??
--An SQL JOIN clause is used to combine rows from two or more tables, based on a common field between them.

--There are many types of join.

--Inner Join
	--Equi-join
	--Natural Join
--Self Join
--Outer Join
	--Left outer Join
	--Right outer join
	--Full outer join
--Cross Join


--To understand join with example, we have to create two tables in SQL Server database.
/*
CREATE TABLE tblJoinstblJoinsEmployee(
[Empid] [Int] IDENTITY (1, 1) NOT NULL Primary key,
[EmpNumber] [nvarchar](50) NOT NULL,
[EmpFirstName] [nvarchar](150) NOT NULL,
[EmpLastName] [nvarchar](150) NULL,
[EmpEmail] [nvarchar](150) NULL,
[Managerid] [int] NULL,
[Departmentid] [INT]
)
CREATE TABLE tblJoinsDepartment(
[Departmentid] [int] IDENTITY (1, 1) NOT NULL primary key,
[DepartmentName] [nvarchar](255) NOT NULL
)

insert into tblJoinstblJoinsEmployee
(EmpNumber,EmpFirstName,EmpLastName,EmpEmail,Managerid,Departmentid)
values('A001','Samir','Singh','samir@abc.com',2,2)
insert into tblJoinstblJoinsEmployee
(EmpNumber,EmpFirstName,EmpLastName,EmpEmail,Managerid,Departmentid)
values('A002','Amit','Kumar','amit@abc.com',1,1)
insert into tblJoinstblJoinsEmployee (EmpNumber,EmpFirstName,EmpLastName,EmpEmail,Managerid,Departmentid)
values('A003','Neha','Sharma','neha@abc.com',1,2)
insert into tblJoinstblJoinsEmployee (EmpNumber,EmpFirstName,EmpLastName,EmpEmail,Managerid,Departmentid)
values('A004','Vivek','Kumar','vivek@abc.com',1,NULL)

insert into tblJoinsDepartment(DepartmentName) values('Accounts')
insert into tblJoinsDepartment(DepartmentName) values('Admin')
insert into tblJoinsDepartment(DepartmentName) values('HR')
insert into tblJoinsDepartment(DepartmentName) values('Technology')
*/
--select * from tblJoinstblJoinsEmployee
--select * from tblJoinsDepartment

--Inner Join
--This type of join is also known as the Equi join. This join returns all the rows from both tables where there is a match. This type of join can be used in the situation where we need to select only those rows which have values common in the columns which are specified in the ON clause.
--Now, if we want to get employee id, employee first name, employee's last name and their department name for those entries employee which belongs to at least one department, then we can use the inner join.

SELECT Emp.Empid, Emp.EmpFirstName, Emp.EmpLastName, Dept.DepartmentName 
 FROM tblJoinstblJoinsEmployee Emp 
  INNER JOIN tblJoinsDepartment dept 
     ON Emp.Departmentid=Dept.Departmentid


--Self Join
--Sometime we need to join a table to itself. This type of join is called Self join. It is one of the type of inner join where both the columns belong to the same table. In this Join, we need to open two copies of a same table in the memory. Since the table name is the same for both instances, we use the table aliases to make identical copies of the same table to be open in different memory locations. For example if we need to get the employee name and their manager name we need to use the self join, since the managerid for an employee is also stored in the same table as the employee.

SELECT Emp1.Empid, 
       Emp1.EmpFirstName+' '+Emp1.EmpLastName as EmployeeName, 
    Emp2.EmpFirstName+' '+Emp2.EmpLastName as ManagerName 
  FROM tblJoinstblJoinsEmployee Emp1 
     INNER JOIN tblJoinstblJoinsEmployee Emp2 
    ON Emp1.Managerid=Emp2.Empid


--Outer Join
--This type of join is needed when we need to select all the rows from the table on the left (or right or both) regardless of whether the other table has common values or not and it usually enter null values for the data which is missing.


--Left Outer Join
--If we want to get employee id, employee first name, employes last name and their department name for all the employees regardless of whether they belong to any department or not,then we can use the left outer join. In this case we keep the Employee table on the left side of the join clause. It will insert NULL values for the data which is missing in the right table.

SELECT Emp.Empid, 
       Emp.EmpFirstName, 
    Emp.EmpLastName, 
    Dept.DepartmentName
  FROM tblJoinstblJoinsEmployee Emp 
     LEFT OUTER JOIN tblJoinsDepartment dept 
     ON Emp.Departmentid=Dept.Departmentid

--Right Outer Join
--If we want to get all the departments name and employee id, employee first name, and employees last name of all the employees belonging to the department regardless of whether a department have employees or not, then we can use the right outer join. In this case we keep the Department table on the right side of the join clause. It will insert NULL values for the data which is missing in the left table (Employee).

SELECT Dept.DepartmentName, 
       Emp.Empid, Emp.EmpFirstName, 
    Emp.EmpLastName 
  FROM tblJoinstblJoinsEmployee Emp 
    RIGHT OUTER JOIN tblJoinsDepartment dept 
   ON Emp.Departmentid=Dept.Departmentid


--Full Outer Join
--If we want to get all the departments name and the employee id, employee first name, employes last name of all the employees regardless of whether a department have employees or not, or whether a employee belong to a department or not, then we can use the full outer join. It will insert null values for the data which is missing in both the tables.

SELECT Emp.Empid, 
       Emp.EmpFirstName, 
    Emp.EmpLastName, 
    Dept.DepartmentName 
  FROM tblJoinstblJoinsEmployee Emp 
     FULL OUTER JOIN tblJoinsDepartment dept 
    ON Emp.Departmentid=Dept.Departmentid


--Cross Join
--This join combines all the rows from the left table with every row from the right table. This type of join is needed when we need to select all the possible combinations of rows and columns from both the tables. This type of join is generally not preferred as it takes lot of time and gives a huge result that is not often useful.
SELECT Emp.Empid,
       Emp.EmpFirstName,
       Emp.EmpLastName,
    Dept.DepartmentName 
 FROM tblJoinstblJoinsEmployee Emp 
   CROSS JOIN tblJoinsDepartment dept


select * from tblJoinstblJoinsEmployee
select * from tblJoinsDepartment
