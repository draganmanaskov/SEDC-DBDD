USE [SEDCHome]

/*Calculate the count of all grades per Teacher in the system*/
SELECT t.ID, t.FirstName, t.LastName, COUNT(*) as NumberOfGrades FROM Grade as g
INNER JOIN Teacher as t ON t.ID = g.TeacherID
GROUP BY t.ID, t.FirstName, t.LastName
ORDER BY t.ID

/*Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)*/
SELECT t.ID, t.FirstName, t.LastName, COUNT(*) as NumberOfGrades FROM Grade as g
INNER JOIN Teacher as t ON t.ID = g.TeacherID
WHERE StudentID < 100
GROUP BY t.ID, t.FirstName, t.LastName
ORDER BY t.ID

/*Find the Maximal Grade, and the Average Grade per Student on all grades in the system*/
SELECT s.ID, s.FirstName, s.LastName, MAX(Grade) AS MaxGrade FROM GRADE as g
INNER JOIN Student as s ON s.ID = g.StudentID
GROUP BY s.ID, s.FirstName, s.LastName
ORDER BY s.ID

/*Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200*/
SELECT t.ID, t.FirstName, t.LastName, COUNT(*) as NumberOfGrades FROM Grade as g
INNER JOIN Teacher as t ON t.ID = g.TeacherID
GROUP BY t.ID, t.FirstName, t.LastName
HAVING COUNT(*) > 200
ORDER BY t.ID

/*Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the 
system. Filter only records where Maximal Grade is equal to Average Grade*/
SELECT s.ID, s.FirstName, s.LastName, COUNT(*) as GradeCount, MAX(Grade) AS MaxGrade, AVG(Grade) as AvarageGrade FROM GRADE as g
INNER JOIN Student as s ON s.ID = g.StudentID
GROUP BY s.ID, s.FirstName, s.LastName
HAVING MAX(Grade) = AVG(Grade)
ORDER BY s.ID

/*List Student First Name and Last Name next to the other details from previous query*/
/* Vekje go pravev toa :D */

/*Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student*/
GO
CREATE or ALTER VIEW vw_StudentGrades 
AS 
(
SELECT StudentID, COUNT(*) as GradeCount FROM Grade
GROUP BY StudentID
)
GO
SELECT * FROM vw_StudentGrades

/*Change the view to show Student First and Last Names instead of StudentID*/
GO
CREATE or ALTER VIEW vw_StudentGrades 
AS 
(
SELECT s.FirstName, s.LastName, COUNT(*) as GradeCount FROM Grade as g
INNER JOIN Student as s ON s.ID = g.StudentID
GROUP BY s.FirstName, s.LastName
)
GO
SELECT * FROM vw_StudentGrades

/*List all rows from view ordered by biggest Grade Count */
SELECT * FROM vw_StudentGrades
ORDER BY GradeCount