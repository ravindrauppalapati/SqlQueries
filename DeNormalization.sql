CREATE TABLE Customers(CustomerID INT Primary Key,CustomerName Varchar(50))

CREATE TABLE Orders(OrderID INT Primary Key,CustomerID INT REFERENCES Customers(CustomerID),OrderDate DateTime)

CREATE TABLE OrderDetails(OrderDetailsID INT Primary Key,OrderID INT REFERENCES Orders(OrderID),ProductID INT,UnitPrice INT,Quantity INT)

--===============================================================================================================================================
-- Data into Customers table
INSERT INTO Customers VALUES (1, 'James');
INSERT INTO Customers VALUES (2, 'Pam');
INSERT INTO Customers VALUES (3, 'Sara');
INSERT INTO Customers VALUES (4, 'David');
INSERT INTO Customers VALUES (5, 'John');
INSERT INTO Customers VALUES (6, 'Smith');

-- Data into Orders table
INSERT INTO Orders VALUES(101, 1, GETDATE());
INSERT INTO Orders VALUES(102, 6, GETDATE());
INSERT INTO Orders VALUES(103, 5, GETDATE());
INSERT INTO Orders VALUES(104, 2, GETDATE());
INSERT INTO Orders VALUES(105, 4, GETDATE());
INSERT INTO Orders VALUES(106, 3, GETDATE());

-- Data into Order Details table
INSERT INTO OrderDetails VALUES(1, 101, 1001, 100, 2);
INSERT INTO OrderDetails VALUES(2, 101, 1002, 200, 3);
INSERT INTO OrderDetails VALUES(3, 102, 1001, 100, 2);
INSERT INTO OrderDetails VALUES(4, 102, 1002, 200, 3);
INSERT INTO OrderDetails VALUES(5, 102, 1003, 300, 1);
INSERT INTO OrderDetails VALUES(6, 103, 1002, 200, 2);
INSERT INTO OrderDetails VALUES(7, 104, 1001, 100, 2);
INSERT INTO OrderDetails VALUES(8, 104, 1003, 300, 2);
INSERT INTO OrderDetails VALUES(9, 105, 1002, 200, 4);
INSERT INTO OrderDetails VALUES(10, 105, 1003, 300, 5);
INSERT INTO OrderDetails VALUES(11, 106, 1001, 100, 3);
INSERT INTO OrderDetails VALUES(12, 106, 1002, 200, 2);
INSERT INTO OrderDetails VALUES(13, 106, 1003, 300, 2);
--============================================================================================================================
SELECT C.CustomerID, C.CustomerName, OD.UnitPrice, OD.Quantity, (OD.UnitPrice * OD.Quantity) AS TotalAmount
FROM Customers C  INNER JOIN Orders O ON C.CustomerID = O.CustomerID  INNER JOIN OrderDetails OD ON O.OrderID = OD.OrderID
--===============================================================================================================================
SET STATISTICS IO ON


SELECT C.CustomerID, C.CustomerName, OD.UnitPrice, OD.Quantity, (OD.UnitPrice * OD.Quantity) AS TotalAmount
FROM Customers C  INNER JOIN Orders O ON C.CustomerID = O.CustomerID  INNER JOIN OrderDetails OD ON O.OrderID = OD.OrderID
--===================================================================================================================================
SELECT * INTO DenormalizedCustomer FROM (SELECT C.CustomerID, C.CustomerName, OD.UnitPrice, OD.Quantity, (OD.UnitPrice * OD.Quantity) AS TotalAmount
FROM Customers C INNER JOIN Orders O ON C.CustomerID = O.CustomerID  INNER JOIN OrderDetails OD ON O.OrderID = OD.OrderID ) Tab1 
--=========================================================================================================================================
SET STATISTICS IO ON
SELECT * FROM DenormalizedCustomer;