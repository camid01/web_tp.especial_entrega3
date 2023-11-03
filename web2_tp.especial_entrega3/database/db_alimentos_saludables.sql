-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-11-2023 a las 20:02:50
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
-- Base de datos: `db_alimentos_saludables`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Dirección` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `Nombre`, `Dirección`) VALUES
(1, 'Camila', 'Tandil'),
(2, 'Noelia', 'Tandil'),
(3, 'Carlitos', 'Azul'),
(4, 'Sabrina', 'Balcarse'),
(5, 'Matias', 'La Dulce'),
(6, 'webadmin', 'Tandil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_usuario` int(11) NOT NULL,
  `Destino` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Detalle` varchar(45) NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_usuario`, `Destino`, `Detalle`, `Total`) VALUES
(1, 'Tandil', '1kg cookies de manzana', 2000),
(2, 'Tandil', '1kg milanesas de soja, 1kg cookies', 5300),
(3, 'Azul', '1kg milanesas de berenjena, 1kg lentejas', 4120),
(4, 'Balcarse', '1kg frutos secos, 1kg lentejas', 3000),
(5, 'La dulce', '1kg chips de banana, 1kg milanesas de berenje', 4700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `password`) VALUES
(1, 'exa.unicen@gmail.com', '$2y$10$yQutn1aenkPc7yMAXIkvAuARqlvbT9fMd1wxglvro/aiYhzbniSoe'),
(4, 'durecamila01@gmail.com', '$2y$10$nEdPYQQj7DrHEAWogxA5pe2f.3WO43WS/L0a0sLvbsZrmMGVsCjSC'),
(5, 'elporo_vad@hotmail.es', '$2y$10$prGI6LCsOa8f8RNhLyEdgeXGs/Cx.P.cCWcxOy4jeUbHLdu8xVUaG'),
(6, 'melinamagdalena@live.com', '$2y$10$gJ2dWEUgvbDMj0e2Ib/4Euvut28RCuRb.PjLfDOn1SSMozpFS2Gb2'),
(7, 'cami23335@gmail.com', '$2y$10$.g02yJXNJ8UgjJKfNjzXhugET2AppjxWzKEoLuD1.QbvYxsgBuf6S'),
(8, 'hola@gmail.com', '$2y$10$JhMlYURLuJoLk/gG1nbQPePUfgek0H2QwZhtQ4dN8wxb9uvDdahWS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `compra_id_usuario_usuario` FOREIGN KEY (`id`) REFERENCES `compras` (`id_usuario`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `clientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
