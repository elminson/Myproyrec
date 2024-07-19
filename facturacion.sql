-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-07-2024 a las 07:11:37
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
-- Base de datos: `facturacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nit` int(11) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `dataadd` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nit`, `nombre`, `telefono`, `direccion`, `dataadd`, `usuario_id`, `estatus`) VALUES
(1, 12344, 'Dalex Perex', 1838377, 'Calle 20 ', '2024-07-12 00:13:10', 1, 1),
(2, 0, 'jose vasquez', 35666666, 'santiago', '2024-07-12 01:28:21', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `correlativo` bigint(11) NOT NULL,
  `nofactura` bigint(11) DEFAULT NULL,
  `codproducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `preciototal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `correlativo` int(11) NOT NULL,
  `nofactura` bigint(11) NOT NULL,
  `codproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `preciototal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `correlativo` int(11) NOT NULL,
  `codproducto` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `nofactura` bigint(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `codcliente` int(11) DEFAULT NULL,
  `totaltactura` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codproducto` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `proveedor` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `foto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `codproveedor` int(11) NOT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` bigint(11) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`codproveedor`, `proveedor`, `contacto`, `telefono`, `direccion`, `date_add`, `usuario_id`, `estatus`) VALUES
(1, 'BIC', 'Claudia Rosales', 789877889, 'Avenida las Americas', '2024-07-14 23:55:07', 0, 1),
(2, 'CASIO', 'Jorge Herrera', 565656565656, 'Calzada Las Flores', '2024-07-14 23:55:07', 0, 1),
(3, 'Omega', 'Julio Estrada', 982877489, 'Avenida Elena Zona 4, Guatemala', '2024-07-14 23:55:07', 0, 1),
(4, 'Dell Compani', 'Roberto Estrada', 2147483647, 'Guatemala, Guatemala', '2024-07-14 23:55:07', 0, 1),
(5, 'Olimpia S.A', 'Elena Franco Morales', 564535676, '5ta. Avenida Zona 4 Ciudad', '2024-07-14 23:55:07', 0, 1),
(6, 'Oster', 'Fernando Guerra', 78987678, 'Calzada La Paz, Guatemala', '2024-07-14 23:55:07', 0, 1),
(7, 'ACELTECSA S.A', 'Ruben PÃ©rez', 789879889, 'Colonia las Victorias', '2024-07-14 23:55:07', 0, 1),
(8, 'Sony', 'Julieta Contreras', 89476787, 'Antigua Guatemala', '2024-07-14 23:55:07', 0, 1),
(9, 'VAIO', 'Felix Arnoldo Rojas', 476378276, 'Avenida las Americas Zona 13', '2024-07-14 23:55:07', 0, 1),
(10, 'SUMAR', 'Oscar Maldonado', 788376787, 'Colonia San Jose, Zona 5 Guatemala', '2024-07-14 23:55:07', 0, 1),
(11, 'HP', 'Angel Cardona', 2147483647, '5ta. calle zona 4 Guatemala', '2024-07-14 23:55:07', 0, 1),
(12, 'Dali', '', 8296732402, 'Calle primera,Los Jardinez ,Santiago', '2024-07-15 12:10:59', 1, 1),
(13, 'Da', '', 8933333, 'Molina Sosa', '2024-07-15 12:20:48', 1, 1),
(14, 'Dali', '', 456666, 'santos Gutier', '2024-07-15 12:23:29', 1, 1),
(15, 'MG', '', 5677, 'Los rieles', '2024-07-15 12:24:04', 1, 1),
(16, 'corl', '', 2355, 'Azua', '2024-07-15 14:49:04', 1, 1),
(17, 'Daslex', '', 5678, 'Guazumal', '2024-07-15 15:00:37', 1, 1),
(18, 'Dali', '', 45678, 'Sosua', '2024-07-15 19:16:44', 1, 1),
(19, 'Dali', '', 5678, 'santos Gutier', '2024-07-15 19:17:34', 1, 1),
(20, 'AMIR', 'Santana Baldia', 1234, 'Calle 20', '2024-07-16 00:09:31', 1, 1),
(21, 'Gm', 'Santo Rodriguez', 12334, 'Vargas', '2024-07-17 17:09:03', 1, 1),
(22, 'BV', 'Pilar Medina', 323444, 'Calle 2o', '2024-07-17 17:09:37', 1, 1),
(23, 'BA', 'Larry Gomez', 577777, 'calle 30', '2024-07-17 17:11:39', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `rol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Supervisor'),
(3, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `usuario` varchar(15) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`, `rol`, `estatus`) VALUES
(1, 'Danny', 'dannyrafael9@gmail.com', 'admin', '202cb962ac59075b964b07152d234b70', 1, 1),
(2, 'Angel perez sanchez', 'angelrafael9@gmail.com', 'f4f068e71e0d87b', '202cb962ac59075b964b07152d234b70', 1, 1),
(3, 'Jesus Perez', 'jesusperez@gmail.com', '110d46fcd978c24', '123', 3, 1),
(4, 'miha ho', 'migye@gmail.com', 'mig', '202cb962ac59075b964b07152d234b70', 2, 1),
(5, 'jose vasquez', 'josevasuqezl@gmail.com', 'jose p', '202cb962ac59075b964b07152d234b70', 1, 0),
(8, 'jesu alva', 'jesusl@gmail.com', 'jesua', '202cb962ac59075b964b07152d234b70', 2, 0),
(9, 'Rick Gomez', 'Rickl@gmail.com', 'Rick', '202cb962ac59075b964b07152d234b70', 3, 1),
(10, 'Carlos Gomez', 'carlos@gmail.com', 'carlos', '202cb962ac59075b964b07152d234b70', 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `usuario_id_2` (`usuario_id`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`correlativo`),
  ADD KEY `codproducto` (`codproducto`),
  ADD KEY `nofactura` (`nofactura`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`correlativo`),
  ADD KEY `nofactura` (`nofactura`),
  ADD KEY `codproducto` (`codproducto`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`correlativo`),
  ADD KEY `codproducto` (`codproducto`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`nofactura`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `codcliente` (`codcliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codproducto`),
  ADD KEY `proveedor` (`proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`codproveedor`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `rol` (`rol`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idusuario_2` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `correlativo` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `correlativo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `correlativo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `nofactura` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codproducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `codproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `detallefactura_ibfk_1` FOREIGN KEY (`nofactura`) REFERENCES `factura` (`nofactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detallefactura_ibfk_2` FOREIGN KEY (`codproducto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`nofactura`) REFERENCES `factura` (`nofactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_temp_ibfk_2` FOREIGN KEY (`codproducto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`codproducto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`codcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`codproveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
