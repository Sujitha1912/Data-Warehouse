--Q1
--STEP 1:sales business process
--STEP 2:Trascation Fact table
--STEP 3:Salesperson Dimension,Product dimesnion,customer dimension,Date dimension.
--STEP 4:Totalnoorder,SalesYTD,SalesLastYear
CREATE TABLE Salespersondim(
	salespersonkey int PRIMARY KEY,
	Bonus int,
	commisionpct int,
	jobtitle varchar(100)
);
CREATE TABLE productdim(
	Productid int PRIMARY KEY,
	Productnumber int,
	Productsize int,
	rating int,
	Standardcost int
);
CREATE TABLE Customerdim(
	customerid int PRIMARY KEY,
	firstname varchar(100),
	Middlename varchar(100),
	Lastname Varchar(100)
);
CREATE TABLE Datedim(
	Datekey int Primary key,
	year int,
	month int,
	Day int
);
CREATE TABLE Transactionfact(
	totalnoorder int,
	salesYTD int,
	saleslastYear int,
	salespersonkey int,
	Productid int,
	customerid int,
	Datekey int,
	PRIMARY KEY(salespersonkey,Productid,customerid,Datekey),
	FOREIGN KEY(salespersonkey) REFERENCES Salespersondim(salespersonkey),
	FOREIGN KEY(Productid) REFERENCES productdim(Productid),
	FOREIGN KEY(customerid) REFERENCES Customerdim(customerid),
	FOREIGN KEY(Datekey) REFERENCES Datedim(Datekey)
);

--Q2
--STEP 1: sales lifecycle business Process
--STEP 2: sales order
--STEP 3: saleorder detail dim, customer dim, date dim, credit card dim,Poduct dim and Store dim
--STEP 4: totalnoordered,totalnodue,totalnoshipped.
CREATE TABLE saleorderdetaildim(
	salesorderid int PRIMARY KEY,
	status varchar(100),
	orderdate int,
	orderqty int,
	subtotal Float,
	taxamount Float
);
/*CREATE TABLE Customerdim(
	customerid int PRIMARY KEY,
	firstname varchar(100),
	Middlename varchar(100),
	Lastname Varchar(100)
);
CREATE TABLE datedim(
	Datekey int Primary key,
	year int,
	month int,
	Day int
);
CREATE TABLE productdim(
	Productid int PRIMARY KEY,
	Productnumber int,
	Productsize int,
	rating int,
	Standardcost int
);*/
CREATE TABLE creditcarddim(
	creditcardid int PRIMARY KEY,
	cardtype varchar(100),
	cardnumber int,
	Expmonth int,
	Expyear int
);
CREATE TABLE storedim(
	storekey int PRIMARY KEY,
	Name Varchar(100),
	Demographics Varchar(100)
);
CREATE TABLE SalesOrderfact(
	totalnoordered int,
	totalnodue int,
	totalnoshipped int,
	salesorderid int,
	/*customerid int,
	Datekey int,
	creditcardid int*/
	Productid int,
	storekey int,
	PRIMARY KEY(salesorderid,/*customerid,Datekey,creditcardid*/Productid,storekey),
	FOREIGN KEY(salesorderid) REFERENCES saleorderdetaildim(salesorderid),
	/*FOREIGN KEY(customerid) REFERENCES Customerdim(customerid),
	FOREIGN KEY(Datekey) REFERENCES Datedim(Datekey),
	FOREIGN KEY(creditcardid) REFERENCES creditcarddim(creditcardid),*/
	FOREIGN KEY(Productid) REFERENCES productdim(Productid),
	FOREIGN KEY(storekey) REFERENCES storedim(storekey)
);

--Q3
--Step 1: month store sales Business Process
--Step 2: Monthly sales performance fact table
--Step 3: store dimension, Salestax rate dimension,sale reason dimension,Date dimsension.
--Step 4: taxamount,salessubtotal,monthlysalesamount
CREATE TABLE salereasondim(
	salereasonid int PRIMARY KEY,
	reasontype varchar(100),
);
CREATE TABLE Salestaxratedim(
	salestaxrateid int Primary key,
	taxrate float,
);
/*CREATE TABLE storedim(
	storekey int PRIMARY KEY,
	name varchar(100),
	demographics Varchar(100),
);
CREATE TABLE datedim(
	Datekey int Primary key,
	year int,
	month int,
	Day int
);*/
CREATE TABLE MonthlysalesperformanceFact(
	taxamount float,
	salesubtotal float,
	Monthlysalesamount FLoat,
	salereasonid int,
	salestaxrateid int,
	/*storeKey int,
	datekey int,*/
	PRIMARY KEY(salereasonid,salestaxrateid/*storeKey,datekey*/),
	FOREIGN KEY(salereasonid) REFERENCES salereasondim(salereasonid),
	FOREIGN KEY(salestaxrateid) REFERENCES Salestaxratedim(salestaxrateid),
	/*FOREIGN KEY (storeKey) REFERENCES storedim(storeKey),
	FOREIGN KEY (datekey) REFERENCES datedim(datekey)*/
);

