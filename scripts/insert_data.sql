/* Tercera parte de nuestra práctica en donde añadimos los registros a las tablas correspondientes al punto 3 */
USE practicesql
GO

-- Insertar 5 renglones en la tabla 'Statuses'
INSERT INTO Statuses
   ([Name])
VALUES
   (N'Pendiente'),
   (N'En proceso'),
   (N'Cancelado'),
   (N'Finalizado'),
   (N'En pausa')
GO

-- Consulta para saber si los datos fueron exitosamente agregados, el PK se genera de manera incremental 1+ (del 1 al 5)
SELECT	Name, PK_StatusId
FROM	Statuses;
GO

-- Insertar 3 renglones en la tabla 'Companies'
INSERT INTO Companies
   ([Name],[CompanyAddress])
VALUES
   (N'IMC',		N'5151 W 29th St #2201Greeley, Colorado(CO),	80634'),
   (N'Atoz',	N'2007 Ardmore HwyArdmore, Tennessee(TN),		38449'),
   (N'Disnei',	N'4226 Highgate DrHorn Lake, Mississippi(MS),	38637')
GO

-- Consulta para saber si los datos fueron exitosamente agregados, el PK se genera de manera incremental 1+ (del 1 al 3)
SELECT	Name, CompanyAddress, PK_CompanyId
FROM Companies
GO

-- Insertar 5 renglones en la tabla 'Projects'
INSERT INTO Projects
   ([Name],[StartDate],[Deadline],[FinishedOn],[FK_StatusId])
VALUES
   (N'Dainler Learning',		'2-7-1995',		'2-22-2050', NULL,		2),
   (N'Provident Software',		'9-15-2022',	'2-28-2023', NULL,		1),
   (N'DataAnlysis',				'1-31-2023',	'10-5-2023', NULL,		1),
   (N'SoftCentral Migration',	'5-2-2021',		'7-25-2022', '1-1-2022',4),
   (N'Atoz Insight',			'1-1-2022',		'10-1-2024', NULL,		3)
GO

-- Consulta para saber si los datos fueron exitosamente agregados, el PK se genera de manera incremental 1+ (del 1 al 5)
SELECT	PK_ProjectsId, Name, StartDate, Deadline, FinishedOn, FK_StatusId
FROM Projects
GO

-- Insertar 10 renglones en la tabla 'Employees'
INSERT INTO Employees
   ([FirstName],[LastName],[Email],[Phone],[Salary], [FK_CompanyId], [FK_ProjectsId])
VALUES
   (N'Juan',		N'Perez',		N'juan@jmail.com',			N'9991808182', 9500,	3, 1),
   (N'Paco',		N'Ochoa',		N'paco@jmail.com',			N'9991808183', 8000,	3, 1),
   (N'Pedro',		N'Fernandez',	N'pedro@jmail.com',			N'9991808184', 12500,	1, 2),
   (N'Sofi',		N'Hernandez',	N'sofi@jmail.com',			N'9991808185', 11000,	1, 2),
   (N'Isabella',	N'Smith',		N'isabella@jmail.com',		N'9991808186', 9000,	3, 3),
   (N'Eduardo',		N'Jimenez',		N'eduardo@jmail.com',		N'9991808187', 11000,	1, 2),
   (N'Jose',		N'Pavon',		N'jose@jmail.com',			N'9991808188', 12000,	2, 5),
   (N'Pancho',		N'Fernandez',	N'pancho@jmail.com',		N'9991808189', 12500,	2, 5),
   (N'Francisco',	N'Fernandez',	N'francisco@jmail.com',		N'9991808190', 25000,	2, 4),
   (N'Diego',		N'Olivarez',	N'diego@jmail.com',			N'9991808191', 9000,	3, 1)
GO

-- Consulta para saber si los datos fueron exitosamente agregados, el PK se genera de manera incremental 1+ (del 1 al 10)
SELECT	PK_EmployeesId, FirstName,LastName,Email,Phone,Salary, FK_CompanyId, FK_ProjectsId
FROM Employees
GO