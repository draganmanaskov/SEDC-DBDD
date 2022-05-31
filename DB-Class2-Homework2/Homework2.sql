USE [SEDCHome]

SELECT * FROM dbo.Student as s
WHERE s.FirstName = 'Antonio'

SELECT * FROM dbo.Student as s
WHERE s.DateOfBirth < '01/01/1998'

SELECT * FROM dbo.Student as s
WHERE s.LastName LIKE 'J%' AND s.EnrolledDate between '1998-01-01' and '1998-02-01'

SELECT * FROM dbo.Student as s
ORDER BY s.FirstName ASC

SELECT t.LastName FROM dbo.Teacher as t
UNION
SELECT s.LastName FROM dbo.Student as s

ALTER TABLE Grade
ADD CONSTRAINT FK_StudentID
FOREIGN KEY (StudentID) REFERENCES Student(ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_CourseID
FOREIGN KEY (CourseID) REFERENCES Course(ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_TeacherID
FOREIGN KEY (TeacherID) REFERENCES Teacher(ID)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeID
FOREIGN KEY (GradeID) REFERENCES Grade(ID)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_AchievementTypeID
FOREIGN KEY (AchievementTypeID) REFERENCES AchievementType(ID)

SELECT c.Name, a.Name FROM dbo.Course as c
CROSS JOIN [AchievementType] as a

SELECT * FROM dbo.Teacher as t
LEFT JOIN [Grade] as g ON g.TeacherID = t.ID
WHERE g.ID is NULL


