CREATE TABLE clientes(
    id_cliente INT(3) NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Domicilio VARCHAR(100) NOT NULL,
    Telefono INT(11),
    PRIMARY KEY(id_cliente)
)