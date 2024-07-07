-- Insertar un nuevo libro
INSERT INTO libros VALUES (150, 'Nuevo Libro', 'Nuevo Autor', 'Nueva Editorial', 45);

-- Eliminar un libro
DELETE FROM libros WHERE codigo = 103;

-- Actualizar el precio de un libro
UPDATE libros SET precio = 40 WHERE codigo = 105;

-- Verificar el contenido de la tabla control
SELECT * FROM control;
