-- Crear la tabla empleados
CREATE TABLE empleados (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(50),
    seccion VARCHAR(20)
);
GO

-- Crear la tabla controlCambios
CREATE TABLE controlCambios (
    usuario VARCHAR(50),
    fecha DATETIME,
    datoanterior VARCHAR(50),
    datonuevo VARCHAR(50)
);
GO

-- Crear el disparador para actualizaciones en empleados
CREATE TRIGGER trg_empleados_update
ON empleados
FOR UPDATE
AS
BEGIN
    INSERT INTO controlCambios (usuario, fecha, datoanterior, datonuevo)
    SELECT SYSTEM_USER, GETDATE(), d.nombre, i.nombre
    FROM inserted i
    JOIN deleted d ON i.documento = d.documento;
END;
GO
