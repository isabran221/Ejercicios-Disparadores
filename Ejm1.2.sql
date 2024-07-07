CREATE TRIGGER trg_amigos_insert
ON amigos
AFTER INSERT
AS
BEGIN
    INSERT INTO amigoscopia (id_amigo, nombre)
    SELECT id_amigo, nombre FROM inserted;
END;
