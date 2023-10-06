--32. Mitme avaldisega tabeliväärtusega funktsioonid

-- Definitsioon funktsioonile fn_ILTVF_GetEmployees, mis tagastab tabeli
Create Function fn_ILTVF_GetEmployees()
Returns Table
as
Return (Select EmployeeKey, Firstname,Cast (BirthDate as Date) as DOB
from Dimemployee);
select * from fn_ILTVF_GetEmployees(); -- Kutsu funktsiooni ja kuvab tulemused

-- Definitsioon funktsioonile fn_MSTVF_GetEmpolyees, mis tagastab tabeli
Create Function fn_MSTVF_GetEmpolyees()
Returns @Table Table(Id int, Name varchar(20), DOB Date)
as
Begin
Insert into @Table
Select EmployeeKey, FirstName,Cast(BirthDate as Date)
from Dimemployee
return
end

-- Kutsu funktsiooni ja kuvab tulemused
select * from fn_MSTVF_GetEmpolyees();

--36. Klastreeritud ja mitte-klastreeritud indeksid

-- Loob tabeli tblEmployee
Select * from tblEmployee
CREATE TABLE tblEmployee(
id int primary key,
name nvarchar(50),
salary int,
gender nvarchar(10),
city nvarchar(50))

select * from tblEmployee

-- Lisab andmeid tabelisse tblEmployee
insert into tblEmployee values
(3,'John',4500,'Male','New York')
insert into tblEmployee values
(1,'Sam',2500,'Male','London')
insert into tblEmployee values
(4,'Sara',5500,'Female','Tokyo')
insert into tblEmployee values
(5,'Todd',3100,'Male','Totonto')
insert into tblEmployee values
(2,'Pam',6500,'Female','Sydney')

-- Loob klastreeritud indeksi tblEmployee tabelile
create clustered index IX_tblEmployee_Name
on tblEmployee(Name)

-- Loob klastreeritud indeksi tblEmployee tabelile koos mitme välja sorteerimisega
create clustered index IX_tblEmployee_gender_salary
on tblEmployee(gender DESC, salary ASC)

-- Loob mitte-klastreeritud indeksi tblEmployee tabelile
--create NonClustered index IX_tblEmployee_Name
--on tblEmployee(Name)

--37. Unikaalne ja mitte-unikaalne indeks

-- Lisab duplikaatidega andmeid tblEmployee tabelisse
INSERT INTO tblEmployee (id, FirstName, LastName, salary, gender, city)
VALUES (1, 'Mike', 'Sandoz', 4500, 'Male', 'New York');
INSERT INTO tblEmployee (id, FirstName, LastName, salary, gender, city)
VALUES (1, 'Yohn', 'Menco', 2500, 'Male', 'London');

-- Lisab veel duplikaate
Insert into tblEmployee Values(1,'Mike', 'Sandoz',4500,'Male','New York')
Insert into tblEmployee Values(1,'John', 'Menco',2500,'Male','London')

INSERT INTO tblEmployee (id, FirstName, LastName, salary, gender, city)
VALUES (1, 'Mike', 'Sandoz', 4500, 'Male', 'New York');
INSERT INTO tblEmployee (id, FirstName, LastName, salary, gender, city)
VALUES (1, 'Yohn', 'Menco', 2500, 'Male', 'London');

-- Loob unikaalse mitte-klastreeritud indeksi FirstName ja LastName väljadele
Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)

-- Loob unikaalse indeksi City väljale ja ignoreerib duplikaate
CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY

--38. Indeksi plussid ja miinused

-- Valib andmeid, kus palk on vahemikus 4000-8000
select * from tblEmployee where salary>4000 and Salary <8000

-- Kustutab kirje, kus palk on 2500
delete from tblEmployee where salary = 2500

-- Uuendab palka, kus palk on 7500
update tblEmployee set salary = 9000 where salary = 7500

-- Kuvab kogu tabeli, sorteerituna palga järgi tõusvalt
select * from tblEmployee order by salary 

-- Kuvab kogu tabeli, sorteerituna palga järgi kahanevalt
select * from tblEmployee order by salary desc

-- Loob päringu, mis rühmitab palgad ja loendab neid
select salary, count(salary) as total
from tblEmployee
GROUP BY salary

--39. View SQL serveris

-- Lisab osakonnad tabelisse tblDepartment
insert into tblDepartment values (1,'IT')
insert into tblDepartment values (2,'Payroll')
insert into tblDepartment values (3,'HR')
insert into tblDepartment values (4,'Admin')

-- Lisab töötajad tabelisse tblEmployeee
insert into tblEmployeee
values(1,'John',5000,'Male',3)
insert into tblEmployeee
values(2,'Mike',3400,'Male',2)
insert into tblEmployeee
values(3,'Pam',6000,'Female',1)
insert into tblEmployeee
values(4,'Todd',4800,'Male',4)
insert into tblEmployeee
values(5,'Sara',3200,'Female',1)
insert into tblEmployeee
values(6,'Ben',4800,'Male',3)

-- Liitub tabelid tblEmployeee ja tblDepartment ning kuvab tulemused
select id,name, salary, deptname
from tblEmployeee
join tblDepartment
on tblEmployeee.departmentid = tblDepartment.deptid

-- Loob vaate vWEemployeeesBydepartment
create view vWEemployeeesBydepartment
as
select id, name, salary, gender, deptname
from tblEmployeee
join tblDepartment
on tblEmployeee.departmentid = tblDepartment.deptid

