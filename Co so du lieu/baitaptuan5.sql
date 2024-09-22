CREATE DATABASE Company ON  PRIMARY 
	( NAME = 'Company', 
	FILENAME = 'C:\DATA\Company.mdf' , 
	SIZE = 3072KB ,
	MAXSIZE = UNLIMITED, 
	FILEGROWTH = 1024KB )
 LOG ON 
	( NAME = 'Company_log', 
	FILENAME = 'C:\DATA\Company_log.ldf' , 
	SIZE = 1024KB , 
	MAXSIZE = 2048KB , 
	FILEGROWTH = 10%)
GO

USE Company

go

create table employee
(
	FName	varchar(15)	NOT NULL,
	MInit	varchar(1)	NULL,
	LName	varchar(15)	NOT NULL,
	SSN	char(9)	NOT NULL,
	BDate	datetime	NULL,
	Address	varchar(30)	NULL,
	Sex	char(1)	NULL,
	Salary	numeric(10, 2)	NULL,
	SuperSSN	char(9)	NULL,
	DNo 	numeric(4, 0)	NULL,
	Constraint pk_Ssn primary key (SSN),
	Constraint fk_superSsn foreign key (SuperSSN)  references employee(SSN)
)

go

create table department
(
	DName	varchar(15)	NOT NULL,
	DNumber	numeric(4, 0)	NOT NULL,
	Mgrssn	char(9)	NULL,
	MgrStartdate	datetime	NULL,
	Constraint pk_Dnumber primary key (DNumber),
	Constraint fk_mgrssn foreign key (Mgrssn)  references employee(SSN)
)

go

alter table employee
add constraint fk_dno foreign key (DNo) references department(DNumber)

go 
create table dept_locations
(
	DNumber	numeric(4, 0)	NOT NULL,
	DLocation	varchar(15)	NOT NULL,
	Constraint pk_dnum primary key (DNumber,DLocation),
	Constraint fk_Dnumber foreign key (DNumber) references department (DNumber)

)

go

create table project
(
PName	varchar(15)	NOT NULL,
PNumber	numeric(4, 0)	NOT NULL,
PLocation	varchar(15)	NULL,
DNum	numeric(4, 0)	NOT NULL,
Constraint pk_pnumber primary key (PNumber),
Constraint fk_dnum foreign key (DNum) references department (DNumber)


)

go

create table workson
(
ESSN	char(9)	NOT NULL,
PNo	numeric(4, 0)	NOT NULL,
Hours	numeric(4, 1)	NULL,
constraint pk_essnpno primary key (ESSN,PNo),
constraint fk_essn foreign key (ESSN) references employee (SSN),
constraint fk_pno foreign key (PNo) references project (PNumber)

)
go


create table dependent
(
ESSN	char(9)	NOT NULL,
Dependent_Name	varchar(15)	NOT NULL,
Sex	char(1)	NULL,
BDate	datetime	NULL,
Relationship	varchar(8)	NULL,
constraint pk_essnDm primary key (ESSN,Dependent_Name),
constraint fk_es foreign key (ESSN) references employee (SSN)
)

go
INSERT INTO Employee VALUES ('John','B','Smith','123456789','01/09/1955 ','Houston, TX','M',30000,NULL,NULL)
INSERT INTO Employee VALUES ('Franklin','T','Wong','333445555','12/08/1945  ','Houston, TX','M',40000,NULL,NULL)
INSERT INTO Employee VALUES ('Joyce','A','English','453453453','07/31/1962  ','Houston, TX','F',25000,NULL,NULL)
INSERT INTO Employee VALUES ('Ramesh','K','Narayan','666884444','09/15/1952  ','Humble, TX','M',38000,NULL,NULL)
INSERT INTO Employee VALUES ('James','E','Borg','888665555','11/10/1927   ','Houston, TX','M',55000,NULL,NULL)
INSERT INTO Employee VALUES ('Jennifer','S','Wallace','987654321','06/20/1931  ','Bellaire, TX','F',43000,NULL,NULL)
INSERT INTO Employee VALUES ('Ahmad','V','Jabbar','987987987','03/29/1959  ','Houston, TX','M',25000,NULL,NULL)
INSERT INTO Employee VALUES ('Alicia','J','Zelaya','999887777','07/19/1958  ','Spring, TX','F',25000,NULL,NULL)

INSERT INTO Department VALUES ('Headquarters','1',NULL,NULL);
INSERT INTO Department VALUES ('Administration','4',NULL,NULL);
INSERT INTO Department VALUES ('Research','5',NULL,NULL);

UPDATE Employee 
SET SuperSSN = '333445555' , DNO = 5
WHERE SSN = '123456789'

UPDATE Employee 
SET SuperSSN = '888665555' , DNO = 5
WHERE SSN = '333445555'

UPDATE Employee 
SET SuperSSN = '333445555' , DNO = 5
WHERE SSN = '453453453'

