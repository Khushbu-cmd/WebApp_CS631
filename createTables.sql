DROP TABLE Division CASCADE;
DROP TABLE Department CASCADE;
DROP TABLE Employee CASCADE;
DROP TABLE Project CASCADE;
DROP TABLE Project_Hist CASCADE;
DROP TABLE Rooms CASCADE;
DROP TABLE Building CASCADE;
DROP TABLE Office CASCADE;
DROP TABLE Phone CASCADE;
DROP TABLE Records CASCADE;

CREATE TABLE Division(
	divisionId int NOT NULL,
	dName varchar(255),
	PRIMARY KEY(divisionId)
);
CREATE TABLE Department(
	depName varchar(255) NOT NULL,
	depBudget int,
	divisionId int,
	PRIMARY KEY(depName),
	CONSTRAINT fk_divisionId FOREIGN KEY(divisionId) REFERENCES Division(divisionId)
);

CREATE TABLE Employee(
	employeeNum int NOT NULL,
	eName varchar(255),
	projectNum int,
	title varchar(255),
	officeNum int,
	phoneNum int, 
	worksForDiv int,
	headOfDiv int, 
	worksForDep varchar(255), 
	headOfDep varchar(255),
	workingOnProj int,
	PRIMARY KEY (employeeNum),
	CONSTRAINT fk_worksForDiv FOREIGN KEY(worksForDiv) REFERENCES Division(divisionId),
	CONSTRAINT fk_headOfDiv FOREIGN KEY(headOfDiv) REFERENCES Division(divisionId),
	CONSTRAINT fk_worksForDep FOREIGN KEY(worksForDep) REFERENCES Department(depName),
	CONSTRAINT fk_headOfDep FOREIGN KEY(headOfDep) REFERENCES Department(depName)
);

CREATE TABLE Project(
	projectNum int NOT NULL,
	projBudget int,
	startDate date,
	endDate date,
	depName varchar(255),
	manager int,
	PRIMARY KEY(projectNum),
	CONSTRAINT fk_depName FOREIGN KEY(depName) REFERENCES Department(depName),
	CONSTRAINT fk_manager FOREIGN KEY(manager) REFERENCES Employee(employeeNum)
);

ALTER TABLE Employee
    ADD CONSTRAINT fk_working_on_Proj FOREIGN KEY (workingOnProj) REFERENCES Project(projectNum);

CREATE TABLE Project_Hist(
	historyId int NOT NULL, 
	timespent int, 
	role varchar(255),
	employeeId int,
	projectId int,
	PRIMARY KEY(historyId),
	CONSTRAINT fk_employeeId FOREIGN KEY(employeeId) REFERENCES Employee(employeeNum),
	CONSTRAINT fk_project_id FOREIGN KEY(projectId) REFERENCES Project(ProjectNum)
);


CREATE TABLE Rooms(
	roomNumber int NOT NULL,
	roomType int,
	depName varchar(255),
	buildingCode int,
	officeNum int,
	PRIMARY KEY (roomNumber),
	CONSTRAINT fk_department_belongTo FOREIGN KEY (depName) REFERENCES Department(depName)
);

CREATE TABLE Building(
	code int NOT NULL,
	bName varchar(255),
	yearOfPurchase int,
	costOfPurchase int,
	PRIMARY KEY (code)
);

ALTER TABLE Rooms
    ADD CONSTRAINT fk_builing_belongsTo FOREIGN KEY (buildingCode) REFERENCES Building(code);

CREATE TABLE Office(
	officeNum int NOT NULL,
	areaSqaFt int,
	PRIMARY KEY (officeNum)
);

ALTER TABLE Rooms
    ADD CONSTRAINT fk_office_belongsTo FOREIGN KEY (officeNum) REFERENCES Office(officeNum);

ALTER TABLE Employee
    ADD CONSTRAINT fk_goesTo_office FOREIGN KEY (officeNum) REFERENCES Office(officeNum);

CREATE TABLE Phone(
	phoneNum int NOT NULL,
	officeNum int,
	PRIMARY KEY (phoneNum),
	CONSTRAINT fk_isin_office FOREIGN KEY (officeNum) REFERENCES Office(officeNum)
);

ALTER TABLE Employee
    ADD CONSTRAINT fk_has_phoneNum FOREIGN KEY (phoneNum) REFERENCES Phone(phoneNum);

CREATE TABLE Records(
	eID int NOT NULL, 
	title varchar(255),
	start_Date date,
	salaryReceived int,
	PRIMARY KEY (eID),
	CONSTRAINT fk_records_of_emloyee FOREIGN KEY (eID) REFERENCES Employee(employeeNum)
);

