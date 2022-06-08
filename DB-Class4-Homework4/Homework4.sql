USE [SEDCHome]

/*TASK 1 */
/*Declare scalar variable for storing FirstName values*/
DECLARE @FirstName nvarchar(255);

/*Assign value ‘Antonio’ to the FirstName variable*/
SET @FirstName = 'Antonio';

/*Find all Students having FirstName same as the variable*/
SELECT * FROM Student
WHERE FirstName = @FirstName

/*TASK 2*/
/*Declare table variable that will contain StudentId, StudentName and DateOfBirth*/
DECLARE @StudentTable TABLE (StudentID int, StudentName nvarchar(1000), DateOfBirth date)

/*Fill the table variable with all Female students*/
INSERT INTO @StudentTable
SELECT ID, CONCAT(FirstName, ' ', LastName), DateOfBirth from Student
WHERE Gender = 'F'

SELECT * FROM @StudentTable

/*TASK 3*/
/*Declare temp table that will contain LastName and EnrolledDate columns*/
CREATE TABLE #StudentTableTemp (LastName nvarchar(255), EnrolledDate date)

/*Fill the temp table with all Male students having First Name starting with ‘A’*/
INSERT INTO #StudentTableTemp
SELECT LastName, EnrolledDate FROM Student
WHERE Gender = 'M' AND FirstName LIKE 'A%'

SELECT * FROM #StudentTableTemp

/*Retrieve the students from the table which last name is with 7 characters*/
SELECT * FROM #StudentTableTemp
WHERE LEN(LastName) = 7

/*TASK 4*/
/*Find all teachers whose FirstName length is less than 5 and
the first 3 characters of their FirstName and LastName are the same*/
SELECT * FROM Teacher
WHERE LEN(FirstName) < 5
AND SUBSTRING(FirstName, 1, 3) = SUBSTRING(LastName, 1, 3)

