SET VERIFY OFF
connect "SYS"/"&1" as SYSDBA
set echo on
spool c:\scripts\logs\CreateDB.log append
startup nomount pfile="C:\oracle\product\19.0.0\dbhome_1\database\initORA193.ora";
CREATE DATABASE "ORA193"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
DATAFILE 'C:\oracle\oradata\ORA193\system01.dbf' SIZE 10M REUSE AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED
EXTENT MANAGEMENT LOCAL
SYSAUX DATAFILE 'C:\oracle\oradata\ORA193\sysaux01.dbf' SIZE 10M REUSE AUTOEXTEND ON NEXT  10M MAXSIZE UNLIMITED
SMALLFILE DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE 'C:\oracle\oradata\ORA193\temp01.dbf' SIZE 10M REUSE AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1M
SMALLFILE UNDO TABLESPACE "UNDOTBS1" DATAFILE  'C:\oracle\oradata\ORA193\undotbs01.dbf' SIZE 10M REUSE AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED
CHARACTER SET AL32UTF8
NATIONAL CHARACTER SET AL16UTF16
LOGFILE GROUP 1 ('C:\oracle\oradata\ORA193\redo01.log') SIZE 20M,
GROUP 2 ('C:\oracle\oradata\ORA193\redo02.log') SIZE 20M,
GROUP 3 ('C:\oracle\oradata\ORA193\redo03.log') SIZE 20M
USER SYS IDENTIFIED BY "&1" USER SYSTEM IDENTIFIED BY "&1";
spool off
