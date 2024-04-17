CREATE TABLE proveedores(
    Cuit_Prov INT(12) NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Calle VARCHAR(50) NOT NULL,
    Numero VARCHAR(50) NOT NULL,
    Comuna VARCHAR(50) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    Telefono INT(13) NULL,
    Pagina_Web INT(30) NULL,
    PRIMARY KEY(Cuit_Prov)
)