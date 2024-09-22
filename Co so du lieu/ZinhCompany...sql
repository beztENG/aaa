CREATE DATABASE CompanyZinh ON  PRIMARY 
	( NAME = 'CompanyZinh', 
	FILENAME = 'D:\Co so du lieu\CompanyZinh.mdf' , 
	SIZE = 3072KB ,
	MAXSIZE = UNLIMITED, 
	FILEGROWTH = 1024KB )
 LOG ON 
	( NAME = 'CompanyZinh_log', 
	FILENAME = 'D:\Co so du lieu\CompanyZinh_log.ldf' , 
	SIZE = 1024KB , 
	MAXSIZE = 2048KB , 
	FILEGROWTH = 10%)

Use CompanyZinh
Go
--Tao bang

Create Table Department(
	DName	varchar(15)	NOT NULL,
	DNumber	numeric(4, 0)	NOT NULL,
	Mgrssn	char(9)	NULL,
	MgrStartdate	datetime	NULL);

Create Table Employee(
	FName	varchar(15)	NOT NULL,
	MInit	varchar(1)	NULL,
	LName	varchar(15)	NOT NULL,
	SSN	char(9)	NOT NULL,
	BDate	datetime	NULL,
	Address	varchar(30)	NULL,
	Sex	char(1)	NULL,
	Salary	numeric(10, 2)	NULL,
	SuperSSN	char(9)	NULL,
	DNo 	numeric(4, 0)	NULL);

Create Table Dept_Location(
	DNumber	numeric(4, 0)	NOT NULL,
	DLocation	varchar(15)	NOT NULL);

Create Table Project(
	PName	varchar(15)	NOT NULL,
	PNumber	numeric(4, 0)	NOT NULL,
	PLocation	varchar(15)	NULL,
	DNum	numeric(4, 0)	NOT NULL);

Create Table Works_On(
	ESSN	char(9)	NOT NULL,
	PNo	numeric(4, 0)	NOT NULL,
	Hours	numeric(4, 1)	NULL);

Create Table Dependent(
	ESSN	char(9)	NOT NULL,
	Dependent_Name	varchar(15)	NOT NULL,
	Sex	char(1)	NULL,
	BDate	datetime	NULL,
	Relationship	varchar(8)	NULL);

--Tao Khoa Chinh		
ALTER TABLE Department
	ADD Constraint pk_Dept PRIMARY KEY (DNumber);
GO

ALTER TABLE Employee
	ADD Constraint pk_Emp PRIMARY KEY (SSN);
GO

ALTER TABLE Dept_Location
	ADD Constraint pk_Location PRIMARY KEY (DNumber, DLocation);
GO

ALTER TABLE Project
	ADD Constraint pk_Pro PRIMARY KEY (PNumber);
GO

ALTER TABLE Works_On
	ADD Constraint pk_Wor PRIMARY KEY (ESSN, PNo);
GO

ALTER TABLE Dependent
	ADD Constraint pk_Dep PRIMARY KEY (ESSN, Dependent_Name);
GO



--Tao Khoa Ngoai
ALTER TABLE Department
	ADD constraint fk_DeptMgrssn FOREIGN KEY(Mgrssn) REFERENCES Employee(SSN);
GO

ALTER TABLE Employee
	ADD Constraint fk_EmpDNo FOREIGN KEY(DNo) REFERENCES Department(DNumber);
GO

ALTER TABLE Employee
	ADD Constraint fk_EmpSuperSSN FOREIGN KEY(SuperSSN) REFERENCES Employee(SSN);
GO

ALTER TABLE Dept_Location
	ADD Constraint fk_Dept_Dnumber FOREIGN KEY(DNumber) REFERENCES Department(Dnumber);
GO

ALTER TABLE Project
	ADD Constraint fk_Pro_Dnum FOREIGN KEY(DNum) REFERENCES Department(Dnumber);
GO

ALTER TABLE Works_On
	ADD Constraint fk_Works_Essn FOREIGN KEY(ESSN) REFERENCES Employee(SSN);
GO

ALTER TABLE Works_On
	ADD Constraint fk_Works_Pno FOREIGN KEY(PNo) REFERENCES Project(Pnumber);
GO

ALTER TABLE Dependent
	ADD Constraint fk_Dep_Essn FOREIGN KEY(ESSN) REFERENCES Employee(SSN);
GO



