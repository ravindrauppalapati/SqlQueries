Create Table ProductSales(SalesAgenName VARCHAR(50),SalesCountryName VARCHAR(20),SalesAmount INT) 

INSERT INTO ProductSales VALUES ('James', 'India', 9260)
INSERT INTO ProductSales VALUES ('James', 'US',5280)
INSERT INTO ProductSales VALUES ('Pam', 'India',9770)
INSERT INTO ProductSales VALUES ('Pam', 'US',2540)
INSERT INTO ProductSales VALUES ('David', 'India',9970)
INSERT INTO ProductSales VALUES ('David', 'US',5405)
 
 --============================================================================================
 SELECT SalesAgenName, India, US
FROM
(
   SELECT SalesAgenName, SalesCountryName,  SalesAmount 
   FROM ProductSales
) AS PivotData
PIVOT
(
 Sum (SalesAmount) FOR SalesCountryName 
 IN (India, US)
) AS PivotTable
--==============================================================================================
SELECT SalesAgenName, SalesCountryName, SalesAmount
FROM

 -- PIVOT Section
 (
 SELECT SalesAgenName, India, US
 FROM
 (
  SELECT SalesAgenName, SalesCountryName,  SalesAmount 
  FROM ProductSales
 ) AS PivotData
 PIVOT
 (
  Sum(SalesAmount) FOR SalesCountryName 
  IN (India, US)
 ) AS PivotTable) PTable

UNPIVOT
(
     SalesAmount
     FOR SalesCountryName IN (India, US)
) AS UnpivotTable
--=================================================================================================
INSERT INTO ProductSales VALUES ('James', 'India', 1200)
--===================================================================================================
SELECT SalesAgenName, India, US
FROM
(
   SELECT SalesAgenName, SalesCountryName,  SalesAmount 
   FROM ProductSales
) AS PivotData
PIVOT
(
 Sum (SalesAmount) FOR SalesCountryName 
 IN (India, US)
) AS PivotTable
--=================================================================================================
SELECT SalesAgenName, SalesCountryName, SalesAmount
FROM

 -- PIVOT Section
 (
 SELECT SalesAgenName, India, US
 FROM
 (
  SELECT  SalesAgenName, SalesCountryName,  SalesAmount 
  FROM ProductSales
 ) AS PivotData
 PIVOT
 (
  Sum(SalesAmount) FOR SalesCountryName 
  IN (India, US)
 ) AS PivotTable ) PTable

UNPIVOT
(
     SalesAmount
     FOR SalesCountryName IN (India, US)
) AS UnpivotTable
--==================================================================================================