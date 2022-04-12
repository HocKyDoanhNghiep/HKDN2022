USE master
CREATE DATABASE LapTrinhDB
USE LapTrinhDB
GO

------Tạo bảng Admin-----
Create table AdminAccount(
	AdminId INT IDENTITY(1,1) NOT NULL primary key,
	Name nvarchar(200) NOT NULL,
	Password varchar(50) NOT NULL,
	Email varchar(100) NOT NULL CHECK (Email LIKE '[a-z]%@%')
)

------Tạo bảng User-----
Create table UserAccount(
	UserId INT IDENTITY(1,1) NOT NULL primary key,
	Name nvarchar(200) NOT NULL,
	Password varchar(50) NOT NULL,
	Email varchar(100) NOT NULL CHECK (Email LIKE '[a-z]%@%'),
	Coin int NULL
)
------Tạo bảng Tác giả-----
Create table AuthorAccount(
	AuthorId INT IDENTITY(1,1) NOT NULL primary key,
	Name nvarchar(200) NOT NULL,
	Password varchar(50) NOT NULL,
	Email varchar(100) NOT NULL CHECK (Email LIKE '[a-z]%@%'),
)

------Tạo bảng Profile------
CREATE TABLE Profile (
	ProfileId INT IDENTITY(1,1) NOT NULL primary key,
	UserId INT  NULL  FOREIGN KEY (UserId) REFERENCES UserAccount,
	AdminId INT  NULL  FOREIGN KEY (AdminId) REFERENCES AdminAccount,
	AuthorId INT  NULL  FOREIGN KEY (AuthorId) REFERENCES AuthorAccount,
	FullName NVARCHAR(255) NULL,
	DateUser DATE NULL,
	Phone varchar(10) NULL 
		CHECK (Phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Country NVARCHAR(255) NULL,
	City NVARCHAR(255) NULL,
	Address NVARCHAR(255) NULL,
	Facebook NVARCHAR(255) NULL,
)

-----Tạo bảng Danh mục-------
Create table Category(
	CategoryId INT IDENTITY(1,1) NOT NULL primary key,
	NameCategory nvarchar(200) NOT NULL
)

------Tạo bảng Khoá học------
CREATE TABLE Courses (
	CoursesId INT IDENTITY(1,1) NOT NULL  primary key,
	NameCourses nvarchar(255) NOT NULL,
	Author NVARCHAR(255) NULL,
	Description NVARCHAR(255) NULL,
	Price int NOT NULL,
	Target NVARCHAR(500) NULL ,
	Request NVARCHAR(255) NULL,
	LinkVideo NVARCHAR(255) NOT NULL,
	Level NVARCHAR(100)  NOT NULL,
	Datetime Datetime not null,
	Status bit null,
	CategoryId int NULL FOREIGN KEY (CategoryId) REFERENCES Category,
	AuthorId INT NOT NULL FOREIGN KEY (AuthorId) REFERENCES AuthorAccount
)

------Tạo bảng đăng ký khoá học------
CREATE TABLE CourseRegister (
	CourseDetailsId INT IDENTITY(1,1) NOT NULL  primary key,
	CoursesId INT NOT NULL  FOREIGN KEY (CoursesId) REFERENCES Courses,
	UserId INT NOT NULL FOREIGN KEY (UserId) REFERENCES UserAccount,
)

------Tạo bảng tiến độ khoá học------
CREATE TABLE CourseProcess (
	CourseProcessId INT IDENTITY(1,1) NOT NULL  primary key,
	CoursesId INT NOT NULL  FOREIGN KEY (CoursesId) REFERENCES Courses,
	UserId INT NOT NULL FOREIGN KEY (UserId) REFERENCES UserAccount,
	LinkVideo NVARCHAR(255) NULL,
	Learned bit NULL,
)

------Tạo bảng đánh giá khoá học------
CREATE TABLE StarRate (
	StarId INT IDENTITY(1,1) NOT NULL  primary key,
	CoursesId INT NOT NULL  FOREIGN KEY (CoursesId) REFERENCES Courses,
	UserId INT NOT NULL FOREIGN KEY (UserId) REFERENCES UserAccount,
	Star int NULL
)

------Tạo bảng Bài học------
CREATE TABLE Lesson (
	LessonId INT IDENTITY(1,1) NOT NULL  primary key,
	Namelesson nvarchar(255) NOT NULL,
	LinkVideo NVARCHAR(255) NOT NULL,
	CoursesId INT NOT NULL  FOREIGN KEY (CoursesId) REFERENCES Courses,
)

------Tạo bảng Ghi chú------
CREATE TABLE Note (
	NoteId INT IDENTITY(1,1) NOT NULL  primary key,
	Note nvarchar(255) NOT NULL,
	LessonId INT NULL FOREIGN KEY (LessonId) REFERENCES Lesson,
	UserId INT NOT NULL FOREIGN KEY (UserId) REFERENCES UserAccount,
)

-----Tạo bảng bài tập-------
Create table Assignment(
	AssignmentId INT IDENTITY(1,1) NOT NULL primary key,
	Question nvarchar(500) NOT NULL,
	Answer1 nvarchar(200) NOT NULL,
	Answer2 nvarchar(200) NOT NULL,
	Answer3 nvarchar(200) NOT NULL,
	Answer4 nvarchar(200) NOT NULL,
	Result nvarchar(200) NOT NULL,
	LessonId INT NULL FOREIGN KEY (LessonId) REFERENCES Lesson,

)
Create table Answer(
	AnswerId INT IDENTITY(1,1) NOT NULL primary key,
	Answer nvarchar(500) NOT NULL,
	UserId INT NOT NULL FOREIGN KEY (UserId) REFERENCES UserAccount,
	AssignmentId int NOT NULL FOREIGN KEY (AssignmentId) REFERENCES Assignment,

)

------Tạo bảng Bình luận------
CREATE TABLE Comment (
	CommentId INT IDENTITY(1,1) NOT NULL  primary key,
	Content nvarchar(max) NOT NULL,
	Datetime datetime NOT NULL,
	LessonId INT NULL FOREIGN KEY (LessonId) REFERENCES Lesson,
	UserId INT NOT NULL FOREIGN KEY (UserId) REFERENCES UserAccount,
)

------Tạo bảng Trả lời Bình luận------
CREATE TABLE CommentReply (
	CommentReplyId INT IDENTITY(1,1) NOT NULL  primary key,
	Content nvarchar(max) NOT NULL,
	Datetime datetime NOT NULL,
	CommentId INT NULL FOREIGN KEY (CommentId) REFERENCES Comment,
	UserId INT NOT NULL FOREIGN KEY (UserId) REFERENCES UserAccount,
	AuthorId INT NOT NULL FOREIGN KEY (AuthorId) REFERENCES AuthorAccount
)
