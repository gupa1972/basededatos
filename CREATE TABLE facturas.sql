CREATE TABLE
    facturas (
        id_factura INT (12) NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Fecha DATE NOT NULL,
        Cantidad INT (4) NOT NULL,
        IVA DECIMAL(4, 2) NOT NULL,
        Cod_cli INT (3) NOT NULL,
        Cod_produ INT (3) NOT NULL
        FOREIGN KEY (Cod_cli) REFERENCES cliente(id_cliente),
        FOREIGN KEY (Cod_produ) REFERENCES productos(id_producto)
    )
