create database assisnmentday1_2;
use assisnmentday1_2;

create table Department (
DepartmentID int primary key auto_increment,
DepartmentName varchar(200)
);

create table Positions (
PositionID int primary key auto_increment,
PositionName enum('Dev', 'Test', 'Scrum Master', 'PM')
);

create table Account_User (
AccountID int primary key auto_increment,
Email varchar(200),
Username varchar(200),
Fullname varchar(200),
DepartmentID int,
constraint FK_DepAcc foreign key (DepartmentID) references Department(DepartmentID), 
PositionID int,
constraint FK_PosAcc foreign key (PositionID) references Positions(PositionID),
CreateDate date
);

create table Group_User (
GroupID int primary key auto_increment,
GroupName varchar(200),
CreatorID int,
constraint FK_AccCre foreign key (CreatorID) references Account_User(AccountID),
CreateDate date
);

create table GroupAccount (
GroupID int,
constraint FK_GrAcc foreign key (GroupID) references Group_User(GroupID),
AccountID int,
constraint FK_FrUser foreign key (AccountID) references Account_User(AccountID),
JoinDate date
);

create table TypeQuestion (
TypeID int primary key auto_increment, 
TypeName enum('Essay', 'Multiple-Choice')
);

create table CategoryQuestion (
CategoryID int primary key auto_increment, 
CategoryName varchar(200)
);

create table Question (
QuestionID int primary key auto_increment,
Content varchar (500),
CategoryID int, 
constraint FK_QC foreign key (CategoryID) references CategoryQuestion(CategoryID),
TypeID int,
constraint FK_QT foreign key (TypeID) references TypeQuestion(TypeID),
CreatorID int, 
constraint FK_QI foreign key (CreatorID) references Account_User(AccountID), 
CreateDate date
);

create table Answer (
AnswerID int primary key auto_increment, 
Content varchar(1000),
QuestionID int, 
constraint FK_QA foreign key (QuestionID) references Question(QuestionID),
isCorrect enum('correct','wrong')
);

create table Exam (
ExamID int primary key auto_increment, 
Code_Exam varchar(100),
Title varchar(500),
CategoryID int, 
constraint FK_QE foreign key (CategoryID) references CategoryQuestion(CategoryID),
CreatorID int, 
constraint FK_EC foreign key (CreatorID) references Account_User(AccountID),
CreateDate date
);

create table ExamQuestion (
ExamID int, 
constraint FK_EQI foreign key (ExamID) references Exam(ExamID),
QuestionID int, 
constraint FK_QEI foreign key (QuestionID) references Question(QuestionID)
);