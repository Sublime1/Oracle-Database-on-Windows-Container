SET VERIFY OFF
connect "SYS"/"&1" as SYSDBA
set echo on
spool c:\scripts\logs\lockAccount.log append
BEGIN 
 FOR item IN ( SELECT USERNAME, AUTHENTICATION_TYPE FROM DBA_USERS WHERE ACCOUNT_STATUS IN ('OPEN', 'LOCKED', 'EXPIRED') AND USERNAME NOT IN ( 
'SYS','SYSTEM') ) 
 LOOP 
IF item.AUTHENTICATION_TYPE='PASSWORD' THEN
  dbms_output.put_line('Locking and Expiring: ' || item.USERNAME); 
  execute immediate 'alter user ' ||
 	 sys.dbms_assert.enquote_name(
 	 sys.dbms_assert.schema_name(
 	 item.USERNAME),false) || ' password expire account lock' ;
 ELSE 
  dbms_output.put_line('Locking: ' || item.USERNAME); 
  execute immediate 'alter user ' ||
 	 sys.dbms_assert.enquote_name(
 	 sys.dbms_assert.schema_name(
 	 item.USERNAME),false) || ' account lock' ;
 END IF;
 END LOOP;
END;
/
spool off
