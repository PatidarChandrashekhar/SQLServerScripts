
/*
	create table tblDuplicateEmployee(empid int,name varchar(20))
	truncate table tblDuplicateEmployee
    insert into tblDuplicateEmployee values(1,'Andy')
    insert into tblDuplicateEmployee values (1,'Andy')
    insert into tblDuplicateEmployee values (2,'Chris')
    insert into tblDuplicateEmployee values(3,'Bill')
    insert into tblDuplicateEmployee values(3,'Bill')
    insert into tblDuplicateEmployee values (3,'Bill') 
*/

select * from tblDuplicateEmployee

--Method 1:
--Insert the distinct rows from the duplicate rows table to new temporary table. Then delete all the data from duplicate rows table then insert all data from temporary table which has no duplicates as shown below.
/*
select distinct * into #tmp From tblDuplicateEmployee
delete from tblDuplicateEmployee
insert into tblDuplicateEmployee select * from #tmp drop table #tmp
select * from tblDuplicateEmployee
*/

--Method 2:
--If you want to consider only few columns in a table for duplication criteria to delete rows then Method1 doesn't work. In our example assume if EMDup has one more column "hobbies" extra apart from empid , name but you want to delete duplicate records if empid and name are repeated irrespective of "hobbies" data column, in this case Method1 will not work and follow "Method2".
--Delete duplicate rows using Common Table Expression(CTE)
/*
With CTE_Duplicates as
(select empid,name , row_number() over(partition by empid,name order by empid,name) rownumber from tblDuplicateEmployee)
delete from CTE_Duplicates where rownumber > 1
*/

--Method 3:Following code is useful to delete duplicate records. The table must have identity column, which will be used to identify the duplicate records. Table in example is has empid as Identity Column and Columns which have duplicate data
/*
DELETE FROM tblDuplicateEmployee
WHERE empid NOT IN (SELECT MAX(empid) FROM tblDuplicateEmployee GROUP BY empid, name)
*/



