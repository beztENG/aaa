--query 1
Select Ttile, No_Of_Copies, Branch_Name	
	FROM Book, Book_Copies, Library_Branch
	WHERE Book.Book_ID = Book_Copies.Book_ID
		AND Book_Copies.Branch_ID = Library_Branch.Branch_ID
		AND Branch_Name = 'Sharpstown'
		AND Ttile = 'The Lost Tribe'

-- query 2
Select Ttile, No_Of_Copies, Branch_Name	
	FROM Book, Book_Copies, Library_Branch
	WHERE Book.Book_ID = Book_Copies.Book_ID
		AND Book_Copies.Branch_ID = Library_Branch.Branch_ID
		AND Ttile = 'The Lost Tribe'

--query 3
SELECT Name
	FROM Borrower 
	WHERE NOT EXISTS(
		SELECT *
		FROM Book_Loans
		WHERE Borrower.Card_NO = Book_Loans.Card_NO)

--query 4
Select Ttile, Name, Address
	From Book_Loans, Borrower, Library_Branch, Book
	Where Library_Branch.Branch_Name = 'Sharpstown' AND Book_Loans.Due_Date = '10/15/2022'
	AND Book.Book_ID = Book_Loans.Book_ID AND Library_Branch.Branch_ID = Book_Loans.Branch_ID AND Borrower.Card_NO = Book_Loans.Card_NO

--query 5
SELECT Branch_Name, COUNT(*)
	FROM Library_Branch, Book_Loans
	WHERE Book_Loans.Branch_ID = Library_Branch.Branch_ID
	GROUP BY Library_Branch.Branch_Name


--query 6
CREATE TABLE Borrowers_Information(
	Name varchar(20) null,
	Address varchar(30) null,
	Total_Loaned_Book smallint null)
GO

INSERT INTO	Borrowers_Information
	SELECT Name, Adress, Count (*)
		FROM Borrower , Book_Loans 
		WHERE Borrower.Card_NO = Book_Loans.Card_NO
		GROUP BY Borrower.Name, Adress
GO

SELECT *
	 FROM Borrowers_Information
	 WHERE Total_Loaned_Book > 5
GO

Select *
	From Borrowers_Info
	Where Total_of_books > 5

--query 7
Select Ttile, No_Of_Copies
	FROM Book_Authors, Book_Copies, Book, Library_Branch
	WHERE Book_Authors.Book_ID = Book.Book_ID AND
	Library_Branch.Branch_ID = Book_Copies.Branch_ID AND
	Book_Authors.Book_ID = Book_Copies.Book_ID AND
	Library_Branch.Branch_Name = 'Central 9876' AND Book_Authors.Author_Name = 'Stephen King'