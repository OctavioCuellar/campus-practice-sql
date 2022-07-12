/* Primera parte de nuestra práctica en donde creamos las tablas correspondientes al punto 1 */
USE practicesql
GO

CREATE TABLE Companies(
    PK_CompanyId INT IDENTITY(1,1),
    PRIMARY KEY (PK_CompanyId),
    Name			[VARCHAR](150)	NOT NULL UNIQUE,
    CompanyAddress	[TEXT]			NOT NULL
);
GO

CREATE TABLE Statuses(
    PK_StatusId INT IDENTITY(1,1),
    PRIMARY KEY (PK_StatusId),
    Name		[VARCHAR] (50) NOT NULL
);
GO

CREATE TABLE Projects(
    PK_ProjectsId INT IDENTITY(1,1),
    PRIMARY KEY (PK_ProjectsId),
    Name		[VARCHAR](150)	NOT NULL UNIQUE,
    StartDate	[DATE]			NOT NULL,
    Deadline	[DATE]			NOT NULL,
    FinishedOn	[DATE],
    FK_StatusId INT,
    CONSTRAINT FK_Projects_Statuses FOREIGN KEY (FK_StatusId) REFERENCES Statuses(PK_StatusId)
);
GO

CREATE TABLE Employees(
    PK_EmployeesId INT IDENTITY(1,1),
    PRIMARY KEY (PK_EmployeesId),
    FirstName	[VARCHAR](50)	NOT NULL,
    LastName	[VARCHAR](50)	NOT NULL,
    Email		[VARCHAR](100)	NOT NULL,
    Phone		[VARCHAR](12)	NOT NULL,
    Salary FLOAT
);
GO