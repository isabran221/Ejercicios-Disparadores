CREATE TRIGGER trg_libros_all_events
ON libros
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @event VARCHAR(10), @precio_anterior DECIMAL(10, 2), @precio_nuevo DECIMAL(10, 2);

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        SET @event = 'UPDATE';
        SELECT @precio_anterior = d.precio, @precio_nuevo = i.precio
        FROM inserted i
        JOIN deleted d ON i.codigo = d.codigo;
    END
    ELSE IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SET @event = 'INSERT';
        SELECT @precio_nuevo = precio FROM inserted;
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SET @event = 'DELETE';
        SELECT @precio_anterior = precio FROM deleted;
    END

    INSERT INTO control (usuario, fecha, codigo_libro, precio_anterior, precio_nuevo)
    SELECT SYSTEM_USER, GETDATE(), i.codigo, @precio_anterior, @precio_nuevo
    FROM inserted i
    UNION ALL
    SELECT SYSTEM_USER, GETDATE(), d.codigo, @precio_anterior, @precio_nuevo
    FROM deleted d;
END;
