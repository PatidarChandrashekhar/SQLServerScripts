/*
--Rank Functions in SQL Server
--ROW_NUMBER() OVER ([PARTITION BY CLAUSE] <ORDER BY CLUASE>): Returns the sequantial number of a row within the a partition of result set at 1 for the first row of the each partition.
--RANK() OVER ([PARTITION BY CLAUSE] <ORDER BY CLUASE >): Returns rank for rows within the partition of result set.
--DENSE_RANK() OVER ([PARTITION BY CLAUSE] <ORDER BY CLUASE >): Returns rank for rows within the partition of result set.With out any gaps in the ranking.
--NTILE(INTEGER_EXPRESSION) OVER ([PARTITION BY CLAUSE] <ORDER BY CLUASE >): Distributes the rows in an ordered partition into a specified number of groups.


--create tblRankEmployee table  
create table tblRankEmployee  
(  
   EmpId int identity(1,1) primary key,  
   FirstName varchar(100),  
   LastName varchar(100),  
   JoinDate datetime ,  
   Salary int ,  
   Department varchar(20)  
)

--Insert data to tblRankEmployee table  
  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department)values('Rakesh','Kalluri','2012-07-01 10:00:00.000',20000,'Software')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department)values('Shabari','Vempati','2011-05-01 10:00:00.000',25000,'Software')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department)values('Venkatesh','Bodupaly','2013-04-01 10:00:00.000',15000,'Bpo')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department)values('Surjan','Peddineni','2011-07-01 10:00:00.000',25000,'Software')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department) values('Nani','Ch','2010-07-01 10:00:00.000',50000,'Software')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department) values('Raju','Chinna','2012-07-01 10:00:00.000',25000,'Software')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department) values('Kiran','Kumar','2011-07-01 10:00:00.000',20000,'Software')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department) values('Raki','Kumar','2012-07-01 10:00:00.000',17000,'Bpo')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department) values('Sri','Vidya','2011-07-01 10:00:00.000',30000,'Software')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department) values('Fehad','MD','2013-07-01 10:00:00.000',20000,'Bpo')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department)values('Anusha','Kumari','2011-07-01 10:00:00.000',35000,'Software')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department) values('Venky','Naidu','2013-07-01 10:00:00.000',20000,'Bpo')  
insert into tblRankEmployee(FirstName,LastName,JoinDate,Salary,Department)values('Radha','Kumari','2012-07-01 10:00:00.000',10000,'Bpo')
*/

--selecting data from tblRankEmployee table  
select * from tblRankEmployee 

--Row_Number() with out using partition cluase  
select * ,row_number() over (order by Salary desc) as Row_Num from tblRankEmployee  


--Row_Number() with using partition cluase  
select * ,row_number() over (partition by Department order by Salary desc) as Row_Num from tblRankEmployee

--rank() with out using partition cluase  
select * ,rank() over (order by Salary desc) as [Rank] from tblRankEmployee  


--rank() with using partition cluase  
select * ,rank() over (partition by Department order by Salary desc) as [Rank] from tblRankEmployee 


--dense_rank() with out using partition cluase  
select * ,dense_rank() over (order by Salary desc) as [Dense_rank] from tblRankEmployee  

--dense_rank() with using partition cluase  
select * ,dense_rank() over (partition by Department order by Salary desc) as [Dense_rank] from tblRankEmployee  


--ntile(input_exp) with out using partition cluase  
select * ,ntile(3) over (order by Salary desc) as [ntile] from tblRankEmployee  


--ntile(input_exp) with using partition cluase  
select * ,ntile(3) over (partition by Department order by Salary desc) as [ntile] from tblRankEmployee