-- Loob vaate vWITdepartment_employeees
create view vWITdepartment_employeees
as
select id, name, salary, gender, deptname
from tblEmployeee
join tblDepartment
on  tblEmployeee.departmentid = tblDepartment.deptid
where tblDepartment.deptname='IT'

-- Loob vaate vWemployeeesNonConfidentialData
create view vWemployeeesNonConfidentialData
as
select id, name, gender, deptname
from tblEmployeee
join tblDepartment
on tblEmployeee.departmentid = tblDepartment.deptid

-- Loob vaate vWemployeeesCountBydepartment,
osakonnas
create view vWemployeeesCountBydepartment
as
select deptname, count(id) as totalemployeees
from tblEmployeee
join tblDepartment
on tblEmployeee.departmentid = tblDepartment.deptid
group by deptname

--40. View uuendused

-- Loob tabeli tblEmployeee ja tblDepartment
CREATE TABLE tblEmployeee(
id int primary key,
name nvarchar(30),
salary int,
gender nvarchar(10),
departmentid int)

create table tblDepartment(
deptid int primary key,
deptname nvarchar(20))

-- Lisab andmeid tabelitesse
insert into tblDepartment values (1,'IT')
insert into tblDepartment values (2,'Payroll')
insert into tblDepartment values (3,'HR')
insert into tblDepartment values (4,'Admin')

insert into tblEmployeee
values(1,'John',5000,'Male',3)
insert into tblEmployeee
values(2,'Mike',3400,'Male',2)
insert into tblEmployeee
values(3,'Pam',6000,'Female',1)
insert into tblEmployeee
values(4,'Todd',4800,'Male',4)
insert into tblEmployeee
values(5,'Sara',3200,'Female',1)
insert into tblEmployeee
values(6,'Ben',4800,'Male',3)

-- Uuendab vaadet vWEemployeeesDataExceptsalary, muutes töötaja nime
update vWEemployeeesDataExceptsalary
set name ='Mikey' where id=2

-- Kustutab kirje vaatest vWEemployeeesDataExceptsalary, kus töötaja id on 2
delete from vWEemployeeesDataExceptsalary where id=2

-- Lisab uue kirje vaatesse vWEemployeeesDataExceptsalary
insert into vWEemployeeesDataExceptsalary values(2, 'Mikey', 'Male',2)

-- Loob vaate vwemployeeeDetailsBydepartment, mis liidab tblEmployeee ja tblDepartment
create view vwemployeeeDetailsBydepartment
as
select id, name, salary, gender, deptname
from tblEmployeee
join tblDepartment

-- Uuendab vaadet vwemployeeeDetailsBydepartment, muutes osakonna nime
update vwemployeeeDetailsBydepartment
set deptname='IT' where name='John'

--41. Indekseeritud view-d

-- Loob tabeli tblproduct
create table tblproduct(
productid int primary key,
name nvarchar(20),
unitprice int)

-- Lisab tooteid tabelisse tblproduct
insert into tblproduct values(1,'books',20)
insert into tblproduct values(2,'pens',14)
insert into tblproduct values(3,'pencils',11)
insert into tblproduct values(4,'clips',10)

-- Loob tabeli tblproductsales
create table tblproductsales(
productid int,
quantity int)

-- Lisab müügitehinguid tabelisse tblproductsales
insert into tblproductsales values(1, 10)
insert into tblproductsales values(3, 23)
insert into tblproductsales values(4, 21)
insert into tblproductsales values(2, 12)
insert into tblproductsales values(1, 13)
insert into tblproductsales values(3, 12)
insert into tblproductsales values(4, 13)
insert into tblproductsales values(1, 11)
insert into tblproductsales values(2, 12)
insert into tblproductsales values(1, 14)

--92. DDL Trigger SQL serveris

-- Loob DDL triggeri trMyFirstTrigger, mis reageerib CREATE_TABLE, ALTER_TABLE ja DROP_TABLE toimingutele
alter trigger trMyFirstTrigger
on Database
for CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
print 'A table has just been created, modified or deleted'
end

-- Uuendab DDL triggerit, lisades rollback käsu
alter trigger trMyFirstTrigger
on Database
for CREATE_TABLE,ALTER_TABLE,DROP_TABLE
as
begin
rollback
print 'You cannot create, alter or drop a table'
end

-- Keelab DDL triggeri trMyFirstTrigger andmebaasis
disable trigger trMyFirstTrigger on DATABASE

-- Loob DDL triggeri trRenameTable, mis reageerib RENAME toimingule
create trigger trRenameTable
on DATABASE
for RENAME
as
begin
print 'you just renamed something'
end

-- Loob DDL triggeri tr_DatabaseScopeTrigger, mis reageerib CREATE_TABLE toimingule andmebaasis
create trigger tr_DatabaseScopeTrigger
on DATABASE
for CREATE_TABLE
AS
BEGIN
print 'Database Scope Trigger'
end
go

-- Määrab DDL triggeri järjekorra ja tüübi
exec sp_settriggerorder
@triggername='tr_DatabaseScopeTrigger11 ',
@order='none',
@stmttype='CREATE_TABLE',
@namespace='DATABASE'
GO

-- Loob DDL triggeri tr_LogonAuditTriggers, mis reageerib LOGON toimingule
CREATE TRIGGER tr_LogonAuditTriggers
on all server
for LOGON
as
begin
declare @LoginName nvarchar(100)

set @LoginName=ORIGINAL_LOGIN()
IF(SELECT COUNT(*) FROM sys.dm_exec_sessions
where is_user_process=1
AND original_login_name=@LoginName)>3
begin
print'Fourth connecion of' + @LoginName + 'blocked'
rollback
end
END











 



 










