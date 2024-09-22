CREATE DATABASE LibraryDatabaseZinh ON PRIMARY
	(NAME = 'LibraryDatabaseZinh',
	FILENAME = 'D:\Co so du lieu\LibraryDatabaseZinh.mdf',
	SIZE= 3072KB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 1024KB)

LOG ON
	(NAME = 'LibraryDatabaseZinh_log',
	FILENAME = 'D:\Co so du lieu\LibraryDatabaseZinh_log.ldf',
	SIZE = 1024KB,
	MAXSIZE = 2048KB,
	FILEGROWTH = 10%);
GO	

use LibraryDatabaseZinh
GO

--Create table
CREATE TABLE Publisher(
	Name	VARCHAR(20)	NOT NULL,
	Address	VARCHAR(30),	
	Phone	VARCHAR(10));	
GO

CREATE TABLE Book(
	Book_ID	SMALLINT	NOT NULL,
	Ttile	VARCHAR(30)	NOT NULL,
	Publisher_Name	VARCHAR(20)	);
GO

CREATE TABLE Library_Branch(
	Branch_ID   	SMALLINT	NOT NULL,
	Branch_Name	VARCHAR(20)	NOT NULL,
	Address	VARCHAR(30)	);
GO

CREATE TABLE Book_Authors(
	Book_ID      	SMALLINT	NOT NULL,
	Author_Name  	VARCHAR(20)	NOT NULL);
GO

CREATE TABLE Borrower(
	Card_NO SMALLINT NOT NULL,
	Name	VARCHAR(20)	,
	Adress	VARCHAR(30)	,
	Phone	VARCHAR(10)	);
GO

CREATE TABLE Book_Copies(
	Book_ID  	SMALLINT	NOT NULL,
	Branch_ID	SMALLINT	NOT NULL,
	No_Of_Copies	SMALLINT);
GO

CREATE TABLE Book_Loans(
	Book_ID  	SMALLINT	NOT NULL,
	Branch_ID	SMALLINT	NOT NULL,
	Card_NO  	SMALLINT	NOT NULL,
	Date_Out	DATETIME,	
	Due_Date	DATETIME	);
GO

--Primary Key
ALTER TABLE Book
	ADD Constraint pk_Book PRIMARY KEY (Book_ID);
GO

ALTER TABLE Book_Authors
	ADD Constraint pk_Bk_Ath PRIMARY KEY (Book_ID,Author_Name);
GO

ALTER TABLE Publisher
	ADD Constraint pk_Pub PRIMARY KEY (Name);
GO

ALTER TABLE Book_Copies
	ADD Constraint pk_Bk_Cop PRIMARY KEY (Book_ID,Branch_ID);
GO

ALTER TABLE Book_Loans
	ADD Constraint pk_Bk_Loans PRIMARY KEY (Book_ID,Branch_ID,Card_NO);
GO

ALTER TABLE Library_Branch
	ADD Constraint pk_Lbra_Bran PRIMARY KEY (Branch_ID);
GO

ALTER TABLE Borrower
	ADD Constraint pk_Bor PRIMARY KEY (Card_NO);
GO

--Foreign key
ALTER TABLE Book
	ADD constraint fk_Book_Publisher_Name FOREIGN KEY(Publisher_Name)
	REFERENCES Publisher(Name);
GO

ALTER TABLE Book_Authors
	ADD Constraint fk_Bk_A_Bk_ID FOREIGN KEY(Book_ID) 
	REFERENCES Book(Book_ID);
GO

ALTER TABLE Book_Copies
	ADD Constraint fk_Bk_Cp_Bk_ID FOREIGN KEY(Book_ID) 
	REFERENCES Book(Book_ID);
GO

ALTER TABLE Book_Copies
	ADD Constraint fk_Bk_Cp_Br_ID FOREIGN KEY(Branch_ID) 
	REFERENCES Library_Branch(Branch_ID);
GO

ALTER TABLE Book_Loans
	ADD Constraint fk_Bk_Loan_Bk_ID FOREIGN KEY(Book_ID) 
	REFERENCES Book(Book_ID);
GO

ALTER TABLE Book_Loans
	ADD Constraint fk_Bk_Loan_Br_ID FOREIGN KEY(Branch_ID) 
	REFERENCES Library_Branch(Branch_ID);
GO

ALTER TABLE Book_Loans
	ADD Constraint fk_Bk_Loan_Card_no FOREIGN KEY(Card_no) 
	REFERENCES Borrower(Card_no);
GO

--Insert Data
--Publisher
INSERT INTO Publisher
	VALUES ('Amazing Books','9012 Great Rd','333-3333' );
GO

INSERT INTO Publisher
	VALUES ('Plume','1234 Cool Ave','555-5555');
GO

INSERT INTO Publisher
	VALUES ('Random House','5678 Neat St','444-4444');
GO



-- Book
INSERT INTO Book
	VALUES (1,'The Lost Tribe','Random House');
GO

INSERT INTO Book
	VALUES (2,'Farook','Random House');
GO

INSERT INTO Book
	VALUES (3,	'Carrie',	'Plume');
GO

INSERT INTO Book
	VALUES (4,	'The Dark Tower VII',	'Plume');
GO

INSERT INTO Book
	VALUES (5,	'Red Dawn',	'Amazing Books');
GO

INSERT INTO Book
	VALUES (6,	'Zepplin',	'Amazing Books');
GO


--Library-Branch
INSERT INTO Library_Branch
	VALUES (1,	'Sharpstown',	'4321 Wonder Road');
GO

INSERT INTO Library_Branch
	VALUES (2,	'Central 9876', 'Flower St');
GO


