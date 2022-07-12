/* Segunda parte de nuestra práctica en donde creamos las relaciones entre las tablas correspondientes al punto 2 */
USE practicesql
GO

ALTER TABLE Employees ADD FK_CompanyId INT;
ALTER TABLE Employees ADD CONSTRAINT FK_Employee_Companies FOREIGN KEY (FK_CompanyId) REFERENCES Companies (PK_CompanyId);
GO

ALTER TABLE Employees ADD FK_ProjectsId INT;
ALTER TABLE Employees ADD CONSTRAINT FK_Employee_Projects FOREIGN KEY (FK_ProjectsId) REFERENCES Projects (PK_ProjectsId);
GO