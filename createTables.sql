/**
CREATE TABLE Division(
	divisionId int NOT NULL,
	dName varchar(255),
	PRIMARY KEY(divisionId)
);

CREATE TABLE Department(
	depName varchar(255) NOT NULL,
	depBudget int,
	PRIMARY KEY(depName)
);

CREATE TABLE Employee(
	employeeNum int NOT NULL,
	eName varchar(255),
	projectNum int,
	title varchar(255),
	officeNum int,
	phoneNum int, 
	PRIMARY KEY (employeeNum)
);


CREATE TABLE Project(
	projectNum int NOT NULL,
	projBudget int,
	startDate date,
	endDate date,
	PRIMARY KEY(projectNum)
);


CREATE TABLE Rooms(
	roomNumber int NOT NULL,
	roomType int,
	PRIMARY KEY (roomNumber)
);


CREATE TABLE Building(
	code int NOT NULL,
	bName varchar(255),
	yearOfPurchase int,
	costOfPurchase int,
	PRIMARY KEY (code)
);


CREATE TABLE Records(
	eID int NOT NULL, 
	title varchar(255),
	start_Date date,
	salaryReceived int,
	PRIMARY KEY (eID)
);

CREATE TABLE Phone(
	phoneNum int NOT NULL,
	PRIMARY KEY (phoneNum)
);


CREATE TABLE Office(
	officeNum int NOT NULL,
	areaSqaFt int,
	PRIMARY KEY (officeNum)
);
**/