--Book_Authors
INSERT INTO Book_Authors
	VALUES (1,	'Master Nook');
GO

INSERT INTO Book_Authors
	VALUES (2,	'Jardumba Nartangula');
GO

INSERT INTO Book_Authors
	VALUES (3,	'Stephen King');
GO

INSERT INTO Book_Authors
	VALUES (4,	'Stephen King');
GO

INSERT INTO Book_Authors
	VALUES (5,	'John Smith');
GO

INSERT INTO Book_Authors
	VALUES (6,	'Yasunori Mitsugi');
GO


--Borrower
INSERT INTO Borrower
	VALUES (1,	'John Doe',	'1234 Plain St',	'532-2432');
GO

INSERT INTO Borrower
	VALUES (2,	'Jane Doe',	'1234 Plain St',	'532-2432');
GO

INSERT INTO Borrower
	VALUES (3,	'Mike Jackson',	'1111 nowhere',	'222-2222');
GO


--Book-Copies
INSERT INTO Book_Copies
	VALUES (1,	1,	10);
GO

INSERT INTO Book_Copies
	VALUES (1,	2,	10);
GO

INSERT INTO Book_Copies
	VALUES (2,	1,	10);
GO

INSERT INTO Book_Copies
	VALUES (2,	2,	10);
GO

INSERT INTO Book_Copies
	VALUES (3,	1,	10);
GO

INSERT INTO Book_Copies
	VALUES (3,	2,	10);
GO

INSERT INTO Book_Copies
	VALUES (4,	1,	10);
GO

INSERT INTO Book_Copies
	VALUES (4,	2,	10);
GO

INSERT INTO Book_Copies
	VALUES (5,	1,	10);
GO

INSERT INTO Book_Copies
	VALUES (5,	2,	10);
GO

INSERT INTO Book_Copies
	VALUES (6,	2,	10);
GO


--Book_Loans
INSERT INTO Book_Loans
	VALUES (1,	1,	1,	'12/15/2005', 	NULL);
GO

INSERT INTO Book_Loans
	VALUES (1,	2,	1,	'11/24/2005', 	NULL);
GO

INSERT INTO Book_Loans
	VALUES (2,	1,	2,	'12/15/2005', 	NULL);
GO

INSERT INTO Book_Loans
	VALUES (2,	2,	2,	'11/24/2005', 	NULL);
GO

INSERT INTO Book_Loans
	VALUES (3,	1,	3,	'12/15/2005', 	NULL);
GO

INSERT INTO Book_Loans
	VALUES (3,	2,	3,	'11/24/2005', 	NULL);
GO

INSERT INTO Book_Loans
	VALUES (4,	1,	1,	'12/15/2005', 	NULL);
GO

INSERT INTO Book_Loans
	VALUES (4,	2,	1,	'11/24/2005', 	NULL);
GO

INSERT INTO Book_Loans
	VALUES (5,	1,	2,	'12/15/2005', 	NULL);
GO

INSERT INTO Book_Loans
	VALUES (5,	2,	2,	'11/24/2005', 	NULL);
GO

INSERT INTO Book_Loans
	VALUES (6,	1,	3,	'12/15/2005', 	NULL);
GO

INSERT INTO Book_Loans
	VALUES (6,	2,	3,	'11/19/2009', 	NULL);
GO





SELECT * FROM Book_Loans
SELECT * FROM Publisher
SELECT * FROM Borrower 
SELECT * FROM Book_Authors
SELECT * FROM Book
SELECT * FROM Library_Branch
SELECT * FROM Book_Copies


--query 1
Select bc.No_Of_Copies
	From Book_Copies bc, Book b, Library_Branch lb
	Where lb.Branch_ID = bc.Branch_ID
	and b.Book_ID = bc.Book_ID
	and b.Ttile = 'The Lost Tribe'
	and lb.Branch_Name = 'Sharpstown'

-- query 2
Select bc.No_Of_Copies
	From Book_Copies bc, Book b, Library_Branch lb
	Where lb.Branch_ID = bc.Branch_ID
	and b.Book_ID = bc.Book_ID
	and b.Ttile = 'The Lost Tribe'

--query 3
Select b.Name
	From Borrower b
	Where NOT EXISTS(
		Select *
			From Book_Loans bl
			Where bl.Card_NO = b.Card_NO)

-- query 4
Select b.Ttile, bor.Name, bor.Adress
	From Book_Loans bl, Library_Branch lb, Book b, Borrower bor 
	Where lb.Branch_ID = bl.Branch_ID
	and lb.Branch_Name = 'Sharpstown'
	and bl.Due_Date = '10/30/2022'

--query 5
Select	lb.Branch_Name, COUNT(*)
	From Library_Branch lb, Book_Loans bl
	Where lb.Branch_ID = bl.Branch_ID
	group by lb.Branch_Name

--query 6
Create table Borrowers_Info(
	Name varchar(30) null,
	address varchar(30) null,
	Total_of_books smallint null);

INSERT INTO Borrowers_Info
Select	bor.Name, bor.Adress, COUNT(*)
	From Book b, Borrower bor, Book_Loans bl
	Where bor.Card_NO = bl.Card_NO
	group by bor.Name, bor.Adress

Select *
	From Borrowers_Info
	Where Total_of_books > 5

--query 7
Select b.Ttile, bc.No_Of_Copies
	From Book_Authors ba, Book b, Library_Branch lb, Book_Copies bc
	Where b.Book_ID = ba.Book_ID
	and ba.Author_Name = 'Stephen King'
	and lb.Branch_ID = bc.Branch_ID
	and ba.Book_ID = bc.Book_ID
	and lb.Branch_Name LIKE 'Central%'