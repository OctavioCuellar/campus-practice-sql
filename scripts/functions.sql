/* Sexta parte de nuestra práctica en donde realizamos las funciones correspondientes al punto 6*/
USE practicesql
GO

-- 6.1.Crea una funcion “GetLastProjetIdByEmployeeName()” que reciba el nombre de un empleado y retorne el Id del proyecto mas reciente del empleado ingresando
CREATE FUNCTION GetLastProjetIdByEmployeeName(@EmployeeName VARCHAR(50))
	RETURNS INT
AS
BEGIN
	DECLARE 
		@ReturnId			INT,
		@PK_EmployeesId		INT,
		@PK_ProjectsId		INT
	
	SELECT
	@PK_EmployeesId = PK_EmployeesId FROM Employees WHERE Employees.FirstName = @EmployeeName
	
	SELECT
	@PK_ProjectsId = PK_ProjectsId FROM Projects
	INNER JOIN Employees ON PK_ProjectsId = FK_ProjectsId AND @PK_EmployeesId = PK_EmployeesId AND Projects.StartDate
	IN (SELECT MAX(Projects.StartDate) FROM Employees INNER JOIN Projects on PK_ProjectsId = FK_ProjectsId AND PK_ProjectsId = @PK_ProjectsId)

	SELECT @ReturnId = @PK_ProjectsId;
	IF(@ReturnId IS NULL) SET @ReturnId = 0;
	RETURN @ReturnId;
END;
GO

-- 6.2.Crea una funcion “HasAnyProject()” que reciba el nombre de un empleado y retorne un bit, indicando 1 en caso de que el empleado pertenezca a mas de 1 proyecto o 0 en caso contrario. 
CREATE FUNCTION HasAnyProject(@EmployeeName AS VARCHAR(50))
RETURNS BIT
AS
BEGIN
	DECLARE 
		@ProjectCounter		INT,
		@EmployeeProjectsId	INT

	SELECT 
	@EmployeeProjectsId = PK_EmployeesId FROM Employees WHERE FirstName = @EmployeeName;

	SELECT @ProjectCounter =
	COUNT(*) FROM Projects INNER JOIN Employees ON FK_ProjectsId = PK_ProjectsId WHERE PK_EmployeesId = @EmployeeProjectsId;

	IF(@ProjectCounter > 1) RETURN 1
	RETURN 0
END;
GO
