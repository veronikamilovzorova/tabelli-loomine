
create trigger trMyFirstTrigger
on Database
for CREATE_TABLE
as
begin
print 'New table created'
end
-----
alter trigger trMyFirstTrigger
on Database
for CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
print 'A table has just been created, modified or deleted'
end
----
alter trigger trMyFirstTrigger
on Database
for CREATE_TABLE,ALTER_TABLE,DROP_TABLE
as
begin
rollback
print 'You cannot create, alter or drop a table'
end
---
disable trigger trMyFirstTrigger on DATABASE
---
create trigger trRenameTable
on DATABASE
for RENAME
as
begin
print 'you just renamed something'
end
---
create trigger tr_DatabaseScopeTrigger
on DATABASE
for CREATE_TABLE,ALTER_TABLE,DROP_TABLE
as
begin
rollback
print 'You cannot create, alter or drop a table in the current database'
end 
---
create trigger tr_ServerScropeTrigger
on ALL SERVER
for CREATE_TABLE,ALTER_TABLE,DROP_TABLE
as
begin
rollback
print'You cannot create, alter or drop a table in any datebase on the server'
end
---
create trigger tr_DatabaseScoreTrigger
on database
for CREATE_TABLE
AS
BEGIN
print 'Database Scrope Trigger'
end
go
---
exec sp_settriggerorder
@triggername='tr_DatabaseScopeTrigger11 ',
@order='none',
@stmttype='CREATE_TABLE',
@namespace='DATABASE'
GO
---
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
