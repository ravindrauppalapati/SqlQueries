 
CREATE TABLE Employee(ID INT,Name VARCHAR(50),Salary Money);

INSERT INTO Employee VALUES (1, 'James', 100000)
INSERT INTO Employee VALUES (2, 'David', 100000)
INSERT INTO Employee VALUES (3, 'Sara', 100000)

EXEC sys.sp_cdc_enable_db
--==============================================================================
EXEC sys.sp_cdc_enable_table @source_schema = 'dbo',@source_name = 'Employee',@role_name = null
--=================================================================================================
UPDATE Employee SET Name = 'Smith' WHERE ID = 2
--=========================================================================================
DELETE FROM Employee WHERE ID = 3
--====================================================================================================
INSERT INTO Employee VALUES (4, 'John', 3300000)
--==============================================================================================
