CREATE TRIGGER trg_empleados_delete
ON empleados
FOR DELETE
AS
BEGIN
    INSERT INTO controlCambios (usuario, fecha, datoanterior, datonuevo)
    SELECT SYSTEM_USER, GETDATE(), d.documento, NULL
    FROM deleted d;
END;
GO
