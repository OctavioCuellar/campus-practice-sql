/* Quinta parte de nuestra práctica en donde realizamos los triggers correspondientes al punto 5 */
USE practicesql
GO

-- 5.1 Generar un error para prevenir “inserts” de proyectos cuyo Deadline sea antes que la fecha de inicio.
-- 5.2 Al insertar proyectos, actualizar sus estatus a “pendientes”, o “en proceso” en caso que la fecha actual sea posterior a StartDate y antes del deadline.

CREATE TRIGGER TR_ProjectsErrorAndUpdate
ON Projects
FOR INSERT
AS
    DECLARE
        @Name			VARCHAR(150),
        @StartDate		DATE,
        @Deadline		DATE,
        @FinishedOn		DATE,
		@PK_ProjectsId	INT

    SELECT @StartDate = INSERTED.[StartDate],
           @DeadLine = INSERTED.[Deadline],
		   @PK_ProjectsId =	INSERTED.[PK_ProjectsId]
           FROM INSERTED
        IF (@DeadLine<@StartDate)
		BEGIN
            RAISERROR ('La fecha limite (Deadline) es menor que la fecha de inicio (StartDate)',16,1);
			ROLLBACK TRANSACTION;
			RETURN
		END
		ELSE
            IF (@StartDate <= GETDATE() OR @Deadline >= GETDATE())
			BEGIN
				UPDATE Projects SET FK_StatusId = 1 WHERE @PK_ProjectsId = PK_ProjectsId;
				RETURN
			END
GO

-- Para activar el 1er trigger:
INSERT INTO Projects 
	   ([Name], [StartDate], [DeadLine]) 
VALUES ('Proyecto Prueba', '7/12/2022', '7/11/2022')
GO

-- Para activar el 2do trigger:
INSERT INTO Projects 
	   ([Name], [StartDate], [DeadLine]) 
VALUES ('Proyecto Prueba En Pendiente', '7/14/2022', '7/30/2022')
GO

SELECT * FROM Projects
GO
