CREATE TABLE productos(
    Id_Producto INT(3) NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Precio_actual decimal (10,2) NOT NULL,
    Numero VARCHAR(50) NOT NULL,
    Stock INT(3) NOT NULL,
    PRIMARY KEY(Id_Producto),
    FKCuitProv INT(12) NOT NULL,
    FKId_Categ INT(3) NOT NULL,
    FOREIGN KEY(FKCuitProv) REFERENCES proveedores(Cuit_Prov),
    FOREIGN KEY(FKId_Categ) REFERENCES categorias(Id_Categoria))