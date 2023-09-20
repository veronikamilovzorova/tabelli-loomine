select FirstName, BirthDate, Gender, DepartmentName from DimEmployee 

Create Function fn_ILTVF_GetEmployees()

Returns Table
as
Return (Select EmployeeKey, Firstname,Cast (BirthDate as Date) as DOB
from Dimemployee);
select * from fn_ILTVF_GetEmployees();

Create Function fn_MSTVF_GetEmpolyees()
Returns @Table Table(Id int, Name varchar(20), DOB Date)
as
Begin
Insert into @Table
Select EmployeeKey, FirstName,Cast(BirthDate as Date)
from Dimemployee
return
end
select * from fn_MSTVF_GetEmpolyees();

Select * from fn_ILTVF_GetEmployees()
Create Function fn_ILTVF_GetEmployees()

Returns Table
as
Return (Select EmployeeKey, Firstname,Cast (BirthDate as Date) as DOB
from Dimemployee);
select * from fn_ILTVF_GetEmployees();


update fn_ILTVF_GetEmployees() set FirstName='Sam17' where EmployeeKey=1
select * from fn_ILTVF_GetEmployees();

Create Function fn_MSTVF_GetEmpolyees()
Returns @Table Table(Id int, Name varchar(20), DOB Date)
as
Begin
Insert into @Table
Select EmployeeKey, FirstName,Cast(BirthDate as Date)
from Dimemployee
return
end
select * from fn_MSTVF_GetEmpolyees();

select * from DimEmployee

select * from DimEmployee
select * from DimEmployee where BaseRate  > 35 and BaseRate < 50

create Index  IX_DimEmployee_BaseRate
on DimEmployee (BaseRate ASC)
exec sys.helpindex @ojbname = 'DimEmployee'


create function fn_GetEmployeeNameById(@Id int)
Returns nvarchar(20)
as
begin
Return (select FirstName from DimEmployee where EmployeeKey - @Id)
End

select EmployeeKey from DimEmployee

select * from fn_ILTVF_GetEmployees();