UPDATE Employee 
SET SuperSSN = '333445555' , DNO = 5
WHERE SSN = '666884444'

UPDATE Employee 
SET SuperSSN = null , DNO = 1
WHERE SSN = '888665555'

UPDATE Employee 
SET SuperSSN = '888665555' , DNO = 4
WHERE SSN = '987654321'

UPDATE Employee 
SET SuperSSN = '987654321' , DNO = 4
WHERE SSN = '987987987'

UPDATE Employee 
SET SuperSSN = '987654321' , DNO = 4
WHERE SSN = '999887777'

INSERT INTO dept_locations VALUES ('1','Houston');
INSERT INTO dept_locations VALUES ('4','Stafford');
INSERT INTO dept_locations VALUES ('5','Bellaire');
INSERT INTO dept_locations VALUES ('5','Houston');
INSERT INTO dept_locations VALUES ('5','Sugarland');

UPDate Department
set Mgrssn='888665555',MgrStartdate='06/19/1971 '
where DNumber='1'

UPDate Department
set Mgrssn='987654321',MgrStartdate='01/01/1985  '
where DNumber='4'

UPDate Department
set Mgrssn='333445555',MgrStartdate='05/22/1978  '
where DNumber='5'

INSERT INTO Project VALUES ('ProductX',1,'Bellaire','5');
INSERT INTO Project VALUES ('ProductY',2,'Sugarland','5');
INSERT INTO Project VALUES ('ProductZ',3,'Houston','5');
INSERT INTO Project VALUES ('Computerization',10,'Stafford','4');
INSERT INTO Project VALUES ('Reorganization',20,'Houston','1');
INSERT INTO Project VALUES ('Newbenefits',30,'Stafford','4')
go

insert into workson values ('123456789',1,32.5)
insert into workson values ('123456789',2,7.5)
insert into workson values ('333445555',2,10.0)
insert into workson values ('333445555',3,10.0)
insert into workson values ('333445555',10,10.0)
insert into workson values ('333445555',20,10.0)
insert into workson values ('453453453',1,20.0)
insert into workson values ('453453453',2,20.0)
insert into workson values ('666884444',3,40.0)
insert into workson values ('888665555',20,null)
insert into workson values ('987654321',20,15.0)
insert into workson values ('987654321',30,20.0)
insert into workson values ('987987987',10,35.0)
insert into workson values ('987987987',30,5.0)
insert into workson values ('999887777',10,10.0)
insert into workson values ('999887777',30,30.0)

insert into dependent values ('123456789','Alice','F','12/31/1978','Daughter')
insert into dependent values ('123456789','Elizabeth','F','05/05/1957','Spouse')
insert into dependent values ('123456789','Michael','M','01/01/1978','Son')
insert into dependent values ('333445555','Alice','F','04/05/1976','Daughter')
insert into dependent values ('333445555','Joy','F','05/03/1948', 'Spouse')
insert into dependent values ('333445555','Theodore','M','10/25/1973','Son')
insert into dependent values ('987654321','Abner','M','02/29/1932','Spouse')

go



Select * from dependent



Select * from project
Select * from employee
Select * from department
Select * from dept_locations
Select * from workson
--2 
Select distinct e.FName, e.LName
	From department d, employee e, project p, workson w
	Where e.DNo = d.DNumber and d.DNumber = 4 or d.DNumber = 5
	and d.DNumber = p.DNum and p.PName = 'ProductX'
	and p.PNumber = w.PNo
	group by e.FName, e.LName, w.Hours having w.Hours > 10

--3
Select e.FName, e.LName 	
	From employee e, dependent d
	Where e.SSN = d.ESSN 
	and e.FName = d.Dependent_Name

--4 
Select e.FName, e.LName 	
	From employee e
	Where e.SSN = e.SuperSSN
	and e.FName = 'Joyce' and e.MInit = 'A' and e.LName = 'English'

--5
Select p.*, SUM(w.Hours) as 'Total time working'
	From project p, workson w
	Where p.PNumber = w.PNo
	group by p.PName, p.PNumber, p.PLocation, p.DNum

--6
Select distinct e.FName, e.MInit, e.LName, p.PName
	From employee e, project p, workson w
	Where p.PNumber = w.PNo
	and w.ESSN = e.SSN

--7
Select  e.FName, e.MInit, e.LName
	From employee e
	Where e.SSN not in (Select w.ESSN From workson w)

--8
Select d.DName, AVG(e.Salary)
	From department d, employee e
	Where e.DNo = d.DNumber
	group by d.DName

--9
Select AVG(e.Salary)
	From employee e
	Where e.Sex = 'F'


Select distinct e.FName, e.LName, e.Address
	From employee e, project p, dept_locations dl, department d, workson w
	Where e.SSN = w.ESSN and w.PNo = p.PNumber and p.PLocation = 'Houston'
	and d.DNumber = dl.DNumber and dl.DLocation not in('Houston')
	and e.DNo = d.DNumber