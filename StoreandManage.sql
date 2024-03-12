 

CREATE TABLE Employee(EmployeeName CHAR(1000))

INSERT INTO Employee VALUES ('Record1');
--========================================================================
DBCC IND ('TestDB', Employee, -1)

--=======================================================================
DBCC TRACEON (3604)
DBCC PAGE ('TestDB', 1, 232, 1)
--=======================================================================
INSERT INTO Employee VALUES ('Record2');
--========================================================================
DBCC TRACEON (3604)
DBCC PAGE ('TestDB', 1, 232, 1)
--=======================================================================
INSERT INTO Employee VALUES ('Record3');
INSERT INTO Employee VALUES ('Record4');
INSERT INTO Employee VALUES ('Record5');
INSERT INTO Employee VALUES ('Record6');
INSERT INTO Employee VALUES ('Record7');
INSERT INTO Employee VALUES ('Record8');
--======================================================================
INSERT INTO Employee VALUES ('Record9');

DBCC IND ('TestDB', Employee, -1)
 
