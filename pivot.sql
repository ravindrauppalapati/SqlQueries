CREATE TABLE Customers(CustomerName VARCHAR(50),ProductName VARCHAR(50),Amount INT) 

INSERT INTO Customers VALUES('James', 'Laptop', 30000)
INSERT INTO Customers VALUES('James', 'Desktop', 25000)
INSERT INTO Customers VALUES('David', 'Laptop', 25000)
INSERT INTO Customers VALUES('Smith', 'Desktop', 30000)
INSERT INTO Customers VALUES('Pam', 'Laptop', 45000)
INSERT INTO Customers VALUES('Pam', 'Laptop', 30000)
INSERT INTO Customers VALUES('John', 'Desktop', 30000)
INSERT INTO Customers VALUES('John', 'Desktop', 30000)
INSERT INTO Customers VALUES('John', 'Laptop', 30000)
--===========================================================================================
-- Section1: Define the column names
SELECT CustomerName, 
 Laptop, 
 Desktop
FROM

-- Section2: Get the Actual Data
(
   SELECT  CustomerName, 
    ProductName, 
    Amount 
   FROM Customers
) AS PivotData

-- Section3: Pivot function
PIVOT
(
 Sum(Amount) FOR ProductName 
 IN (Laptop, Desktop)
) AS PivotTable
--================================================================================================
Create Table ProductSales(AgentName VARCHAR(50),India int,US int, UK int)
 

INSERT INTO ProductSales VALUES ('Smith', 9160, 5220, 3360)
INSERT INTO ProductSales VALUES ('David', 9770, 5440, 8800)
INSERT INTO ProductSales VALUES ('James', 9870, 5480, 8900)

--=========================================================================================================
SELECT AgentName, Country, SalesAmount

FROM 

( 
   SELECT AgentName, 
    India, 
    US,  
    UK 
 FROM ProductSales) AS ActualData

UNPIVOT
(
       SalesAmount
       FOR Country IN (India, US, UK)
) AS UnpivotData