USE [SEDCACADEMYDB]

CREATE TABLE [Student](
	[ID][int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
	[FirstName][nvarchar](100) NOT NULL,
	[LastName][nvarchar](100) NOT NULL,
	[DateOfBirth][date] NOT NULL,
	[EnrolledDate][date] NOT NULL,
	[Gender][nvarchar](100) NOT NULL,
	[NationalIDNumber][nvarchar](100) NOT NULL,
	[StudentCardNumber][nvarchar](100) NOT NULL,
)

CREATE TABLE [Teacher](
	[ID][int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
	[FirstName][nvarchar](100) NOT NULL,
	[LastName][nvarchar](100) NOT NULL,
	[DateOfBirth][date] NOT NULL,
	[AcademicRank][nvarchar](100) NOT NULL,
	[HireDate][date] NOT NULL,
)

CREATE TABLE [Course](
	[ID][int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name][nvarchar](100) NOT NULL,
	[Credit][int] NOT NULL,
	[AcademicYear][int] NOT NULL,
	[Semester][int] NOT NULL,
)

CREATE TABLE [Grade](
	[ID][int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[StudentID][int],
	[CourseID][int],
	[TeacherID][int],
	[Grade][int] NOT NULL,
	[Comment][nvarchar](300) NOT NULL,
	[CreatedDate][date] NOT NULL,
)

CREATE TABLE [AchievementType](
	[ID][int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
	[Name][nvarchar](100) NOT NULL,
	[Description][nvarchar](300) NULL,
	[ParticipationRate][int] NOT NULL,
)

CREATE TABLE [GradeDetails](
	[ID][int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
	[GradeId][int],
	[AchievementTypeId][int],
	[AchievementPoints][int] NOT NULL,
	[AchievementMaxPoints][int] NOT NULL,
	[AchievementDate][date] NOT NULL,
)

