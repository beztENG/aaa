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


--Department data
Insert into Department Values ('Headquarters',1,null,'06/19/1971');
Insert into Department Values ('Administration',4,	null,	'01/01/1985'); 
Insert into Department Values ('Research',5,null,'05/22/1978');
Go

Update Department
	SET Mgrssn = '888665555'
	WHERE DNumber = 1;
Go

Update Department
	SET Mgrssn = '987654321'
	WHERE DNumber = 4;
Go

Update Department
	SET Mgrssn = '333445555'
	WHERE DNumber = 5;
Go



Insert into Employee Values('James','E','Borg','888665555','11/10/1927','Houston, TX','M',55000,NULL,1);
Insert into Employee Values('Franklin','T','Wong','333445555','12/08/1945' ,'Houston, TX','M',40000,'888665555',5);
Insert into Employee Values('Jennifer','S','Wallace','987654321','06/20/1931', 'Bellaire, TX','F',43000,'888665555',4);
Insert into Employee Values('Ahmad','V','Jabbar','987987987','03/29/1959 ','Houston, TX','M',25000,'987654321',4);
Insert into Employee Values('Alicia','J','Zelaya','999887777','07/19/1958','Spring, TX','F',25000,'987654321',4);
Insert into Employee Values('Joyce','A','English','453453453','07/31/1962 ','Houston, TX','F',25000,'333445555',5);
Insert into Employee Values('Ramesh','K','Narayan','666884444','09/15/1952','Humble, TX','M',38000,'333445555',5);
Insert into Employee Values('John', 'B','Smith','123456789','01/09/1955', 'Houston, TX','M',30000,'333445555',5);
Go



Insert into Dept_Location Values(1,'Houston');
Insert into Dept_Location Values(4,'Stafford');
Insert into Dept_Location Values(5,'Bellaire');
Insert into Dept_Location Values(5,'Houston');
Insert into Dept_Location Values(5,'Sugarland');
Go



Insert into Project Values('ProductX',1,'Bellaire',5);
Insert into Project Values('ProductY',2,'Sugarland',5);
Insert into Project Values('ProductZ',3,'Houston',5);
Insert into Project Values('Computerization',10,'Stafford',4);
Insert into Project Values('Reorganization',20,'Houston',1);
Insert into Project Values('Newbenefits',30,'Stafford',4);
Go


Insert into Works_On Values('123456789',1,32.5);
Insert into Works_On Values('123456789',2,7.5);
Insert into Works_On Values('333445555',2,10.0);
Insert into Works_On Values('333445555',3,10.0);
Insert into Works_On Values('333445555',10,10.0);
Insert into Works_On Values('333445555',20,10.0);
Insert into Works_On Values('453453453',1,20.0);
Insert into Works_On Values('453453453',2,20.0);
Insert into Works_On Values('666884444',3,40.0);
Insert into Works_On Values('888665555',20,NULL);
Insert into Works_On Values('987654321',20,15.0);
Insert into Works_On Values('987654321',30,20.0);
Insert into Works_On Values('987987987',10,35.0);
Insert into Works_On Values('987987987',30,5.0);
Insert into Works_On Values('999887777',10,10.0);
Insert into Works_On Values('999887777',30,30.0);
Go


Insert into Dependent Values('123456789','Alice','F','12/31/1978', 'Daughter');
Insert into Dependent Values('123456789','Elizabeth','F','05/05/1957','Spouse');
Insert into Dependent Values('123456789','Michael','M','01/01/1978','Son');
Insert into Dependent Values('333445555','Alice','F','04/05/1976','Daughter');
Insert into Dependent Values('333445555','Joy',	'F','05/03/1948' ,'Spouse');
Insert into Dependent Values('333445555','Theodore','M','10/25/1973','Son');
Insert into Dependent Values('987654321','Abner','M','02/29/1932','Spouse');
Go



Select * from Dept_Location;


Select * from Department;
Select * from Dependent;

Select * from Project;
Select * from Employee;
Select * from Works_On;

--query 1
Select e.LName
	From Employee e
	Where e.LName LIKE 'N%'

--query 2
Select e.Sex, e.Address
	From Employee e
	Where e.Sex = 'M'
	and e.Address LIKE 'Spring%' or e.Address LIKE 'Humble%'

--query 3
Select p.PName
	From Department d, Project p
	Where p.PLocation = 'Houston'
	and d.DNumber = 5
	and d.DNumber = p.DNum

--query 5
Select e.FName, e.MInit, e.LName
	From Employee e
	Where e.BDate between '1940' and '1960'
	and e.Sex = 'F' and e.Salary between '30000' and '50000'

--query 6
Select e.FName, e.MInit, e.LName
	From Employee e
	Where e.SSN = e.SuperSSN
	and e.FName = 'Franklin'
	and e.MInit = 'T'
	and e.LName = 'Wong'

--query 7
Select e.FName, e.MInit, e.LName
	From Employee e, Department d, Works_On w, Project p
	Where e.DNo = d.DNumber and d.DNumber = 5
	and d.DNumber = p.DNum and p.PName = 'ProductX'
	and p.PNumber = w.PNo and e.SSN = w.ESSN
	group by e.FName, e.MInit, e.LName, w.Hours having w.Hours > 10

--query 8
Select e.FName, e.MInit, e.LName
	From Employee e, Dependent d
	Where e.FName = d.Dependent_Name

--query 9
Select e.LName as 'Last Name'
	From Employee e, Department d1 , Dependent d2
	Where e.SSN = d1.Mgrssn
	and e.SSN != d2.ESSN

--query 10
Select e.FName, e.MInit, e.LName
	From Employee e, Project p
	Where e.SSN not in(Select w.ESSN From Works_On w)

--query 11
Select AVG(e.Salary)
	From Employee e
	Where e.Sex = 'F'
