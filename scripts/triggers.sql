/* Quinta parte de nuestra práctica en donde realizamos los triggers correspondientes al punto 5 */
USE practicesql
GO

-- 5.1 Generar un error para prevenir “inserts” de proyectos cuyo Deadline sea antes que la fecha de inicio.
CREATE TRIGGER TR_projectStartDead
ON Projects
INSTEAD OF INSERT
AS
BEGIN
    DECLARE
        @Name varchar(150),
        @StartDate date,
        @DeadLine date,
        @FinishedOn date
    SELECT @StartDate= INSERTED.[StartDate],
           @DeadLine= INSERTED.[Deadline]
           FROM INSERTED
        IF (@DeadLine<@StartDate)
            PRINT('La fecha limite (Deadline) es menor que la fecha de inicio (StartDate)')
        ELSE
            INSERT INTO Projects(
                [Name], [StartDate], [Deadline], [FinishedOn])
            VALUES(@Name, @StartDate, @DeadLine, @FinishedOn)
END
GO

INSERT INTO Projects 
	   ([Name], [StartDate], [DeadLine]) 
VALUES ('Proyecto Prueba', '7/12/2022', '7/11/2022')
GO

SELECT * FROM Projects
GO

-- 5.2 Al insertar proyectos, actalizar sus estatus a “pendientes”, o “en proceso” en caso que la fecha actual sea posterior a StartDate y antes del deadline.
