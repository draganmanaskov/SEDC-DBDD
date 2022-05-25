USE [SEDCACADEMYDB]


CREATE TABLE [Student](
	[StudentId][int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[FirstName][nvarchar](100) NOT NULL,
	[LastName][nvarchar](100) NOT NULL,
	[DateOfBirth][date] NOT NULL,
	[EnrolledDate][date] NULL,
	[NationalIDNumber][int] NULL,
	[StudentCardNumber][int]NULL,
)

CREATE TABLE [Teacher](
	[TeacherId][int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[FirstName][nvarchar](100) NOT NULL,
	[LastName][nvarchar](100) NOT NULL,
	[DateOfBirth][date] NOT NULL,
	[AcademicRank][nvarchar](100) NOT NULL,
	[HireDate][date] NULL,
)

CREATE TABLE [Course](
	[CourseId][int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name][nvarchar](100) NOT NULL,
	[Creadit][int] NOT NULL,
	[AcademicYear][date] NOT NULL,
	[Semester][nvarchar](100) NOT NULL,
)

CREATE TABLE [Grade](
	[GradeId][int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[StudentId][int] FOREIGN KEY REFERENCES Student(StudentId) NOT NULL,
	[CourseId][int] FOREIGN KEY REFERENCES Course(CourseId) NOT NULL,
	[TeacherId][int] FOREIGN KEY REFERENCES Teacher(TeacherId) NOT NULL,
	[Grade][int] NOT NULL CHECK (Grade between 1 and 5),
	[Comment][nvarchar](300) NULL,
	[CreatedDate][date] NULL,
)

CREATE TABLE [AchievementType](
	[AchievementTypeId][int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name][nvarchar](100) NOT NULL,
	[Description][nvarchar](300) NULL,
	[ParticipationRate][decimal] NULL,
)

CREATE TABLE [GradeDetails](
	[GradeDetailsId][int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[GradeId][int] FOREIGN KEY REFERENCES Grade(GradeId) NOT NULL,
	[AchievementTypeId][int] FOREIGN KEY REFERENCES AchievementType(AchievementTypeId) NOT NULL,
	[AchievementPoints][int] NULL,
	[AchievementMaxPoints][int] NULL,
	[AchievementDate][date] NULL,
)


