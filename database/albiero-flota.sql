-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2021 a las 00:57:44
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `albiero-flota`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choferes`
--

CREATE TABLE `choferes` (
  `id` int(11) NOT NULL,
  `apenom` varchar(50) NOT NULL,
  `abrev` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `choferes`
--

INSERT INTO `choferes` (`id`, `apenom`, `abrev`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Juan Mulki', 'jmulki', NULL, '2021-04-20 18:27:36', '2021-04-20 18:27:36'),
(2, 'Mulki Juanqui', 'jm_mas', NULL, '2021-04-20 18:27:39', '2021-04-20 18:27:39'),
(3, 'Prueba de Nombre', 'pnom', '2021-04-07 20:56:00', '2021-04-07 20:59:01', '2021-04-07 20:59:01'),
(4, 'Chofer número uno', 'chofer1', '2021-04-20 18:39:17', '2021-04-20 18:39:45', '2021-04-20 18:39:45'),
(5, 'Juan Carlos Perez', 'jperez', '2021-04-20 18:39:29', '2021-04-20 18:39:29', NULL),
(6, 'Otro Chofer', 'ocho', '2021-04-22 18:41:15', '2021-04-22 18:41:15', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `combustible_tipos`
--

CREATE TABLE `combustible_tipos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `combustible_tipos`
--

