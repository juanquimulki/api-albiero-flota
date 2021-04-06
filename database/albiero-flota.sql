-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2021 a las 15:56:00
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
(2, 2, 'Reportes', NULL, 0),
(3, 3, 'Usuarios', NULL, 0),
(4, 1, 'Choferes', '/archivos/choferes', 1),
(5, 2, 'Vehículos', '/archivos/vehiculos', 1),
(6, 1, 'Vencimiento de Garantía', '/reportes/garantiafecha', 2),
(7, 1, 'Gestión de Usuarios', '/usuarios/usuarios', 3);

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
(24, 'jmulki', 4),
(25, 'jmulki', 6),
(26, 'jmulki', 7),
(27, 'otro', 4),
(28, 'otro', 5),
(29, 'otro', 6),
(30, 'otro', 7);

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
(1, 'jmulki', 'Juan M. Mulki A.', '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL),
(56, 'otro', 'prueba', '81dc9bdb52d04dc20036dbd8313ed055', '2021-04-05 21:53:43', '2021-04-05 21:53:43', NULL),
(57, 'prueba', 'viendo', '81dc9bdb52d04dc20036dbd8313ed055', '2021-04-05 21:55:00', '2021-04-05 21:55:00', NULL),
(58, 'hello', 'otra', '81dc9bdb52d04dc20036dbd8313ed055', '2021-04-05 21:55:43', '2021-04-05 21:55:43', NULL),
(59, 'tetertet', 'tertert', '81dc9bdb52d04dc20036dbd8313ed055', '2021-04-06 13:47:45', '2021-04-06 13:47:58', '2021-04-06 13:47:58');

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
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
