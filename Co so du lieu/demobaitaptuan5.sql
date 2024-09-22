--2
Select e.FName, e.MInit, e.LName
	From employee e, department d, project p, workson w
	Where e.DNo = d.DNumber and d.DNumber = 4 or d.DNumber = 5
	and d.DNumber = p.DNum and p.PName = 'Product X'
	and p.PNumber = w.PNo and e.SSN = w.ESSN
	group by e.FName, e.MInit, e.LName, w.Hours having w.Hours > 10

--3 
Select e.FName, e.MInit, e.LName
	From employee e, dependent d 
	Where e.SSN = d.ESSN 
	and e.FName = d.Dependent_Name

--4 
Select e.FName, e.MInit, e.LName
	From employee e
	Where e.SSN = e.SuperSSN and
	e.FName = 'Joyce' and e.MInit = 'A' and e.LName = 'English'


--5
Select p.*, SUM(w.Hours) as 'Total of employee work time'
	From project p, workson w
	Where p.PNumber = w.PNo
	group by p.PName, p.DNum, p.PLocation, p.PNumber

--6
Select distinct e.FName, e.MInit, e.LName, p.PName
	From employee e, project p, workson w
	Where p.PNumber = w.PNo
	and w.ESSN = e.SSN

--7
Select  e.FName, e.MInit, e.LName
	From employee e, project p
	Where e.SSN not in (Select w.ESSN From workson w)

--8
Select  d.DName, AVG(e.Salary) as 'Salary in Average'
	From employee e, department d
	Where e.DNo = d.DNumber
	group by d.DName

--9
Select AVG(e.Salary) as 'Women salary in average'
	From employee e
	Where e.Sex = 'F'

--10
Select distinct e.FName, e.MInit, e.LName , e.Address
	From employee e, project p, dept_locations d
	Where e.DNo = p.DNum
	and e.SSN in(Select w.ESSN From workson w Where w.PNo in (Select p.PNumber From project p Where p.PLocation = 'Houston'))
	and d.DNumber = p.DNum and d.DLocation not in ('Houston')

--11
Select e.LName
	From employee e, dependent d, department d1
	Where  d1.Mgrssn = e.SSN
	--and e.SSN != d.ESSN