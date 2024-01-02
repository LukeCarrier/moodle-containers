if not exists (
  select loginname
  from master.dbo.syslogins
  where name = 'moodle'
)
begin
  create login [moodle]
    with password = 'P4$$word'
end
go

if not exists (
  select name
  from master.sys.databases
  where name = 'moodle'
)
begin
  create database [moodle] collate Latin1_General_CS_AS

  alter database [moodle] set ansi_nulls on
  alter database [moodle] set quoted_identifier on
  alter database [moodle] set read_committed_snapshot on
end
go

use [moodle]
go

if not exists (
  select name
  from moodle.sys.database_principals
  where name = 'moodle'
)
begin
  create user [moodle]
    for login [moodle]
  exec sp_addrolemember 'db_owner', 'moodle'
end
go
