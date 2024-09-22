
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


Select * from Dependent;
Select * from Department; 
Select * from Works_On;
Select * from Project;Select * from Employee;
Select * from Dept_Location;