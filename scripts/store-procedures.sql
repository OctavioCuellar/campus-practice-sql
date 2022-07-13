/* Séptima parte de nuestra práctica en donde realizamos el store procedure correspondiente al punto 7*/
USE practicesql
GO

/*
6.1. Crea un store procedure que reciba el nombre de una compania y el nombre de un proyecto, 
el store procedure debera realizar la siguientes operaciones por cada empleado perteneciente a la campania: 
- Debera utilizar la funcion HasAnyProject() para verificar que el empleado pertenezca a algun proyecto, 
en caso que asi sea entones se deberá eliminar al empleado de cada unos de sus proyectos.
- Posteriormente, el empleado sera asignado al proyecto segun el nombre ingresado.
*/

CREATE PROCEDURE spProjectEmployeeUpdater (@CompanyName VARCHAR(150), @ProjectName VARCHAR(150))
AS
	DECLARE 
		@CompanyId					INT,
		@EmployeeId					INT,
		@EmployeeName				VARCHAR (50),
		@ProjectId					INT,
		@HasAnyProject				BIT
	
	SELECT 
	@CompanyId = PK_CompanyId FROM Companies WHERE Name = @CompanyName;

	SELECT 
	@ProjectId = PK_ProjectsId FROM Projects WHERE Name = @ProjectName;

	DECLARE Projects_Cursor CURSOR 
		FOR
		SELECT DISTINCT PK_CompanyId, FirstName FROM Companies INNER JOIN Employees on PK_CompanyId = @CompanyId;
	
	OPEN Projects_Cursor

	FETCH NEXT FROM Projects_Cursor INTO @EmployeeId, @EmployeeName;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @HasAnyProject = dbo.HasAnyProject(@EmployeeName);
		IF(@HasAnyProject = 1)
		BEGIN
			DELETE FROM Employees WHERE FK_ProjectsId = @ProjectId
			INSERT INTO Employees VALUES (@ProjectId);
		END
		ELSE
		BEGIN
			INSERT INTO Employees VALUES (@ProjectId);
		END
		FETCH NEXT FROM Projects_Cursor INTO @EmployeeId, @EmployeeName
	END
	CLOSE Projects_Cursor
	DEALLOCATE Projects_Cursor
GO

EXEC spProjectEmployeeUpdater @CompanyName = 'Atoz', @ProjectName = 'Atoz Insight';