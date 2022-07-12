/* Cuarta parte de nuestra práctica en donde realizamos las consultas correspondientes al punto 4 */
USE practicesql
GO

-- 4.1 Consulta para las compañías
SELECT	Name, CompanyAddress, PK_CompanyId
FROM Companies;
GO

-- 4.2 Consulta para los empleados
SELECT	PK_EmployeesId, FirstName,LastName,Email,Phone,Salary
FROM Employees;
GO

-- 4.3 Consulta para los proyectos finalizados antes del deadline
SELECT Name, StartDate, Deadline, FinishedOn
FROM Projects
WHERE FinishedOn <= Deadline;
GO

-- 4.4 Consulta para los proyectos que no hayan empezado a partir de hoy (07-12-2022)
SELECT Name, StartDate
FROM Projects
WHERE StartDate >= GETDATE();
GO

-- 4.5 Consulta para devolver los empleados con un salario mayor a 10,000
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary >= 10000
ORDER BY Salary DESC, FirstName, LastName;
GO

-- 4.6 Consulta que devuelve los empleados de Atoz
SELECT FirstName, LastName, Companies.Name
FROM Employees
RIGHT JOIN Companies
ON FK_CompanyId = PK_CompanyId
WHERE FK_CompanyId = 2
GO

-- 4.7 Consulta que devuelve los empleados que no son de Disnei
SELECT FirstName, LastName, Companies.Name
FROM Employees
RIGHT JOIN Companies
ON FK_CompanyId = PK_CompanyId
WHERE FK_CompanyId != 3
GO

-- 4.8 Devuelve los empleados con sus respectivas companies, ordenados primeramente por el nombre de sus companies y Luego por sus apellidos.
SELECT Name, LastName, FirstName
FROM Companies
INNER JOIN Employees
ON PK_CompanyId = FK_CompanyId
ORDER BY Name, LastName DESC
GO

-- 4.9 Devuelve los empleados que pertenezcan a proyectos que esten en proceso.
SELECT FirstName, LastName, Projects.Name, Statuses.Name
FROM Employees
INNER JOIN Projects ON FK_ProjectsId = PK_ProjectsId
INNER JOIN Statuses ON FK_StatusId = PK_StatusId
WHERE FK_StatusId = 1
GO

-- 4.10 Devuelve los empleados sin proyectos pendientes o en proceso.
SELECT FirstName, LastName, Projects.Name, Statuses.Name
FROM Employees
INNER JOIN Projects ON FK_ProjectsId = PK_ProjectsId
INNER JOIN Statuses ON FK_StatusId = PK_StatusId
WHERE FK_StatusId = 1 OR FK_StatusId = 2
GO