INSERT INTO `combustible_tipos` (`id`, `tipo`) VALUES
(1, 'Nafta'),
(2, 'Diesel'),
(3, 'GNC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kilometraje`
--

CREATE TABLE `kilometraje` (
  `id` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `kilometros` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `kilometraje`
--

INSERT INTO `kilometraje` (`id`, `id_vehiculo`, `fecha_hora`, `kilometros`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, '2021-05-13 23:02:00', 12345, NULL, NULL, NULL),
(3, 8, '2021-04-01 12:18:00', 321899, '2021-04-27 14:23:40', '2021-04-27 14:24:13', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `operation` varchar(5) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `user`, `operation`, `date`) VALUES
(1, 'jmulki', 'IN', '2021-04-21 06:21:05'),
(2, 'jmulki', 'IN', '2021-04-21 18:22:16'),
(3, 'jmulki', 'OUT', '2021-04-21 18:24:36'),
(4, 'jmulki', 'IN', '2021-04-22 18:22:03'),
(5, 'jmulki', 'IN', '2021-04-23 14:36:16'),
(6, 'jmulki', 'IN', '2021-04-23 17:40:53'),
(7, 'jmulki', 'OUT', '2021-04-23 17:44:41'),
(8, 'jmulki', 'IN', '2021-04-23 17:44:45'),
(9, 'jmulki', 'OUT', '2021-04-23 17:45:51'),
(10, 'jmulki', 'IN', '2021-04-23 17:45:58'),
(11, 'jmulki', 'OUT', '2021-04-23 17:52:41'),
(12, 'jmulki', 'IN', '2021-04-23 17:52:45'),
(13, 'jmulki', 'OUT', '2021-04-23 19:00:33'),
(14, 'jmulki', 'IN', '2021-04-23 19:00:37'),
(15, 'jmulki', 'IN', '2021-04-27 13:49:23'),
(16, 'jmulki', 'IN', '2021-04-27 22:24:12'),
(17, 'jmulki', 'OUT', '2021-04-27 22:31:25'),
(18, 'jmulki', 'IN', '2021-04-27 22:31:29'),
(19, 'jmulki', 'OUT', '2021-04-27 22:45:57'),
(20, 'jmulki', 'IN', '2021-04-27 22:46:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `label` varchar(40) NOT NULL,
  `link` varchar(50) DEFAULT NULL,
  `parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `order`, `label`, `link`, `parent`) VALUES
(1, 1, 'Archivos', NULL, 0),
(2, 3, 'Reportes', NULL, 0),
(3, 4, 'Usuarios', NULL, 0),
(4, 1, 'Choferes', '/archivos/choferes', 1),
(5, 2, 'Vehículos', '/archivos/vehiculos', 1),
(6, 2, 'Vencimientos de Garantía (Fecha)', '/reportes/garantiafecha', 2),
(7, 1, 'Gestión de Usuarios', '/usuarios/usuarios', 3),
(8, 1, 'Mi Flota', '/reportes/flota', 2),
(9, 2, 'Vehículos', NULL, 0),
(10, 1, 'Kilometraje', '/vehiculos/kilometraje', 9),
(11, 2, 'Partes', '/vehiculos/partes', 9),
(12, 3, 'Tareas', '/vehiculos/tareas', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partes`
--

CREATE TABLE `partes` (
  `id` int(11) NOT NULL,
  `parte` varchar(40) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `partes`
--

INSERT INTO `partes` (`id`, `parte`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'una parte', '2021-04-27 22:42:24', '2021-04-27 22:42:24', NULL),
(3, 'un trabajo', '2021-04-27 22:42:39', '2021-04-27 22:42:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `id_opcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `user`, `id_opcion`) VALUES
(37, 'jmulki', 4),
(38, 'jmulki', 5),
(39, 'jmulki', 8),
(40, 'jmulki', 6),
(41, 'jmulki', 7),
(42, 'balbiero', 4),
(43, 'balbiero', 5),
(44, 'balbiero', 8),
(45, 'balbiero', 6),
(46, 'balbiero', 7),
(47, 'jmulki', 10),
(48, 'jmulki', 11),
(49, 'jmulki', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `tarea` varchar(30) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `tarea`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'tarea uno uno', '2021-04-27 22:55:22', '2021-04-27 22:55:40', NULL),
(3, 'cambiar', '2021-04-27 22:55:30', '2021-04-27 22:55:30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pass` varchar(80) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `name`, `pass`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'jmulki', 'Juan M. Mulki A.', '022617a2a7b9314727853c874b65258a', NULL, '2021-04-08 19:57:03', NULL),
(56, 'otro', 'prueba', '81dc9bdb52d04dc20036dbd8313ed055', '2021-04-05 21:53:43', '2021-04-20 18:28:16', '2021-04-20 18:28:16'),
(57, 'prueba', 'viendo', '81dc9bdb52d04dc20036dbd8313ed055', '2021-04-05 21:55:00', '2021-04-20 18:28:19', '2021-04-20 18:28:19'),
(58, 'hello', 'otra', '81dc9bdb52d04dc20036dbd8313ed055', '2021-04-05 21:55:43', '2021-04-20 18:28:22', '2021-04-20 18:28:22'),
(59, 'tetertet', 'tertert', '81dc9bdb52d04dc20036dbd8313ed055', '2021-04-06 13:47:45', '2021-04-06 13:47:58', '2021-04-06 13:47:58'),
(60, 'balbiero', 'Belén Albiero', '81dc9bdb52d04dc20036dbd8313ed055', '2021-04-20 18:35:06', '2021-04-20 18:35:06', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `alias` varchar(30) DEFAULT NULL,
  `patente` varchar(7) NOT NULL,
  `id_tipo_comb` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `id_chofer` int(11) DEFAULT NULL,
  `fecha_venc_gtia` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `id_tipo`, `descripcion`, `alias`, `patente`, `id_tipo_comb`, `anio`, `id_chofer`, `fecha_venc_gtia`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Volkswagen Gol 1.4', 'Auto de Pablo', 'LXG764', NULL, 2012, 1, '2021-04-13', NULL, '2021-04-14 21:48:55', '2021-04-14 21:48:55'),
(3, 4, 'utilitarios', 'de martin capo', 'LL123XG', NULL, 2013, 2, '2021-04-17', '2021-04-14 21:47:44', '2021-04-20 18:27:56', '2021-04-20 18:27:56'),
(4, 3, 'Amarok VW', 'camioneta', 'NFC211', NULL, 2015, 1, '2021-05-06', '2021-04-15 23:13:38', '2021-04-20 18:27:58', '2021-04-20 18:27:58'),
(5, 5, 'decrip', 'ali', 'LJH567', NULL, 2015, 1, '2021-03-01', '2021-04-17 23:34:15', '2021-04-20 18:28:01', '2021-04-20 18:28:01'),
(6, 1, 'erty', '5656', 'LXG764D', NULL, 345666, 2, '2021-03-31', '2021-04-18 01:54:50', '2021-04-20 18:28:04', '2021-04-20 18:28:04'),
(7, 2, 'Yamaha', 'Moto de Juan', 'LXG764', 1, 2020, 5, '2021-05-06', '2021-04-20 18:40:54', '2021-04-23 14:48:27', NULL),
(8, 5, 'Otro', 'Otro', 'LXG768', 3, 2030, 6, '2020-04-30', '2021-04-23 14:49:29', '2021-04-23 14:49:29', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos_tipos`
--

CREATE TABLE `vehiculos_tipos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculos_tipos`
--

INSERT INTO `vehiculos_tipos` (`id`, `tipo`) VALUES
(1, 'Moto'),
(2, 'Auto'),
(3, 'Camioneta'),
(4, 'Utilitario'),
(5, 'Otro');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_menu_menues`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_menu_menues` (
`id` int(11)
,`order` int(11)
,`label` varchar(40)
,`link` varchar(50)
,`parent` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_menu_opciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_menu_opciones` (
`id_menu` int(11)
,`id_opcion` int(11)
,`menu` varchar(40)
,`opcion` varchar(40)
,`link` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_menu_menues`
--
DROP TABLE IF EXISTS `vw_menu_menues`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_menu_menues`  AS  select `menu`.`id` AS `id`,`menu`.`order` AS `order`,`menu`.`label` AS `label`,`menu`.`link` AS `link`,`menu`.`parent` AS `parent` from `menu` where `menu`.`parent` = 0 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_menu_opciones`
--
DROP TABLE IF EXISTS `vw_menu_opciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_menu_opciones`  AS  select `vw_menu_menues`.`id` AS `id_menu`,`menu`.`id` AS `id_opcion`,`vw_menu_menues`.`label` AS `menu`,`menu`.`label` AS `opcion`,`menu`.`link` AS `link` from (`vw_menu_menues` join `menu` on(`vw_menu_menues`.`id` = `menu`.`parent`)) order by `vw_menu_menues`.`order`,`menu`.`order` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `choferes`
--
ALTER TABLE `choferes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `combustible_tipos`
--
ALTER TABLE `combustible_tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `kilometraje`
--
ALTER TABLE `kilometraje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_kilometraje_vehiculos_id` (`id_vehiculo`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `partes`
--
ALTER TABLE `partes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_vehiculos_choferes_id` (`id_chofer`),
  ADD KEY `FK_vehiculos_vehiculos_tipos_id` (`id_tipo`),
  ADD KEY `FK_vehiculos_combustible_tipos_id` (`id_tipo_comb`);

--
-- Indices de la tabla `vehiculos_tipos`
--
ALTER TABLE `vehiculos_tipos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `choferes`
--
ALTER TABLE `choferes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `combustible_tipos`
--
ALTER TABLE `combustible_tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `kilometraje`
--
ALTER TABLE `kilometraje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `partes`
--
ALTER TABLE `partes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `vehiculos_tipos`
--
ALTER TABLE `vehiculos_tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `kilometraje`
--
ALTER TABLE `kilometraje`
  ADD CONSTRAINT `FK_kilometraje_vehiculos_id` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `FK_vehiculos_choferes_id` FOREIGN KEY (`id_chofer`) REFERENCES `choferes` (`id`),
  ADD CONSTRAINT `FK_vehiculos_combustible_tipos_id` FOREIGN KEY (`id_tipo_comb`) REFERENCES `combustible_tipos` (`id`),
  ADD CONSTRAINT `FK_vehiculos_vehiculos_tipos_id` FOREIGN KEY (`id_tipo`) REFERENCES `vehiculos_tipos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
