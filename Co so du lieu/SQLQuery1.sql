Select FName
	From Employee
	Where LName LIKE 'N%'
Go

Select *
	From Employee
	Where Sex = 'M' and Address LIKE 'Spring%' or Address LIKE 'Humble%'
Go

Select *
	From Employee
	Where Address LIKE 'Houston%' and DNo = 5
Go

Select * 
	From Dependent
	Where Relationship LIKE 'Son' and BDate LIKE 1988
Go

Select FName
	From Employee
	Where  BDate between '1940' and '1960' and Sex = 'F' and Salary between 30000 and 50000
Go 

Select FName, LName
	From Employee  
	Where SuperSSN = 333445555;
	
Select FName, LName
	From Employee, Works_On, Project
	Where SuperSSN = SSN and DNo = DNum and PName = 'ProductX' and Hours > 10
Go
j
Select FName, Dependent_Name
	From Employee ,Dependent
	Where FName = Dependent_Name
Go


																	