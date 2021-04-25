USE heroku_0c282ad41a365e8;

CREATE TABLE Myguests (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
email VARCHAR(50)
);

CREATE TABLE productos (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'disponible',
    precio FLOAT NOT NULL DEFAULT 0.0,
    PRIMARY KEY(id)
);

INSERT INTO productos (nombre, estado, precio) VALUES ('Producto A','disponible', 8), ('Producto B', 'disponible', 1.5),('Producto C', 'agotado', 80);

DELIMITER $$
CREATE PROCEDURE obtenerProductosPorEstado(IN nombre_estado VARCHAR(255))
BEGIN
    SELECT * 
    FROM productos
    WHERE estado = nombre_estado;
END$$

CALL obtenerProductosPorEstado('disponible')