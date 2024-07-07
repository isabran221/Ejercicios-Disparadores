CREATE TABLE libros (
    codigo INT PRIMARY KEY,
    titulo VARCHAR(50),
    autor VARCHAR(50),
    editorial VARCHAR(50),
    precio DECIMAL(10, 2)
);

CREATE TABLE control (
    usuario VARCHAR(50),
    fecha DATETIME,
    codigo_libro INT,
    precio_anterior DECIMAL(10, 2),
    precio_nuevo DECIMAL(10, 2)
);
