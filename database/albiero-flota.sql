-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2021 a las 18:27:40
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
-- Estructura de tabla para la tabla `correctivo`
--

CREATE TABLE `correctivo` (
  `id` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_parte` int(11) NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `detalles` text DEFAULT NULL,
  `fecha` date NOT NULL,
  `kilometros` int(11) NOT NULL,
  `cumplimentado` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `correctivo`
--

INSERT INTO `correctivo` (`id`, `id_vehiculo`, `id_parte`, `id_tarea`, `detalles`, `fecha`, `kilometros`, `cumplimentado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 4, 3, 'se rompio el asdasdads asdfsadf', '2021-05-07', 123455, NULL, '2021-05-20 21:20:18', '2021-05-20 21:21:09', '2021-05-20 21:21:09'),
(2, 10, 3, 1, 'se rompio la moto', '2021-05-21', 123123, 0, '2021-05-20 21:21:05', '2021-05-22 16:18:20', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correctivo_tareas`
--

CREATE TABLE `correctivo_tareas` (
  `id` int(11) NOT NULL,
  `id_correctivo` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `kilometros` int(11) NOT NULL,
  `detalles` text DEFAULT NULL,
  `cumplimentado` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `correctivo_tareas`
--

INSERT INTO `correctivo_tareas` (`id`, `id_correctivo`, `user`, `fecha`, `kilometros`, `detalles`, `cumplimentado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'jmulki', '2021-05-22', 123123, '123123 detalles', 1, '2021-05-22 16:14:42', '2021-05-22 16:14:42', '2021-05-22 16:14:42'),
(2, 2, 'jmulki', '2021-05-22', 33333, 'detalles de desestimación', 0, '2021-05-22 16:18:20', '2021-05-22 16:18:20', NULL);

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
(3, 8, '2021-04-01 12:18:00', 321899, '2021-04-27 14:23:40', '2021-04-27 14:24:13', NULL),
(4, 8, '2021-04-28 16:40:00', 456789, '2021-04-28 19:40:18', '2021-04-28 19:40:18', NULL),
(5, 7, '2021-04-28 16:40:00', 987654, '2021-04-28 19:40:41', '2021-04-28 19:40:41', NULL),
(6, 7, '2021-04-28 16:40:00', 654321, '2021-04-28 19:40:52', '2021-04-28 19:40:52', NULL),
(7, 7, '2021-04-28 16:40:00', 654654, '2021-04-28 19:41:00', '2021-04-28 19:41:00', NULL),
(8, 8, '2021-04-28 16:42:00', 1234234, '2021-04-28 19:42:19', '2021-04-28 19:42:19', NULL),
(10, 9, '2021-05-15 15:48:00', 100000, '2021-05-15 18:48:21', '2021-05-15 18:48:21', NULL),
(11, 7, '2021-05-15 15:48:00', 155000, '2021-05-15 18:48:31', '2021-05-16 02:23:48', NULL),
(12, 8, '2021-05-15 15:48:00', 50000, '2021-05-15 18:48:39', '2021-05-15 18:48:39', NULL),
(13, 10, '2021-05-20 18:56:00', 123500, '2021-05-20 21:56:59', '2021-05-20 21:56:59', NULL);

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
(20, 'jmulki', 'IN', '2021-04-27 22:46:37'),
(21, 'jmulki', 'IN', '2021-04-28 19:20:11'),
(22, 'Jmulki', 'IN', '2021-04-28 19:26:26'),
(23, 'jmulki', 'IN', '2021-04-29 13:52:20'),
(24, 'jmulki', 'OUT', '2021-04-29 13:53:05'),
(25, 'jmulki', 'IN', '2021-04-29 13:53:10'),
(26, 'jmulki', 'OUT', '2021-04-29 13:53:17'),
(27, 'jmulki', 'IN', '2021-04-29 13:54:12'),
(28, 'jmulki', 'OUT', '2021-04-29 13:54:20'),
(29, 'jmulki', 'IN', '2021-04-29 13:54:23'),
(30, 'jmulki', 'OUT', '2021-04-29 15:14:18'),
(31, 'jmulki', 'IN', '2021-04-29 15:14:22'),
(32, 'jmulki', 'IN', '2021-04-30 15:32:02'),
(33, 'jmulki', 'IN', '2021-04-30 15:54:06'),
(34, 'jmulki', 'IN', '2021-05-08 14:46:06'),
(35, 'jmulki', 'OUT', '2021-05-08 15:03:54'),
(36, 'jmulki', 'IN', '2021-05-08 15:03:59'),
(37, 'jmulki', 'OUT', '2021-05-08 15:06:32'),
(38, 'jmulki', 'IN', '2021-05-08 15:06:36'),
(39, 'jmulki', 'OUT', '2021-05-08 15:12:24'),
(40, 'jmulki', 'IN', '2021-05-08 15:12:27'),
(41, 'jmulki', 'IN', '2021-05-08 16:17:59'),
(42, 'Jmulki', 'IN', '2021-05-08 17:01:13'),
(43, 'jmulki', 'IN', '2021-05-08 17:18:25'),
(44, 'Jmulki', 'IN', '2021-05-08 17:36:44'),
(45, 'jmulki', 'IN', '2021-05-15 17:05:54'),
(46, 'jmulki', 'OUT', '2021-05-15 18:21:19'),
(47, 'jmulki', 'IN', '2021-05-15 18:21:24'),
(48, 'jmulki', 'OUT', '2021-05-15 18:24:47'),
(49, 'jmulki', 'IN', '2021-05-15 18:24:53'),
(50, 'jmulki', 'IN', '2021-05-16 00:07:20'),
(51, 'jmulki', 'OUT', '2021-05-16 01:08:45'),
(52, 'jmulki', 'IN', '2021-05-16 01:08:49'),
(53, 'jmulki', 'IN', '2021-05-16 02:11:03'),
(54, 'jmulki', 'IN', '2021-05-18 21:48:53'),
(55, 'jmulki', 'OUT', '2021-05-18 22:55:29'),
(56, 'jmulki', 'IN', '2021-05-18 22:55:33'),
(57, 'jmulki', 'OUT', '2021-05-18 23:58:47'),
(58, 'jmulki', 'IN', '2021-05-18 23:58:51'),
(59, 'jmulki', 'IN', '2021-05-19 23:02:34'),
(60, 'jmulki', 'OUT', '2021-05-19 23:46:20'),
(61, 'jmulki', 'IN', '2021-05-19 23:46:26'),
(62, 'jmulki', 'IN', '2021-05-20 00:14:05'),
(63, 'jmulki', 'IN', '2021-05-20 21:08:07'),
(64, 'jmulki', 'IN', '2021-05-22 15:42:50'),
(65, 'jmulki', 'OUT', '2021-05-22 16:27:27'),
(66, 'jmulki', 'IN', '2021-05-22 16:31:53'),
(67, 'jmulki', 'IN', '2021-05-24 14:03:56'),
(68, 'jmulki', 'OUT', '2021-05-24 14:52:44'),
(69, 'jmulki', 'IN', '2021-05-24 14:56:53'),
(70, 'jmulki', 'IN', '2021-05-24 16:02:56');

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
(2, 5, 'Reportes', NULL, 0),
(3, 6, 'Usuarios', NULL, 0),
(4, 1, 'Choferes', '/archivos/choferes', 1),
(5, 2, 'Vehículos', '/archivos/vehiculos', 1),
(6, 2, 'Vencimientos de Garantía', '/reportes/garantia', 2),
(7, 1, 'Gestión de Usuarios', '/usuarios/usuarios', 3),
(8, 1, 'Mi Flota', '/reportes/flota', 2),
(9, 2, 'Vehículos', NULL, 0),
(10, 2, 'Kilometraje', '/vehiculos/kilometraje', 9),
(11, 3, 'Partes', '/vehiculos/partes', 9),
(12, 4, 'Tareas', '/vehiculos/tareas', 9),
(13, 3, 'Preventivo', NULL, 0),
(14, 1, 'Actividades', '/preventivo/actividades', 13),
(15, 2, 'Agenda', '/preventivo/agenda', 13),
(16, 4, 'Correctivo', NULL, 0),
(17, 1, 'Actividades', '/correctivo/actividades', 16),
(18, 2, 'Agenda', '/correctivo/agenda', 16),
(19, 1, 'Vehículos', '/archivos/vehiculos', 9);

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
(3, 'un trabajo', '2021-04-27 22:42:39', '2021-04-27 22:42:39', NULL),
(4, 'asdfasdfasdf', '2021-04-28 19:46:38', '2021-04-28 19:46:38', NULL);

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
(49, 'jmulki', 12),
(50, 'jmulki', 14),
(51, 'jmulki', 15),
(52, 'jmulki', 17),
(53, 'jmulki', 18),
(54, 'jmulki', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preventivo`
--

CREATE TABLE `preventivo` (
  `id` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_parte` int(11) NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `detalles` text DEFAULT NULL,
  `frecuenciaDias` int(11) DEFAULT NULL,
  `frecuenciaKms` int(11) DEFAULT NULL,
  `ultimaFecha` date DEFAULT NULL,
  `ultimoKms` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `preventivo`
--

INSERT INTO `preventivo` (`id`, `id_vehiculo`, `id_parte`, `id_tarea`, `detalles`, `frecuenciaDias`, `frecuenciaKms`, `ultimaFecha`, `ultimoKms`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, 1, 1, 'detalles', NULL, NULL, NULL, NULL, '2021-05-08 16:04:25', '2021-05-08 16:12:10', '2021-05-08 16:12:10'),
(2, 8, 4, 4, 'asdasdfasdf asdlfkj\nalsdkfjñl', 11, 11, NULL, NULL, '2021-05-08 16:10:53', '2021-05-15 17:22:30', '2021-05-15 17:22:30'),
(3, 9, 3, 3, 'detalles de prueba', 15, 10000, '2021-05-01', 50000, '2021-05-08 17:11:03', '2021-05-15 18:48:59', '2021-05-15 18:48:59'),
(4, 8, 1, 3, 'cambiar una parte', 123, 123, NULL, NULL, '2021-05-08 17:19:17', '2021-05-15 18:49:02', '2021-05-15 18:49:02'),
(5, 9, 4, 4, 'ssdfgsdfg', 15, 12345, '2021-05-15', 123456, '2021-05-15 17:21:25', '2021-05-15 18:49:05', '2021-05-15 18:49:05'),
(6, 8, 4, 4, NULL, NULL, NULL, NULL, NULL, '2021-05-15 17:23:09', '2021-05-15 17:23:17', '2021-05-15 17:23:17'),
(7, 7, 4, 3, NULL, 11, NULL, NULL, NULL, '2021-05-15 17:40:53', '2021-05-15 18:49:08', '2021-05-15 18:49:08'),
(8, 7, 4, 4, NULL, 134, 12, '2021-05-07', 1234, '2021-05-15 17:44:34', '2021-05-15 18:49:11', '2021-05-15 18:49:11'),
(9, 9, 3, 3, 'tarea de utilitario sobre trabajo (cambiar)', 15, NULL, '2021-05-05', NULL, '2021-05-15 18:50:03', '2021-05-15 18:50:03', NULL),
(10, 7, 1, 3, 'cambio una parte de yamaha (doble control de intervalo)', 10, 500, '2021-05-19', 333333, '2021-05-15 18:51:03', '2021-05-19 23:24:09', NULL),
(11, 8, 1, 1, 'tarea uno de una parte', NULL, 1000, NULL, 50500, '2021-05-15 18:51:36', '2021-05-19 23:27:45', NULL),
(12, 10, 1, 1, 'detalles de la tarea', 10, NULL, '2021-05-28', NULL, '2021-05-18 21:54:17', '2021-05-19 23:30:18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preventivo_tareas`
--

CREATE TABLE `preventivo_tareas` (
  `id` int(11) NOT NULL,
  `id_preventivo` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `kilometros` int(11) NOT NULL,
  `detalles` text DEFAULT NULL,
  `cumplimentado` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `preventivo_tareas`
--

INSERT INTO `preventivo_tareas` (`id`, `id_preventivo`, `user`, `fecha`, `kilometros`, `detalles`, `cumplimentado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10, 'jmulki', '2021-05-18', 123456, 'detalles cumplido', 1, '2021-05-19 00:16:24', '2021-05-19 00:16:24', NULL),
(2, 10, 'jmulki', '2021-05-18', 321654, 'detalles desestimado', 0, '2021-05-19 00:16:40', '2021-05-19 00:16:40', NULL),
(3, 10, 'jmulki', '2021-05-19', 123127, NULL, 1, '2021-05-19 23:17:34', '2021-05-19 23:17:34', NULL),
(4, 10, 'jmulki', '2021-05-19', 150000, NULL, 1, '2021-05-19 23:23:23', '2021-05-19 23:23:23', NULL),
(5, 10, 'jmulki', '2021-05-19', 333333, NULL, 0, '2021-05-19 23:24:09', '2021-05-19 23:24:09', NULL),
(6, 11, 'jmulki', '2021-05-19', 50500, NULL, 0, '2021-05-19 23:27:45', '2021-05-19 23:27:45', NULL),
(7, 12, 'jmulki', '2021-05-28', 3522345, NULL, 0, '2021-05-19 23:30:18', '2021-05-19 23:30:18', NULL);

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
(3, 'cambiar', '2021-04-27 22:55:30', '2021-04-27 22:55:30', NULL),
(4, 'asdfasdf', '2021-04-28 19:48:07', '2021-04-28 19:48:07', NULL);

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
  `kms_venc_gtia` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `id_tipo`, `descripcion`, `alias`, `patente`, `id_tipo_comb`, `anio`, `id_chofer`, `fecha_venc_gtia`, `kms_venc_gtia`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Volkswagen Gol 1.4', 'Auto de Pablo', 'LXG764', NULL, 2012, 1, '2021-04-13', NULL, NULL, '2021-04-14 21:48:55', '2021-04-14 21:48:55'),
(3, 4, 'utilitarios', 'de martin capo', 'LL123XG', NULL, 2013, 2, '2021-04-17', NULL, '2021-04-14 21:47:44', '2021-04-20 18:27:56', '2021-04-20 18:27:56'),
(4, 3, 'Amarok VW', 'camioneta', 'NFC211', NULL, 2015, 1, '2021-05-06', NULL, '2021-04-15 23:13:38', '2021-04-20 18:27:58', '2021-04-20 18:27:58'),
(5, 5, 'decrip', 'ali', 'LJH567', NULL, 2015, 1, '2021-03-01', NULL, '2021-04-17 23:34:15', '2021-04-20 18:28:01', '2021-04-20 18:28:01'),
(6, 1, 'erty', '5656', 'LXG764D', NULL, 345666, 2, '2021-03-31', NULL, '2021-04-18 01:54:50', '2021-04-20 18:28:04', '2021-04-20 18:28:04'),
(7, 2, 'Yamaha', 'Moto de Juan', 'LXG764', 1, 2020, 5, '2021-05-06', NULL, '2021-04-20 18:40:54', '2021-04-23 14:48:27', NULL),
(8, 5, 'Otro', 'Otro', 'LXG768', 3, 2030, 6, '2020-04-30', NULL, '2021-04-23 14:49:29', '2021-04-23 14:49:29', NULL),
(9, 4, 'utilitario', 'utilitario grande', 'UID987', 2, 2013, 6, '2021-04-29', 150000, '2021-04-29 15:33:13', '2021-05-24 14:50:36', NULL),
(10, 1, 'Moto', 'mi moto', 'LG123SD', 1, 2015, 5, '2020-01-01', NULL, '2021-05-18 21:53:09', '2021-05-18 21:53:09', NULL);

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
-- Estructura Stand-in para la vista `vw_ultimo_km`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_ultimo_km` (
`id_vehiculo` int(11)
,`ultimo` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_vehiculos_km`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_vehiculos_km` (
`id_vehiculo` int(11)
,`kilometros` int(11)
,`fecha_hora` datetime
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

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ultimo_km`
--
DROP TABLE IF EXISTS `vw_ultimo_km`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_ultimo_km`  AS  select `kilometraje`.`id_vehiculo` AS `id_vehiculo`,max(`kilometraje`.`id`) AS `ultimo` from `kilometraje` group by `kilometraje`.`id_vehiculo` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_vehiculos_km`
--
DROP TABLE IF EXISTS `vw_vehiculos_km`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vehiculos_km`  AS  select `kilometraje`.`id_vehiculo` AS `id_vehiculo`,`kilometraje`.`kilometros` AS `kilometros`,`kilometraje`.`fecha_hora` AS `fecha_hora` from (`vw_ultimo_km` join `kilometraje` on(`vw_ultimo_km`.`ultimo` = `kilometraje`.`id`)) ;

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
-- Indices de la tabla `correctivo`
--
ALTER TABLE `correctivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_correctivo_vehiculos_id` (`id_vehiculo`);

--
-- Indices de la tabla `correctivo_tareas`
--
ALTER TABLE `correctivo_tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_correctivo_tareas_correctivo_id` (`id_correctivo`);

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
-- Indices de la tabla `preventivo`
--
ALTER TABLE `preventivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_preventivo_vehiculos_id` (`id_vehiculo`);

--
-- Indices de la tabla `preventivo_tareas`
--
ALTER TABLE `preventivo_tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_preventivo_tareas_preventivo_id` (`id_preventivo`);

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
-- AUTO_INCREMENT de la tabla `correctivo`
--
ALTER TABLE `correctivo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `correctivo_tareas`
--
ALTER TABLE `correctivo_tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `kilometraje`
--
ALTER TABLE `kilometraje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `partes`
--
ALTER TABLE `partes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `preventivo`
--
ALTER TABLE `preventivo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `preventivo_tareas`
--
ALTER TABLE `preventivo_tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `vehiculos_tipos`
--
ALTER TABLE `vehiculos_tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `correctivo`
--
ALTER TABLE `correctivo`
  ADD CONSTRAINT `FK_correctivo_vehiculos_id` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id`);

--
-- Filtros para la tabla `correctivo_tareas`
--
ALTER TABLE `correctivo_tareas`
  ADD CONSTRAINT `FK_correctivo_tareas_correctivo_id` FOREIGN KEY (`id_correctivo`) REFERENCES `correctivo` (`id`);

--
-- Filtros para la tabla `kilometraje`
--
ALTER TABLE `kilometraje`
  ADD CONSTRAINT `FK_kilometraje_vehiculos_id` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id`);

--
-- Filtros para la tabla `preventivo`
--
ALTER TABLE `preventivo`
  ADD CONSTRAINT `FK_preventivo_vehiculos_id` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id`);

--
-- Filtros para la tabla `preventivo_tareas`
--
ALTER TABLE `preventivo_tareas`
  ADD CONSTRAINT `FK_preventivo_tareas_preventivo_id` FOREIGN KEY (`id_preventivo`) REFERENCES `preventivo` (`id`);

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
