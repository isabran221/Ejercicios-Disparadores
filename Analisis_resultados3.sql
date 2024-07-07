CREATE TRIGGER trg_empleados_insert
ON empleados
FOR INSERT
AS
BEGIN
    INSERT INTO controlCambios (usuario, fecha, datoanterior, datonuevo)
    SELECT SYSTEM_USER, GETDATE(), NULL, i.documento
    FROM inserted i;
END;
GO
