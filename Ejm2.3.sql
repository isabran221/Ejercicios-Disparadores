CREATE TRIGGER trg_update_precio_libros
ON libros
FOR UPDATE
AS
BEGIN
    IF UPDATE(precio)
    BEGIN
        INSERT INTO control (usuario, fecha, codigo_libro, precio_anterior, precio_nuevo)
        SELECT SYSTEM_USER, GETDATE(), i.codigo, d.precio, i.precio
        FROM inserted i
        JOIN deleted d ON i.codigo = d.codigo;
    END
END;
