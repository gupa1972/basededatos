-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-04-2024 a las 20:21:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `Id_Categoria` int(3) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Cuit_Cli` int(12) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `Numero` varchar(50) NOT NULL,
  `Comuna` varchar(50) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Telefono` int(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_Producto` int(3) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Precio_actual` decimal(10,2) NOT NULL,
  `Numero` varchar(50) NOT NULL,
  `Stock` int(3) NOT NULL,
  `FKCuitProv` int(12) NOT NULL,
  `FKId_Categ` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `Cuit_Prov` int(12) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `Numero` varchar(50) NOT NULL,
  `Comuna` varchar(50) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Telefono` int(13) DEFAULT NULL,
  `Pagina_Web` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `Nro_Factura` int(13) NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` int(5) NOT NULL,
  `Descuento` decimal(10,2) NOT NULL,
  `Monto_Final` decimal(10,2) NOT NULL,
  `FKId_Producto` int(3) NOT NULL,
  `FKCuit_Cli` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Cuit_Cli`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_Producto`),
  ADD KEY `FKCuitProv` (`FKCuitProv`),
  ADD KEY `FKId_Categ` (`FKId_Categ`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Cuit_Prov`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`Nro_Factura`),
  ADD KEY `FKId_Producto` (`FKId_Producto`),
  ADD KEY `FKCuit_Cli` (`FKCuit_Cli`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `Id_Categoria` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Cuit_Cli` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Id_Producto` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `Cuit_Prov` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `Nro_Factura` int(13) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`FKCuitProv`) REFERENCES `proveedores` (`Cuit_Prov`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`FKId_Categ`) REFERENCES `categorias` (`Id_Categoria`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`FKId_Producto`) REFERENCES `productos` (`Id_Producto`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`FKCuit_Cli`) REFERENCES `clientes` (`Cuit_Cli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
