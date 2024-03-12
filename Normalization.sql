CREATE TABLE Customer(CustomerId INT IDENTITY (1, 1),Name VARCHAR(200),Code VARCHAR(200),PhoneNumber VARCHAR(200),SSN VARCHAR(200),Product VARCHAR(200))
--==========================================================================================
insert into customer values(1,'Ravi','1001','11111111','SSN0001','Mobile');
insert into customer values(2,'Sai','1001','22222222','SSN0001','Laptop');
--============================================================================================
TRUNCATE TABLE Customer;

ALTER TABLE Customer  ADD CONSTRAINT UK_Customer_Code UNIQUE (Code);  

ALTER TABLE Customer  ADD CONSTRAINT UK_Customer_SSN UNIQUE (SSN);
--============================================================================================
insert into customer values(1,'Ravi','1001','11111111','SSN0001','Mobile');
insert into customer values(2,'Sai','1001','22222222','SSN0001','Laptop');
--============================================================================================
TRUNCATE TABLE Customer;
insert into customer values(1,'Ravi','1001','11111111','SSN0001','Mobile,Laptop,Tablet');
insert into customer values(2,'Sai','1002','22222222','SSN0002','Shirt|Jeans|Shooes');
--===============================================================================================
Drop table Customer;

CREATE TABLE Customer(CustomerId INT IDENTITY (1, 1),Name VARCHAR(200),Code VARCHAR(200),PhoneNumber VARCHAR(200),
SSN VARCHAR(200),Product1 VARCHAR(200),Product2 VARCHAR(200),Product3 VARCHAR(200))
--====================================================================================================
insert into customer values(1,'Ravi','1001','11111111','SSN0001','Mobile','Laptop','Tablet');
insert into customer values(2,'Sai','1002','22222222','SSN0002','Shirt','Jeans',null);
--=====================================================================================================
CREATE TABLE Product([ProductId] [int] PRIMARY KEY,[ModelId] [int] UNIQUE,[ProductName] [nvarchar](50) NULL,
[ProductCost] [money] NULL,[ModelName] [nvarchar](50) NULL,[ManufacturerName] [nvarchar](50) NULL);
--======================================================================================================
DROP TABLE Customer;

CREATE TABLE [Customer](
 [CustomerId] [int] PRIMARY KEY,
 [Name] [varchar](200) NULL,
 [Code] [varchar](200) NULL,
 [PhoneNumber] [varchar](200) NULL,
 [SSN] [varchar](200) NULL,
 [ProductId] INT FOREIGN KEY REFERENCES Product(ProductId),
 [ModelId] INT FOREIGN KEY REFERENCES Product(ModelId)
)
--============================================================================================================
insert into product values(101,10001,'Mobile',2000,'Samsung','Samsung');
insert into product values(102,10002,'Laptop',3000,'Lenovo','Lenovo');
--===========================================================================================================
insert into customer values(1,'Ravi','1001','11111111','SSN0001',101,10001);
insert into customer values(2,'Sai','1002','22222222','SSN0002',102,10002);
--=========================================================================================================
Alter table customer drop column ProductId;
Alter table customer drop column ModelId;
--========================================================================================================
CREATE TABLE [ProductCustomerMapping](
 [ProductCustomerId] INT PRIMARY KEY,
 [CustomerId] INT FOREIGN KEY REFERENCES Customer(CustomerId),
 [ModelId] INT FOREIGN KEY REFERENCES Product(ModelId),
 [ProductId] INT FOREIGN KEY REFERENCES Product(ProductId)
);
--==============================================================================================================
insert into customer values(1,'Ravi','1001','11111111','SSN0001');
insert into customer values(2,'Sai','1002','22222222','SSN0002');

insert into ProductCustomerMapping values(1,1,10001,101);
insert into ProductCustomerMapping values(2,1,10002,102);
insert into ProductCustomerMapping values(3,2,10001,101);
--==================================================================================================================
Drop table Product;

CREATE TABLE Product([ProductId] [int] PRIMARY KEY,[ModelId] [int] UNIQUE,[ProductName] [nvarchar](50) NULL,
[ProductCost] [money] NULL,[ModelName] [nvarchar](50) NULL,[ManufacturerName] [nvarchar](50) NULL,Country [nvarchar](50),City [nvarchar](50));
--==================================================================================================================
insert into product values(101,10001,'Mobile',2000,'Samsung','Samsung','India','Mumbai');
insert into product values(102,10002,'Laptop',3000,'Lenovo','Lenovo','UK','London');
--=================================================================================================================
CREATE TABLE [Model](
 [ModelId] [int] PRIMARY KEY,
 [ModelName] [nvarchar](50) NULL,
 [ManufacturerName] [nvarchar](50) NULL,
 [Country] [nvarchar](50) NULL,
 [City] [nvarchar](50) NULL
);

insert into model values(10001,'Mobile','Samsung','India','Mumbai');
insert into model values(10002,'Laptop','Lenovo','UK','London');

--===============================================================================================================================
Drop table Product;

CREATE TABLE Product([ProductId] [int] PRIMARY KEY,[ProductName] [nvarchar](50) NULL,[ProductCost] [money] NULL);

insert into product values(101,'Mobile',2000);
insert into product values(102,'Laptop',3000);
--===================================================================================================================
DROP TABLE ProductCustomerMapping;

CREATE TABLE [ProductCustomerMapping](
 [ProductCustomerId] INT PRIMARY KEY,
 [CustomerId] INT FOREIGN KEY REFERENCES Customer(CustomerId),
 [ModelId] INT FOREIGN KEY REFERENCES Model(ModelId),
    [ProductId] INT FOREIGN KEY REFERENCES Product(ProductId)
);

insert into ProductCustomerMapping values(1,1,10001,101);
insert into ProductCustomerMapping values(2,1,10002,102);
insert into ProductCustomerMapping values(3,2,10001,101);
--==================================================================================================================================
CREATE TABLE [Country]([CountryId] [int] Primary Key,[CountryName] [nvarchar](50));

insert into Country values(1,'India');
insert into Country values(2,'USA');
insert into Country values(3,'UK');
insert into Country values(4,'Australia');

--==========================================================================================================================
CREATE TABLE [City]([CityId] [int] Primary Key,[CityName] [nvarchar](50),[CountryId] INT FOREIGN KEY REFERENCES Country(CountryId) );

insert into City values(1,'Mumbai',1);
insert into City values(2,'London',3);
insert into City values(3,'Hyderabad',1);
--===================================================================================================================
ALTER TABLE Model DROP COLUMN Country;
ALTER TABLE Model DROP COLUMN City;

ALTER TABLE Model ADD CountryId INT;
ALTER TABLE Model ADD FOREIGN KEY (CountryId) REFERENCES Country(CountryId);
--===========================================================================================================================
insert into Model values(10001,'Mobile','Samsung',1);
insert into Model values(10002,'Laptop','Lenovo',2);
insert into Model values(10003,'Desktop','Dell',2);
--================================================================================================================