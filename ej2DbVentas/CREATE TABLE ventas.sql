CREATE TABLE ventas(
    Nro_Factura INT(13) NOT NULL AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Cantidad INT (5) NOT NULL,
    Descuento DECIMAL(10,2) NOT NULL,
    Monto_Final DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(Nro_Factura),
    FKId_Producto INT(3) NOT NULL,
    FKCuit_Cli INT(12) NOT NULL,
    FOREIGN KEY(FKId_Producto) REFERENCES productos(Id_Producto),
    FOREIGN KEY(FKCuit_Cli) REFERENCES clientes(Cuit_Cli))