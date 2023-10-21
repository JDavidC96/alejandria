-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2023 a las 22:06:51
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
-- Base de datos: `database_alejandria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `autor_id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`autor_id`, `nombre`, `fecha_nacimiento`, `nacionalidad`) VALUES
(1, 'George Orwell', '1903-06-25', 'Hindu'),
(2, 'Carlos Ruiz Zafon', '1964-09-25', 'Español'),
(3, 'J. K Rowling', '1965-07-31', 'Britanica'),
(4, 'Pablo Cohelo', '1947-08-24', 'Brasileño'),
(5, 'Gabriel Garcia Marquez', '1927-03-06', 'Mexicano'),
(6, 'Frans Kafka', '1883-07-03', 'Austriaco'),
(7, 'George R.R Martin', '1946-10-20', 'Estadounidense'),
(8, 'John Green', '1977-08-24', 'Estadounidense');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `genero_id` int(11) NOT NULL,
  `nombre_genero` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `libro_id` int(11) NOT NULL,
  `titulo` text DEFAULT NULL,
  `anio_publicacion` year(4) DEFAULT NULL,
  `genero_id` int(11) NOT NULL DEFAULT 0,
  `disponible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`libro_id`, `titulo`, `anio_publicacion`, `genero_id`, `disponible`) VALUES
(1, 'Las sombras del viento', '2001', 1, 1),
(2, 'Harry Potter y la piedra filosofal', '1997', 2, 0),
(3, '1984', '1964', 3, 1),
(4, 'El alquimista', '1988', 1, 1),
(5, 'Cien años de Soledad', '1967', 5, 0),
(6, 'La metamorfosis', '1915', 2, 1),
(7, 'Cancion de hielo y fuego', '1996', 2, 0),
(8, 'Bajo la misma estrella', '2012', 4, 0),
(9, 'El caballero errante', '2014', 2, 1),
(10, 'Rebelion en la granja', '1945', 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `prestamo_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  `genero_id` int(11) NOT NULL,
  `autor_id` int(11) NOT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `devuelto` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`prestamo_id`, `usuario_id`, `libro_id`, `genero_id`, `autor_id`, `fecha_prestamo`, `fecha_devolucion`, `devuelto`) VALUES
(1, 3, 2, 2, 3, '2023-09-25', '2023-10-21 16:53:21', 0),
(2, 2, 5, 5, 5, '2023-10-11', '2023-10-21 16:53:21', 0),
(3, 1, 7, 2, 7, '2023-10-20', '2023-10-21 16:53:21', 0),
(4, 5, 8, 4, 8, '2023-09-30', '2023-10-21 16:53:21', 0),
(5, 4, 10, 3, 1, '2023-06-30', '2023-10-21 16:53:21', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `dias_para_devolver` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `nombre`, `email`, `dias_para_devolver`) VALUES
(1, 'Luisa Maria', 'luisa@correo.com', 0),
(2, 'Pedro Valderrama', 'pedrama@correo.com', 0),
(3, 'Fernando Gloom', 'fernando@correo.com', 0),
(4, 'Carlos Arroyave', 'Carlos@correo.com', 0),
(5, 'Valentina Lopez', 'valentina.lopez@correo.com', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`autor_id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`genero_id`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`libro_id`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`prestamo_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `autor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `genero_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `libro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `prestamo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
