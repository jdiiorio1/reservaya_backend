-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2023 a las 08:43:16
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reserva_ya`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aficionado`
--

CREATE TABLE `aficionado` (
  `id` int(11) NOT NULL,
  `equipo` varchar(255) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aficionado`
--

INSERT INTO `aficionado` (`id`, `equipo`, `usuario_id`) VALUES
(4, 'Boca Jr', 7),
(5, 'River Plate', 8),
(6, 'Boca Jr', 11),
(7, 'Boca Jr', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancha`
--

CREATE TABLE `cancha` (
  `id` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `techado` tinyint(4) NOT NULL,
  `complejo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `complejo`
--

CREATE TABLE `complejo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `dirreccion_id` int(11) DEFAULT NULL,
  `propietario_id` int(11) DEFAULT NULL,
  `horaInicio` time DEFAULT NULL,
  `horaFin` time DEFAULT NULL,
  `cantidadCanchas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dirreccion`
--

CREATE TABLE `dirreccion` (
  `id` int(11) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `localidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id` int(11) NOT NULL,
  `codigoPostal` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `provincia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `id` int(11) NOT NULL,
  `cuil` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`id`, `cuil`, `usuario_id`) VALUES
(1, 2041564295, 9),
(2, 2147483647, 10),
(3, 2041564259, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `propietario` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo_electronico`, `contrasena`, `propietario`) VALUES
(7, 'Enzo', 'enzo@gmail.com', '12345678', 0),
(8, 'Jorge', 'jorge@gmail.com', '12345678', 0),
(9, 'Propietario 1', 'propietario1@gmail.com', '12345678', 1),
(10, 'luis', 'luis@gmail.com', '12345678', 1),
(11, 'Martin', 'martin@gmail.com', '12345678', 0),
(12, 'enzo', 'enzo1@gmail.com', '12345678', 1),
(13, 'aficionado', 'aficionado@gmail.com', '123456789', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aficionado`
--
ALTER TABLE `aficionado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `cancha`
--
ALTER TABLE `cancha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complejo_id` (`complejo_id`);

--
-- Indices de la tabla `complejo`
--
ALTER TABLE `complejo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dirreccion_id` (`dirreccion_id`),
  ADD KEY `propietario_id` (`propietario_id`);

--
-- Indices de la tabla `dirreccion`
--
ALTER TABLE `dirreccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `localidad_id` (`localidad_id`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aficionado`
--
ALTER TABLE `aficionado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cancha`
--
ALTER TABLE `cancha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `complejo`
--
ALTER TABLE `complejo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dirreccion`
--
ALTER TABLE `dirreccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aficionado`
--
ALTER TABLE `aficionado`
  ADD CONSTRAINT `aficionado_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `cancha`
--
ALTER TABLE `cancha`
  ADD CONSTRAINT `cancha_ibfk_1` FOREIGN KEY (`complejo_id`) REFERENCES `complejo` (`id`);

--
-- Filtros para la tabla `complejo`
--
ALTER TABLE `complejo`
  ADD CONSTRAINT `complejo_ibfk_1` FOREIGN KEY (`dirreccion_id`) REFERENCES `dirreccion` (`id`),
  ADD CONSTRAINT `complejo_ibfk_2` FOREIGN KEY (`propietario_id`) REFERENCES `propietario` (`id`);

--
-- Filtros para la tabla `dirreccion`
--
ALTER TABLE `dirreccion`
  ADD CONSTRAINT `dirreccion_ibfk_1` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`);

--
-- Filtros para la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD CONSTRAINT `propietario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


----------------
---- ACTUALIZACION DE TABLA COMPLEJOS CON CAMPOS LATITUD Y LONGITUD (SE PUEDE CAMBIAR DESPUES SI LOS TIPOS DE DATOS NO SON CORRECTOS)
----------------

ALTER TABLE reserva_ya.complejo
ADD latitud  decimal(8,5) DEFAULT NULL,
Add longitud decimal(8,5) DEFAULT NULL;

insert into reserva_ya.complejo (id, nombre, latitud, longitud) VALUES (1,"Complejo Deportivo La Plata", -34.90816, -57.91680);

insert into reserva_ya.complejo (id, nombre, latitud, longitud) VALUES (2,"Cancha de 5", -34.92565, -57.97683);

insert into reserva_ya.complejo (id, nombre, latitud, longitud) VALUES (3,"PapiFutbol don Pepe", -34.92210, -57.97086);

insert into reserva_ya.complejo (id, nombre, latitud, longitud) VALUES (4,"la cancha de la gente", -34.92125, -57.93928);

insert into reserva_ya.complejo (id, nombre, latitud, longitud) VALUES (5,"Club Social y deportivo", -34.90960, -57.91693);
----------------------

