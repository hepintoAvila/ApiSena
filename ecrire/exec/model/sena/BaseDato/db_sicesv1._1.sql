-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2024 a las 02:49:29
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
-- Base de datos: `db_sicesv1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apis_autorizaciones`
--

CREATE TABLE `apis_autorizaciones` (
  `id` int(21) NOT NULL,
  `idMenu` int(21) NOT NULL,
  `idSubmenu` int(21) NOT NULL,
  `idRol` int(11) NOT NULL,
  `c` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `u` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `d` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `a` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `entidad` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `apis_autorizaciones`
--

INSERT INTO `apis_autorizaciones` (`id`, `idMenu`, `idSubmenu`, `idRol`, `c`, `u`, `d`, `a`, `entidad`, `maj`) VALUES
(1, 2, 1, 1, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:56:46'),
(2, 2, 2, 1, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:57:15'),
(3, 3, 3, 1, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:38'),
(4, 4, 4, 1, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:56'),
(5, 4, 5, 1, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:08'),
(6, 4, 6, 1, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(7, 4, 6, 1, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(8, 5, 7, 1, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(9, 5, 8, 1, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(10, 2, 1, 2, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:56:46'),
(11, 2, 2, 2, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:57:15'),
(12, 3, 3, 2, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:38'),
(13, 4, 4, 2, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:56'),
(14, 4, 5, 2, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:08'),
(15, 4, 6, 2, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(16, 4, 6, 2, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(17, 5, 7, 2, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(18, 5, 8, 2, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(19, 2, 1, 3, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:56:46'),
(20, 2, 2, 3, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:57:15'),
(21, 3, 3, 3, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:38'),
(22, 4, 4, 3, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:56'),
(23, 4, 5, 3, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:08'),
(24, 4, 6, 3, 'S', 'S', 'S', 'S', 'senaV1', '2024-04-29 12:54:43'),
(25, 5, 7, 1, 'S', 'S', 'S', 'S', 'senaV1', '2024-04-29 13:09:52'),
(27, 5, 8, 3, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(28, 2, 1, 4, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:56:46'),
(29, 2, 2, 4, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:57:15'),
(30, 3, 3, 4, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:38'),
(31, 4, 4, 4, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:56'),
(32, 4, 5, 4, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:08'),
(33, 4, 6, 4, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(34, 4, 6, 4, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(35, 5, 7, 4, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(36, 5, 8, 4, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(37, 2, 1, 5, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:56:46'),
(38, 2, 2, 5, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:57:15'),
(39, 3, 3, 5, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:38'),
(40, 4, 4, 5, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:56'),
(41, 4, 5, 5, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:08'),
(42, 4, 6, 5, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(43, 4, 6, 5, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(44, 5, 7, 5, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(45, 5, 8, 5, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(46, 2, 1, 6, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:56:46'),
(47, 2, 2, 6, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 04:57:15'),
(48, 3, 3, 6, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:38'),
(49, 4, 4, 6, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:18:56'),
(50, 4, 5, 6, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:08'),
(51, 4, 6, 6, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(52, 4, 6, 6, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(53, 5, 7, 6, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(54, 5, 8, 6, 'S', 'S', 'S', 'S', 'senaV1', '2023-08-30 19:19:27'),
(55, 6, 9, 1, 'S', 'S', 'S', 'S', 'senaV1', '2023-09-01 15:07:22'),
(56, 6, 9, 4, 'S', 'S', 'S', 'S', 'senaV1', '2023-09-01 15:08:36'),
(57, 7, 10, 1, 'S', 'S', 'S', 'S', 'senaV1', '2024-04-29 12:53:44'),
(59, 8, 11, 1, 'S', 'S', 'S', 'S', 'senaV1', '2024-05-15 18:13:31'),
(60, 8, 12, 1, 'S', 'S', 'S', 'S', 'senaV1', '2024-06-10 17:38:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apis_menu`
--

CREATE TABLE `apis_menu` (
  `idMenu` int(21) NOT NULL,
  `key` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `label` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isTitle` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Active',
  `entidad` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `apis_menu`
--

INSERT INTO `apis_menu` (`idMenu`, `key`, `label`, `isTitle`, `icon`, `status`, `entidad`, `maj`) VALUES
(1, 'Navigation', 'Navigation', 1, '', 'Active', 'senaV1', '2024-04-29 00:53:23'),
(2, 'AdminUsuarios', 'Gestión de Usuarios', 0, 'dripicons-user', 'Active', 'senaV1', '2023-08-26 02:13:38'),
(3, 'Menu', 'Gestión de Menu', 0, 'dripicons-user', 'Active', 'senaV1', '2023-08-30 00:01:21'),
(4, 'ModuloSolicitudComite', 'Módulo Solicitud Comite', 0, 'dripicons-user', 'Active', 'senaV1', '2023-09-11 18:11:44'),
(5, 'ModuloReportes', 'Módulo de Reportes', 0, 'dripicons-user', 'Active', 'senaV1', '2023-08-30 14:26:59'),
(6, 'ModuloNotificaciones', 'Módulo Notificaciones', 0, 'dripicons-user', 'Active', 'senaV1', '2023-09-01 15:04:19'),
(7, 'ModuloAprendiz', 'Modulo Aprendiz', 0, 'dripicons-user', 'Active', 'senaV1', '2024-04-29 01:02:38'),
(8, 'ModuloActas', 'Modulo Actas', 0, 'dripicons-user', 'Active', 'senaV1', '2024-05-15 18:09:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apis_roles`
--

CREATE TABLE `apis_roles` (
  `idRol` int(11) NOT NULL,
  `tipo` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `entidad` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `maj` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `apis_roles`
--

INSERT INTO `apis_roles` (`idRol`, `tipo`, `entidad`, `maj`) VALUES
(1, 'Administrador', 'senaV1', '2023-04-21 02:11:55'),
(2, 'Instructor', 'senaV1', '2023-04-21 02:11:55'),
(3, 'Aprendiz', 'senaV1', '2023-08-26 20:30:36'),
(4, 'Apoyo', 'senaV1', '2023-08-26 20:30:36'),
(5, 'Coordinador', 'senaV1', '2023-08-26 20:31:20'),
(6, 'Comite', 'senaV1', '2023-08-26 20:31:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apis_submenus`
--

CREATE TABLE `apis_submenus` (
  `idSubmenu` int(21) NOT NULL,
  `idMenu` int(21) NOT NULL,
  `key` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parentKey` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `label` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Active',
  `entidad` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `apis_submenus`
--

INSERT INTO `apis_submenus` (`idSubmenu`, `idMenu`, `key`, `parentKey`, `label`, `url`, `icon`, `status`, `entidad`, `maj`) VALUES
(1, 2, 'ds-usuarios', 'AdminUsuarios', 'Usuarios', '/dashboard/AdminUsuarios/Usuarios', 'mdi mdi-account-cog', 'Active', 'senaV1', '2023-08-26 19:42:11'),
(2, 2, 'ds-roles', 'AdminUsuarios', 'Roles', '/dashboard/AdminUsuarios/Roles', 'mdi mdi-account-cog', 'Active', 'senaV1', '2023-08-26 19:42:05'),
(3, 3, 'ds-menu', 'GestionMenu', 'Menus', '/dashboard/GestionMenu/Menus', 'mdi mdi-account-cog', 'Active', 'senaV1', '2023-08-30 09:37:13'),
(4, 4, 'ds-incidentes', 'ModuloSolicitudComite', 'Enviar Solicitud', '/dashboard/ModuloSolicitudComite/EnviarSolicitud', 'mdi mdi-account-cog', 'Active', 'senaV1', '2024-04-14 23:33:31'),
(5, 4, 'ds-incidentes', 'ModuloSolicitudComite', 'Consultas', '/dashboard/ModuloSolicitudComite/ConsultaIncidente', 'mdi mdi-account-cog', 'Active', 'senaV1', '2024-04-14 23:40:08'),
(6, 4, 'ds-incidentes', 'ModuloSolicitudComite', 'Reportes', '/dashboard/ModuloSolicitudComite/ReportesIncidentes', 'mdi mdi-account-cog', 'Active', 'senaV1', '2024-04-14 23:32:01'),
(7, 5, 'ds-reportes', 'ModuloReportes', 'Por Comite', '/dashboard/ModuloReportes/ReportesComite', 'mdi mdi-account-cog', 'Active', 'senaV1', '2023-08-30 14:51:04'),
(8, 5, 'ds-reportes', 'ModuloReportes', 'Por Incidentes', '/dashboard/ModuloReportes/ReportesIncidentes', 'mdi mdi-account-cog', 'Active', 'senaV1', '2023-08-30 14:51:09'),
(9, 6, 'ms-nofificaciones', 'ModuloNotificaciones', 'Consulta Notificaciones', '/dashboard/ModuloNotificaciones/ConsultaNotificaciones', 'mdi mdi-account-cog', 'Active', 'senaV1', '2024-06-11 20:38:40'),
(10, 7, 'ds-aprendiz', 'ModuloAprendiz', 'Aprendiz', '/dashboard/ModuloAprendiz/Aprendiz', 'mdi mdi-account-cog', 'Active', 'senaV1', '2024-04-29 12:56:39'),
(11, 8, 'ds-actas', 'ModuloActas', 'Actas', '/dashboard/ModuloActas/Actas', 'mdi mdi-account-cog', 'Active', 'senaV1', '2024-05-15 18:12:05'),
(12, 8, 'ds-actas', 'ModuloActas', 'Papelera de Actas', '/dashboard/ModuloActas/PapeleraActas', 'ds-actas', 'Active', 'senaV1', '2024-06-10 17:43:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_articles`
--

CREATE TABLE `api_articles` (
  `id_article` bigint(21) NOT NULL,
  `surtitre` text NOT NULL DEFAULT '',
  `titre` text NOT NULL DEFAULT '',
  `soustitre` text NOT NULL DEFAULT '',
  `id_rubrique` bigint(21) NOT NULL DEFAULT 0,
  `descriptif` text NOT NULL DEFAULT '',
  `chapo` mediumtext NOT NULL DEFAULT '',
  `texte` longtext NOT NULL DEFAULT '',
  `ps` mediumtext NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `statut` varchar(10) NOT NULL DEFAULT '0',
  `id_secteur` bigint(21) NOT NULL DEFAULT 0,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `export` varchar(10) DEFAULT 'oui',
  `date_redac` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `visites` int(11) NOT NULL DEFAULT 0,
  `referers` int(11) NOT NULL DEFAULT 0,
  `popularite` double NOT NULL DEFAULT 0,
  `accepter_forum` char(3) NOT NULL DEFAULT '',
  `date_modif` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `lang` varchar(10) NOT NULL DEFAULT '',
  `langue_choisie` varchar(3) DEFAULT 'non',
  `id_trad` bigint(21) NOT NULL DEFAULT 0,
  `nom_site` tinytext NOT NULL DEFAULT '',
  `url_site` text NOT NULL DEFAULT '',
  `virtuel` text NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_auteurs`
--

CREATE TABLE `api_auteurs` (
  `id_auteur` bigint(21) NOT NULL,
  `nom` text NOT NULL DEFAULT '',
  `bio` text NOT NULL DEFAULT '',
  `email` tinytext NOT NULL DEFAULT '',
  `nom_site` tinytext NOT NULL DEFAULT '',
  `url_site` text NOT NULL DEFAULT '',
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pass` tinytext NOT NULL DEFAULT '',
  `low_sec` tinytext NOT NULL DEFAULT '',
  `statut` varchar(255) NOT NULL DEFAULT '0',
  `webmestre` varchar(3) NOT NULL DEFAULT 'non',
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pgp` text NOT NULL DEFAULT '',
  `htpass` tinytext NOT NULL DEFAULT '',
  `en_ligne` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `alea_actuel` tinytext DEFAULT NULL,
  `alea_futur` tinytext DEFAULT NULL,
  `prefs` text DEFAULT NULL,
  `cookie_oubli` tinytext DEFAULT NULL,
  `source` varchar(10) NOT NULL DEFAULT 'spip',
  `lang` varchar(10) NOT NULL DEFAULT '',
  `imessage` varchar(3) NOT NULL DEFAULT '',
  `tipo` varchar(50) NOT NULL,
  `entidad` varchar(8) NOT NULL,
  `idRol` int(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `api_auteurs`
--

INSERT INTO `api_auteurs` (`id_auteur`, `nom`, `bio`, `email`, `nom_site`, `url_site`, `login`, `pass`, `low_sec`, `statut`, `webmestre`, `maj`, `pgp`, `htpass`, `en_ligne`, `alea_actuel`, `alea_futur`, `prefs`, `cookie_oubli`, `source`, `lang`, `imessage`, `tipo`, `entidad`, `idRol`) VALUES
(1, 'holmes', '', 'holmespinto@unicesar.edu.co', '', '', NULL, 'f0bf51c66d2ff435538e07c0ae06cba268cfd51be9d5ba9ee22d1db5c53f69c0', '', '0minirezo', 'oui', '2024-04-29 00:04:28', '', '$1$67xmhLzo$ot4Mo5cbzLnyqapGSoYdo0', '2023-04-20 21:55:47', '178684903065c18ae813dea5.58312858', '19471409665c18ae813dec9.96443977', 'a:5:{s:7:\"couleur\";i:2;s:7:\"display\";i:2;s:18:\"display_navigation\";s:22:\"navigation_avec_icones\";s:14:\"display_outils\";s:3:\"oui\";s:3:\"cnx\";s:0:\"\";}', '99874923765c18ae81576a3.84139685', 'spip', '', '', '', 'v3', 0),
(3, 'Admin', '', 'holmespinto@unicesar.edu.co', '', '', '87737036-5743-41b5-b770-3489aecba069', '5afcfd7f2f7c0ee7ce1c0c46d4c830458bc502d38350069b7c624ba1e966125e', '', '1comite', 'non', '2024-06-12 00:48:26', '', '$1$9Pu9enLo$/jGCyV2rKzNkjNL.OkZxb/', '2024-06-12 02:48:26', '177540723265daa854d95355.35814250', '70244586665daa884e44743.46315544', NULL, NULL, 'spip', '', 'oui', '', '0', 0),
(4, 'Administrador', '', 'administrador@unicesar.edu.co', '', '', 'Admin', '88d4dacc5fd5bed994322e2a52f5aa0d537a7b1597b7835b8ec05f6d47ec20c7', '', '0minirezo', 'non', '2024-01-09 03:04:46', '', '$1$tKLo6vfy$u24XpNK7JoHCFJUSPheoi1', '2024-01-08 22:04:46', '116884957465807a72e73655.63736288', '2085962630659cb7ce5886c2.35377009', 'a:5:{s:7:\"couleur\";i:2;s:7:\"display\";i:2;s:18:\"display_navigation\";s:22:\"navigation_avec_icones\";s:14:\"display_outils\";s:3:\"oui\";s:3:\"cnx\";s:0:\"\";}', NULL, 'spip', '', 'oui', 'Administrador', 'v2', 0),
(21, 'Secretaria', '', 'secretaria@gmail.com', '', '', 'secretaria', '9299b07e73c2f0e1b4be954ae4630d9ef15983dc0b570498e83a18e207b31b44', '', '0minirezo', 'non', '2023-10-19 22:53:25', '', '$1$DoUjX6bo$nIR6BDqyqSpX.HFEujHD51', '2023-10-19 17:53:25', '5617466876531abb4a66822.70947496', '15969528356531b3659c7d13.34206504', '', '122161499564443ae8cefa09.93265287', 'spip', 'es', 'oui', 'Secretaria', 'v2', 0),
(22, 'Gerente', '', 'gerente@gmail.com', '', '', 'gerente', '9a1ec6483fd9268cf0ee0b4b889a44deb41af839c7ec72ab4f2285a9a9eae907', '', '0minirezo', 'non', '2023-08-09 18:15:19', '', '$1$bgndtaDj$gZyN85qHS3lQuF2IT2E5Z1', '2023-08-09 13:15:19', '204688411164d3d73ddbb591.89434301', '19328059064d3d7b71038c8.94203430', '', '74878428764443bf1c8c216.75069678', 'spip', 'es', 'oui', 'Gerente', 'v2', 0),
(23, 'comprador', '', 'comprador@gmail.com', '', '', 'comprador', '5f641d5ee0b08f92ad19dd4ea02dab56a6db6753f54409b184dcd8c693a3eae7', '', '0minirezo', 'non', '2023-10-21 14:39:54', '', '$1$9Pbqbyup$3RZwshTu6oJ47bKwoT9US0', '2023-10-21 09:39:54', '92604785264f95b4b87a4e5.10707819', '20109508336533e2ba70afb3.55050027', '', '117612255964443ca78fa6e2.83538885', 'spip', 'es', 'oui', 'Comprador', 'v2', 0),
(25, 'Consulta', '', 'holmespinto@unicesar.edu.co', '', '', 'consulta', 'a70e5af642d94abe8ce95e3e5f431727750d41f145e5a633906f59e0347e2d44', '', '0minirezo', 'oui', '2024-02-19 17:28:01', '', '$1$5EKknpo3$kcsTZrpouzeD6k63FpJ1v1', '2024-02-19 12:28:01', '119745901065d3805c7c18f8.14729981', '140582741065d38fa183ddb0.67048403', NULL, NULL, 'spip', 'es', 'oui', 'Consulta', 'v3', 0),
(26, 'Consulta', '', 'holmespinto@unicesar.edu.co', '', '', 'Administrador', '14b00487027c09f15977c74579599ed3ddfeb8ff47e5e058b024ceef44853622', '', '0minirezo', 'oui', '2024-06-11 20:35:44', '', '$1$jFHdC6sZ$hZAI0ghWP2muR6flrWxi11', '2024-06-11 22:35:43', '4714771616667cd45ee2615.14515194', '2878622816668b5200d8616.96874692', 'a:5:{s:7:\"couleur\";i:2;s:7:\"display\";i:2;s:18:\"display_navigation\";s:22:\"navigation_avec_icones\";s:14:\"display_outils\";s:3:\"oui\";s:3:\"cnx\";s:0:\"\";}', '', 'spip', 'es', 'oui', 'Administrador', 'senaV1', 1),
(47, 'Holmes', '', 'holmespinto@unicesar.edu.co', '', '', 'Administrador2', 'Administrador2', '', '0minirezo', 'non', '2024-06-10 07:04:01', '', '$1$5EKknpo3$kcsTZrpouzeD6k63FpJ1v1', '2024-06-10 05:31:13', '5640142866668787d7dbc1.68842647', '18520108346666890da25c23.93237773', 'a:5:{s:7:\"couleur\";i:2;s:7:\"display\";i:2;s:18:\"display_navigation\";s:22:\"navigation_avec_icones\";s:14:\"display_outils\";s:3:\"oui\";s:3:\"cnx\";s:0:\"\";}', NULL, 'spip', 'es', 'oui', 'Administrador', 'senaV1', 1),
(48, 'Admin2', '', 'holmespinto@sena.com', '', '', 'admin2', 'b93be4cd927f5fcf1d928a11ae8043b9c05e8bb7643f8189957bb69fbadb7608', '', '0minirezo', 'non', '2024-06-11 04:05:30', '', '$1$5XYPPQWm$UjXMsbyTfgvCCBm7K4nxd0', '2024-06-11 06:05:30', '98291764765274f79788197.11563891', '17142702766667cd0ac16a58.32553783', '', '15757996286508b518c9c747.40017730', 'spip', 'es', 'oui', 'Instructor', 'senaV1', 0),
(50, 'admin23', '', 'estebanrey58@gmail.com', '', '', 'admin23', '58d4dac952c974551562ec386d1133599b0327cdd63e95c0e82dee376c5cd143', '', '0minirezo', 'non', '2023-10-18 23:15:28', '', '$1$nLQMetee$13BNZHol0oJWAn1IlGYMm0', '2023-10-18 18:15:28', '1195510186653061c96eecf0.14734212', '140191801265306710424be0.30017756', '', '1349927787653061c96f5f57.67726900', 'spip', 'es', 'oui', 'Instructor', 'senaV1', 0),
(51, 'Camilo', '', 'cami-2513@hotmail.con', '', '', 'camilo', 'b85846ad5c01c436db69a810cd7df6a7ed742477aa9e5359d58dcb23f9f67925', '', '0minirezo', 'non', '2024-04-24 01:42:16', '', '$1$pLrn3Gyo$IT1yGr5IKeTkF3RDu/.k5/', '2024-04-24 03:42:16', '23899858662862f6352be6.81804848', '160933423766286378b6d5f3.74424942', '', '2053835013662862f6406886.15677173', 'spip', 'es', 'oui', 'Instructor', 'senaV1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_auteurs_liens`
--

CREATE TABLE `api_auteurs_liens` (
  `id_auteur` bigint(21) NOT NULL DEFAULT 0,
  `id_objet` bigint(21) NOT NULL DEFAULT 0,
  `objet` varchar(25) NOT NULL DEFAULT '',
  `vu` varchar(6) NOT NULL DEFAULT 'non'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_depots`
--

CREATE TABLE `api_depots` (
  `id_depot` bigint(21) NOT NULL,
  `titre` text NOT NULL DEFAULT '',
  `descriptif` text NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL DEFAULT '',
  `url_serveur` varchar(255) NOT NULL DEFAULT '',
  `url_brouteur` varchar(255) NOT NULL DEFAULT '',
  `url_archives` varchar(255) NOT NULL DEFAULT '',
  `url_commits` varchar(255) NOT NULL DEFAULT '',
  `xml_paquets` varchar(255) NOT NULL DEFAULT '',
  `sha_paquets` varchar(40) NOT NULL DEFAULT '',
  `nbr_paquets` int(11) NOT NULL DEFAULT 0,
  `nbr_plugins` int(11) NOT NULL DEFAULT 0,
  `nbr_autres` int(11) NOT NULL DEFAULT 0,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_depots_plugins`
--

CREATE TABLE `api_depots_plugins` (
  `id_depot` bigint(21) NOT NULL,
  `id_plugin` bigint(21) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_documents`
--

CREATE TABLE `api_documents` (
  `id_document` bigint(21) NOT NULL,
  `id_vignette` bigint(21) NOT NULL DEFAULT 0,
  `extension` varchar(10) NOT NULL DEFAULT '',
  `titre` text NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `descriptif` text NOT NULL DEFAULT '',
  `fichier` text NOT NULL DEFAULT '',
  `taille` bigint(20) DEFAULT NULL,
  `largeur` int(11) DEFAULT NULL,
  `hauteur` int(11) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `media` varchar(10) NOT NULL DEFAULT 'file',
  `mode` varchar(10) NOT NULL DEFAULT 'document',
  `distant` varchar(3) DEFAULT 'non',
  `statut` varchar(10) NOT NULL DEFAULT '0',
  `credits` text NOT NULL DEFAULT '',
  `alt` text NOT NULL DEFAULT '',
  `date_publication` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `brise` tinyint(4) DEFAULT 0,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_documents_liens`
--

CREATE TABLE `api_documents_liens` (
  `id_document` bigint(21) NOT NULL DEFAULT 0,
  `id_objet` bigint(21) NOT NULL DEFAULT 0,
  `objet` varchar(25) NOT NULL DEFAULT '',
  `vu` enum('non','oui') NOT NULL DEFAULT 'non',
  `rang_lien` int(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_forum`
--

CREATE TABLE `api_forum` (
  `id_forum` bigint(21) NOT NULL,
  `id_objet` bigint(21) NOT NULL DEFAULT 0,
  `objet` varchar(25) NOT NULL DEFAULT '',
  `id_parent` bigint(21) NOT NULL DEFAULT 0,
  `id_thread` bigint(21) NOT NULL DEFAULT 0,
  `date_heure` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `date_thread` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `titre` text NOT NULL DEFAULT '',
  `texte` mediumtext NOT NULL DEFAULT '',
  `auteur` text NOT NULL DEFAULT '',
  `email_auteur` text NOT NULL DEFAULT '',
  `nom_site` text NOT NULL DEFAULT '',
  `url_site` text NOT NULL DEFAULT '',
  `statut` varchar(8) NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_auteur` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_groupes_mots`
--

CREATE TABLE `api_groupes_mots` (
  `id_groupe` bigint(21) NOT NULL,
  `titre` text NOT NULL DEFAULT '',
  `descriptif` text NOT NULL DEFAULT '',
  `texte` longtext NOT NULL DEFAULT '',
  `unseul` varchar(3) NOT NULL DEFAULT '',
  `obligatoire` varchar(3) NOT NULL DEFAULT '',
  `tables_liees` text NOT NULL DEFAULT '',
  `minirezo` varchar(3) NOT NULL DEFAULT '',
  `comite` varchar(3) NOT NULL DEFAULT '',
  `forum` varchar(3) NOT NULL DEFAULT '',
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_jobs`
--

CREATE TABLE `api_jobs` (
  `id_job` bigint(21) NOT NULL,
  `descriptif` text NOT NULL DEFAULT '',
  `fonction` varchar(255) NOT NULL,
  `args` longblob NOT NULL DEFAULT '',
  `md5args` char(32) NOT NULL DEFAULT '',
  `inclure` varchar(255) NOT NULL,
  `priorite` smallint(6) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `api_jobs`
--

INSERT INTO `api_jobs` (`id_job`, `descriptif`, `fonction`, `args`, `md5args`, `inclure`, `priorite`, `date`, `status`) VALUES
(3112, 'Tarea CRON mise_a_jour (cada 259200 s)', 'mise_a_jour', 0x613a313a7b693a303b693a313731383133383133373b7d, '508786e67917933a661994fc8b405754', 'genie/', 0, '2024-06-14 22:35:37', 1),
(3116, 'Tarea CRON maintenance (cada 7200 s)', 'maintenance', 0x613a313a7b693a303b693a313731383135323633333b7d, '0790a99e0bff779ca792639090c9a11e', 'genie/', 0, '2024-06-12 04:37:13', 1),
(3114, 'Tarea CRON queue_watch (cada 86400 s)', 'queue_watch', 0x613a313a7b693a303b693a313731383135303137333b7d, '05aa3a803ebe250129c586ee84d5519a', 'genie/', 0, '2024-06-13 01:56:13', 1),
(3115, 'Tarea CRON bigup_nettoyer_repertoire_upload (cada 86400 s)', 'bigup_nettoyer_repertoire_upload', 0x613a313a7b693a303b693a313731383135303137333b7d, '05aa3a803ebe250129c586ee84d5519a', 'genie/', 0, '2024-06-13 01:56:13', 1),
(3095, 'Tarea CRON optimiser (cada 172800 s)', 'optimiser', 0x613a313a7b693a303b693a313731373938333233323b7d, '17e64c1ae49653981bf0c5f75d9f9358', 'genie/', -10, '2024-06-12 03:33:52', 1),
(3110, 'Tarea CRON svp_actualiser_depots (cada 21600 s)', 'svp_actualiser_depots', 0x613a313a7b693a303b693a313731383133383133353b7d, '96184fc141a7a5b75d50a15aab1c0cce', 'genie/', 0, '2024-06-12 04:35:35', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_jobs_liens`
--

CREATE TABLE `api_jobs_liens` (
  `id_job` bigint(21) NOT NULL DEFAULT 0,
  `id_objet` bigint(21) NOT NULL DEFAULT 0,
  `objet` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_meta`
--

CREATE TABLE `api_meta` (
  `nom` varchar(255) NOT NULL,
  `valeur` text DEFAULT '',
  `impt` enum('non','oui') NOT NULL DEFAULT 'oui',
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `api_meta`
--

INSERT INTO `api_meta` (`nom`, `valeur`, `impt`, `maj`) VALUES
('charset_sql_base', 'utf8', 'non', '2022-03-23 03:54:51'),
('charset_collation_sql_base', 'utf8_general_ci', 'non', '2022-03-23 03:54:51'),
('charset_sql_connexion', 'utf8', 'non', '2022-03-23 03:54:51'),
('version_installee', '2021021800', 'non', '2022-03-23 03:54:51'),
('nouvelle_install', '1', 'non', '2022-03-23 03:54:51'),
('pcre_u', 'u', 'oui', '2022-03-23 03:55:48'),
('charset', 'utf-8', 'oui', '2022-03-23 03:55:48'),
('alea_ephemere_ancien', 'b9a10ebd822a32d933b42137d47654e5', 'non', '2024-06-11 20:35:33'),
('alea_ephemere', 'ccb7dd19cdecb7173d90073f2326c2f8', 'non', '2024-06-11 20:35:33'),
('alea_ephemere_date', '1718138133', 'non', '2024-06-11 20:35:33'),
('langues_proposees', 'ar,ast,ay,bg,br,bs,ca,co,cpf,cpf_hat,cs,da,de,en,eo,es,eu,fa,fon,fr,fr_fem,fr_tu,gl,he,hr,hu,id,it,it_fem,ja,km,lb,my,nl,oc_auv,oc_gsc,oc_lms,oc_lnc,oc_ni,oc_ni_la,oc_ni_mis,oc_prv,oc_va,pl,pt,pt_br,ro,ru,sk,sv,tr,uk,vi,zh', 'non', '2022-03-23 03:55:48'),
('langue_site', 'es', 'non', '2023-04-12 02:59:27'),
('email_webmaster', 'hosmmer.eduardo@gmail.com', 'oui', '2023-11-23 00:30:25'),
('nom_site', 'ApiSpip', 'oui', '2022-03-23 04:01:57'),
('slogan_site', '', 'oui', '2022-03-23 03:55:48'),
('adresse_site', 'http://api.compucel.co', 'non', '2022-03-23 03:55:50'),
('descriptif_site', '', 'oui', '2022-03-23 03:55:48'),
('activer_logos', 'oui', 'oui', '2022-03-23 03:55:48'),
('activer_logos_survol', 'non', 'oui', '2022-03-23 03:55:48'),
('articles_surtitre', 'non', 'oui', '2022-03-23 03:55:48'),
('articles_soustitre', 'non', 'oui', '2022-03-23 03:55:48'),
('articles_descriptif', 'non', 'oui', '2022-03-23 03:55:48'),
('articles_chapeau', 'non', 'oui', '2022-03-23 03:55:48'),
('articles_texte', 'oui', 'oui', '2022-03-23 03:55:48'),
('articles_ps', 'non', 'oui', '2022-03-23 03:55:48'),
('articles_redac', 'non', 'oui', '2022-03-23 03:55:48'),
('post_dates', 'non', 'oui', '2022-03-23 03:55:48'),
('articles_urlref', 'non', 'oui', '2022-03-23 03:55:48'),
('articles_redirection', 'non', 'oui', '2022-03-23 03:55:48'),
('creer_preview', 'non', 'non', '2022-03-23 03:55:50'),
('taille_preview', '150', 'non', '2022-03-23 03:55:50'),
('articles_modif', 'non', 'oui', '2022-03-23 03:55:48'),
('rubriques_descriptif', 'non', 'oui', '2022-03-23 03:55:48'),
('rubriques_texte', 'oui', 'oui', '2022-03-23 03:55:48'),
('accepter_inscriptions', 'non', 'oui', '2022-03-23 03:55:48'),
('accepter_visiteurs', 'non', 'oui', '2022-03-23 03:55:48'),
('prevenir_auteurs', 'non', 'oui', '2022-03-23 03:55:48'),
('suivi_edito', 'non', 'oui', '2022-03-23 03:55:48'),
('adresse_suivi', '', 'oui', '2022-03-23 03:55:48'),
('adresse_suivi_inscription', '', 'oui', '2022-03-23 03:55:48'),
('adresse_neuf', '', 'oui', '2022-03-23 03:55:48'),
('jours_neuf', '', 'oui', '2022-03-23 03:55:48'),
('quoi_de_neuf', 'non', 'oui', '2022-03-23 03:55:48'),
('preview', ',0minirezo,1comite,', 'oui', '2022-03-23 03:55:48'),
('syndication_integrale', 'oui', 'oui', '2022-03-23 03:55:48'),
('dir_img', 'IMG/', 'oui', '2022-03-23 03:55:48'),
('multi_rubriques', 'non', 'oui', '2022-03-23 03:55:48'),
('multi_secteurs', 'non', 'oui', '2022-03-23 03:55:48'),
('gerer_trad', 'non', 'oui', '2022-03-23 03:55:48'),
('langues_multilingue', '', 'oui', '2022-03-23 03:55:48'),
('version_html_max', 'html4', 'oui', '2022-03-23 03:55:48'),
('type_urls', 'page', 'oui', '2022-03-23 03:55:48'),
('email_envoi', '', 'oui', '2022-03-23 03:55:48'),
('auto_compress_http', 'non', 'oui', '2022-03-23 03:55:48'),
('mots_cles_forums', 'non', 'oui', '2022-03-23 03:55:48'),
('forums_titre', 'oui', 'oui', '2022-03-23 03:55:48'),
('forums_texte', 'oui', 'oui', '2022-03-23 03:55:48'),
('forums_urlref', 'non', 'oui', '2022-03-23 03:55:48'),
('forums_afficher_barre', 'oui', 'oui', '2022-03-23 03:55:48'),
('forums_forcer_previsu', 'oui', 'oui', '2022-03-23 03:55:48'),
('formats_documents_forum', '', 'oui', '2022-03-23 03:55:48'),
('forums_publics', 'posteriori', 'oui', '2022-03-23 03:55:48'),
('forum_prive', 'oui', 'oui', '2022-03-23 03:55:48'),
('forum_prive_objets', 'oui', 'oui', '2022-03-23 03:55:48'),
('forum_prive_admin', 'non', 'oui', '2022-03-23 03:55:48'),
('articles_mots', 'non', 'oui', '2022-03-23 03:55:48'),
('config_precise_groupes', 'non', 'oui', '2022-03-23 03:55:48'),
('barre_outils_public', 'oui', 'oui', '2022-03-23 03:55:48'),
('objets_versions', 'a:0:{}', 'oui', '2022-03-23 03:55:50'),
('activer_sites', 'non', 'oui', '2022-03-23 03:55:48'),
('proposer_sites', '0', 'oui', '2022-03-23 03:55:48'),
('activer_syndic', 'oui', 'oui', '2022-03-23 03:55:48'),
('moderation_sites', 'non', 'oui', '2022-03-23 03:55:48'),
('activer_statistiques', 'non', 'oui', '2022-03-23 03:55:48'),
('activer_captures_referers', 'non', 'oui', '2022-03-23 03:55:48'),
('activer_referers', 'oui', 'oui', '2022-03-23 03:55:48'),
('auto_compress_js', 'non', 'oui', '2022-03-23 03:55:48'),
('auto_compress_css', 'non', 'oui', '2022-03-23 03:55:48'),
('url_statique_ressources', '', 'oui', '2022-03-23 03:55:48'),
('documents_objets', 'spip_articles', 'oui', '2022-03-23 03:55:48'),
('documents_date', 'non', 'oui', '2022-03-23 03:55:48'),
('langues_utilisees', 'es', 'oui', '2023-04-21 03:45:19'),
('plugin', 'a:69:{s:4:\"SPIP\";a:5:{s:3:\"nom\";s:4:\"SPIP\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"4.0.0\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:0:\"\";}s:7:\"ADMINER\";a:5:{s:3:\"nom\";s:7:\"Adminer\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:7:\"4.8.1.0\";s:3:\"dir\";s:7:\"adminer\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:4:\"AIDE\";a:5:{s:3:\"nom\";s:9:\"Aide SPIP\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"2.0.2\";s:3:\"dir\";s:4:\"aide\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:10:\"ARCHIVISTE\";a:5:{s:3:\"nom\";s:10:\"Archiviste\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"1.0.1\";s:3:\"dir\";s:10:\"archiviste\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:9:\"COMPAGNON\";a:5:{s:3:\"nom\";s:9:\"Compagnon\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"2.0.2\";s:3:\"dir\";s:9:\"compagnon\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:4:\"DUMP\";a:5:{s:3:\"nom\";s:4:\"Dump\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:6:\"1.10.2\";s:3:\"dir\";s:4:\"dump\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:6:\"IMAGES\";a:5:{s:3:\"nom\";s:6:\"Images\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"3.0.2\";s:3:\"dir\";s:14:\"filtres_images\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:5:\"FORUM\";a:5:{s:3:\"nom\";s:5:\"Forum\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"2.0.2\";s:3:\"dir\";s:5:\"forum\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:8:\"MEDIABOX\";a:5:{s:3:\"nom\";s:8:\"MediaBox\";s:4:\"etat\";s:4:\"test\";s:7:\"version\";s:5:\"2.0.2\";s:3:\"dir\";s:8:\"mediabox\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:4:\"MOTS\";a:5:{s:3:\"nom\";s:4:\"Mots\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"3.0.2\";s:3:\"dir\";s:4:\"mots\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:4:\"PLAN\";a:5:{s:3:\"nom\";s:35:\"Plan du site dans l’espace privé\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"3.0.2\";s:3:\"dir\";s:4:\"plan\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:11:\"PORTE_PLUME\";a:5:{s:3:\"nom\";s:11:\"Porte plume\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"2.0.2\";s:3:\"dir\";s:11:\"porte_plume\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:9:\"REVISIONS\";a:5:{s:3:\"nom\";s:10:\"Révisions\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"2.0.2\";s:3:\"dir\";s:9:\"revisions\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:8:\"SAFEHTML\";a:5:{s:3:\"nom\";s:8:\"SafeHTML\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"2.0.3\";s:3:\"dir\";s:8:\"safehtml\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:5:\"SITES\";a:5:{s:3:\"nom\";s:5:\"Sites\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"3.0.2\";s:3:\"dir\";s:5:\"sites\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:5:\"STATS\";a:5:{s:3:\"nom\";s:12:\"Statistiques\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"2.0.2\";s:3:\"dir\";s:12:\"statistiques\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:2:\"TW\";a:5:{s:3:\"nom\";s:19:\"TextWheel pour SPIP\";s:4:\"etat\";s:4:\"test\";s:7:\"version\";s:5:\"2.0.2\";s:3:\"dir\";s:9:\"textwheel\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:4:\"URLS\";a:5:{s:3:\"nom\";s:13:\"Urls Etendues\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"3.0.2\";s:3:\"dir\";s:13:\"urls_etendues\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:10:\"ITERATEURS\";a:5:{s:3:\"nom\";s:10:\"iterateurs\";s:7:\"version\";s:5:\"1.0.6\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:18:\"procure:iterateurs\";}s:5:\"QUEUE\";a:5:{s:3:\"nom\";s:5:\"queue\";s:7:\"version\";s:5:\"0.6.8\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:13:\"procure:queue\";}s:6:\"JQUERY\";a:5:{s:3:\"nom\";s:6:\"jquery\";s:7:\"version\";s:5:\"3.6.0\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:14:\"procure:jquery\";}s:3:\"PHP\";a:5:{s:3:\"nom\";s:3:\"php\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:11:\"procure:php\";}s:8:\"PHP:CORE\";a:5:{s:3:\"nom\";s:8:\"php:Core\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:16:\"procure:php:Core\";}s:10:\"PHP:BCMATH\";a:5:{s:3:\"nom\";s:10:\"php:bcmath\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:18:\"procure:php:bcmath\";}s:12:\"PHP:CALENDAR\";a:5:{s:3:\"nom\";s:12:\"php:calendar\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:20:\"procure:php:calendar\";}s:9:\"PHP:CTYPE\";a:5:{s:3:\"nom\";s:9:\"php:ctype\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:17:\"procure:php:ctype\";}s:8:\"PHP:DATE\";a:5:{s:3:\"nom\";s:8:\"php:date\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:16:\"procure:php:date\";}s:10:\"PHP:FILTER\";a:5:{s:3:\"nom\";s:10:\"php:filter\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:18:\"procure:php:filter\";}s:8:\"PHP:HASH\";a:5:{s:3:\"nom\";s:8:\"php:hash\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:16:\"procure:php:hash\";}s:9:\"PHP:ICONV\";a:5:{s:3:\"nom\";s:9:\"php:iconv\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:17:\"procure:php:iconv\";}s:8:\"PHP:JSON\";a:5:{s:3:\"nom\";s:8:\"php:json\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:16:\"procure:php:json\";}s:7:\"PHP:SPL\";a:5:{s:3:\"nom\";s:7:\"php:SPL\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:15:\"procure:php:SPL\";}s:8:\"PHP:PCRE\";a:5:{s:3:\"nom\";s:8:\"php:pcre\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:16:\"procure:php:pcre\";}s:10:\"PHP:RANDOM\";a:5:{s:3:\"nom\";s:10:\"php:random\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:18:\"procure:php:random\";}s:12:\"PHP:READLINE\";a:5:{s:3:\"nom\";s:12:\"php:readline\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:20:\"procure:php:readline\";}s:14:\"PHP:REFLECTION\";a:5:{s:3:\"nom\";s:14:\"php:Reflection\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:22:\"procure:php:Reflection\";}s:11:\"PHP:SESSION\";a:5:{s:3:\"nom\";s:11:\"php:session\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:19:\"procure:php:session\";}s:12:\"PHP:STANDARD\";a:5:{s:3:\"nom\";s:12:\"php:standard\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:20:\"procure:php:standard\";}s:11:\"PHP:MYSQLND\";a:5:{s:3:\"nom\";s:11:\"php:mysqlnd\";s:7:\"version\";s:14:\"mysqlnd 8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:19:\"procure:php:mysqlnd\";}s:13:\"PHP:TOKENIZER\";a:5:{s:3:\"nom\";s:13:\"php:tokenizer\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:21:\"procure:php:tokenizer\";}s:8:\"PHP:ZLIB\";a:5:{s:3:\"nom\";s:8:\"php:zlib\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:16:\"procure:php:zlib\";}s:10:\"PHP:LIBXML\";a:5:{s:3:\"nom\";s:10:\"php:libxml\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:18:\"procure:php:libxml\";}s:7:\"PHP:DOM\";a:5:{s:3:\"nom\";s:7:\"php:dom\";s:7:\"version\";s:8:\"20031129\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:15:\"procure:php:dom\";}s:7:\"PHP:PDO\";a:5:{s:3:\"nom\";s:7:\"php:PDO\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:15:\"procure:php:PDO\";}s:7:\"PHP:BZ2\";a:5:{s:3:\"nom\";s:7:\"php:bz2\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:15:\"procure:php:bz2\";}s:13:\"PHP:SIMPLEXML\";a:5:{s:3:\"nom\";s:13:\"php:SimpleXML\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:21:\"procure:php:SimpleXML\";}s:7:\"PHP:XML\";a:5:{s:3:\"nom\";s:7:\"php:xml\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:15:\"procure:php:xml\";}s:13:\"PHP:XMLREADER\";a:5:{s:3:\"nom\";s:13:\"php:xmlreader\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:21:\"procure:php:xmlreader\";}s:13:\"PHP:XMLWRITER\";a:5:{s:3:\"nom\";s:13:\"php:xmlwriter\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:21:\"procure:php:xmlwriter\";}s:18:\"PHP:APACHE2HANDLER\";a:5:{s:3:\"nom\";s:18:\"php:apache2handler\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:26:\"procure:php:apache2handler\";}s:11:\"PHP:OPENSSL\";a:5:{s:3:\"nom\";s:11:\"php:openssl\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:19:\"procure:php:openssl\";}s:8:\"PHP:CURL\";a:5:{s:3:\"nom\";s:8:\"php:curl\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:16:\"procure:php:curl\";}s:12:\"PHP:FILEINFO\";a:5:{s:3:\"nom\";s:12:\"php:fileinfo\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:20:\"procure:php:fileinfo\";}s:11:\"PHP:GETTEXT\";a:5:{s:3:\"nom\";s:11:\"php:gettext\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:19:\"procure:php:gettext\";}s:12:\"PHP:MBSTRING\";a:5:{s:3:\"nom\";s:12:\"php:mbstring\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:20:\"procure:php:mbstring\";}s:8:\"PHP:EXIF\";a:5:{s:3:\"nom\";s:8:\"php:exif\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:16:\"procure:php:exif\";}s:10:\"PHP:MYSQLI\";a:5:{s:3:\"nom\";s:10:\"php:mysqli\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:18:\"procure:php:mysqli\";}s:13:\"PHP:PDO_MYSQL\";a:5:{s:3:\"nom\";s:13:\"php:pdo_mysql\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:21:\"procure:php:pdo_mysql\";}s:14:\"PHP:PDO_SQLITE\";a:5:{s:3:\"nom\";s:14:\"php:pdo_sqlite\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:22:\"procure:php:pdo_sqlite\";}s:8:\"PHP:PHAR\";a:5:{s:3:\"nom\";s:8:\"php:Phar\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:16:\"procure:php:Phar\";}s:7:\"PHP:FTP\";a:5:{s:3:\"nom\";s:7:\"php:ftp\";s:7:\"version\";s:6:\"8.2.12\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:14:\"_DIR_RESTREINT\";s:3:\"dir\";s:15:\"procure:php:ftp\";}s:7:\"CSSTIDY\";a:5:{s:3:\"nom\";s:7:\"csstidy\";s:7:\"version\";s:6:\"1.15.1\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";s:3:\"dir\";s:27:\"compresseur/procure:csstidy\";}s:7:\"MINIDOC\";a:5:{s:3:\"nom\";s:7:\"minidoc\";s:7:\"version\";s:5:\"1.0.3\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";s:3:\"dir\";s:22:\"medias/procure:minidoc\";}s:5:\"ORDOC\";a:5:{s:3:\"nom\";s:5:\"ordoc\";s:7:\"version\";s:5:\"1.1.2\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";s:3:\"dir\";s:20:\"medias/procure:ordoc\";}s:4:\"MEJS\";a:5:{s:3:\"nom\";s:4:\"mejs\";s:7:\"version\";s:5:\"4.2.7\";s:4:\"etat\";s:1:\"?\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";s:3:\"dir\";s:19:\"medias/procure:mejs\";}s:5:\"BIGUP\";a:5:{s:3:\"nom\";s:10:\"Big Upload\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"2.0.2\";s:3:\"dir\";s:5:\"bigup\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:11:\"COMPRESSEUR\";a:5:{s:3:\"nom\";s:11:\"Compresseur\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:6:\"1.15.2\";s:3:\"dir\";s:11:\"compresseur\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:6:\"MEDIAS\";a:5:{s:3:\"nom\";s:6:\"Medias\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"3.2.0\";s:3:\"dir\";s:6:\"medias\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}s:3:\"SVP\";a:5:{s:3:\"nom\";s:3:\"SVP\";s:4:\"etat\";s:6:\"stable\";s:7:\"version\";s:5:\"2.4.0\";s:3:\"dir\";s:3:\"svp\";s:8:\"dir_type\";s:17:\"_DIR_PLUGINS_DIST\";}}', 'non', '2024-05-16 22:19:14'),
('plugin_attente', 'a:0:{}', 'oui', '2022-03-23 03:55:48'),
('compagnon', 'a:3:{s:6:\"config\";a:1:{s:7:\"activer\";s:3:\"oui\";}i:1;a:3:{s:7:\"accueil\";i:1;s:19:\"accueil_publication\";i:1;s:18:\"accueil_configurer\";i:1;}i:4;a:1:{s:7:\"accueil\";i:1;}}', 'oui', '2023-04-12 03:04:43'),
('compagnon_base_version', '1.0.0', 'oui', '2022-03-23 03:55:50'),
('forum_base_version', '1.2.2', 'oui', '2022-03-23 03:55:50'),
('mots_base_version', '2.1.1', 'oui', '2022-03-23 03:55:50'),
('revisions_base_version', '1.2.0', 'oui', '2022-03-23 03:55:50'),
('sites_base_version', '1.2.0', 'oui', '2022-03-23 03:55:50'),
('stats_base_version', '1.0.1', 'oui', '2022-03-23 03:55:50'),
('urls_base_version', '2.0.1', 'oui', '2022-03-23 03:55:50'),
('bigup', 'a:1:{s:13:\"max_file_size\";i:1024;}', 'oui', '2022-03-23 03:55:50'),
('bigup_base_version', '1.0.1', 'oui', '2022-03-23 03:55:50'),
('medias_base_version', '1.7.0', 'oui', '2022-03-23 03:55:50'),
('svp_base_version', '0.6.1', 'oui', '2022-03-23 03:55:50'),
('plugin_installes', 'a:10:{i:0;s:9:\"compagnon\";i:1;s:5:\"forum\";i:2;s:4:\"mots\";i:3;s:9:\"revisions\";i:4;s:5:\"sites\";i:5;s:12:\"statistiques\";i:6;s:13:\"urls_etendues\";i:7;s:5:\"bigup\";i:8;s:6:\"medias\";i:9;s:3:\"svp\";}', 'oui', '2022-03-23 03:55:50'),
('cache_signature', '4f5da491cd5b636fa53d3d26389eced86a19871f45a9bc1e98f6422f0b91d467', 'oui', '2022-03-23 03:55:55'),
('secret_du_site', '06ae4348247c31d30412837a30aa8d501bb09301d45f1c755d8a6e3a7aafab49', 'oui', '2022-03-23 03:55:55'),
('optimiser_table', 'i:11;', 'oui', '2024-06-10 02:46:05'),
('info_maj_spip', '4.0.0|<a class=\'info_maj_spip\' href=\'https://www.spip.net/fr_update\' title=\'4.0.11\'>La versión 4.0.11 de SPIP está disponible | Una nueva  versión SPIP 4.1.0 está disponible</a>', 'non', '2023-04-13 15:07:50'),
('sha_256_only', 'oui', 'oui', '2022-03-23 04:02:38'),
('derniere_modif_auteur', '1713922806', 'oui', '2024-04-24 01:40:06'),
('derniere_modif', '1713922806', 'oui', '2024-04-24 01:40:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_mots`
--

CREATE TABLE `api_mots` (
  `id_mot` bigint(21) NOT NULL,
  `titre` text NOT NULL DEFAULT '',
  `descriptif` text NOT NULL DEFAULT '',
  `texte` longtext NOT NULL DEFAULT '',
  `id_groupe` bigint(21) NOT NULL DEFAULT 0,
  `type` text NOT NULL DEFAULT '',
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_mots_liens`
--

CREATE TABLE `api_mots_liens` (
  `id_mot` bigint(21) NOT NULL DEFAULT 0,
  `id_objet` bigint(21) NOT NULL DEFAULT 0,
  `objet` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_paquets`
--

CREATE TABLE `api_paquets` (
  `id_paquet` bigint(21) NOT NULL,
  `id_plugin` bigint(21) NOT NULL,
  `prefixe` varchar(48) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(24) NOT NULL DEFAULT '',
  `version_base` varchar(24) NOT NULL DEFAULT '',
  `compatibilite_spip` varchar(24) NOT NULL DEFAULT '',
  `branches_spip` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL DEFAULT '',
  `auteur` text NOT NULL DEFAULT '',
  `credit` text NOT NULL DEFAULT '',
  `licence` text NOT NULL DEFAULT '',
  `copyright` text NOT NULL DEFAULT '',
  `lien_doc` text NOT NULL DEFAULT '',
  `lien_demo` text NOT NULL DEFAULT '',
  `lien_dev` text NOT NULL DEFAULT '',
  `etat` varchar(16) NOT NULL DEFAULT '',
  `etatnum` int(1) NOT NULL DEFAULT 0,
  `dependances` text NOT NULL DEFAULT '',
  `procure` text NOT NULL DEFAULT '',
  `date_crea` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `date_modif` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `id_depot` bigint(21) NOT NULL DEFAULT 0,
  `nom_archive` varchar(255) NOT NULL DEFAULT '',
  `nbo_archive` int(11) NOT NULL DEFAULT 0,
  `maj_archive` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `src_archive` varchar(255) NOT NULL DEFAULT '',
  `traductions` text NOT NULL DEFAULT '',
  `actif` varchar(3) NOT NULL DEFAULT 'non',
  `installe` varchar(3) NOT NULL DEFAULT 'non',
  `recent` int(2) NOT NULL DEFAULT 0,
  `maj_version` varchar(255) NOT NULL DEFAULT '',
  `superieur` varchar(3) NOT NULL DEFAULT 'non',
  `obsolete` varchar(3) NOT NULL DEFAULT 'non',
  `attente` varchar(3) NOT NULL DEFAULT 'non',
  `constante` varchar(30) NOT NULL DEFAULT '',
  `signature` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `api_paquets`
--

INSERT INTO `api_paquets` (`id_paquet`, `id_plugin`, `prefixe`, `logo`, `version`, `version_base`, `compatibilite_spip`, `branches_spip`, `description`, `auteur`, `credit`, `licence`, `copyright`, `lien_doc`, `lien_demo`, `lien_dev`, `etat`, `etatnum`, `dependances`, `procure`, `date_crea`, `date_modif`, `id_depot`, `nom_archive`, `nbo_archive`, `maj_archive`, `src_archive`, `traductions`, `actif`, `installe`, `recent`, `maj_version`, `superieur`, `obsolete`, `attente`, `constante`, `signature`) VALUES
(1, 1, 'AIDE', 'aide-logo.svg', '002.000.002', '', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]يتيح هذا الملحق إدخال تعليمات فورية على SPIP يُدلّ اليها برمز معين. يمكن تعميم هذه التعليمات على ملاحق أخرى.[en]This plug-in includes a contextual help in SPIP which is indicated by an icon. This help can be extended to other plug-ins.[fr]Ce plugin permet d’inclure dans SPIP une aide contextuelle repérée par un icone. Cette aide peut-être étendue aussi aux plugins.[pt_br]Este plugin permite incluir ajuda contextual no SPIP, acessível por um ícone. Esta ajuda pode ser também extendida aos plugins.</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', 'a:1:{i:1;a:2:{s:3:\"nom\";s:3:\"GPL\";s:3:\"url\";s:40:\"http://www.gnu.org/licenses/gpl-3.0.html\";}}', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'aide', '', 'oui', 'non', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', '206c001088749b8cd177c432336b594d'),
(2, 2, 'ARCHIVISTE', 'prive/themes/spip/images/archiviste.svg', '001.000.001', '', '[4.0.0;4.0.*]', '4.0', '<multi>[fr]Permet d’emballer ou déballer des archives de fichiers Zip, Tar, …[pt_br]Permite comprimir ou expandir arquivos Zip, Tar, ...</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', 'a:1:{i:1;a:2:{s:3:\"nom\";s:3:\"GPL\";s:3:\"url\";s:40:\"http://www.gnu.org/licenses/gpl-3.0.html\";}}', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'archiviste', '', 'oui', 'non', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', '2ef7741d17c08b5e0946df770d3cee22'),
(3, 3, 'BIGUP', 'prive/themes/spip/images/bigup-64.png', '002.000.002', '1.0.1', '[4.0.0;4.0.*]', '4.0', '<multi>[de]... wie der Name schon sagt ...</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:19:\"Matthieu Marcillaud\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', 'a:3:{i:1;a:2:{s:3:\"nom\";s:15:\"Neurovit (logo)\";s:3:\"url\";s:59:\"https://www.iconfinder.com/icons/48761/add_file_upload_icon\";}i:2;a:2:{s:3:\"nom\";s:25:\"23 Company (resumable.js)\";s:3:\"url\";s:22:\"http://resumablejs.com\";}i:3;a:2:{s:3:\"nom\";s:7:\"Flow.js\";s:3:\"url\";s:33:\"https://github.com/flowjs/flow.js\";}}', 'a:1:{i:1;a:2:{s:3:\"nom\";s:7:\"GNU/GPL\";s:3:\"url\";s:0:\"\";}}', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:1:{i:0;a:1:{s:3:\"php\";a:2:{s:3:\"nom\";s:3:\"php\";s:13:\"compatibilite\";s:8:\"[5.4.0;[\";}}}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:1:{i:0;a:1:{s:7:\"saisies\";a:2:{s:3:\"nom\";s:7:\"saisies\";s:13:\"compatibilite\";s:9:\"[2.17.1;]\";}}}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'bigup', '', 'oui', 'oui', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', 'e207bfdaaade83732bf8a0e12de64ec7'),
(4, 4, 'COMPAGNON', 'prive/themes/spip/images/compagnon-32.png', '002.000.002', '1.0.0', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]يقدم الرفيق مساعدة للمستخدمين\n		لدى أول زيارة لهم الى المجال الخاص في SPIP.[br]An ambrouger a ginnig sikour d’an implijerien\n		da vare ar c’hentañ weladenn el lec’h prevez SPIP.[de]Der Begleiter hilft neuen Benutzern bei ihren ersten Schritten im SPIP Redaktionssystem.[en]The companion provides assistance to users\nduring their first visit to the backoffice of SPIP.[eo]La kompano proponas helpon por uzantoj dum liaj unuaj vizitoj al SPIP privata spaco.[es]El compañero ofrece ayuda a los usuarios durante su primera visita al espacio privado de SPIP.[fa]همراه به كاربران در جريان نخستين ازديدشان از قسمت خصوصي اسپيپ كمك ارايه مي‌كند.[fr]Le compagnon offre une aide aux utilisateurs\n		lors de leur première visite dans l’espace privé de SPIP.[fr_fem]Le compagnon offre une aide aux utilisatrices\n		lors de leur première visite dans l’espace privé de SPIP.[fr_tu]Le compagnon offre une aide aux utilisateurs\n		lors de leur première visite dans l’espace privé de SPIP.[hac]کەسی هامڕا چە یەکەمین سەردانیکەردەو نۋیسنگاو پەشتۊSPIP .خزمەتو بەکاربەرا کەرۊ[it]L’assistente fornisce una guida agli utenti durante la loro prima visita all’area riservata di SPIP.[ja]初めてSPIPの管理エリアをご訪問する時、仲間さんは、援助を提供してくださいます。[lb]De Compagnon bitt de Benotzer Hëllef beim éischte Benotze vum privaten Deel vu SPIP.[nl]De metgezel helpt de gebruikers tijdens\n		hun eerste bezoek in het privé-ruimte van SPIP[oc_ni_mis]Lou coumpàgnou fournisse una adjuda ai utilisaire\n		per la siéu premièra vìsita en l’espaci privat de SPIP.[pt]O guia oferece assistência as utilizadores durante a sua primeira visita à área privada de SPIP.[pt_br]O Companheiro oferece ajuda aos usuários, na primeira visita à área privada do SPIP.[ru]Плагин выводит справку о системе управления при первом входе пользователя в админку.[sk]Compagnon ponúka pomoc používateľom \n		pri ich prvej návšteve v súkromnej zóne SPIPu.[uk]Плагін виводить довідку про систему управління при першому вході користувача до адміністративної частини.</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:19:\"Matthieu Marcillaud\";s:3:\"url\";s:20:\"http://magraine.net/\";s:4:\"mail\";s:0:\"\";}}', 'a:1:{i:1;a:2:{s:3:\"nom\";s:36:\"Logo par Freepik de www.flaticon.com\";s:3:\"url\";s:40:\"https://www.flaticon.com/authors/freepik\";}}', 'a:1:{i:1;a:2:{s:3:\"nom\";s:7:\"GNU/GPL\";s:3:\"url\";s:0:\"\";}}', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'compagnon', '', 'oui', 'oui', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', '97957017224328e4357b38eb1f02b16f'),
(5, 5, 'COMPRESSEUR', 'images/compresseur-32.png', '001.015.002', '', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]ضغط أوراق الأنماط ورموز جافاسكريبت في ترويسة الصفحات في <code>ecrire/</code> و/او الموقع العمومي[br]Gwaskadurez css ha javascript en titouroù ar pajennoù html deus <code>ecrire/</code> ha/pe deus al lec’h publik[de]Kompression von CSS und Javascript-Code im Kopf der Seiten unter <code>ecrire/</code> und/oder auf der öffentlichen Website[en]Compression of css and javascript in the header of the HTML pages of <code>ecrire/</code> and/or of the public site[eo]Densigo de la css kaj javascript en la kaplinio de HTML-paĝoj pri <code>ecrire/</code> kaj / aŭ de la publika retejo[es]Compresión de css y javascript en los encabezados de las páginas HTML de <code>ecrire/</code> y/o del sitio público[fa]و/يا سايت همگاني <code>ecrire/</code> فشرده‌سازي سي.اس.اس‌ها و جاوا اسكريپت در سرصفحه‌ي صفحات اچ.تي.ام.ال‌[fr]Compression des css et javascript dans l’en-tête des pages html de <code>ecrire/</code> et/ou du site public[fr_fem]Compression des css et javascript dans l’en-tête des pages html de <code>ecrire/</code> et/ou du site public[fr_tu]Compression des css et javascript dans l’en-tête des pages html de <code>ecrire/</code> et/ou du site public[hac]دروسکەودەی فشاردریاو سی‌ئێس‌ئێس و جاڤا سکریپتی چە لاو سەری  پەڕەکاۋە چیرو<code>ecrire/</code> و/یا سەرو پەڕەی سەرەكی پەڕیانەكەیۆ[it]Compressione di CSS e javascript \nnell’intestazione delle pagine html di <code>ecrire/</code> e/o del sito pubblico pubblico.[ja]<code>ecrire/</code>と言うhtmlページや公開サイトのヘッダーにあるCSSとjavascriptの圧縮[lb]Compressioun vun CSS a Javascript am Header vun den HTML-Säiten vun <code>ecrire/</code> an/oder dem ëffentleche Site[nl]Compressie van CSS en JavaScript in de heading van HTML-paginas uit <code>ecrire/</code> en/of van het publieke site.[oc_ni_mis]Coumpressioun dei css e javascript en la prima-testa dei pàgina html de <code>ecrire/</code> e/o dóu sit pùblicou[pt]Compressão de css e javascript no cabeçalho das páginas HTML de <code>ecrire/</code> e/ou do sítio público.[pt_br]Compressão dos css e javascript nos cabeçalhos das páginas html de <code>ecrire/</code> e/ou do site público[ru]Сжимает css и javascript файлы для уменьшения времени загрузки. Используется как на основном сайте, так и в его администраторской части <code>ecrire/</code>[sk]Kompresia css a javascriptu v hlavičke html stránok <code>ecrire/</code> a/lebo na verejne prístupnej stránke[uk]Стискає css та javascript файли для зменьшення часу завантаження. Використовується як на основному сайті, так і в його адміністративній частині <code>ecrire/</code></multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', 'a:2:{i:1;a:2:{s:3:\"nom\";s:14:\"Cerdic/CSSTidy\";s:3:\"url\";s:33:\"https://github.com/Cerdic/CSSTidy\";}i:2;a:2:{s:3:\"nom\";s:36:\"Icon par Freepik de www.flaticon.com\";s:3:\"url\";s:40:\"https://www.flaticon.com/authors/freepik\";}}', 'a:1:{i:1;a:2:{s:3:\"nom\";s:3:\"GPL\";s:3:\"url\";s:40:\"http://www.gnu.org/licenses/gpl-3.0.html\";}}', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:1:{i:0;a:1:{s:11:\"porte_plume\";a:2:{s:3:\"nom\";s:11:\"porte_plume\";s:13:\"compatibilite\";s:9:\"[1.19.0;]\";}}}}', 'a:1:{s:7:\"CSSTIDY\";s:6:\"1.15.1\";}', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'compresseur', '', 'oui', 'non', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', 'a6f8fab998a2d8a2835805a90ffe5c01'),
(6, 6, 'DUMP', 'prive/themes/spip/images/base-backup-32.png', '001.010.002', '', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]نسخ احتياطي لقاعدة البيانات بتنسيق SQLite واسترجاعها[br]Gwared hag assevel deus an diaz titouroù e SQLite[de]Sicherung und Wiederherstellung der Datenbank im SQLite-Format[en]Backup and restoration of the database in SQLite format[eo]Savkopio de la datumbazo en SQLite kaj restaŭro[es]Copia de seguridad en SQLite y recuperación[fa]بك‌آپ و ذخيره‌سازي پايگاه داده‌ها در فرمت اس.كيو.لايت[fr]Sauvegarde de la base en SQLite et restauration[fr_fem]Sauvegarde de la base de données en SQLite et restauration[fr_tu]Sauvegarde de la base en SQLite et restauration[hac]پاشەکۆتکەرڎەی و ئەۋەگېڵنای داتابەیسی بە فۆرماتو SQLite[it]Backup e ripristino della base dati SQLite[ja]SQLiteにデータベースバックアップと復元[lb]Backup vun der Datebank als SQLite an Zeréckspillen[nl]Backup van de database in SQLite en restauratie[oc_ni_mis]Sauvagarda de la basa en SQLite e restauramen[pt]Cópia de segurança e restauro da base de dados em SQLite[pt_br]Cópia de segurança da base em SQLite e restauro[ru]Резервная копия в SQLite[sk]Záloha databázy v SQLite a jej obnovenie[uk]Резервне копіювання і відновлення бази даних у SQLite форматі</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', 'a:1:{i:1;a:2:{s:3:\"nom\";s:3:\"GPL\";s:3:\"url\";s:40:\"http://www.gnu.org/licenses/gpl-3.0.html\";}}', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'dump', '', 'oui', 'non', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', 'e114a9772fcab4f43c0c67ca787dae55'),
(7, 7, 'IMAGES', 'images/image_filtre-xx.svg', '003.000.002', '', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]مرشحات معالجة الصور والألوان[br]Siloù treuzfurmadur skeudennoù ha livioù[de]Bild- und Farbfilter[en]Images processing and colors filters[eo]Filtriloj de bild- kaj kolor-transformo[es]Filtros de transformación de imágenes y de colores[fa]فيلتر‌هاي پردازش تصوير‌ها و رنگ‌ها[fr]Filtres de transformation d’images et de couleurs[fr_fem]Filtres de transformation d’images et de couleurs[fr_tu]Filtres de transformation d’images et de couleurs[it]Filtri di trasformazione delle immagini e dei colori[ja]画像および色変換フィルタ[lb]Ännerungs-Filteren fir d’Biller an d’Faarwen[nl]Beeld en kleur transformatie filters[oc_ni_mis]Filtre de trasfourmacioun d’image e de coulou[pt]Processamento de imagens e filtros de cores[pt_br]Filtros de transformação de imagens e de cores[ru]Набор фильтров по работе с изображениями[sk]Filtre na transformáciu obrázkov a farieb[uk]Фільтри для обробки зображень і роботи з кольорами</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', 'a:1:{i:1;a:2:{s:3:\"nom\";s:3:\"GPL\";s:3:\"url\";s:40:\"http://www.gnu.org/licenses/gpl-3.0.html\";}}', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'filtres_images', '', 'oui', 'non', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', '7be13eba96f45dd2fc19fcadbf179a36'),
(8, 8, 'FORUM', 'prive/themes/spip/images/forum-32.png', '002.000.002', '1.2.2', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]منتدى SPIP (الخاص والعمومي)[ast]Foru de SPIP (priváu y públicu)[br]SPIP forum (prevez ha publik)[de]Foren in SPIP (Redaktionsbereich und öffentliche Website)[en]SPIP’s forum (private and public)[eo]SPIP-forumo (privata kaj publika)[es]Foros de SPIP (privado y público)[fa]سخنگاه اسپيپ (خصوصي همگاني)؟[fr]Forum de SPIP (privé et public)[fr_fem]Forum de SPIP (privé et public)[fr_tu]Forum de SPIP (privé et public)[hac]فۆڕومې ئێس‌پی‌ئای‌پی (تایبەتیی و گرڎینەیی)[it]Forum di SPIP (privati e pubblici)[ja]SPIPの掲示板（プライベートと公開）[lb]SPIP-Forum (privat an ëffentlech)[nl]Forum van SPIP (privé en openbaar)[oc_ni_mis]Fòrou de SPIP (privat e pùblicou)[pt]Fórum de SPIP (privado e público)[pt_br]Fórum do SPIP (privado e público)[ru]Форумы и комментарии в SPIP[sk]Diskusné fóra SPIPu (súkromné a verejné)[uk]Форуми у SPIP (загальні і редакційні)</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', '', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'forum', '', 'oui', 'oui', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', 'd14caeffdefd9e25b411d9e952b086e8'),
(9, 9, 'MEDIABOX', 'prive/themes/spip/images/mediabox-xx.svg', '002.000.002', '', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]افتراضياً، يتم إضفاء صندوق الفرجة على كل الوصلات الى الصور (لها نوع خاصية يصف mime/type الصورة) إضافة الى الوصلات المزودة بنمط &lt;code&gt;.mediabox&lt;/code&gt;.\n\n\n\nمن الممكن إعداد كل وصلة على حدة من خلال أنماط إضافية:\n\n-* يتيح &lt;code&gt;boxIframe&lt;/code&gt;  فتح الوصلة في إطار iframe\n\n-* يتيج &lt;code&gt;boxWidth-350px&lt;/code&gt; تحديد عرض ٣٥٠ نقطة للإطار\n\n-* يتيح &lt;code&gt;boxHeight-90pc&lt;/code&gt; تحديد ارتفاع ٩٠٪ للإطار\n\n\n\nوتتيح لوحة تحكم تعديل الإعدادات العامة حسب الرغبة كما تتيح اختيار شكل الصندوق من بين الأشكال المتاحة.\n\nيعمل هذا الملحق في الصفحات النموذجية التي تحتوي على علامة <code>#INSERT_HEAD</code>[br]Dre ziouer, an holl liammoù etrezek skeudennoù (gant un astenn o diskrivañ ar mime/stumm ar skeudenn) hag al liammoù gant ar rumm <code>.mediabox</code> a vez astennet gant ar voest miltimedia.\n	\n	Posubl eo kefluniañ pep liamm unan hag unan gant rummadoù ouzhpenn : \n\n-* <code>boxIframe</code> evit goulenn digeriñ al laimm e-barzh ur voest mod iframe ;\n\n-* <code>boxWidth-350px</code> evit spisañ ul ledander a 350px evit ar voest ;\n\n-* <code>boxHeight-90pc</code> evit spisañ un uhelder a 90% evit ar voest.\n	\nGant ur panel kefluniadur e c’hallit kemmañ ar penn-dibarzhoù giz ma plij deoc’h, hag ivez neuz ar voest gant ar stummoù kinniget.\n	\n	Ar plugin-se a ya gant skeledennoù oc’h ober gant an arouez\n <code>#INSERT_HEAD</code>[de]Alle Links zu Bildern (mit einem mime/type für Bilder) sowie Links mit der Klasse <code>.mediabox</code>werden in einer Multimedia-Box angezeigt.\n\nJeder Link kann einzeln um folgende Klassen ergänzt werden:\n\n-* <code>boxIframe</code> öffnet den Link als iFrame in einer Box;\n\n-* <code>boxWidth-350px</code>öffnet eine 350px breite Box;\n\n-* <code>boxHeight-90pc</code> öffnet eine 90% hohe Box;\n\nSie können die Voreinstellungen in einem Konfigurationsdialog einstellen, und das Standarddesign der Boxen auswählen.\n\nDieses Plugin benötigt den Tag <code>#INSERT_HEAD</code> im Kopf des Skeletts.[en]By default, all links to pictures (with a type attribute describing the mime/type of the picture) and\nlinks with the CSS class <code>.mediabox</code> are enriched by multimedia box.\n\nYou can configure each link on a case by case basis with additional classes:\n-* <code>boxIframe</code> enables to open link in iframe box; \n-* <code>boxWidth-350px</code> enables to specify a width of 350px for the box;\n-* <code>boxHeight-90pc</code> enables to specify a height of 90% for the box\n\nA configuration panel lets you edit the general settings to your liking, and the appearance of the box among the available skins.\n\nThis plugin works on skeletons which have the <code>#INSERT_HEAD</code> tag.[eo]Defaŭlte, ĉiujn ligilojn al bildoj (kun atributo „type“, kiu difinas la bildan MIME-tipon) kaj la ligilojn kun la klaso <code>.mediabox</code> pliriĉigas la plurmedia skatolo.\n \n	Eblas agordi ĉiun ligilon unuope per pliaj klasoj :\n	\n-* <code>boxIframe</code>, por ke la ligilo malfermiĝu en IFRAME-skatolo ;\n\n-* <code>boxWidth-350px</code> por skatolo largâ je 350px (px = bilderoj) ;\n\n-* <code>boxHeight-90pc</code> por skatolo alta je 90%.\n\n	Agordilaro ebligas vin modifi plurajn aspektojn laŭvole.\n	\n	Tiu kromprogramo funkcias ĉe la skeletoj, kiuj uzas la markon <code>#INSERT_HEAD</code>.[es]Por defecto, todos los enlaces definidos sobre imágenes (con un atributo tipo que describa el mime/type de la imafen) así como los enlaces con la clase <code>.mediabox</code> son enriquecidos por la caja multimedia.\n	\nEs posible configurar cada enlace, caso por caso, con clases adicionales:\n\n-* <code>boxIframe</code> permite abrir el enlace en una caja en un iframe ;\n\n-* <code>boxWidth-350px</code> permite definir un ancho de 350px para la caja;\n\n-* <code>boxHeight-90pc</code> perite definir un alto de 90% para la caja.\n\nUn panel de configuración permite modificar tanto las especificaciones generales como el aspecto de la caja, a partir de un conjunto de opciones disponibles. \n	\nEste plugin funciona en los esqueletos que incluyen la baliza <code>#INSERT_HEAD</code>[fr]Par défaut, tous les liens vers des images (avec un attribut type décrivant le mime/type de l’image) ainsi que les liens avec la classe <code>.mediabox</code> sont enrichis par la boîte multimédia.\n	\n	Il est possible de configurer chaque lien au cas par cas avec des classes supplémentaires :\n\n-* <code>boxIframe</code> permet de demander à ouvrir le lien dans une boîte en iframe ;\n\n-* <code>boxWidth-350px</code> permet de spécifier une largeur de 350px pour la boîte ;\n\n-* <code>boxHeight-90pc</code> permet de spécifier une hauteur de 90% pour la boîte.\n\n	Un panneau de configuration vous permet de modifier les réglages généraux à votre convenance, ainsi que l’aspect de la boîte parmi les habillages disponibles.\n	\n	Ce plugin fonctionne sur les squelettes disposant de la balise <code>#INSERT_HEAD</code>[fr_fem]Par défaut, tous les liens vers des images (avec un attribut type décrivant le mime/type de l’image) ainsi que les liens avec la classe <code>.mediabox</code> sont enrichis par la boîte multimédia.\n	\n	Il est possible de configurer chaque lien au cas par cas avec des classes supplémentaires :\n\n-* <code>boxIframe</code> permet de demander à ouvrir le lien dans une boîte en iframe ;\n\n-* <code>boxWidth-350px</code> permet de spécifier une largeur de 350px pour la boîte ;\n\n-* <code>boxHeight-90pc</code> permet de spécifier une hauteur de 90% pour la boîte.\n\n	Un panneau de configuration vous permet de modifier les réglages généraux à votre convenance, ainsi que l’aspect de la boîte parmi les habillages disponibles.\n	\n	Ce plugin fonctionne sur les squelettes disposant de la balise <code>#INSERT_HEAD</code>[fr_tu]Par défaut, tous les liens vers des images (avec un attribut type décrivant le mime/type de l’image) ainsi que les liens avec la classe <code>.mediabox</code> sont enrichis par la boîte multimédia.\n	\n	Il est possible de configurer chaque lien au cas par cas avec des classes supplémentaires :\n\n-* <code>boxIframe</code> permet de demander à ouvrir le lien dans une boîte en iframe ;\n\n-* <code>boxWidth-350px</code> permet de spécifier une largeur de 350px pour la boîte ;\n\n-* <code>boxHeight-90pc</code> permet de spécifier une hauteur de 90% pour la boîte.\n\n	Un panneau de configuration te permet de modifier les réglages généraux à ta convenance, ainsi que l’aspect de la boîte parmi les habillages disponibles.\n	\n	Ce plugin fonctionne sur les squelettes disposant de la balise <code>#INSERT_HEAD</code>[it]Per impostazione predefinita, tutti i collegamenti alle immagini (con un attributo che descrive il tipo mime/tipo di foto) e\ncollegamenti con il <code> classe CSS. mediabox </ code> sono arricchite da box multimediale.\n	\nÈ possibile configurare ogni collegamento in una caso per caso con le classi aggiuntive:\n- * <code> BoxIframe </ code> permette di aprire il collegamento nella casella iframe;\n- * <code> Boxwidth-350 pixel </ code> consente di specificare una larghezza di 350 pixel per il box;\n- * <code> BoxHeight-90pc </ code> consente di specificare una altezza di 90% per il box\n\nUn pannello di configurazione permette di modificare le impostazioni generali a proprio piacimento, e l’aspetto tra le skin disponibili.\n\nQuesto plugin funziona su scheletri che hanno la <code> INSERT_HEAD # </ code> tag.[ja]デフォルトでは、<code>.mediabox </code>クラスとのリンクだけでなく、画像へのすべてのリンクは（MIME/イメージタイプ）、マルチメディアボックスによって取り上げられます。\n\n追加のクラスを使用して、各リンクをケースバイケースで設定することができます。\n\n -* <code>boxIframe</code>はiframe内のボックスでリンクを開くように頼むことができます。\n\n -* <code>boxWidth-350px</code>でボックスの幅を350pxに指定できます。\n\n -* <code>boxHeight-90pc</code>では、ボックスの高さを90％に指定できます。\n\nコントロールパネルでは、便利なときに一般設定を変更できるほか、使用可能なスキンの中のボックスの外観も変更できます。\n\nこのプラグインは、<code>#INSERT_HEAD</code>タグを持つレイアウト上で動作します。[lb]Par défaut hunn all Linken op Biller (mat Attribut mime/type) a Linke mat der Klass <code>.mediabox</code> Zougrëff op d’Mediabox.\n\nAll Link ka mat zousätzleche Klassen agestallt ginn:\n-* <code>boxIframe</code> de Link soll an engem Iframe opgemach ginn;\n-* <code>boxWidth-350px</code> d’Box soll eng Breet vun 350 Pixel hun;\n-* <code>boxHeight-90pc</code> d’Box soll eng Héicht vun 90% hun.\n\nD’Astellung erlaabt de generelle Layout festzeleen, op Basis vun e puer Virlagen.\nDëse Plugin fonktionnéiert mat Skeletter déi den Tag <code>#INSERT_HEAD</code> hun.[nl]Standaard worden alle links naar afbeeldingen (met een type attribuut dat de mime/type beschrijft) en de links met een class <code>.mediabox </code> verrijkt door de mediabox.\n\nHet is mogelijk om elke link telkens met extra classes te configureren:\n\n- * <code>boxIframe</code> om de link in een iframe doos te tonen;\n\n- * <code>boxWidth-350px</code> om een boxbreedte van 350px te specificeren;\n\n- <code>boxHeight-90pc</code>  om een hoogte van 90% voor de box te specificeren.\n\nIn een configuratiepaneel kun je de algemene instellingen bewerken, alsmede het uiterlijk van de doos aanpassen met de beschikbare skins.\n\nDeze plugin werkt op de skeletten die het SPIP baken <code>#INSERT_HEAD</ code> gebruiken.[oc_ni_mis]En mancança, toui lu estac devers li image (embé un atribut type descrivent lou mime/type de l’image) couma pura lu estac embé la classa <code>.mediabox</code> soun enriquit per la bouòta multimedia.\n\n	Es poussible de counfigurà cada estac au cas per cas embé de classa suplementari :\n\n-* <code>boxIframe</code> permete de demandà a durbì l’estac en una bouòta iframe ;\n\n-* <code>boxWidth-350px</code> permete de spechificà una larguessa de 350px per la bouòta ;\n\n-* <code>boxHeight-90pc</code> permete de spechificà una autessa de 90% per la bouòta.\n\n	Un panèu de counfiguracioun vi permete de moudificà lu reglage general a la vouòstra counveniença, couma pura l’aspet de la bouòta tra lu abilhage dispounible.\n\n	Aqueu plugin founciouna soubre lu esquèletrou qu’an una balisa <code>#INSERT_HEAD</code>[pt]Por defeito, todas as ligações a imagens (com um atributo tipo que descreva o mime/type da imagem) e as ligações com a classe CSS <code>.mediabox</code> são enriquecidas pela caixa multimédia.\n	\n	É possível configurar cada ligação, caso a caso, com classes adicionais:\n\n-* <code>boxIframe</code> permite abrir uma ligação numa caixa iframe ;\n\n-* <code>boxWidth-350px</code> permite especificar uma largura de 350px para a caixa ;\n\n-* <code>boxHeight-90pc</code> permite especificar uma altura de 90% para a caixa.\n\n	Um painel de configuração permite-lhe editar as suas preferências gerais, e o aspecto da caixa, de entre as alternativas disponíveis.\n	\n	Este plugin funciona em modelos que tenham a tag <code>#INSERT_HEAD</code>[pt_br]Por padrão, todos os links para imagens (com um atributo do tipo que descreve o mime/type da imagem) assim como os links com a classe <code>.mediabox</code> são enriquecidos pela caixa multimedia.\n	\n	É possível configurar cada link ou caso a caso com classes suplementares:\n\n-* <code>boxIframe</code> permite oferecer de abrir o link numa caixa em iframe;\n\n-* <code>boxWidth-350px</code> permite especificar uma largura de 350px para a caixa;\n\n-* <code>boxHeight-90pc</code> permite especificar uma altura de 90% para a caixa.\n\n	Um painel de controle permite que você altere as configurações gerais, bem como a aparência da caixa entre os temas disponíveis.\n	\n	Esse plugin funciona nos templates com a tag <code>#INSERT_HEAD</code>[ru]По умолчанию все ссылки на картинки (файлы с соответствующим mime/type атрибутом) и ссылки с CSS классом <code>.mediabox</code> выводятся в сплывающем окне.\n	\n	Вы можете настроить класс ссылки для каждого конкретного случая :\n\n-* <code>boxIframe</code> позволяет открывать ссылки в iframe ;\n\n-* <code>boxWidth-350px</code> задает ширину всплывающего окна в 350px ;\n\n-* <code>boxHeight-90pc</code> задает высоту окна в 90%.\n\nВ настройках модуля вы можете изменять 	внешний вид блоков и прочие настройки.\n	Модуль работает только в случае, если вы добавляете <code>#INSERT_HEAD</code> в ваши шаблоны.[sk]Podľa predvolených nastavení všetky odkazy k obrázkom (s typom v parametre, ktorý uvádza mime/typ obrázka) a odkazy v triede <code>.mediabox</code> obohacuje multimediálny box.\n\nKaždý odkaz môžete osobitne nastaviť pomocou doplnkových tried:\n\n-* <code>boxIframe</code> umožňuje otvárať odkaz v ráme iframe,\n\n-* <code>boxWidth-350px</code> umožňuje definovať šírku poľa 350px,\n\n-* <code>boxHeight-90pc</code> umožňuje zadať výšku poľa 90%.\n\nOvládací panel vám umožňuje všeobecné nastavenia podľa vašich želaní vybrať dizajn boxu z dostupných vzhľadov.\n\nTento zásuvný modul spolupracuje so šablónami, ktoré obsahujú tag <code>#INSERT_HEAD</code>[uk]Зазвичай усі посилання на зображення (файли з відповідним mime/type атрибутом) і посилання з CSS класом <code>.mediabox</code> виводяться у вікні, що спливає.\n	\n	Ви можете налаштувати клас посилання для кожного випадку:\n\n-* <code>boxIframe</code> дозволяє відкривати посилання в iframe ;\n\n-* <code>boxWidth-350px</code> задає ширину спливаючого вікна у 350px ;\n\n-* <code>boxHeight-90pc</code> задає висоту вікна у 90%.\n\nВ налаштуваннях модуля ви можете змінити зовнішній вигляд блоків та інші налаштування.\n	Модуль працює лише в тому випадку, якщо ви додаєте тег <code>#INSERT_HEAD</code> до ваших шаблонів.</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', 'a:2:{i:1;a:2:{s:3:\"nom\";s:4:\"Lity\";s:3:\"url\";s:26:\"https://sorgalla.com/lity/\";}i:2;a:2:{s:3:\"nom\";s:37:\"Icon made by Freepik www.flaticon.com\";s:3:\"url\";s:23:\"http://www.freepik.com/\";}}', '', '', 'https://contrib.spip.net/MediaBox', '', '', 'test', 3, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'mediabox', '', 'oui', 'non', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', 'bfba302f345ceb3619eda122c6961d1a'),
(10, 10, 'MEDIAS', 'prive/themes/spip/images/portfolio-32.png', '003.002.000', '1.7.0', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]أدارة الوسائط المتعددة في SPIP[br]Merañ ar mediaoù SPIP[de]Medienverwaltung in  SPIP[en]SPIP’s media management[eo]Mastrumado de ĉiuspecaj dokumentoj de SPIP[es]Gestión de documentos multimedia de SPIP[fa]مديريت رسانه‌‌هاي اسپيپ[fr]Gestion des médias de SPIP[fr_fem]Gestion des médias de SPIP[fr_tu]Gestion des médias de SPIP[it]Gestione dei media di SPIP[ja]SPIPにおけるメディア管理[lb]Gestioun vun de Medien vu SPIP[nl]Beheer van de medias in SPIP[oc_ni_mis]Gestioun dei media de SPIP[pt]Gestão multimédia de SPIP[pt_br]Gerenciamento de mídias do SPIP[ru]Управление медиа файлами[sk]Správa multimédií v SPIPe[uk]Управління медіа-файлами</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', 'a:4:{i:1;a:2:{s:3:\"nom\";s:57:\"Cédric Morin, Romy Duhem-Verdière pour la médiathèque\";s:3:\"url\";s:0:\"\";}i:2;a:2:{s:3:\"nom\";s:8:\"getID3()\";s:3:\"url\";s:22:\"http://www.getid3.org/\";}i:3;a:2:{s:3:\"nom\";s:15:\"MediaElement.js\";s:3:\"url\";s:26:\"http://mediaelementjs.com/\";}i:4;a:2:{s:3:\"nom\";s:21:\"SVG Sanitizer v0.14.0\";s:3:\"url\";s:53:\"https://github.com/darylldoyle/svg-sanitizer/releases\";}}', '', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:1:{i:0;a:1:{s:10:\"archiviste\";a:2:{s:3:\"nom\";s:10:\"archiviste\";s:13:\"compatibilite\";s:8:\"[0.3.0;]\";}}}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:1:{i:0;a:3:{s:1:\"Z\";a:2:{s:3:\"nom\";s:1:\"Z\";s:13:\"compatibilite\";s:9:\"[1.7.30;]\";}s:8:\"mediabox\";a:2:{s:3:\"nom\";s:8:\"mediabox\";s:13:\"compatibilite\";s:8:\"[1.2.0;]\";}s:4:\"mots\";a:2:{s:3:\"nom\";s:4:\"mots\";s:13:\"compatibilite\";s:8:\"[2.9.0;]\";}}}}', 'a:3:{s:7:\"MINIDOC\";s:5:\"1.0.3\";s:5:\"ORDOC\";s:5:\"1.1.2\";s:4:\"MEJS\";s:5:\"4.2.7\";}', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'medias', '', 'oui', 'oui', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', '4a2700358946d888d3ae012adb1d5aa0'),
(11, 11, 'MOTS', 'prive/themes/spip/images/mot-32.png', '003.000.002', '2.1.1', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]المفاتيح ومجموعات المفاتيح[br]Gerioù ha strolladoù ger[de]Schlagworte und Schlagwortgruppen[en]Keywords and keywords groups[eo]Ŝlosilvortoj kaj grupoj de ŝlosilvortoj[es]Palabras clave y grupos de palabras clave[fa]واژه‌ها و گروه‌ واژه‌ها[fr]Mots et Groupes de mots[fr_fem]Mots-clef et Groupes de mots-clef[fr_tu]Mots et Groupes de mots[it]Parole e Gruppi di parole[ja]キーワードとキーワードのグループ[lb]Schlësselwierder a Gruppen[nl]Terfwoorden en groepen van trefwoorden[oc_ni_mis]Mot e Group de mot[pt]Palavras e grupos de palavras[pt_br]Palavras-chave e seus grupos[ru]Ключи и группы ключей[sk]Kľúčové slová a skupiny kľúčových slov[uk]Ключі та групи ключів</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', '', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'mots', '', 'oui', 'oui', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', 'bc0a591682a61d82710d03f796281a09'),
(12, 12, 'PLAN', 'prive/images/plan-xx.svg', '003.000.002', '', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]يحسن هذا الملحق صفحة «خرية الموقع» في المجال الخاص وذلك بعرض بنية يمكن فتحها وطيهاوإتاحة الترشيح حسب وضعية المقالات.[de]Dieses Plugin verbessert die « SItemap » des Redaktionssystems durch eine aufklappbare Baumstruktur mit einem Filter nach Artikelstatus.[en]This plugin improves the page \"Site Map\" of the private space by displaying a foldable structure and allowing to filter by article status.[eo]Tiu kromprogramo plibonigas la privatspacan paĝon „Mapo de la retejo“ per malfaldebla strukturo kaj filtrilo pri statuso de artikoloj.[fr]Ce plugin améliore la page « Plan du site » de l’espace privé en affichant une structure dépliable et en permettant de filtrer par statut d’articles.[fr_fem]Ce plugin améliore la page « Plan du site » de l’espace privé en affichant une structure dépliable et en permettant de filtrer par statut d’articles.[fr_tu]Ce plugin améliore la page « Plan du site » de l’espace privé en affichant une structure dépliable et en permettant de filtrer par statut d’articles.[ja]このプラグインは、折りたたみ可能な構造を表示し、記事のステータスでソートすることによって、管理エリアのページ「サイトマップ」を改善します。[nl]Deze plugin verbetert de weergave van de « Sitemap » in het privé gedeelte door een uitvouwbare structuur weet te geven waarin op status van artikel kan worden gefilterd.[pt_br]Este plugin melhora a página «Mapa do site » da área restrita, exibindo uma estrutura expansível e permitindo a filtragem pelo status das matérias.[sk]Tento zásuvný modul vylepší stránku „Mapa stránky“ v súkromej zóne tým, že zobrazí štruktúru stránky vo forme rozbaľovacieho modelu s možnosťou filtrovania článkov podľa stavu spracovania.</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:19:\"Matthieu Marcillaud\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', 'a:1:{i:1;a:2:{s:3:\"nom\";s:22:\"Ivan Bozhanov (jstree)\";s:3:\"url\";s:23:\"https://www.jstree.com/\";}}', 'a:1:{i:1;a:2:{s:3:\"nom\";s:7:\"GNU/GPL\";s:3:\"url\";s:0:\"\";}}', '', 'https://contrib.spip.net/4718', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'plan', '', 'oui', 'non', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', '069d262d2527d965349a246571ba8252'),
(13, 13, 'PORTE_PLUME', 'images/porte-plume-xx.svg', '002.000.002', '', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]الريشة هي شريط أدوات موسع لنظام SPIP يستخدم مكتبة جافاسكريبت [MarkItUp-&gt;http://markitup.jaysalvat.com/home/][de]Der Federhalter ist eine erweiterbare Werkzeugleiste für SPIP auf Grundlage der Javascript-Bibiliothek [MarkItUp->http://markitup.jaysalvat.com/home/][en]The Quill is a SPIP extensible toolbar which uses the [MarkItUp->http://markitup.jaysalvat.com/home/] javascript library.[eo]Plumingo estas etendebla ilobreto por SPIP, kiu uzas la Javascript-bibliotekon [MarkItUp->http://markitup.jaysalvat.com/home/][es]Porta pluma es una barra de herramientas extensible para SPIP que utiliza la librería javascript [MarkItUp->http://markitup.jaysalvat.com/home/][fa]چوب قلم يك نوار ابزار قابل گسترش براي اسپيپ است كه آرشيو جاوا اسكريپت [MarkItUp->http://markitup.jaysalvat.com/home/] را مورد استفاده قرار مي‌دهد.[fr]Porte plume est une barre d’outils extensible pour SPIP qui utilise la bibliothèque javascript [MarkItUp->http://markitup.jaysalvat.com/home/][fr_fem]Porte plume est une barre d’outils extensible pour SPIP qui utilise la bibliothèque javascript [MarkItUp->http://markitup.jaysalvat.com/home/][fr_tu]Porte plume est une barre d’outils extensible pour SPIP qui utilise la bibliothèque javascript [MarkItUp->http://markitup.jaysalvat.com/home/][it]Portapenne è una barra degli strumenti estensibile per SPIP che utilizza la libreria javascript [MarkItUp->http://markitup.jaysalvat.com/home/][nl]Penhouder is een rekbare werkbalk voor SPIP die gebruik van [MarkItUp->http://markitup.jaysalvat.com/home/] javascript library  maakt.[oc_ni_mis]Pouòrta-pluma es una barra d’óutis estensible per SPIP qu’utilisa la biblioutèca javascript [MarkItUp->http://markitup.jaysalvat.com/home/][pt]Pena é uma barra de ferramentas em SPIP que usa a biblioteca javascript [MarkItUp->http://markitup.jaysalvat.com/home/][pt_br]Porte plume é uma barra de feramentas para SPIP que utiliza a biblioteca javascript [MarkItUp->http://markitup.jaysalvat.com/home/][ru]Porte plume - расширение возможностей стандартного текстового редактора SPIP. Использует javascript библиотеку  [MarkItUp->http://markitup.jaysalvat.com/home/].[sk]Porte plume je rozšíriteľný panel s nástrojmi pre SPIP, ktorý využíva javascriptovú knižnicu [MarkItUp->http://markitup.jaysalvat.com/home/][uk]Porte plume - розширення можливостей стандартного текстового редактора SPIP. Використовує javascript бібліотеку  [MarkItUp->http://markitup.jaysalvat.com/home/].</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:19:\"Matthieu Marcillaud\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', 'a:3:{i:1;a:2:{s:3:\"nom\";s:21:\"Jay Salvat (MarkitUp)\";s:3:\"url\";s:30:\"http://markitup.jaysalvat.com/\";}i:2;a:2:{s:3:\"nom\";s:18:\"FamFamFam (Icones)\";s:3:\"url\";s:25:\"http://www.famfamfam.com/\";}i:3;a:2:{s:3:\"nom\";s:38:\"Frey Wazza / The Noun Project (icône)\";s:3:\"url\";s:54:\"https://thenounproject.com/search/?q=preview&i=2766461\";}}', 'a:1:{i:1;a:2:{s:3:\"nom\";s:7:\"GNU/GPL\";s:3:\"url\";s:40:\"http://www.gnu.org/licenses/gpl-3.0.html\";}}', '', 'https://contrib.spip.net/Porte-plume,3117', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'porte_plume', '', 'oui', 'non', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', '89499399c9a61618367f509e1d0b499e'),
(14, 14, 'REVISIONS', 'prive/themes/spip/images/revision-32.png', '002.000.002', '1.2.0', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]متابعة التغييرات في العناصر التحريرية[br]Heuliañ kemmoù an traoù stur[de]Änderungen von redaktionellen Inhalten nachvollziehen[en]Tracking changes of editorial objects[eo]Superrigardo de la modifoj de la redaktaj objektoj[es]Seguimiento de las modificaciones de los objetos editoriales[fa]پيگيري اصلاحات موضوع‌هاي سردبيري[fr]Suivi des modifications des objets éditoriaux[fr_fem]Suivi des modifications des objets éditoriaux[fr_tu]Suivi des modifications des objets éditoriaux[it]Il rilevamento delle revisioni sugli oggetti editoriali[lb]Verwaltung vun de Versiounen vun den Objekter[nl]De revisies van de editoriale objecten volgen[oc_ni_mis]Seguit dei moudificacioun dei ouget editourial[pt]Seguimento das modificações dos objectos editoriais[pt_br]Acompanhamento das alterações dos objetos editoriais[ru]История изменений[sk]Sledujte zmeny redakčných objektov[uk]Відстеження змін об’єктів, що редагуються</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', '', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'revisions', '', 'oui', 'oui', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', 'b3c287db4ddaa965a1436a1dddfdc631'),
(15, 15, 'SAFEHTML', 'images/safehtml-32.png', '002.000.003', '', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]حماية المنتديات من هجمات من نوع الأوامرالعابرة للمواقع[br]Gwarezadur ar forum ouzh argadennoù evel cross-site scripting[de]Schutz der Foren gegen cross-site scripting Attacken[en]Forums protection against cross-site scripting attacks[eo]Ŝirmilo por la forumoj kontraŭ transreteja atakoj[es]Protección de los foros contra ataques de type cross-site scripting[fr]Protection des forums contre les attaques de type cross-site scripting[fr_fem]Protection des forums contre les attaques de type cross-site scripting[fr_tu]Protection des forums contre les attaques de type cross-site scripting[it]Protezione del forum contro gli attacchi di tipo cross-site scripting[nl]Bescherming van forums tegen cross-site scripting[oc_ni_mis]Proutecioun dei fòrou countra lu atac de tìpou cross-site scripting[pt]Protecção dos fóruns contra os ataques do tipo cross-site scripting[pt_br]Proteção dos foruns contra ataques do tipo cross-site scripting[ru]Защищает форму комментариев от межсайтового скриптинга (XSS)[sk]Ochrana diskusných fór pred útokmi, ako cross-site scripting[uk]Захищає форуми від міжсайтового скриптингу (XSS)</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', 'a:4:{i:1;a:2:{s:3:\"nom\";s:12:\"Roman Ivanov\";s:3:\"url\";s:0:\"\";}i:2;a:2:{s:3:\"nom\";s:10:\"Pixel-Apes\";s:3:\"url\";s:0:\"\";}i:3;a:2:{s:3:\"nom\";s:8:\"JetStyle\";s:3:\"url\";s:0:\"\";}i:4;a:2:{s:3:\"nom\";s:47:\"https://wackowiki.org/doc/Dev/Projects/SafeHTML\";s:3:\"url\";s:63:\"https://bitbucket.org/wackowiki/wackowiki/src/master/wacko/lib/\";}}', 'a:1:{i:1;a:2:{s:3:\"nom\";s:3:\"GPL\";s:3:\"url\";s:40:\"http://www.gnu.org/licenses/gpl-3.0.html\";}}', '', 'http://www.ohloh.net/p/safehtml', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', 'a:1:{s:8:\"SAFEHTML\";s:6:\"1.3.12\";}', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'safehtml', '', 'oui', 'non', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', 'e89d71ba90a004bec1f9f0ea28c3fe97'),
(16, 16, 'SITES', 'prive/themes/spip/images/site-32.png', '003.000.002', '1.2.0', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]مواقع وترخيص في SPIP (خاص وعمومي)[br]Lec’hioù ha sindikadur e SPIP (prevez ha publik)[de]Verwaltung verlinkter und syndizierter Websites mit  SPIP (im öffentlichen und Redaktionsbereich)[en]Sites and syndication in SPIP (private and public)[eo]Retejoj kaj abonrilato en SPIP (privata kaj publika)[es]Sitios y sindicación en SPIP (privado y público)[fa]سايت‌ها و مشترك‌سازي‌ها در اسپسپ (خصوصي و همگاني)[fr]Sites et syndication dans SPIP (privé et public)[fr_fem]Sites et syndication dans SPIP (privé et public)[fr_tu]Sites et syndication dans SPIP (privé et public)[it]Siti e syndication in SPIP (privato e pubblica)[lb]Websäiten a Syndicatioun am SPIP (privat an ëffentlech)[nl]Sites en Websyndicatie in SPIP (privé en publiek)[oc_ni_mis]Sit e sindicacioun en SPIP (privat et pùblicou)[pt]Sítios e vinculação em SPIP (privado e público)[pt_br]Sites e sindicação do SPIP (privado e público)[ru]Подключение других сайтов по RSS[sk]Stránky a syndikácia v SPIPe (súkromná aj verejná)[uk]Підключення інших сайтів по RSS</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', '', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'sites', '', 'oui', 'oui', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', '98874556da867d8ff3af28c7a9e53fd2'),
(17, 17, 'STATS', 'prive/themes/spip/images/statistique-32.png', '002.000.002', '1.0.1', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]إحصاءات SPIP[br]Statistikoù SPIP[de]SPIP Statistiken[en]Statistics of SPIP[eo]Statistikoj de SPIP[es]Estadísticas de SPIP[fa]آمارهاي اسپيپ[fr]Statistiques de SPIP[fr_fem]Statistiques de SPIP[fr_tu]Statistiques de SPIP[it]Statistiche di SPIP[lb]SPIP-Statistiken[nl]Statistieken van SPIP[oc_ni_mis]Estatìstica de SPIP[pt]Estatísticas de SPIP[pt_br]Estatísticas do SPIP[ru]Статистика посещений сайта[sk]Štatistiky SPIPu[uk]Статистика відвідувань сайту</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', '', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'statistiques', '', 'oui', 'oui', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', '09d0d847402ad91375f390cdd88144c9'),
(18, 18, 'SVP', 'svp.svg', '002.004.000', '0.6.1', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]يقدم هذا الملحق، من جهة، دارة تتيح تنفيذ بحث متعدد المعايير حول الملحقات وتجميع معلومات عنها (نماذج وظيفية، نماذج تصاميمن صفحات نموذجية) ومن جهة أخرى، يقدم واجهة لإدارة الملحقات والعلاقات بينها.[de]SVP stellt ein API bereit, mit dem SPIP-Plugins (Zusatzfunktionen, Themen und  Skelette) nach mehreren Kriterien gesucht  und ausgewählt werden können und bietet eine Oberfläche zur Verwaltung der  Plugins sowie ihrer Abhängigkeiten.[en]On one hand, this plugin provides an API to perform multi-criteria searches, to collect and present information on SPIP plugins (functional modules, themes, and skeletons) and on the other hand, proposes a new administration interface to manage the dependencies between plugins.[eo]Tiu kromprogramo disponigas, unue, API-on ebligante plurkriterie serĉi, kolekti kaj prezenti informojn pri SPIP-kromprogramoj (funkciaj, aspektaj kaj skeletaj), kaj, due, nova interfacon de mastrumado de kromprogramoj, kiu zorgas pri la dependeco inter la kromprogramoj.[es]Este plugin proporciona, por un lado, una API que permite efectuar búsquedas multi-criterio, recopilar y presentar información sobre los plugins (módulos funcionales, temas y esqueletos) y, por otro lado, una nueva interfaz de administración de los plugins que gestiona las dependencias entre ellos.[fa]اين پلاگينن،‌ از يك طرف يك آي.پي.يي براي جستجو‌‌هاي چند معياره  براي گردآوري و ارايه‌ي اطلاعات در مورد پلاگين‌هاي اسپيپ (مادوول‌هاي كاركردي، تم‌ها و اسكلث‌ها) در اختيار مي‌گذارد، و از طرف ديگر، يك واسط مديريتي جديد براي مديريت وابستگي‌هاي بين پلاگين‌ها را پيشنهاد مي‌كند.[fr]Ce plugin fournit, d’une part,  une API permettant d’effectuer des recherches multi-critères, de collecter, et de présenter les informations sur les plugins SPIP (modules fonctionnels, thèmes et squelettes) et d’autre part, une nouvelle interface d’administration des plugins gérant les dépendances entre plugins.[fr_fem]Ce plugin fournit, d’une part,  une API permettant d’effectuer des recherches multi-critères, de collecter, et de présenter les informations sur les plugins SPIP (modules fonctionnels, thèmes et squelettes) et d’autre part, une nouvelle interface d’administration des plugins gérant les dépendances entre plugins.[fr_tu]Ce plugin fournit, d’une part,  une API permettant d’effectuer des recherches multi-critères, de collecter, et de présenter les informations sur les plugins SPIP (modules fonctionnels, thèmes et squelettes) et d’autre part, une nouvelle interface d’administration des plugins gérant les dépendances entre plugins.[it]Da un lato, questo plugin fornisce un’API per eseguire ricerche multi-criteri, per raccogliere e presentare informazioni su SPIP plugin (moduli funzionali, temi e scheletri) e, dall’altro, propone una nuova interfaccia di amministrazione per gestire le dipendenze tra i plugin.[nl]Enerzijds biedt deze plugin een API aan voor het multi-criteria zoeken, het verzamelen en het tonen van informatie over SPIP Plugins (functionele modules, thema’s en skeletten), anderzijds biedt het een nieuwe interface voor het beheer van plugins dat ook de onderlinge afhankelijkheden in acht neemt.[oc_ni_mis]Aqueu plugin fournisse, premieramen, una API que permete d’efetuà dei recercà multi-critèri, de couletà, e de presentà li infourmacioun soubre lu plugin SPIP (module fountiounal, tèma e esquèletrou), e segoundamen, una interfaça nouvela d’aministracioun dei plugin que gèron li dependança tra lu plugin.[pt]Por um lado, este plugin fornece um API que permite efectuar pesquisar multi-critério, recolher e apresentar informação sobre plugins SPIP (módulos funcionais, temas e modelos). Por outro lado, propõe uma nova interface de administração, para gerir as dependências entre plugins.[pt_br]Este plugin fornece, por um lado, uma API que permite fazer buscas culti-critérios, coletar e apresentar as informações sobre os plugins SPIP (módulos funcionais, temas e templates) e, por outro lado, uma nova interface de administração dos plugins, gerenciando as dependências entre plugins.[ru]Этот модуль предоставляет API и интерфейс для управления плагинами SPIP.[sk]Tento zásuvný modul poskytuje, po prvé, aplikáciu umožňujúcu vykonávať vyhľadávania na základe viacerých kritérií, vyhľadať a zobraziť informácie o zásuvných moduloch SPIPu (funkčných moduloch, farebných motívoch i šablónach) a po druhé, nové rozhranie nastavení zásuvných modulov riadi závislosti medzi zásuvnými modulmi.[uk]З одного боку, цей плагін забезпечує API для виконання пошуку по безлічі критеріїв, щоб зібрати і представити інформацію про SPIP-плагіни (функціональні модулі, теми і шаблони), а з іншого боку, пропонує новий інтерфейс адміністрування для управління залежностями між плагінами.</multi>', 'a:2:{i:1;a:3:{s:3:\"nom\";s:14:\"Eric Lupinacci\";s:3:\"url\";s:23:\"http://blog.smellup.net\";s:4:\"mail\";s:0:\"\";}i:2;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', 'a:1:{i:1;a:2:{s:3:\"nom\";s:5:\"GPL 3\";s:3:\"url\";s:40:\"http://www.gnu.org/licenses/gpl-3.0.html\";}}', '', 'http://blog.smellup.net/spip.php?rubrique1', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:1:{i:0;a:2:{s:10:\"archiviste\";a:2:{s:3:\"nom\";s:10:\"archiviste\";s:13:\"compatibilite\";s:8:\"[0.3.0;]\";}s:11:\"php:openssl\";a:1:{s:3:\"nom\";s:11:\"php:openssl\";}}}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'svp', '', 'oui', 'oui', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', 'ed042249e03cf024e4b21f0351de8586');
INSERT INTO `api_paquets` (`id_paquet`, `id_plugin`, `prefixe`, `logo`, `version`, `version_base`, `compatibilite_spip`, `branches_spip`, `description`, `auteur`, `credit`, `licence`, `copyright`, `lien_doc`, `lien_demo`, `lien_dev`, `etat`, `etatnum`, `dependances`, `procure`, `date_crea`, `date_modif`, `id_depot`, `nom_archive`, `nbo_archive`, `maj_archive`, `src_archive`, `traductions`, `actif`, `installe`, `recent`, `maj_version`, `superieur`, `obsolete`, `attente`, `constante`, `signature`) VALUES
(19, 19, 'TW', 'textwheel-32.png', '002.000.002', '', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]دمج TextWheel في SPIP[br]Lakaat e TextWheel e SPIP[de]Integration von TextWheel in SPIP[en]Integrate TextWheel in SPIP[eo]Uzi „TextWheel“ en SPIP[es]Integrar TextWheel en SPIP[fa]ادغام چرخ‌نويس (TextWheel) در اسپيپ[fr]Intégrer TextWheel dans SPIP[fr_fem]Intégrer TextWheel dans SPIP[fr_tu]Intégrer TextWheel dans SPIP[it]Integra TextWheel in SPIP[lb]TextWheel a SPIP integréieren[nl]TextWheel in SPIP integreren[oc_ni_mis]Integrà TextWheel en SPIP[pt]Integrar TextWheel em SPIP[pt_br]Integrar TextWheel com o SPIP[ru]Интегрировать TextWheel в SPIP[sk]Integrovať TextWheel do SPIPu[uk]Інтегрувати TextWheel в SPIP</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', 'a:1:{i:1;a:2:{s:3:\"nom\";s:8:\"GNU/LGPL\";s:3:\"url\";s:37:\"http://www.gnu.org/licenses/lgpl.html\";}}', '', '', '', '', 'test', 3, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:1:{i:0;a:2:{s:4:\"yaml\";a:2:{s:3:\"nom\";s:4:\"yaml\";s:13:\"compatibilite\";s:8:\"[1.5.3;]\";}s:11:\"memoization\";a:2:{s:3:\"nom\";s:11:\"memoization\";s:13:\"compatibilite\";s:8:\"[1.8.3;]\";}}}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'textwheel', '', 'oui', 'non', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', 'dca243c5d3216c3bd9fa0eb6041a8b37'),
(20, 20, 'URLS', 'prive/themes/spip/images/url-32.png', '003.000.002', '2.0.1', '[4.0.0;4.0.*]', '4.0', '<multi>[ar]إدارة تنوعات عناوين URL ذات المعنى ام لا[br]Merañ an adstummoù URL sklaer pe ket[de]Verwaltung von URL-Varianten[en]Management of the URL variants, meaningful or not[eo]Mastrumado de aliformaj retadresoj (URL), sencaj aŭ ne[es]Gestión de las variantes de URL significativas o no[fa]مديريت تنوع يو.آر.ال‌هاي مهم يا غيرمهم[fr]Gestion des variantes d’URL signifiantes ou non[fr_fem]Gestion des variantes d’URL signifiantes ou non[fr_tu]Gestion des variantes d’URL signifiantes ou non[it]Gestione delle varianti significative URL, o non[nl]Beheer van de URL’s varianten (betekenisdragend of niet)[oc_ni_mis]Gestioun dei varianti d’URL significanti o noun[pt_br]Gerenciamento das variantes de URLs significantes ou não[ru]SEO-friendly URLs (ЧПУ ссылки)[sk]Riadenie variantov URL, či už sémantických, alebo nie[uk]SEO-friendly URLs (ЧПУ посилання)</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:14:\"Collectif SPIP\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', '', '', '', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'urls_etendues', '', 'oui', 'oui', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', '1359c60ba349cc9325149f15ce74ce3d'),
(21, 21, 'ADMINER', 'prive/themes/spip/images/adminer-64.png', '004.008.001.000', '', '[2.0.0;4.0.*]', '2.0,2.1,3.0,3.1,3.2,3.3,4.0', '<multi>[fr]Utiliser Adminer sur la base SPIP</multi>', 'a:1:{i:1;a:3:{s:3:\"nom\";s:59:\"Jakub Vrana ( https://www.vrana.cz ), mis en plugin par Fil\";s:3:\"url\";s:0:\"\";s:4:\"mail\";s:0:\"\";}}', '', 'a:1:{i:1;a:2:{s:3:\"nom\";s:7:\"GNU/GPL\";s:3:\"url\";s:0:\"\";}}', '', 'https://contrib.spip.net/Adminer', '', '', 'stable', 4, 'a:3:{s:9:\"necessite\";a:0:{}s:9:\"librairie\";a:0:{}s:7:\"utilise\";a:0:{}}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '0000-00-00 00:00:00', 'adminer', '', 'oui', 'non', 0, '', 'non', 'non', 'non', '_DIR_PLUGINS_DIST', 'd95648e9ebc296b11ae9b167686a8cd1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_plugins`
--

CREATE TABLE `api_plugins` (
  `id_plugin` bigint(21) NOT NULL,
  `prefixe` varchar(48) NOT NULL DEFAULT '',
  `nom` text NOT NULL DEFAULT '',
  `slogan` text NOT NULL DEFAULT '',
  `vmax` varchar(24) NOT NULL DEFAULT '',
  `date_crea` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `date_modif` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `compatibilite_spip` varchar(24) NOT NULL DEFAULT '',
  `branches_spip` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `api_plugins`
--

INSERT INTO `api_plugins` (`id_plugin`, `prefixe`, `nom`, `slogan`, `vmax`, `date_crea`, `date_modif`, `compatibilite_spip`, `branches_spip`) VALUES
(1, 'AIDE', '<multi>[ar]تعليمات »[ّ[[en]SPIP help[fr]Aide SPIP[pt_br]Ajuda do SPIP</multi>', '<multi>[ar]تعليمات SPIP الفورية[en]SPIP online help[fr]Aide en ligne de SPIP[pt_br]Ajuda online do SPIP</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(2, 'ARCHIVISTE', '<multi>[fr]Archiviste[pt_br]Arquivista</multi>', '<multi>[fr]Gérer des archives de fichiers[pt_br]Gerenciar arquivos compactados</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(3, 'BIGUP', '<multi>[ar]تحميل كبير[de]Big Upload[en]Big Upload[fr]Big Upload</multi>', '<multi>[ar]تحميل الملفات مهما كان حجمها[de]Dateien hochladen, egal wie gross sie sind.[en]Upload files, whatever their size[fr]Téléverser des fichiers, quelque soit leur taille</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(4, 'COMPAGNON', '<multi>[ar]الرفيق[br]Ambrouger[de]Begleiter[en]Companion[eo]Kompano[es]Compañero[fa]همراه[fr]Compagnon[fr_fem]Compagnon[fr_tu]Compagnon[hac]ھامڕا[it]Assistente[ja]仲間さん[lb]Compagnon[nl]Metgezel[oc_ni_mis]Coumpàgnou[pt]Guia[pt_br]Companheiro[ru]Помощник (Companion)[sk]Compagnon[uk]Помічник (Companion)</multi>', '<multi>[ar]مرافق الخطوات الأولى في SPIP[br]Ambrouger evit kregiñ gant SPIP[de]Assistent für die ersten Schritte mit SPIP[en]First steps wizard with SPIP[eo]Helpanto por SPIP-komencantoj[es]Asistente para dar los primeros pasos con SPIP[fa]همراه اول با اسپيپ نيست[fr]Assistant de premiers pas avec SPIP[fr_fem]Assistant de premiers pas avec SPIP[fr_tu]Assistant de premiers pas avec SPIP[hac]ڕانیشاندەرو یەکەمین ھەنگامەکا چنی SPIP[it]Assistente per il primo utilizzo di SPIP[ja]SPIPを使用するように、最初のステップウィザードです。[lb]Assistent fir déi éischt Schrëtt mat SPIP[nl]Assistent van de eerste steppen met SPIP[oc_ni_mis]Assistant de premié pas embé SPIP[pt]Assistente de iniciação a SPIP[pt_br]Assistente de primeiros passos do SPIP[ru]Начальная помощь при работе со SPIP[sk]Sprievodca pri prvých krokoch so SPIPom[uk]Допомога на початку роботи зі SPIP</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(5, 'COMPRESSEUR', 'Compresseur', '<multi>[ar]ضغط أوراق الأنماط ورموز جافاسكريبت[br]Gwaskadurezh css ha javascript[de]Kompression von CSS und Javascript-Code[en]CSS and javascript compression[eo]Densigo css kaj javascript[es]Compresión de css y javascript[fa]فشرده سازي سي.اس.اس‌ها و جاوااسكريبت[fr]Compression des css et javascript[fr_fem]Compression des css et javascript[fr_tu]Compression des css et javascript[hac]دروسکەردەی فشاردریاو سی‌ئێس‌ئێس و جاڤا سکریپتی[it]Compressione di CSS e javascript[ja]CSSとjavascriptの圧縮[lb]Compressioun vun CSS a Javascript[nl]Compressie van CSS en JavaScript[oc_ni_mis]Coumpressioun dei css e javascript[pt]Compressão de css e javascript[pt_br]Compressão dos css e javascript[ru]Плагин для сжатия CSS и Javascript файлов[sk]Kompresia css a javascriptu[uk]Плагін для стискання CSS та Javascript файлів</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(6, 'DUMP', 'Dump', '<multi>[ar]نسخ احتياطي لقاعدة بيانات SPIP واسترجاعها[br]Gwared hag assevel deus an diaz titouroù SPIP[de]Sicherung und Wiederherstellung der  SPIP-Datenbank[en]Backup and restore database SPIP[eo]Savkopio kaj restaŭro de la datumbazo SPIP[es]Copia de seguridad y recuperación de la base de datos de SPIP[fa]بك‌آپ و ذخيره سازي پايگاه داده‌‌هاي اسپيپ[fr]Sauvegarde et restauration de la base SPIP[fr_fem]Sauvegarde et restauration de la base de données SPIP[fr_tu]Sauvegarde et restauration de la base SPIP[hac]پاشەکۆتکەرڎەی و ئەۋەگېڵنای داتابەیسو SPIP[it]Backup e ripristino del database di SPIP[ja]SPIPのデータベースバックアップと復元Sauvegarde et restauration de la base SPIP[lb]Backup an Zeréckspillen vun der SPIP-Datebank[nl]Back-up en restauratie van de SPIP database[oc_ni_mis]Sauvagarda e restauramen de la basa SPIP[pt]Cópia de segurança e restauro da base de dados SPIP[pt_br]Cópia de segurança e restauro da base SPIP[ru]Резервное копирование[sk]Záloha a obnovenie databázy SPIPu[uk]Резервне копіювання і відновлення бази SPIP</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(7, 'IMAGES', 'Images', '<multi>[ar]مرشحات معالجة الصور والألوان[br]Siloù treuzfurmadur skeudennoù ha livioù[de]Bild- und Farbfilter[en]Images processing and colors filters[eo]Filtriloj de bild- kaj kolor-transformo[es]Filtros de transformación de imágenes y de colores[fa]فيلترهاي پردازش تصوير‌ها و رنگ‌ها[fr]Filtres de transformation d’images et de couleurs[fr_fem]Filtres de transformation d’images et de couleurs[fr_tu]Filtres de transformation d’images et de couleurs[it]Filtri di trasformazione delle immagini e dei colori[ja]画像および色変換フィルタ[lb]Ännerungs-Filteren fir d’Biller an d’Faarwen[nl]Beeld en kleur transformatie filters[oc_ni_mis]Filtre de trasfourmacioun d’image e de coulou[pt]Processamento de imagens e filtros de cores[pt_br]Filtros de transformação de imagens e de cores[ru]Набор фильтров по работе с изображениями[sk]Filtre na transformáciu obrázkov a farieb[uk]Фільтри для обробки зображень і роботи з кольорами</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(8, 'FORUM', 'Forum', '<multi>[ar]إدارة المنتديات الخاصة والعمومي في SPIP[ast]Alministración de foros privaos y públicos en SPIP[br]Merañ ar foromoù preves ha foran e-barzh SPIP[de]Verwaltung der privaten und öffentlichen SPIP-Foren[en]Management of private and public forums in SPIP[eo]Mastrumado de la privataj kaj publikaj forumoj de SPIP[es]Administración de los foros privados y públicos en SPIP[fa]مديريت سخنگاه‌هاي خصوصي و همگاني در اسپيپ[fr]Gestion des forums privés et publics dans SPIP[fr_fem]Gestion des forums privés et publics dans SPIP[fr_tu]Gestion des forums privés et publics dans SPIP[it]Gestione dei forum privati e pubblici di SPIP[ja]SPIPの掲示板（プライベートと公開）の管理[lb]Beaarbechte vun de privaten an ëffentleche Forumen am SPIP[nl]Beheer van de privé en openbare SPIP forums[oc_ni_mis]Gestioun dei fòrou privat e pùblicou en SPIP[pt]Gestião dos fóruns públicos e privados em SPIP[pt_br]Gerenciamento dos fóruns privados e públicos do SPIP[ru]Управление форумами и комментариями[sk]Riadenie súkromných aj verejných diskusných fór v SPIPe[uk]Управління загальними і редакційними форумами у SPIP</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(9, 'MEDIABOX', '<multi>[ar]صندوق الفرجة[br]MediaBoest[de]MediaBox[en]MediaBox[eo]MediaBox[es]MediaBox[fa]مدياباكس[fr]MediaBox[fr_fem]MediaBox[fr_tu]MediaBox[it]MediaBox[ja]メディアボックス[lb]MediaBox[nl]MediaBox[oc_ni_mis]MediaBox[pt]MediaBox[pt_br]MediaBox[ru]MediaBox[sk]Multimediálny box[uk]MediaBox</multi>', '<multi>[ar]صندوق الفرجة[br]Boest liesvedia[de]Multimedia-Box[en]Media box[eo]Plurmedia skatolo[es]Caja multimedia[fa]صندوق چندرسانه‌اي[fr]Boîte multimédia[fr_fem]Boîte multimédia[fr_tu]Boîte multimédia[it]Media box[ja]マルチメディアボックス[lb]Mediabox[nl]Multimedia Box[oc_ni_mis]Bouòta multimedia[pt]Media box[pt_br]Caixa multimedia[ru]Медиабокс[sk]Multimediálny box[uk]Медіабокс</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(10, 'MEDIAS', 'Medias', '<multi>[ar]أدارة الوسائط المتعددة في SPIP[br]Merañ ar mediaoù e SPIP[de]Medienverwaltung in  SPIP[en]SPIP’s media management[eo]Mastrumado de ĉiuspecaj dokumentoj en SPIP[es]Gestión de documentos multimedia en SPIP[fa]مديريت رسانه‌ها دراسپيپ[fr]Gestion des médias dans SPIP[fr_fem]Gestion des médias dans SPIP[fr_tu]Gestion des médias dans SPIP[it]Gestione dei media di SPIP[ja]SPIPにおけるメディア管理[lb]Gestioun vun de Medien am SPIP[nl]Beheer van de digitale documenten in SPIP[oc_ni_mis]Gestioun dei media en SPIP[pt]Gestão multimédia de SPIP[pt_br]Gerenciamento de mídias do SPIP[ru]Управление медиа файлами[sk]Správa multimédií v SPIPe[uk]Управління медіа-файлами</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(11, 'MOTS', 'Mots', '<multi>[ar]إدارة المفاتيح ومجموعات المفاتيح في SPIP[br]Merañ gerioù hag strolladoù ger e  SPIP[de]Verwaltung von Schlagworten und Schlagwortgruppen mit  SPIP[en]Management of keywords and keywords groups in SPIP[eo]Mastrumado de ŝlosilvortoj kaj grupoj de ŝlosilvortoj en SPIP[es]Administración de las palabras clave y los grupos de palabras clave en SPIP[fa]مديريت واژه‌ها و گروه‌واژه‌ها در اسپيپ[fr]Gestion des mots et groupes de mots dans SPIP[fr_fem]Gestion des mots-clef et groupes de mots-clef dans SPIP[fr_tu]Gestion des mots et groupes de mots dans SPIP[it]Gestione delle parole e dei gruppi di parole di SPIP[ja]キーワードとキーワードのグループの管理[lb]Gestioun vun de Schlësselwierder a Gruppen am SPIP[nl]Beheer van trefwoorden en groepen van trefwoorden in SPIP[oc_ni_mis]Gestioun dei mot e group de mot en SPIP[pt]Gestão de palavras e grupos de palavras em SPIP[pt_br]Gerenciamento de palavras-chave e grupos de palavras chave do SPIP[ru]Настройка ключей и групп ключей в SPIP[sk]Riadenie kľúčových slov a skupín kľúčových slov v SPIPe[uk]Управління ключами та їх групами в SPIP</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(12, 'PLAN', '<multi>[ar]خريطة الموقع في المجال الخاص[de]Sitemap des Redaktionssystems[en]Site Map in the Private Space[eo]Mapo de la retejo en la privata spaco[fr]Plan du site dans l’espace privé[fr_fem]Plan du site dans l’espace privé[fr_tu]Plan du site dans l’espace privé[ja]管理エリアのサイトマップ[nl]Sitemap in het privé gedeelte[pt_br]Mapa do site na área restrita[sk]Mapa stránky v súkromnej zóne</multi>', '<multi>[ar]يحسّن صفحة خريطة الموقع في المجال الخاص[de]Verbesserte Sitemap des Redaktionssystems[en]Improves the page Site Map of the private space.[eo]Plibonigas la mapon de la retejo en la privata spaco[fr]Améliore la page plan du site de l’espace privé[fr_fem]Améliore la page plan du site de l’espace privé[fr_tu]Améliore la page plan du site de l’espace privé[ja]管理エリアのサイトマップを改善する。[nl]Verbeterde sitemap in het privé gedeelte[pt_br]Melhora a página mapa do site da área restrita[sk]Vylepší stránku Mapa stránky v súkromnej zóne</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(13, 'PORTE_PLUME', '<multi>[ar]الريشة[de]Federhalter[en]Quill[eo]Plumingo[es]Porta pluma[fa]چوب قلم[fr]Porte plume[fr_fem]Porte plume[fr_tu]Porte plume[it]Portapenne[nl]Penhouder[oc_ni_mis]Pouòrta-pluma[pt]Pena[pt_br]Porte plume[ru]Панель инструментов (Porte plume)[sk]Porte plume[uk]Панель інструментів (Porte plume)</multi>', '<multi>[ar]شريط أدوات لتحسين الكتابة[de]Eine Menüleiste zum Formatieren der Texte[en]A toolbar to enhance your texts[eo]Ilobreto por bone skribi[es]Una barra de herramientas para escribir bien[fa]نوار ابزاري براي بهترنويسي[fr]Une barre d’outils pour bien écrire[fr_fem]Une barre d’outils pour bien écrire[fr_tu]Une barre d’outils pour bien écrire[it]Una barra degli strumenti per scrivere bene[nl]Een penhouder om mooi te schrijven[oc_ni_mis]Una Barra d’óutis da ben escriéure[pt]Uma barra de ferramentas para abrilhantar os seus textos[pt_br]Barre de ferramentas para edição de texto[ru]Дополнительные возможности для текстового редактора[sk]Panel s nástrojmi, vďaka ktorému môžete vylepšiť svoje texty[uk]Додаткові можливості для текстового редактора</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(14, 'REVISIONS', 'Révisions', '<multi>[ar]متابعة التغييرات في العناصر التحريرية[br]Heuliañ  kemmoù an traoù stur[de]Änderungen von redaktionellen Inhalten nachvollziehen[en]Tracking changes of editorial objects[eo]Superrigardo de la modifoj de la redaktaj objektoj[es]Seguimiento de las modificaciones de los objetos editoriales[fa]پيگيري اصلاحات موضوع‌هاي سردبيري[fr]Suivi des modifications des objets éditoriaux[fr_fem]Suivi des modifications des objets éditoriaux[fr_tu]Suivi des modifications des objets éditoriaux[it]Il rilevamento delle revisioni sugli oggetti editoriali[lb]Verwaltung vun de Versiounen vun den Objekter[nl]Revisies laat je toe de  veranderingen van de editorialen objecten zien en volgen.[oc_ni_mis]Seguit dei moudificacioun dei ouget editourial[pt]Seguimento das modificações dos objectos editoriais[pt_br]Acompanhamento das alterações dos objetos editoriais[ru]История изменений[sk]Sledovanie zmien redakčných objektov[uk]Історія змін</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(15, 'SAFEHTML', 'SafeHTML', '<multi>[ar]حماية المنتديات من الأوامرالعابرة للمواقع[br]Gwarezadur ar forum ouzh ar cross-site scripting[de]Schutz der Foren gegen cross-site scripting Attacken[en]Forums protection against cross-site scripting[eo]Ŝirmilo por la forumoj kontraŭ transreteja atakoj[es]Protección de los foros contra el cross-site scripting[fr]Protection des forums contre le cross-site scripting[fr_fem]Protection des forums contre le cross-site scripting[fr_tu]Protection des forums contre le cross-site scripting[it]Protezione del forum contro gli attacchi di tipo cross-site scripting[nl]Bescherming van forums tegen cross-site scripting[oc_ni_mis]Proutecioun dei fòrou countra lou cross-site scripting[pt]Protecção dos fóruns contra o cross-site scripting[pt_br]Proteção dos foruns contra cross-site scripting[ru]Защищает форму комментариев от межсайтового скриптинга (XSS)[sk]Ochrana diskusných fór pred útokmi, ako cross-site scripting[uk]Захищає форуми від міжсайтового скриптингу (XSS)</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(16, 'SITES', 'Sites', '<multi>[ar]إدارة المواقع والترخيص في SPIP[br]Merañ al lec’hioù ha sindikadur e SPIP[de]Verwaltung verlinkter und syndizierter Websites mit  SPIP[en]Management of sites and syndication in SPIP[eo]Mastrumado de retejoj kaj de abonrilato en SPIP[es]Administración de los sitios y de la sindicación en SPIP[fa]مديريت سايت‌ها و مشترك‌سازي در اسپيپ[fr]Gestion des sites et de la syndication dans SPIP[fr_fem]Gestion des sites et de la syndication dans SPIP[fr_tu]Gestion des sites et de la syndication dans SPIP[it]Gestione dei siti e syndication in SPIP[lb]Gestioun vun de Websäiten a Syndicatioun am SPIP[nl]Beheer van de sites en van de Websyndicatie in SPIP[oc_ni_mis]Gestioun dei sit e de la sindicacioun en SPIP[pt]Gestão dos sítios e da vinculação em SPIP[pt_br]Gerenciamento de sites e da sindicação do SPIP[ru]Подключение других сайтов по RSS[sk]Riadenie stránok a syndikácie v SPIPe[uk]Підключення інших сайтів по RSS</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(17, 'STATS', '<multi>[ar]الإحصاءات[br]Statistikoù[de]Statistiken[en]Statistics[eo]Statistikoj[es]Estadísticas[fa]آمارها[fr]Statistiques[fr_fem]Statistiques[fr_tu]Statistiques[it]Statistiche[lb]Statistiken[nl]Statistieken[oc_ni_mis]Estatìstica[pt]Estatísticas[pt_br]Estatísticas[ru]Статистика[sk]Štatistiky[uk]Статистика</multi>', '<multi>[ar]إدارة الإحصاءات في SPIP[br]Merañ an statistikoù e SPIP[de]Verwlatung der SPIIP-Statistiken[en]Statistics management in SPIP[eo]Mastrumado de la statistikoj en SPIP[es]Administración de las estadísticas de SPIP[fa]مديريت آمارها در اسپيپ[fr]Gestion des statistiques dans SPIP[fr_fem]Gestion des statistiques dans SPIP[fr_tu]Gestion des statistiques dans SPIP[it]Gestione delle statistiche di SPIP[lb]Verwalte vun de SPIP-Statistiken[nl]Beheer van de bezoekenstatistieken in SPIP[oc_ni_mis]Gestioun dei estatìstica en SPIP[pt]Gerir as estatísticas em SPIP[pt_br]Gerenciamento das estatísticas do SPIP[ru]Плагин по учету статистики посещений вашего сайта[sk]Správa štatistík v SPIPe[uk]Плагін з обліку статистики відвідувань вашого сайту</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(18, 'SVP', 'SVP', '<multi>[ar]خادم معلومات الملحقات وتحميلها[br]SerVijer titouriñ hag enrollañ ar Plugins[de]Informations- und Download-Server für Plugins[en]Information and download server of plugins[eo]SerVilo pri Informo kaj elŝuto de kromProgramoj[es]Servidor de información y descarga de plugins[fa]سرور اطلاعات و بارگذاري پلاگين‌ها[fr]SerVeur d’information et de téléchargement des Plugins[fr_fem]SerVeur d’information et de téléchargement des Plugins[fr_tu]SerVeur d’information et de téléchargement des Plugins[it]Informazioni e server per il download dei plugin[nl]SerVer voor informatie en downloaden van Plugins[oc_ni_mis]SerVidou d’infourmacion e de telechargamen dei Plugin[pt]Servidor de informação e download de Plugins[pt_br]Servidor de informações e transferência de Plugins[ru]Управление плагинами[sk]Server na zisťovanie informácií o zásuvných moduloch a ich sťahovanie[uk]Інформація про сервер для завантаження плагінів</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(19, 'TW', 'TextWheel pour SPIP', '<multi>[ar]إدارة الكتابة في SPIP بواسطة TextWheel[br]Merañ al lizherennañ SPIP gant TextWheel[de]Typographie in SPIP mit TextWheel steuern[en]Management of SPIP typography with TextWheel[eo]SPIP-tipografio kun „TextWheel“[es]Administración de la tipografía SPIP con TextWheel[fa]مديريت حروف‌نگاري در اسپيپ با چرخ‌نويس[fr]Gestion de la typographie SPIP avec TextWheel[fr_fem]Gestion de la typographie SPIP avec TextWheel[fr_tu]Gestion de la typographie SPIP avec TextWheel[it]Gestione della tipografia di SPIP con TextWheel[lb]Verwalte vun der SPIP-Typografie mat TextWheel[nl]Beheer van de SPIP typografie dank zij TextWheel[oc_ni_mis]Gestioun de la tipougrafìa SPIP embé TextWheel[pt]Gestão da tipografia SPIP com TextWheel[pt_br]Gerenciamento da tipografia do SPIP com TextWheel[ru]Управлять оформлением SPIP c помощью TextWheel[sk]Správa typografie SPIPu s modulom TextWheel[uk]Управляти оформленням SPIP за допомогою TextWheel</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(20, 'URLS', 'Urls Etendues', '<multi>[ar]إدارة تنوعات عناوين URL ذات المعنى ام لا[br]Merañ an adstummoù URL sklaer pe ket[de]Verwaltung von URL-Varianten[en]Management of the URL variants, meaningful or not[eo]Mastrumado de aliformaj retadresoj (URL), sencaj aŭ ne[es]Gestión de las variantes de URL significativas o no[fa]مديريت يو.آر.ال‌هاي مهم يا غيرمهم[fr]Gestion des variantes d’URL signifiantes ou non[fr_fem]Gestion des variantes d’URL signifiantes ou non[fr_tu]Gestion des variantes d’URL signifiantes ou non[it]Gestione delle varianti significative URL, o non[nl]Beheer van de URL varianten (betekenisdragend of niet)[oc_ni_mis]Gestioun dei varianti d’URL significanti o noun[pt_br]Gerenciamento das variantes de URLs significantes ou não[ru]SEO-friendly URLs (ЧПУ ссылки)[sk]Riadenie variantov URL, či už sémantických, alebo nie[uk]SEO-friendly URLs (ЧПУ посилання)</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(21, 'ADMINER', 'Adminer', '<multi>[fr]Utiliser Adminer pour explorer la base SPIP</multi>', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_referers`
--

CREATE TABLE `api_referers` (
  `referer_md5` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `referer` varchar(255) DEFAULT NULL,
  `visites` int(10) UNSIGNED NOT NULL,
  `visites_jour` int(10) UNSIGNED NOT NULL,
  `visites_veille` int(10) UNSIGNED NOT NULL,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_referers_articles`
--

CREATE TABLE `api_referers_articles` (
  `id_article` int(10) UNSIGNED NOT NULL,
  `referer_md5` bigint(20) UNSIGNED NOT NULL,
  `referer` varchar(255) NOT NULL DEFAULT '',
  `visites` int(10) UNSIGNED NOT NULL,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_resultats`
--

CREATE TABLE `api_resultats` (
  `recherche` char(16) NOT NULL DEFAULT '',
  `id` int(10) UNSIGNED NOT NULL,
  `points` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `table_objet` varchar(30) NOT NULL DEFAULT '',
  `serveur` char(16) NOT NULL DEFAULT '',
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_rubriques`
--

CREATE TABLE `api_rubriques` (
  `id_rubrique` bigint(21) NOT NULL,
  `id_parent` bigint(21) NOT NULL DEFAULT 0,
  `titre` text NOT NULL DEFAULT '',
  `descriptif` text NOT NULL DEFAULT '',
  `texte` longtext NOT NULL DEFAULT '',
  `id_secteur` bigint(21) NOT NULL DEFAULT 0,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `statut` varchar(10) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `lang` varchar(10) NOT NULL DEFAULT '',
  `langue_choisie` varchar(3) DEFAULT 'non',
  `statut_tmp` varchar(10) NOT NULL DEFAULT '0',
  `date_tmp` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `profondeur` smallint(5) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_syndic`
--

CREATE TABLE `api_syndic` (
  `id_syndic` bigint(21) NOT NULL,
  `id_rubrique` bigint(21) NOT NULL DEFAULT 0,
  `id_secteur` bigint(21) NOT NULL DEFAULT 0,
  `nom_site` text NOT NULL DEFAULT '',
  `url_site` text NOT NULL DEFAULT '',
  `url_syndic` text NOT NULL DEFAULT '',
  `descriptif` text NOT NULL DEFAULT '',
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `syndication` varchar(3) NOT NULL DEFAULT '',
  `statut` varchar(10) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `date_syndic` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `date_index` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `moderation` varchar(3) DEFAULT 'non',
  `miroir` varchar(3) DEFAULT 'non',
  `oubli` varchar(3) DEFAULT 'non',
  `resume` varchar(3) DEFAULT 'oui'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_syndic_articles`
--

CREATE TABLE `api_syndic_articles` (
  `id_syndic_article` bigint(21) NOT NULL,
  `id_syndic` bigint(21) NOT NULL DEFAULT 0,
  `titre` text NOT NULL DEFAULT '',
  `url` text NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `lesauteurs` text NOT NULL DEFAULT '',
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `statut` varchar(10) NOT NULL DEFAULT '0',
  `descriptif` text NOT NULL DEFAULT '',
  `lang` varchar(10) NOT NULL DEFAULT '',
  `url_source` tinytext NOT NULL DEFAULT '',
  `source` tinytext NOT NULL DEFAULT '',
  `tags` text NOT NULL DEFAULT '',
  `raw_data` text NOT NULL DEFAULT '',
  `raw_format` tinytext NOT NULL DEFAULT '',
  `raw_methode` tinytext NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_types_documents`
--

CREATE TABLE `api_types_documents` (
  `extension` varchar(10) NOT NULL DEFAULT '',
  `titre` text NOT NULL DEFAULT '',
  `descriptif` text NOT NULL DEFAULT '',
  `mime_type` varchar(100) NOT NULL DEFAULT '',
  `inclus` enum('non','image','embed') NOT NULL DEFAULT 'non',
  `upload` enum('oui','non') NOT NULL DEFAULT 'oui',
  `media_defaut` varchar(10) NOT NULL DEFAULT 'file',
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `api_types_documents`
--

INSERT INTO `api_types_documents` (`extension`, `titre`, `descriptif`, `mime_type`, `inclus`, `upload`, `media_defaut`, `maj`) VALUES
('jpg', 'JPEG', '', 'image/jpeg', 'image', 'oui', 'image', '2022-03-23 03:55:50'),
('png', 'PNG', '', 'image/png', 'image', 'oui', 'image', '2022-03-23 03:55:50'),
('gif', 'GIF', '', 'image/gif', 'image', 'oui', 'image', '2022-03-23 03:55:50'),
('webp', 'WEBP', '', 'image/webp', 'image', 'oui', 'image', '2022-03-23 03:55:50'),
('bmp', 'BMP', '', 'image/x-ms-bmp', 'image', 'oui', 'image', '2022-03-23 03:55:50'),
('tif', 'TIFF', '', 'image/tiff', 'embed', 'oui', 'image', '2022-03-23 03:55:50'),
('aac', 'Advanced Audio Coding', '', 'audio/mp4a-latm', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('ac3', 'AC-3 Compressed Audio', '', 'audio/x-aac', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('aifc', 'Compressed AIFF Audio', '', 'audio/x-aifc', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('aiff', 'AIFF', '', 'audio/x-aiff', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('amr', 'Adaptive Multi-Rate Audio', '', 'audio/amr', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('ape', 'Monkey\'s Audio File', '', 'audio/x-monkeys-audio', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('asf', 'Windows Media', '', 'video/x-ms-asf', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('avi', 'AVI', '', 'video/x-msvideo', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('anx', 'Annodex', '', 'application/annodex', 'embed', 'oui', 'file', '2022-03-23 03:55:50'),
('axa', 'Annodex Audio', '', 'audio/annodex', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('axv', 'Annodex Video', '', 'video/annodex', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('dv', 'Digital Video', '', 'video/x-dv', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('f4a', 'Audio for Adobe Flash Player', '', 'audio/mp4', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('f4b', 'Audio Book for Adobe Flash Player', '', 'audio/mp4', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('f4p', 'Protected Video for Adobe Flash Player', '', 'video/mp4', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('f4v', 'Video for Adobe Flash Player', '', 'video/mp4', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('flac', 'Free Lossless Audio Codec', '', 'audio/x-flac', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('flv', 'Flash Video', '', 'video/x-flv', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('m2p', 'MPEG-PS', '', 'video/MP2P', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('m2ts', 'BDAV MPEG-2 Transport Stream', '', 'video/MP2T', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('m4a', 'MPEG4 Audio', '', 'audio/mp4a-latm', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('m4b', 'MPEG4 Audio', '', 'audio/mp4a-latm', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('m4p', 'MPEG4 Audio', '', 'audio/mp4a-latm', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('m4r', 'iPhone Ringtone', '', 'audio/aac', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('m4u', 'MPEG4 Playlist', '', 'video/vnd.mpegurl', 'non', 'oui', 'video', '2022-03-23 03:55:50'),
('m4v', 'MPEG4 Video', '', 'video/x-m4v', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('mid', 'Midi', '', 'audio/midi', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('mka', 'Matroska Audio', '', 'audio/mka', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('mkv', 'Matroska Video', '', 'video/mkv', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('mng', 'MNG', '', 'video/x-mng', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('mov', 'QuickTime', '', 'video/quicktime', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('mp3', 'MP3', '', 'audio/mpeg', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('mp4', 'MPEG4', '', 'application/mp4', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('mpc', 'Musepack', '', 'audio/x-musepack', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('mpg', 'MPEG', '', 'video/mpeg', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('mts', 'AVCHD MPEG-2 transport stream', '', 'video/MP2T', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('oga', 'Ogg Audio', '', 'audio/ogg', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('ogg', 'Ogg Vorbis', '', 'audio/ogg', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('ogv', 'Ogg Video', '', 'video/ogg', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('ogx', 'Ogg Multiplex', '', 'application/ogg', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('qt', 'QuickTime', '', 'video/quicktime', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('ra', 'RealAudio', '', 'audio/x-pn-realaudio', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('ram', 'RealAudio', '', 'audio/x-pn-realaudio', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('rm', 'RealAudio', '', 'audio/x-pn-realaudio', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('spx', 'Ogg Speex', '', 'audio/ogg', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('svg', 'SVG', '', 'image/svg+xml', 'image', 'oui', 'image', '2022-03-23 03:55:50'),
('svgz', 'Compressed Scalable Vector Graphic', '', 'image/svg+xml', 'embed', 'oui', 'image', '2022-03-23 03:55:50'),
('swf', 'Flash', '', 'application/x-shockwave-flash', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('ts', 'MPEG transport stream', '', 'video/MP2T', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('wav', 'WAV', '', 'audio/x-wav', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('webm', 'WebM', '', 'video/webm', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('wma', 'Windows Media Audio', '', 'audio/x-ms-wma', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('wmv', 'Windows Media Video', '', 'video/x-ms-wmv', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('y4m', 'YUV4MPEG2', '', 'video/x-raw-yuv', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('3gp', '3rd Generation Partnership Project', '', 'video/3gpp', 'embed', 'oui', 'video', '2022-03-23 03:55:50'),
('3ga', '3GP Audio File', '', 'audio/3ga', 'embed', 'oui', 'audio', '2022-03-23 03:55:50'),
('7z', '7 Zip', '', 'application/x-7z-compressed', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ai', 'Adobe Illustrator', '', 'application/illustrator', 'non', 'oui', 'image', '2022-03-23 03:55:50'),
('abw', 'Abiword', '', 'application/abiword', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('asx', 'Advanced Stream Redirector', '', 'video/x-ms-asf', 'non', 'oui', 'video', '2022-03-23 03:55:50'),
('bib', 'BibTeX', '', 'application/x-bibtex', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('bin', 'Binary Data', '', 'application/octet-stream', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('blend', 'Blender', '', 'application/x-blender', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('bz2', 'BZip', '', 'application/x-bzip2', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('c', 'C source', '', 'text/x-csrc', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('csl', 'Citation Style Language', '', 'application/xml', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('css', 'Cascading Style Sheet', '', 'text/css', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('csv', 'Comma Separated Values', '', 'text/csv', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('deb', 'Debian', '', 'application/x-debian-package', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('doc', 'Word', '', 'application/msword', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('dot', 'Word Template', '', 'application/msword', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('djvu', 'DjVu', '', 'image/vnd.djvu', 'non', 'oui', 'image', '2022-03-23 03:55:50'),
('dvi', 'LaTeX DVI', '', 'application/x-dvi', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('emf', 'Enhanced Metafile', '', 'image/x-emf', 'non', 'oui', 'image', '2022-03-23 03:55:50'),
('enl', 'EndNote Library', '', 'application/octet-stream', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ens', 'EndNote Style', '', 'application/octet-stream', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('eps', 'PostScript', '', 'application/postscript', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('epub', 'EPUB', '', 'application/epub+zip', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('gpx', 'GPS eXchange Format', '', 'application/gpx+xml', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('gz', 'GZ', '', 'application/x-gzip', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('h', 'C header', '', 'text/x-chdr', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('html', 'HTML', '', 'text/html', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ics', 'iCalendar', '', 'text/calendar', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('jar', 'Java Archive', '', 'application/java-archive', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('json', 'JSON', '', 'application/json', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('kml', 'Keyhole Markup Language', '', 'application/vnd.google-earth.kml+xml', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('kmz', 'Google Earth Placemark File', '', 'application/vnd.google-earth.kmz', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('lyx', 'Lyx file', '', 'application/x-lyx', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('m3u', 'M3U Playlist', '', 'text/plain', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('m3u8', 'M3U8 Playlist', '', 'text/plain', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('mathml', 'MathML', '', 'application/mathml+xml', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('mbtiles', 'MBTiles', '', 'application/x-sqlite3', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('md', 'Markdown Document', '', 'text/x-markdown', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('pas', 'Pascal', '', 'text/x-pascal', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('pdf', 'PDF', '', 'application/pdf', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('pgn', 'Portable Game Notation', '', 'application/x-chess-pgn', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('pls', 'Playlist', '', 'text/plain', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ppt', 'PowerPoint', '', 'application/vnd.ms-powerpoint', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('pot', 'PowerPoint Template', '', 'application/vnd.ms-powerpoint', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ps', 'PostScript', '', 'application/postscript', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('psd', 'Photoshop', '', 'image/x-photoshop', 'non', 'oui', 'image', '2022-03-23 03:55:50'),
('rar', 'WinRAR', '', 'application/x-rar-compressed', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('rdf', 'Resource Description Framework', '', 'application/rdf+xml', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ris', 'RIS', '', 'application/x-research-info-systems', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('rpm', 'RedHat/Mandrake/SuSE', '', 'application/x-redhat-package-manager', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('rtf', 'RTF', '', 'application/rtf', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('sdc', 'StarOffice Spreadsheet', '', 'application/vnd.stardivision.calc', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('sdd', 'StarOffice Presentation', '', 'application/vnd.stardivision.impress', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('sdw', 'StarOffice Writer document', '', 'application/vnd.stardivision.writer', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('sit', 'Stuffit', '', 'application/x-stuffit', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('sla', 'Scribus', '', 'application/x-scribus', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('srt', 'SubRip Subtitle', '', 'text/plain', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ssa', 'SubStation Alpha Subtitle', '', 'text/plain', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('sxc', 'OpenOffice.org Calc', '', 'application/vnd.sun.xml.calc', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('sxi', 'OpenOffice.org Impress', '', 'application/vnd.sun.xml.impress', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('sxw', 'OpenOffice.org', '', 'application/vnd.sun.xml.writer', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('tar', 'Tar', '', 'application/x-tar', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('tex', 'LaTeX', '', 'text/x-tex', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('tgz', 'TGZ', '', 'application/x-gtar', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('torrent', 'BitTorrent', '', 'application/x-bittorrent', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ttf', 'TTF Font', '', 'application/x-font-ttf', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('txt', 'Texte', '', 'text/plain', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('usf', 'Universal Subtitle Format', '', 'application/xml', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('vcf', 'vCard', '', 'text/vcard', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('vtt', 'WebVTT', '', 'text/vtt', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('xcf', 'GIMP multi-layer', '', 'application/x-xcf', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('xls', 'Excel', '', 'application/vnd.ms-excel', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('xlt', 'Excel Template', '', 'application/vnd.ms-excel', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('wmf', 'Windows Metafile', '', 'image/x-emf', 'non', 'oui', 'image', '2022-03-23 03:55:50'),
('wpl', 'Windows Media Player Playlist', '', 'application/vnd.ms-wpl', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('xspf', 'XSPF', '', 'application/xspf+xml', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('xml', 'XML', '', 'application/xml', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('yaml', 'YAML', '', 'text/yaml', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('zip', 'Zip', '', 'application/zip', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('odt', 'OpenDocument Text', '', 'application/vnd.oasis.opendocument.text', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ods', 'OpenDocument Spreadsheet', '', 'application/vnd.oasis.opendocument.spreadsheet', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('odp', 'OpenDocument Presentation', '', 'application/vnd.oasis.opendocument.presentation', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('odg', 'OpenDocument Graphics', '', 'application/vnd.oasis.opendocument.graphics', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('odc', 'OpenDocument Chart', '', 'application/vnd.oasis.opendocument.chart', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('odf', 'OpenDocument Formula', '', 'application/vnd.oasis.opendocument.formula', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('odb', 'OpenDocument Database', '', 'application/vnd.oasis.opendocument.database', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('odi', 'OpenDocument Image', '', 'application/vnd.oasis.opendocument.image', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('odm', 'OpenDocument Text-master', '', 'application/vnd.oasis.opendocument.text-master', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ott', 'OpenDocument Text-template', '', 'application/vnd.oasis.opendocument.text-template', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ots', 'OpenDocument Spreadsheet-template', '', 'application/vnd.oasis.opendocument.spreadsheet-template', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('otp', 'OpenDocument Presentation-template', '', 'application/vnd.oasis.opendocument.presentation-template', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('otg', 'OpenDocument Graphics-template', '', 'application/vnd.oasis.opendocument.graphics-template', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('cls', 'LaTeX Class', '', 'text/x-tex', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('sty', 'LaTeX Style Sheet', '', 'text/x-tex', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('docm', 'Word', '', 'application/vnd.ms-word.document.macroEnabled.12', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('docx', 'Word', '', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('dotm', 'Word template', '', 'application/vnd.ms-word.template.macroEnabled.12', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('dotx', 'Word template', '', 'application/vnd.openxmlformats-officedocument.wordprocessingml.template', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('potm', 'Powerpoint template', '', 'application/vnd.ms-powerpoint.template.macroEnabled.12', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('potx', 'Powerpoint template', '', 'application/vnd.openxmlformats-officedocument.presentationml.template', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ppam', 'Powerpoint addin', '', 'application/vnd.ms-powerpoint.addin.macroEnabled.12', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ppsm', 'Powerpoint slideshow', '', 'application/vnd.ms-powerpoint.slideshow.macroEnabled.12', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('ppsx', 'Powerpoint slideshow', '', 'application/vnd.openxmlformats-officedocument.presentationml.slideshow', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('pptm', 'Powerpoint', '', 'application/vnd.ms-powerpoint.presentation.macroEnabled.12', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('pptx', 'Powerpoint', '', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('xlam', 'Excel', '', 'application/vnd.ms-excel.addin.macroEnabled.12', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('xlsb', 'Excel binary', '', 'application/vnd.ms-excel.sheet.binary.macroEnabled.12', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('xlsm', 'Excel', '', 'application/vnd.ms-excel.sheet.macroEnabled.12', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('xlsx', 'Excel', '', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('xltm', 'Excel template', '', 'application/vnd.ms-excel.template.macroEnabled.12', 'non', 'oui', 'file', '2022-03-23 03:55:50'),
('xltx', 'Excel template', '', 'application/vnd.openxmlformats-officedocument.spreadsheetml.template', 'non', 'oui', 'file', '2022-03-23 03:55:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_urls`
--

CREATE TABLE `api_urls` (
  `id_parent` bigint(21) NOT NULL DEFAULT 0,
  `url` varchar(255) NOT NULL,
  `type` varchar(25) NOT NULL DEFAULT 'article',
  `id_objet` bigint(21) NOT NULL,
  `date` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `segments` smallint(3) NOT NULL DEFAULT 1,
  `perma` tinyint(1) NOT NULL DEFAULT 0,
  `langue` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_usuarios`
--

CREATE TABLE `api_usuarios` (
  `id` bigint(20) NOT NULL,
  `numero_documento` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `primer_nombre` varchar(255) NOT NULL,
  `segundo_nombre` varchar(255) NOT NULL,
  `primer_apellido` varchar(255) NOT NULL,
  `segundo_apellido` varchar(255) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `email_personas` varchar(255) NOT NULL,
  `celular` varchar(255) NOT NULL,
  `celular2` varchar(50) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `idRol` int(21) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `token` varchar(10) NOT NULL,
  `status` varchar(12) NOT NULL DEFAULT 'Active',
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `api_usuarios`
--

INSERT INTO `api_usuarios` (`id`, `numero_documento`, `username`, `password`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `nombres`, `apellidos`, `email_personas`, `celular`, `celular2`, `direccion`, `sexo`, `idRol`, `id_empresa`, `token`, `status`, `maj`) VALUES
(1, '77027207', '77027207', 'U2FsdGVkX18MPEv/wPUs4WlM/hWCL24jz3zmmGydk5Y=', 'Holmes', 'Elias', 'Pinto', 'Avila', 'Holmes Elias ', 'Pinto Avila', 'holmespinto@unicesar.edu.co', '3162789497', '', '', 'M', 1, 1, '', 'Active', '2022-05-02 02:13:19'),
(2, '123456789', '123456789', 'U2FsdGVkX18MPEv/wPUs4WlM/hWCL24jz3zmmGydk5Y=', 'Hosmmer', 'Eduardo', 'Pinto', 'Rojas', 'Hosmmer Eduardo', 'Pinto Rojas', 'hosmmmer@gmail.com', '12345873', '12358477', 'Trans 22 No. 10a', 'M', 1, 1, '', 'Active', '2022-05-02 02:13:19'),
(10, '77027208', 'hepinto2022', 'U2FsdGVkX19LtijTfOfBdpqWdDssQ22bYGBy1fY04GI=', 'Delber', 'Barbosa', 'Barbosa', 'Barboza', 'Delber Barbosa', 'Barbosa Barboza', 'delberbarboza@unicesar.edu.co', '316278', '123456789', 'Trans 22', 'M', 1, 1, '', 'Active', '2022-05-13 06:42:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_versions`
--

CREATE TABLE `api_versions` (
  `id_version` bigint(21) NOT NULL DEFAULT 0,
  `id_objet` bigint(21) NOT NULL DEFAULT 0,
  `objet` varchar(25) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '2024-01-01 01:01:01',
  `id_auteur` varchar(23) NOT NULL DEFAULT '',
  `titre_version` text NOT NULL DEFAULT '',
  `permanent` char(3) NOT NULL DEFAULT '',
  `champs` text NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_versions_fragments`
--

CREATE TABLE `api_versions_fragments` (
  `id_fragment` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `version_min` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `version_max` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_objet` bigint(21) NOT NULL,
  `objet` varchar(25) NOT NULL DEFAULT '',
  `compress` tinyint(4) NOT NULL,
  `fragment` longblob DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_visites`
--

CREATE TABLE `api_visites` (
  `date` date NOT NULL,
  `visites` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_visites_articles`
--

CREATE TABLE `api_visites_articles` (
  `date` date NOT NULL,
  `id_article` int(10) UNSIGNED NOT NULL,
  `visites` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brevess`
--

CREATE TABLE `brevess` (
  `id_breve` int(21) NOT NULL,
  `date_heure` datetime NOT NULL,
  `titre` text NOT NULL,
  `texte` text NOT NULL,
  `lien_titre` text NOT NULL,
  `lien_url` text NOT NULL,
  `statut` varchar(6) NOT NULL,
  `id_rubrique` int(21) NOT NULL,
  `lang` text NOT NULL,
  `langue_choisie` varchar(3) NOT NULL,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_actacomite`
--

CREATE TABLE `sena_actacomite` (
  `idActaComite` int(21) NOT NULL,
  `idSolicitud` int(15) NOT NULL,
  `idDirectivo` int(21) NOT NULL,
  `idApoyo` int(21) NOT NULL,
  `miembrosComites` varchar(45) NOT NULL,
  `codigoFicha` varchar(45) NOT NULL,
  `fechaAgendada` varchar(255) NOT NULL,
  `reglas` text NOT NULL,
  `decision` varchar(45) NOT NULL,
  `entidad` varchar(15) NOT NULL,
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sena_actacomite`
--

INSERT INTO `sena_actacomite` (`idActaComite`, `idSolicitud`, `idDirectivo`, `idApoyo`, `miembrosComites`, `codigoFicha`, `fechaAgendada`, `reglas`, `decision`, `entidad`, `maj`) VALUES
(1, 65, 1, 47, '1,2', '22:46', 'ghfg', '', '', 'senaV1', '2023-11-20 21:10:17'),
(2, 68, 1, 47, '1,2', 'SC-20230919T000000Z-48-68', 'hfg', '', '', 'senaV1', '2023-11-20 21:10:14'),
(3, 74, 1, 47, '1,2', 'SC-20230921T120000Z-48-74', '2023-11-11 23:15:00', '', '', 'senaV1', '2023-11-20 21:14:03'),
(4, 75, 1, 47, '1,2', 'SC-20230921T120000Z-48-75', '2023-11-04 12:18:00', 'REGLAS', '', 'senaV1', '2023-11-20 21:16:13'),
(5, 72, 1, 47, '1,2', 'SC-20230921T120000Z-48-72', '2023-11-18 23:39:00', 'reglas', '', 'senaV1', '2023-11-20 21:38:00'),
(6, 77, 1, 47, '1,2', 'SC-20230921T120000Z-48-77', '2023-11-01 21:02:00', 'DEBERES DEL APRENDIZ. En el  articulo 9, numeral 1 \"Cumplir con todas las actividades propias de su proceso de aprendizaje o del plan de mejoramiento, definidas durante su etapa lectiva y productiva. ', '', 'senaV1', '2023-11-22 20:02:02'),
(8, 82, 1, 47, '1,2', 'SC-20230921T130000Z-48-82', '2023-11-01 07:19:00', 'gfdgdfgdsfg', '', 'senaV1', '2023-11-22 20:20:13'),
(9, 73, 1, 47, '1,2', 'SC-20230921T120000Z-48-73', '2023-11-29 22:46:00', 'ghjghjgj', '', 'senaV1', '2023-11-22 20:44:49'),
(13, 79, 1, 47, '1', 'SC-20230921T120000Z-48-79', '2023-11-01 23:41:00', 'sdfsdfsdfsdf', '', 'senaV1', '2023-11-22 22:40:42'),
(22, 80, 1, 47, '1,2', 'SC-20230921T120000Z-48-80', '2024-06-06 05:25:00', 'dfgdfgdfgd', '', 'senaV1', '2024-06-06 03:23:48'),
(23, 84, 1, 47, '1,2', 'SC-20230921T120000Z-48-84', '2024-06-07 04:26:00', 'cvbcvbcv', '', 'senaV1', '2024-06-06 03:27:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_actas`
--

CREATE TABLE `sena_actas` (
  `idActa` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `fecha` date NOT NULL,
  `horaInicial` time NOT NULL,
  `horaFinal` time NOT NULL,
  `ciudad` varchar(255) NOT NULL DEFAULT 'Bucaramanga',
  `lugar` text NOT NULL DEFAULT 'Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente',
  `direccion` text NOT NULL DEFAULT 'Centro de Servicios Empresariales y Turísticos',
  `casosComite` varchar(255) NOT NULL,
  `secretario` varchar(255) NOT NULL,
  `asistencias` varchar(255) NOT NULL,
  `presentacion` text NOT NULL,
  `entidad` varchar(25) NOT NULL DEFAULT 'senaV1',
  `statut` varchar(8) NOT NULL DEFAULT 'Activo',
  `maj` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sena_actas`
--

INSERT INTO `sena_actas` (`idActa`, `nombre`, `fecha`, `horaInicial`, `horaFinal`, `ciudad`, `lugar`, `direccion`, `casosComite`, `secretario`, `asistencias`, `presentacion`, `entidad`, `statut`, `maj`) VALUES
(2, 'Acta No.1.214', '2024-05-21', '20:22:00', '21:23:00', 'Bucaramanga', 'Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente', 'Centro de Servicios Empresariales y Turísticos', '56,55,58,59', 'Coordinadora Acad?mica Doris Vargas', '', 'Siendo las 08:00 am del día 13 de septiembre de 2023, se reune el Comité de Evaluación y Seguimiento de\nAprendices, con el fin de analizar el rendimiento y desempeño de la etapa lectiva y productiva del Centro de\nServicios Empresariales y Turísticos. A este comité asisten quienes se encuentran relacionados con su\ninformación personal en la planilla de asistencia que contiene este documento, ejerciendo las funciones de\nsecretario de la reunión la Coordinadora Acad?mica Doris Vargas.', 'senaV1', 'Activo', '2024-05-16 22:19:48'),
(3, 'Acta No.3', '2024-05-16', '21:24:00', '23:26:00', 'Bucaramanga', 'Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente', 'Centro de Servicios Empresariales y Turísticos', '55,56,51', 'Coordinadora juana ', '', 'Siendo las 08:00 am del d?a 13 de septiembre de 2023, se re?ne el Comit? de Evaluaci?n y Seguimiento de\nAprendices, con el fin de analizar el rendimiento y desempe?o de la etapa lectiva y productiva del Centro de\nServicios Empresariales y Tur?sticos. A este comit? asisten quienes se encuentran relacionados con su\ninformaci?n personal en la planilla de asistencia que contiene este documento, ejerciendo las funciones de\nsecretario de la reuni?n la Coordinadora Acad?mica Doris Vargas.', 'senaV1', 'Activo', '2024-05-16 22:20:58'),
(4, 'Acta No.333', '2024-05-24', '22:50:00', '23:51:00', 'Bucaramanga', 'Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente', 'Centro de Servicios Empresariales y Turísticos', '84', 'Carlos', '', '', 'senaV1', '	Activo', '2024-05-17 00:48:02'),
(5, 'Acya No.5', '2024-05-22', '20:35:00', '23:41:00', 'Bucaramanga', 'Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente', 'Centro de Servicios Empresariales y Turísticos', '55', 'Coordinadora Acad?mica Doris Vargas', '', 'Siendo las 08:00 am del día 13 de septiembre de 2023, se reune el Comité de Evaluación y Seguimiento de\nAprendices, con el fin de analizar el rendimiento y desempeño de la etapa lectiva y productiva del Centro de\nServicios Empresariales y Turísticos. A este comité asisten quienes se encuentran relacionados con su\ninformación personal en la planilla de asistencia que contiene este documento, ejerciendo las funciones de\nsecretario de la reunión la Coordinadora Acad?mica Doris Vargas.Acta5', 'senaV1', '	Activo', '2024-05-21 22:35:32'),
(6, 'Acta No.555', '2024-06-07', '14:09:00', '16:12:00', 'Bucaramanga', 'Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente', 'Centro de Servicios Empresariales y Turísticos', '60,56', 'Coordinadora Acad?mica Doris Vargas', '', 'sdfsdfasdfsdaf', 'senaV1', 'Activo', '2024-06-08 16:07:12'),
(7, 'Acta no6666', '2024-06-08', '16:13:00', '16:13:00', 'Bucaramanga', 'Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente', 'Centro de Servicios Empresariales y Turísticos', '51', 'Carlos', '', '', 'senaV1', 'Activa', '2024-06-08 16:09:04'),
(8, 'Acta no6666555', '2024-06-08', '15:50:00', '16:13:00', 'Bucaramanga', 'Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente', 'Centro de Servicios Empresariales y Turísticos', '56', 'Carlos', '', '', 'senaV1', 'Activo', '2024-06-08 16:11:21'),
(9, 'Acta no666', '2024-06-08', '15:50:00', '16:13:00', 'Bucaramanga', 'Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente', 'Centro de Servicios Empresariales y Turísticos', '56,59,58,57,51,55,61,60,62,64,65,67,68,69,71,77,79,80,63,70,74,72,75,76,66,84,82,235', 'Carlos', '', '', 'senaV1', 'Activo', '2024-06-08 16:18:09'),
(10, 'acta333', '2024-06-10', '13:57:00', '13:57:00', 'Bucaramanga', 'Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente', 'Centro de Servicios Empresariales y Turísticos', '56,59,58,57,51,55,61,60,62,64,65,67,68,69,71,77,79,80,63,70,74,72,75,76', 'xxxx', '', 'ssdsdsd', 'senaV1', 'Activo', '2024-06-11 04:54:49'),
(11, 'ActaN011', '2024-06-14', '16:05:00', '16:09:00', 'Bucaramanga', 'Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente', 'Centro de Servicios Empresariales y Turísticos', '55,51', 'Carlos', '', 'Siendo las 08:00 am del día 13 de septiembre de 2023, se reune el Comité de Evaluación y Seguimiento de\nAprendices, con el fin de analizar el rendimiento y desempeño de la etapa lectiva y productiva del Centro de\nServicios Empresariales y Turísticos. A este comité asisten quienes se encuentran relacionados con su\ninformación personal en la planilla de asistencia que contiene este documento, ejerciendo las funciones de\nsecretario de la reunión la Coordinadora Acad?mica Doris Vargas.', 'senaV1', 'Activo', '2024-06-11 21:04:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_actas_conceptos`
--

CREATE TABLE `sena_actas_conceptos` (
  `idConcepto` int(21) NOT NULL,
  `idActa` int(21) NOT NULL,
  `idSolicitud` int(21) NOT NULL,
  `hechos` text NOT NULL,
  `contemplacion` text NOT NULL,
  `frenteHechos` text NOT NULL,
  `recomendacion` text NOT NULL,
  `compromisos` text NOT NULL,
  `entidad` varchar(10) NOT NULL DEFAULT 'senaV1',
  `maj` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sena_actas_conceptos`
--

INSERT INTO `sena_actas_conceptos` (`idConcepto`, `idActa`, `idSolicitud`, `hechos`, `contemplacion`, `frenteHechos`, `recomendacion`, `compromisos`, `entidad`, `maj`) VALUES
(6, 2, 57, 'La aprendiz XXX presenta al comité de evaluación y seguimiento según citación enviada. La Coordinadora académica Doris presenta el caso y a los miembros del comité, según información reportada por el Instructor xxxxxx quien indica que xxxx', 'El instructor informa inconvenientes presentados en el desarrollo de la etapa lectiva La aprendiz no presentó evidencia de producto de la guía ', 'La aprendiz XXX se presenta al comité de evaluación y seguimiento según citación enviada, la coordinadora académica Doris le pregunta al aprendiz si sabe porque fue citada al comité, Se le pregunta al aprendiz que, sí es clara la información entregada en el comité de evaluación y seguimiento, manifiesta que sí, igualmente se le informa que al correo registrado en el aplicativo le llega la recomendación del comité.', 'La aprendiz XXX se presenta al comité de evaluación y seguimiento según citación enviada, la coordinadora académica Doris le pregunta al aprendiz si sabe porque fue citada al comité, Se le pregunta al aprendiz que, sí es clara la información entregada en el comité de evaluación y seguimiento, manifiesta que sí, igualmente se le informa que al correo registrado en el aplicativo le llega la recomendación del comité.', 'La aprendiz XXX se presenta al comité de evaluación y seguimiento según citación enviada, la coordinadora académica Doris le pregunta al aprendiz si sabe porque fue citada al comité, Se le pregunta al aprendiz que, sí es clara la información entregada en el comité de evaluación y seguimiento, manifiesta que sí, igualmente se le informa que al correo registrado en el aplicativo le llega la recomendación del comité.', 'senaV1', '2024-05-18 17:26:07'),
(7, 3, 55, 'El instructor informa inconvenientes presentados en el desarrollo de la etapa lectiva La aprendiz no presentó evidencia de producto de la guía ', 'El instructor informa inconvenientes presentados en el desarrollo de la etapa lectiva La aprendiz no presentó evidencia de producto de la guía ', '', 'CONDICIONAMIENTO DE REGISTRO DE MATRICULA POR INDOLE ACADEMICO Y DISCIPLINARIO,\nREPETIR COMPETENCIA DE EMPRENDIMIENTO EN CONTRA JORNADA CON LA INSTRUCTOR', '', 'senaV1', '2024-05-18 17:39:36'),
(8, 3, 56, 'No entiendo muy bien el problema que tienes, si es que no quieres que los caracteres especiales se convierten en formato \\u....\n\nEl receptor tiene que revertir la codificación, normalmente lo hace automáticamente, por ejemplo en php usando json_decode(data_json) lo convierte sin más.', '\nNo entiendo muy bien el problema que tienes, si es que no quieres que los caracteres especiales se convierten en formato \\u....\n\nEl receptor tiene que revertir la codificación, normalmente lo hace automáticamente, por ejemplo en php usando json_decode(data_json) lo convierte sin más.', '\nNo entiendo muy bien el problema que tienes, si es que no quieres que los caracteres especiales se convierten en formato \\u....\n\nEl receptor tiene que revertir la codificación, normalmente lo hace automáticamente, por ejemplo en php usando json_decode(data_json) lo convierte sin más.', 'No entiendo muy bien el problema que tienes, si es que no quieres que los caracteres especiales se convierten en formato \\u....\nEl receptor tiene que revertir la codificación, normalmente lo hace automáticamente, por ejemplo en php usando json_decode(data_json) lo convierte sin más.', '\nNo entiendo muy bien el problema que tienes, si es que no quieres que los caracteres especiales se convierten en formato \\u....\n\nEl receptor tiene que revertir la codificación, normalmente lo hace automáticamente, por ejemplo en php usando json_decode(data_json) lo convierte sin más.', 'senaV1', '2024-05-18 17:41:45'),
(10, 2, 58, '', '', '', '', '', 'senaV1', '2024-05-19 00:38:42'),
(11, 4, 51, 'La aprendiz XXX se presenta al comité de evaluación y seguimiento según citación enviada, la coordinadora académica Doris le pregunta al aprendiz si sabe porque fue citada al comité, Se le pregunta al aprendiz que, sí es clara la información entregada en el comité de evaluación y seguimiento, manifiesta que sí, igualmente se le informa que al correo registrado en el aplicativo le llega la recomendación del comité.', 'La aprendiz XXX presenta al comité de evaluación y seguimiento según citación enviada. La Coordinadora académica Doris presenta el caso y a los miembros del comité, según información reportada por el Instructor xxxxxx quien indica que xxxx', '', '', 'La aprendiz XXX presenta al comité de evaluación y seguimiento según citación enviada. La Coordinadora académica Doris presenta el caso y a los miembros del comité, según información reportada por el Instructor xxxxxx quien indica que xxxx', 'senaV1', '2024-05-19 00:42:29'),
(12, 3, 51, 'Hechos:\nEl instructor informa inconvenientes presentados en el desarrollo de la etapa lectiva La aprendiz no presentó\nevidencia de producto de la guía', 'La aprendiz JOSE CARLOS MARTINEZ AVILA presenta al comité de evaluación y seguimiento según citación enviada. La Coordinadora\nacadémica Doris presenta el caso y a los miembros del comité, según información reportada por el Instructor\nxxxxxx quien indica que JOSE CARLOS MARTINEZ AVILA', 'La aprendiz JOSE CARLOS MARTINEZ AVILA se presenta al comité de evaluación y seguimiento según citación enviada, la coordinadora académica Doris le pregunta al aprendiz si sabe porque fue citada al comité, Se le pregunta al aprendiz que, sí es clara la información entregada en el comité de evaluación y seguimiento, manifiesta que sí, igualmente se le informa que al correo registrado en el aplicativo le llega la recomendación del comité', 'CONDICIONAMIENTO DE REGISTRO DE MATRICULA POR INDOLE ACADEMICO Y DISCIPLINARIO,\nREPETIR COMPETENCIA DE EMPRENDIMIENTO EN CONTRA JORNADA CON LA INSTRUCTOR', '', 'senaV1', '2024-06-08 17:08:53'),
(13, 2, 51, 'El método clave usado es AcceptPageBreak(). Permite aceptar o no el salto automático de línea. Evitándolo y alterando la posición actual y el margen, se consigue la disposición deseada en columnas.', '', '', '', '', 'senaV1', '2024-06-12 00:03:11'),
(14, 2, 55, 'El método clave usado es AcceptPageBreak(). Permite aceptar o no el salto automático de línea. Evitándolo y alterando la posición actual y el margen, se consigue la disposición deseada en columnas.vv', 'El método clave usado es AcceptPageBreak(). Permite aceptar o no el salto automático de línea. Evitándolo y alterando la posición actual y el margen, se consigue la disposición deseada en columnas.', 'El método clave usado es AcceptPageBreak(). Permite aceptar o no el salto automático de línea. Evitándolo y alterando la posición actual y el margen, se consigue la disposición deseada en columnas.', 'El método clave usado es AcceptPageBreak(). Permite aceptar o no el salto automático de línea. Evitándolo y alterando la posición actual y el margen, se consigue la disposición deseada en columnas.', 'El método clave usado es AcceptPageBreak(). Permite aceptar o no el salto automático de línea. Evitándolo y alterando la posición actual y el margen, se consigue la disposición deseada en columnas.', 'senaV1', '2024-06-12 00:05:37'),
(15, 8, 56, 'La aprendiz XXX se presenta al comité de evaluación y seguimiento según citación enviada, la coordinadora académica Doris le pregunta al aprendiz si sabe porque fue citada al comité, Se le pregunta al aprendiz que, sí es clara la información entregada en el comité de evaluación y seguimiento, manifiesta que sí, igualmente se le informa que al correo registrado en el aplicativo le llega la recomendación del comité,', '', '', '', '', 'senaV1', '2024-06-12 00:40:44'),
(16, 11, 51, 'Parece que el código que has proporcionado contiene varios bloques de PHP y dentro de ellos hay muchas funciones y estructuras de control. El problema que mencionas de una \"llave de cierre\" puede referirse a una llave { o } faltante o mal colocada en el código, lo que puede causar errores de sintaxis.', 'Parece que el código que has proporcionado contiene varios bloques de PHP y dentro de ellos hay muchas funciones y estructuras de control. El problema que mencionas de una \"llave de cierre\" puede referirse a una llave { o } faltante o mal colocada en el código, lo que puede causar errores de sintaxis.', 'Parece que el código que has proporcionado contiene varios bloques de PHP y dentro de ellos hay muchas funciones y estructuras de control. El problema que mencionas de una \"llave de cierre\" puede referirse a una llave { o } faltante o mal colocada en el código, lo que puede causar errores de sintaxis.', 'Parece que el código que has proporcionado contiene varios bloques de PHP y dentro de ellos hay muchas funciones y estructuras de control. El problema que mencionas de una \"llave de cierre\" puede referirse a una llave { o } faltante o mal colocada en el código, lo que puede causar errores de sintaxis.', 'Parece que el código que has proporcionado contiene varios bloques de PHP y dentro de ellos hay muchas funciones y estructuras de control. El problema que mencionas de una \"llave de cierre\" puede referirse a una llave { o } faltante o mal colocada en el código, lo que puede causar errores de sintaxis.', 'senaV1', '2024-06-12 00:42:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_agenda`
--

CREATE TABLE `sena_agenda` (
  `idAgenda` int(21) NOT NULL,
  `idApoyo` int(21) NOT NULL,
  `idSolicitud` int(21) NOT NULL,
  `hechos` text NOT NULL,
  `horaMinutoInicial` datetime NOT NULL,
  `horaMinutoFinal` datetime NOT NULL,
  `tiempoEstipulado` varchar(4) NOT NULL,
  `idComites` varchar(15) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `entidad` varchar(15) NOT NULL,
  `statut` varchar(15) NOT NULL,
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sena_agenda`
--

INSERT INTO `sena_agenda` (`idAgenda`, `idApoyo`, `idSolicitud`, `hechos`, `horaMinutoInicial`, `horaMinutoFinal`, `tiempoEstipulado`, `idComites`, `estado`, `start`, `end`, `title`, `entidad`, `statut`, `maj`) VALUES
(6, 47, 46, 'undefined', '2023-09-18 08:02:00', '2023-09-18 08:32:00', '30', '1,2', 'AGENDADO', '2023-09-18 08:02:00', '2023-09-18 08:32:00', '08:02', 'senaV1', '1', '2023-09-18 14:42:12'),
(12, 47, 48, 'fghfgh', '2023-09-18 07:10:00', '2023-09-18 07:25:00', '15', '1', 'AGENDADO', '2023-09-18 07:10:00', '2023-09-18 07:25:00', '07:10', 'senaV1', '1', '2023-09-18 06:37:24'),
(14, 47, 62, 'GFDGDF', '2023-09-18 09:44:00', '2023-09-18 09:59:00', '15', '1', 'AGENDADO', '2023-09-18 09:44:00', '2023-09-18 09:59:00', '09:44', 'senaV1', '1', '2023-09-18 10:22:57'),
(15, 47, 59, 'fsdf', '2023-09-21 15:25:00', '2023-09-20 16:10:00', '45', '1', 'AGENDADO', '2023-09-21 15:25:00', '2023-09-20 16:10:00', '15:25', 'senaV1', '1', '2023-09-20 15:23:45'),
(16, 47, 61, 'fgfdg', '2023-09-29 01:00:00', '2023-09-29 00:00:00', '60', '1', 'AGENDADO', '2023-09-29 01:00:00', '2023-09-29 02:00:00', '01:00', 'senaV1', '1', '2023-09-18 11:57:13'),
(17, 26, 58, 'sadsdasd', '2023-09-20 06:24:00', '2023-09-20 00:00:00', '30', '1', 'AGENDADO', '2023-09-20 06:24:00', '2023-09-20 06:54:00', '06:24', 'senaV1', '1', '2023-09-18 14:41:53'),
(18, 26, 70, 'sdasdasd', '2023-09-19 18:13:00', '2023-09-19 00:00:00', '30', '1,2', 'AGENDADO', '2023-09-19 18:13:00', '2023-09-19 18:43:00', '18:13', 'senaV1', '1', '2023-09-20 15:09:42'),
(19, 48, 69, 'gfdg', '2023-09-16 19:19:00', '2023-09-16 00:00:00', '45', '1', 'AGENDADO', '2023-09-16 19:19:00', '2023-09-16 20:04:00', '19:19', 'senaV1', '1', '2023-09-20 15:16:16'),
(20, 26, 67, 'asdaaa', '2023-09-22 18:17:00', '2023-09-22 00:00:00', '60', '1,2', 'AGENDADO', '2023-09-22 18:17:00', '2023-09-22 19:17:00', '18:17', 'senaV1', '1', '2023-09-20 15:17:35'),
(21, 26, 66, 'HHHH', '2023-09-24 08:33:00', '2023-09-20 09:03:00', '30', '1', 'AGENDADO', '2023-09-24 08:33:00', '2023-09-20 09:03:00', '08:33', 'senaV1', '1', '2023-09-20 15:30:42'),
(24, 26, 245, 'Reunion academicas', '2023-10-05 06:33:00', '2023-10-04 07:33:00', '60', '1', 'AGENDADO', '2023-10-05 06:33:00', '2023-10-04 07:33:00', '06:33', 'senaV1', '1', '2023-10-04 12:33:27'),
(25, 47, 51, '', '2023-11-18 18:44:00', '2023-11-18 00:00:00', '30', '1,2', 'AGENDADO', '2023-11-18 18:44:00', '2023-11-18 19:14:00', '18:44', 'senaV1', '1', '2023-11-13 16:42:50'),
(26, 47, 57, '', '2023-11-10 22:59:00', '2023-11-10 00:00:00', '15', '1', 'AGENDADO', '2023-11-10 22:59:00', '2023-11-10 23:14:00', '22:59', 'senaV1', '1', '2023-11-18 17:55:02'),
(27, 47, 56, '', '2023-11-18 20:06:00', '2023-11-18 00:00:00', '30', '2', 'AGENDADO', '2023-11-18 20:06:00', '2023-11-18 20:36:00', '20:06', 'senaV1', '1', '2023-11-18 18:04:26'),
(31, 47, 55, '', '2023-11-18 22:40:00', '2023-11-18 00:00:00', '15', '1,2', 'AGENDADO', '2023-11-18 22:40:00', '2023-11-18 22:55:00', '22:40', 'senaV1', '1', '2023-11-20 09:40:11'),
(32, 47, 60, '', '2023-11-18 11:43:00', '2023-11-18 00:00:00', '30', '1,2', 'AGENDADO', '2023-11-18 11:43:00', '2023-11-18 12:13:00', '11:43', 'senaV1', '1', '2023-11-20 09:41:06'),
(33, 47, 63, '', '2023-11-18 22:29:00', '2023-11-18 00:00:00', '15', '1,2', 'AGENDADO', '2023-11-18 22:29:00', '2023-11-18 22:44:00', '22:29', 'senaV1', '1', '2023-11-20 20:27:58'),
(34, 47, 64, '', '2023-11-18 22:35:00', '2023-11-18 00:00:00', '15', '1,2', 'AGENDADO', '2023-11-18 22:35:00', '2023-11-18 22:50:00', '22:35', 'senaV1', '1', '2023-11-20 20:36:08'),
(39, 47, 72, '', '2023-11-18 23:39:00', '2023-11-18 00:00:00', '15', '1,2', 'AGENDADO', '2023-11-18 23:39:00', '2023-11-18 23:54:00', '23:39', 'senaV1', '1', '2023-11-20 21:38:00'),
(40, 47, 77, '', '2023-11-01 21:02:00', '2023-11-01 00:00:00', '15', '1,2', 'AGENDADO', '2023-11-01 21:02:00', '2023-11-01 21:17:00', '21:02', 'senaV1', '1', '2023-11-22 20:02:02'),
(42, 47, 82, '', '2023-11-01 07:19:00', '2023-11-01 00:00:00', '30', '1,2', 'AGENDADO', '2023-11-01 07:19:00', '2023-11-01 07:49:00', '07:19', 'senaV1', '1', '2023-11-22 20:20:13'),
(43, 47, 73, '', '2023-11-29 22:46:00', '2023-11-29 00:00:00', '15', '1,2', 'AGENDADO', '2023-11-29 22:46:00', '2023-11-29 23:01:00', '22:46', 'senaV1', '1', '2023-11-22 20:44:49'),
(44, 26, 254, '', '2023-11-01 08:40:00', '2023-11-01 00:00:00', '30', '1', 'AGENDADO', '2023-11-01 08:40:00', '2023-11-01 09:10:00', '08:40', 'senaV1', '1', '2023-11-22 20:53:48'),
(45, 26, 249, '', '2023-11-01 08:43:00', '2023-11-01 00:00:00', '15', '1', 'AGENDADO', '2023-11-01 08:43:00', '2023-11-01 08:58:00', '08:43', 'senaV1', '1', '2023-11-22 20:58:59'),
(46, 26, 248, '', '2023-11-01 10:09:00', '2023-11-01 00:00:00', '15', '2', 'AGENDADO', '2023-11-01 10:09:00', '2023-11-01 10:24:00', '10:09', 'senaV1', '1', '2023-11-22 21:00:15'),
(47, 47, 79, '', '2023-11-01 23:41:00', '2023-11-01 00:00:00', '15', '1', 'AGENDADO', '2023-11-01 23:41:00', '2023-11-01 23:56:00', '23:41', 'senaV1', '1', '2023-11-22 22:40:42'),
(48, 26, 234, '', '2024-02-08 03:53:00', '2024-02-08 00:00:00', '30', '1', 'AGENDADO', '2024-02-08 03:53:00', '2024-02-08 04:23:00', '03:53', 'senaV1', '1', '2024-02-01 00:51:09'),
(49, 26, 78, 'sdasdasd', '2024-04-04 03:20:00', '2024-04-04 02:10:00', '15', '1', 'AGENDADO', '2024-04-04 03:20:00', '2024-04-04 02:10:00', '03:20', 'senaV1', '1', '2024-04-14 22:47:50'),
(53, 26, 262, 'sdasdasdasd', '2024-04-11 02:43:00', '2024-04-11 03:40:00', '30', '1', 'AGENDADO', '2024-04-11 02:43:00', '2024-04-11 03:40:00', '02:43', 'senaV1', '1', '2024-04-15 01:42:38'),
(54, 26, 263, 'SDASDASDASDASDA', '2024-04-05 02:44:00', '2024-04-05 00:00:00', '30', '1', 'AGENDADO', '2024-04-05 02:44:00', '2024-04-05 03:14:00', '02:44', 'senaV1', '1', '2024-04-15 01:44:02'),
(55, 26, 76, 'sadasdasd', '2024-04-18 22:34:00', '2024-04-18 00:00:00', '30', '1', 'AGENDADO', '2024-04-18 22:34:00', '2024-04-18 23:04:00', '22:34', 'senaV1', '1', '2024-04-23 20:32:35'),
(56, 47, 80, 'dfgdfgdfg', '2024-06-06 05:25:00', '2024-06-06 00:00:00', '30', '1,2', 'AGENDADO', '2024-06-06 05:25:00', '2024-06-06 05:55:00', '05:25', 'senaV1', '1', '2024-06-06 03:23:48'),
(57, 47, 84, 'bcvbcvb', '2024-06-07 04:26:00', '2024-06-07 00:00:00', '45', '1,2', 'AGENDADO', '2024-06-07 04:26:00', '2024-06-07 05:11:00', '04:26', 'senaV1', '1', '2024-06-06 03:27:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_apoyo`
--

CREATE TABLE `sena_apoyo` (
  `idApoyo` int(21) NOT NULL,
  `identificacion` varchar(10) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `celular` varchar(45) NOT NULL,
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sena_apoyo`
--

INSERT INTO `sena_apoyo` (`idApoyo`, `identificacion`, `nombres`, `apellidos`, `correo`, `celular`, `maj`) VALUES
(47, '545454545', 'Apoyo ', 'Secretaria', 'hosmmer.eduardo@gmail.com', '656565656', '2023-09-16 19:22:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_aprendiz`
--

CREATE TABLE `sena_aprendiz` (
  `idAprendiz` int(21) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `tipoIdentificacion` varchar(4) NOT NULL,
  `identificacion` varchar(10) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `correo` varchar(25) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `programaFormacion` text NOT NULL,
  `proyectoFormativo` text NOT NULL,
  `avatar` varchar(50) NOT NULL DEFAULT '../assets/images/users/avatar-2.jpg',
  `jornada` varchar(45) NOT NULL,
  `etapa` varchar(45) NOT NULL,
  `ficha` varchar(45) NOT NULL,
  `statut` varchar(10) NOT NULL,
  `entidad` varchar(8) NOT NULL DEFAULT 'senaV1',
  `municipio` varchar(45) NOT NULL DEFAULT 'Bucaramanga',
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sena_aprendiz`
--

INSERT INTO `sena_aprendiz` (`idAprendiz`, `nombres`, `apellidos`, `tipoIdentificacion`, `identificacion`, `telefono`, `correo`, `direccion`, `programaFormacion`, `proyectoFormativo`, `avatar`, `jornada`, `etapa`, `ficha`, `statut`, `entidad`, `municipio`, `maj`) VALUES
(1, 'HOLMES ELIAS', 'PINTO AVILA', 'CC', '123456789', '1234565', 'hosmmer.eduardo@gmail.com', 'TRANSVERSAL  22 NO.19A-48', 'DESARROLLO DE SOFTWARE', 'DESARROLLO DE SOFTWARE SENA', '../assets/images/users/avatar-2.jpg', '', '', '', '', 'senaV1', 'Bucaramanga', '2023-09-05 08:49:45'),
(2, 'HOSMMER EDUARDO', 'PINTO ROJAS', 'CC', '123456789', '1234565', 'hosmmer.eduardo@gmail.com', 'TRANSVERSAL  22 NO.19A-48', 'DESARROLLO DE SOFTWARE', 'DESARROLLO DE SOFTWARE SENA', '../assets/images/users/avatar-2.jpg', '', '', '', '', 'senaV1', 'Bucaramanga', '2023-09-05 08:50:19'),
(3, 'DANNA GIBELLYS', 'PINTO ROJAS', 'CC', '123456789', '32546855', 'hosmmer.eduardo@gmail.com', 'TRANSVERSAL  22 NO.19A-48', 'DESARROLLO DE SOFTWARE', 'DESARROLLO DE SOFTWARE SENA', '../assets/images/users/avatar-2.jpg', '', '', '', '', 'senaV1', 'Bucaramanga', '2023-09-05 08:50:50'),
(4, 'ALEXANDRA', 'PINTO ROJAS', 'CC', '123456789', '6547899988', 'hosmmer.eduardo@gmail.com', 'TRANSVERSAL  22 NO.19A-48', 'DESARROLLO DE SOFTWARE', 'DESARROLLO DE SOFTWARE SENA', '../assets/images/users/avatar-2.jpg', '', '', '', '', 'senaV1', 'Bucaramanga', '2023-09-05 08:51:23'),
(5, 'JUAN CARLOS', 'BARRIOS AVILA', 'CC', '123456789', '6547899988', 'hosmmer.eduardo@gmail.com', 'TRANSVERSAL  22 NO.19A-48', 'DESARROLLO DE SOFTWARE', 'DESARROLLO DE SOFTWARE SENA', '../assets/images/users/avatar-2.jpg', '', '', '', '', 'senaV1', 'Bucaramanga', '2023-09-05 08:51:44'),
(6, 'JOSE CARLOS', 'MARTINEZ AVILA', 'CC', '123456789', '6547899988', 'hosmmer.eduardo@gmail.com', 'TRANSVERSAL  22 NO.19A-48', 'DESARROLLO DE SOFTWARE', 'DESARROLLO DE SOFTWARE SENA', '../assets/images/users/avatar-2.jpg', '', '', '', '', 'senaV1', 'Bucaramanga', '2023-09-05 08:52:02'),
(7, 'Juan Carlos', 'Barrios ', '', '', '65487787788787', 'juancarlos@gmail.com', 'f', '', '', '../assets/images/users/avatar-2.jpg', '', '', '', '', 'senaV1', 'Bucaramanga', '2024-02-05 20:58:27'),
(8, 'asdasd', 'asdasd', 'asda', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd', '../assets/images/users/avatar-2.jpg', 'asdasd', 'asdasd', 'asdasd', '', 'senaV1', 'asdasd', '2024-04-29 09:52:53'),
(9, 'asdasd', 'asdasd', 'asda', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd', '../assets/images/users/avatar-2.jpg', 'asdasd', 'asdasd', 'asdasd', '', 'senaV1', 'asdasd', '2024-04-29 09:57:23'),
(10, 'HOLMES ELIASSSS', 'PINTO AVILA', 'CC', '123456789', '1234565', 'hosmmer.eduardo@gmail.com', 'TRANSVERSAL  22 NO.19A-48', 'DESARROLLO DE SOFTWARE', 'DESARROLLO DE SOFTWARE SENA', '../assets/images/users/avatar-2.jpg', 'Ma?ana', 'Productiva', '2619701', '', 'senaV1', 'Bucaramanga', '2024-04-29 11:53:05'),
(11, 'HOLMES ELIASSSSS', 'PINTO AVILA', 'CC', '123456789', '1234565', 'hosmmer.eduardo@gmail.com', 'TRANSVERSAL  22 NO.19A-48', 'DESARROLLO DE SOFTWARE', 'DESARROLLO DE SOFTWARE SENA', '../assets/images/users/avatar-2.jpg', 'Ma?ana', 'Productiva', '2619701', '', 'senaV1', 'Bucaramanga', '2024-04-29 12:02:15'),
(12, 'HOLMES ELIASSS', 'PINTO AVILA', 'CC', '123456789', '1234565', 'hosmmer.eduardo@gmail.com', 'TRANSVERSAL  22 NO.19A-48', 'DESARROLLO DE SOFTWARE', 'DESARROLLO DE SOFTWARE SENA', '../assets/images/users/avatar-2.jpg', 'Ma?ana', 'Productiva', '2619701', '', 'senaV1', 'Bucaramanga', '2024-04-29 12:02:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_aprendizacademico`
--

CREATE TABLE `sena_aprendizacademico` (
  `idAprendizAcademico` int(21) NOT NULL,
  `idAprendiz` int(21) NOT NULL,
  `etapa` varchar(45) NOT NULL,
  `codigoFicha` varchar(45) NOT NULL,
  `jornada` varchar(45) NOT NULL,
  `inicioproductiva` date NOT NULL,
  `finProductiva` date NOT NULL,
  `iniciLectiva` date NOT NULL,
  `finElectiva` date NOT NULL,
  `Especialidad` text NOT NULL,
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_asistencias`
--

CREATE TABLE `sena_asistencias` (
  `id_asistencia` int(11) NOT NULL,
  `idActa` int(21) NOT NULL,
  `nombresApellidos` text NOT NULL,
  `documento` varchar(25) NOT NULL,
  `dependencia` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` text NOT NULL,
  `contratista` varchar(4) NOT NULL,
  `planta` varchar(2) NOT NULL,
  `contratistaOtros` varchar(255) NOT NULL,
  `autorizacion` varchar(4) NOT NULL,
  `firmaDigital` text NOT NULL,
  `entidad` varchar(15) NOT NULL DEFAULT 'senaV1',
  `maj` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sena_asistencias`
--

INSERT INTO `sena_asistencias` (`id_asistencia`, `idActa`, `nombresApellidos`, `documento`, `dependencia`, `email`, `telefono`, `contratista`, `planta`, `contratistaOtros`, `autorizacion`, `firmaDigital`, `entidad`, `maj`) VALUES
(1, 2, 'HOLMES ELIAS PINTO AVILA', '7770272073333', 'SISTEMAS', 'holmespinto@unicesar.edu.co', '5646546546', 'SI', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-18 01:49:56'),
(3, 2, 'HOSMMER EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'hosmmer@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 06:30:48'),
(4, 2, 'JOSE EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'jose@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 06:38:10'),
(5, 2, 'CARLOS EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'Carlos@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 06:44:44'),
(6, 2, 'CARLOS EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'Carlos@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 06:46:35'),
(7, 2, 'CARLOS EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'Carlos@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 06:47:27'),
(8, 2, 'CARLOS EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'Carlos@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 06:48:09'),
(9, 2, 'CARLOS EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'Carlos@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 06:49:49'),
(10, 2, 'CARLOS EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'Carlos@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 07:08:43'),
(11, 2, 'CARLOS EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'Carlos@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 07:10:24'),
(12, 2, 'CARLOS EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'Carlos@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 07:11:57'),
(13, 2, 'CARLOS EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'Carlos@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 07:13:41'),
(14, 2, 'CARLOS EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'Carlos@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 07:14:48'),
(15, 2, 'CARLOS EDUARDO PINTO ROJAS', '1111212121212', 'EDUACION', 'Carlos@gmail.com', '124545454', 'NO', '', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 07:22:44'),
(16, 2, 'DANNA PINTO ROJAS', '6753485475487', 'ENFERMERIA', 'danna@gmail.com', '5465464564', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-19 23:59:16'),
(17, 2, 'DANNA PINTO ROJAS', '6753485475487', 'ENFERMERIA', 'danna@gmail.com', '5465464564', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-05-20 00:00:27'),
(18, 3, 'jun joseS', '2232122121', 'SENA', 'jc@gmail.com', '1121211', 'SI', 'NO', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 01:48:37'),
(19, 8, 'jun joseS', '43443', 'SENA', 'jc@gmail.com', '1121211', 'NO', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 01:53:35'),
(20, 8, 'jun joseS 2', '22222', 'SENA', 'jc@gmail.com', '1121211', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 01:54:41'),
(21, 9, 'jun joseS9', '9999', 'SENA', 'jc@gmail.com', '1121211999', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 01:57:04'),
(22, 9, 'jun joseS9', '9999', 'SENA', 'jc@gmail.com', '1121211999', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 01:58:43'),
(23, 9, 'jun joseS9', '9999', 'SENA', 'jc@gmail.com', '1121211999', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 01:59:50'),
(24, 9, 'jun joseS9', '9999', 'SENA', 'jc@gmail.com', '1121211999', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 02:00:26'),
(25, 9, 'jun joseS9', '9999', 'SENA', 'jc@gmail.com', '1121211999', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 02:01:29'),
(26, 9, 'jun joseS9', '9999', 'SENA', 'jc@gmail.com', '1121211999', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 02:02:31'),
(27, 9, 'jun joseS9', '9999', 'SENA', 'jc@gmail.com', '1121211999', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 02:03:40'),
(28, 9, 'jun joseS9', '9999', 'SENA', 'jc@gmail.com', '1121211999', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 02:05:00'),
(29, 6, 'ASISTENTE DEL ACTA NO.6', '66666', 'SENA', 'ASISTENTE@GMAIL.co', '444444', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-11 02:08:10'),
(30, 11, 'Asistente No.1', '111111', 'SISTEMAS', 'asistente1@gmail.com', '1122222', 'SI', 'SI', '', 'SI', 'SIN FIRMA DIGITAL', 'senaV1', '2024-06-12 00:45:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_directivo`
--

CREATE TABLE `sena_directivo` (
  `idDirectivo` int(21) NOT NULL,
  `identificacion` varchar(10) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `celular` varchar(45) NOT NULL,
  `entidad` varchar(15) NOT NULL DEFAULT 'senaV1',
  `statut` varchar(15) NOT NULL DEFAULT 'publie',
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sena_directivo`
--

INSERT INTO `sena_directivo` (`idDirectivo`, `identificacion`, `nombres`, `apellidos`, `correo`, `celular`, `entidad`, `statut`, `maj`) VALUES
(1, '1234566789', 'Pedro Pablo', 'Perez', 'hosmmer.eduardo@gmail.com', '123255666', 'senaV1', 'publie', '2023-09-16 05:11:05'),
(2, '123465897', 'Maria', 'Perez Prado', 'hosmmer.eduardo@gmail.com', '1236664878787', 'senaV1', 'publie', '2023-09-16 05:11:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_evidencia`
--

CREATE TABLE `sena_evidencia` (
  `idEvidencia` int(21) NOT NULL,
  `codigoFicha` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `archivoEvidencia` varchar(45) NOT NULL,
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_instructor`
--

CREATE TABLE `sena_instructor` (
  `idInstructor` int(21) NOT NULL,
  `identificacion` varchar(10) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sena_instructor`
--

INSERT INTO `sena_instructor` (`idInstructor`, `identificacion`, `nombres`, `apellidos`, `telefono`, `correo`, `maj`) VALUES
(26, '1222222', 'Jhon Doe', 'Perez Perez', '555554545454', 'holmespinto.avila@gmail.com', '2023-10-18 17:15:43'),
(47, '122222233', 'Juan Carlos', 'Avila Florez', '245544445454', 'holmespinto@unicesar.edu.co', '2023-10-18 17:15:57'),
(48, '21212121', 'Pedro Antonio', 'Pardo Jimenez', '546456', 'hosmmer.eduardo@gmail.com', '2023-10-18 17:16:07'),
(50, '212112211', 'Camilo', 'Arrieta', '36566586654', 'estebanrey58@gmail.com', '2023-10-18 17:52:57'),
(51, '77027207', 'Camilo andres', 'Arrieta Munoz', '3042172357', 'cami-2513@hotmail.con', '2024-04-23 20:40:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_modelo_historial_incidencias`
--

CREATE TABLE `sena_modelo_historial_incidencias` (
  `idHistorial` int(21) NOT NULL,
  `idAprendiz` int(11) NOT NULL,
  `idInstructor` int(11) NOT NULL,
  `gravedad` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `fechaIncidente` varchar(45) NOT NULL,
  `actas` varchar(255) NOT NULL,
  `evidencias` varchar(45) NOT NULL,
  `tipoIncidencia` varchar(255) NOT NULL,
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sena_modelo_historial_incidencias`
--

INSERT INTO `sena_modelo_historial_incidencias` (`idHistorial`, `idAprendiz`, `idInstructor`, `gravedad`, `estado`, `fechaIncidente`, `actas`, `evidencias`, `tipoIncidencia`, `maj`) VALUES
(1, 5, 26, 'ALTA', 'EN TRAMITE', '2023-08-31 10:55:00', 'Acta No.001', 'Documental', 'ACADEMICO', '2023-09-18 21:41:41'),
(2, 5, 26, 'BAJA', 'CODICIONADO', ' 2023-02-23 10:55:00', 'No.0023 de agosto', 'DOCUMENTAL', 'ACADEMICO', '2023-09-18 21:41:45'),
(3, 5, 26, 'MEDIA', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'ACADEMICA', '2023-09-18 21:41:49'),
(4, 5, 26, 'GRAVE', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'ACADEMICA', '2023-09-18 21:41:53'),
(5, 4, 48, 'MEDIA', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'ACADEMICA', '2023-09-18 21:42:01'),
(6, 4, 48, 'MEDIA', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'ACADEMICA', '2023-09-18 21:42:03'),
(7, 3, 48, 'MEDIA', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'AMBIENTAL', '2023-09-18 21:42:05'),
(8, 3, 48, 'MEDIA', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'AMBIENTAL', '2023-09-18 21:42:08'),
(9, 2, 26, 'MEDIA', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'AMBIENTAL', '2023-09-18 21:42:23'),
(10, 2, 48, 'MEDIA', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'AMBIENTAL', '2023-09-18 21:42:12'),
(11, 1, 48, 'MEDIA', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'DISCIPLINARIA', '2023-09-18 21:42:16'),
(12, 1, 47, 'MEDIA', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'DISCIPLINARIA', '2023-09-18 21:42:33'),
(13, 1, 47, 'MEDIA', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'DISCIPLINARIA', '2023-09-18 21:42:37'),
(14, 1, 47, 'MEDIA', 'EN TRAMITE', ' 2023-08-3 11:55:00', 'No. 0003 del agosto', 'DOCUMENTAL', 'DISCIPLINARIA', '2023-09-18 21:42:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_modelo_novedades`
--

CREATE TABLE `sena_modelo_novedades` (
  `id` int(21) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `instructor` text NOT NULL,
  `aprendiz` text NOT NULL,
  `fechaIncidente` varchar(45) NOT NULL,
  `fechaAgendada` varchar(45) NOT NULL,
  `tipoAtencion` varchar(45) NOT NULL,
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sena_modelo_novedades`
--

INSERT INTO `sena_modelo_novedades` (`id`, `codigo`, `instructor`, `aprendiz`, `fechaIncidente`, `fechaAgendada`, `tipoAtencion`, `maj`) VALUES
(1, '0001', 'YOLANDA ROJAS', 'EDUARDO PINTO AVILA', ' 2023-02-23 10:55:00', ' 2023-01-23 2:55:00', 'DISCIPLINARIA', '2023-09-01 15:44:29'),
(2, '0001', 'MARIA BUITRAGO', 'HOSMMER EDUARDO PINTO ROJAS', ' 2023-02-23 10:55:00', 'SIN AGENDAR', 'DISCIPLINARIA', '2023-09-01 21:04:30'),
(3, '0001', 'ALEXANDRA GIL', 'JOSE MARTINEZ', ' 2023-02-23 10:55:00', ' 2023-01-23 2:55:00', 'DISCIPLINARIA', '2023-09-01 15:44:43'),
(4, '0001', 'LEYDIS PAOLA GUERRIETEZ', 'SILVIO PEREZ', ' 2023-02-23 10:55:00', ' 2023-01-23 2:55:00', 'DISCIPLINARIA', '2023-09-01 15:45:07'),
(5, '0001', 'SOFIA GUZMAN', 'CARLITOS VARGAS', ' 2023-02-23 10:55:00', ' 2023-01-23 2:55:00', 'DISCIPLINARIA', '2023-09-01 15:45:33'),
(6, '0001', 'EUFEMIA RODRIGUEZ', 'JORGE ZAMBRANO', ' 2023-02-23 10:55:00', 'SIN AGENDAR', 'DISCIPLINARIA', '2023-09-01 21:04:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_planmejora`
--

CREATE TABLE `sena_planmejora` (
  `idPlanMejora` int(21) NOT NULL,
  `idActaComite` int(21) NOT NULL,
  `idSolicitud` int(21) NOT NULL,
  `codigoFicha` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  `accionesPropuestas` text NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinalizacion` date NOT NULL,
  `estado` varchar(10) NOT NULL,
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_sancionesanteriores`
--

CREATE TABLE `sena_sancionesanteriores` (
  `idSancion` int(11) NOT NULL,
  `idAprendiz` int(21) NOT NULL,
  `idSolicitud` int(21) NOT NULL,
  `academica` varchar(4) NOT NULL,
  `disciplinaria` varchar(4) NOT NULL,
  `inasistencias` varchar(4) NOT NULL,
  `verbal` varchar(4) NOT NULL,
  `escrito` varchar(4) NOT NULL,
  `maj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sena_sancionesanteriores`
--

INSERT INTO `sena_sancionesanteriores` (`idSancion`, `idAprendiz`, `idSolicitud`, `academica`, `disciplinaria`, `inasistencias`, `verbal`, `escrito`, `maj`) VALUES
(1, 2, 237, '2', '3', '3', '3', '1', '2024-04-14 19:14:12'),
(2, 2, 238, '2', '3', '2', '2', '2', '2023-09-23 23:38:07'),
(3, 2, 239, '2', '3', '2', '2', '2', '2023-09-23 23:42:37'),
(4, 2, 240, '2', '3', '2', '2', '2', '2023-09-23 23:42:56'),
(5, 2, 241, '4', '5', '4', '4', '3', '2023-09-23 23:44:16'),
(6, 4, 242, '44', '55', '33', '21', '15', '2023-09-23 23:46:20'),
(7, 3, 243, '2', '3', '3', '3', '1', '2024-04-14 19:13:07'),
(8, 4, 244, '1', '0', '0', '0', '15', '2023-10-02 20:45:25'),
(9, 3, 245, '2', '44', '3', '3', '1', '2023-10-04 17:28:43'),
(10, 5, 246, '2', '8', '2', '1', '0', '2023-10-04 17:48:00'),
(11, 2, 247, '11', '20', '4', '4', '1', '2023-10-05 03:28:29'),
(12, 5, 248, '2', '9', '3', '1', '1', '2023-10-05 03:50:12'),
(13, 6, 249, '1', '1', '1', '1', '1', '2023-10-17 00:47:27'),
(14, 3, 250, '0', '0', '0', '0', '0', '2023-10-17 01:00:38'),
(15, 2, 251, '9', '21', '4', '3', '2', '2023-10-17 13:52:36'),
(16, 2, 252, '9', '19', '4', '3', '2', '2023-10-18 06:42:54'),
(17, 2, 253, '9', '20', '3', '5', '3', '2023-10-19 05:29:13'),
(18, 6, 254, '0', '0', '0', '2', '0', '2023-10-20 16:15:31'),
(19, 1, 255, '4', '27', '2', '2', '3', '2023-11-20 11:12:20'),
(20, 4, 256, '1', '0', '0', '0', '0', '2023-11-23 15:40:44'),
(21, 1, 257, '4', '26', '2', '2', '3', '2024-01-31 18:04:50'),
(22, 2, 258, '8', '22', '5', '4', '3', '2024-02-01 05:56:20'),
(23, 6, 259, '3', '4', '2', '2', '2', '2024-02-02 18:39:36'),
(24, 1, 260, '4', '26', '4', '3', '5', '2024-02-05 22:11:01'),
(25, 2, 261, '8', '20', '4', '3', '2', '2024-02-08 20:28:52'),
(26, 1, 262, '0', '0', '0', '0', '0', '2024-04-14 16:28:48'),
(27, 1, 263, '0', '0', '0', '0', '0', '2024-04-14 16:33:04'),
(28, 7, 264, '0', '0', '0', '0', '0', '2024-04-14 17:05:38'),
(29, 1, 265, '0', '0', '0', '0', '0', '2024-04-16 14:27:24'),
(30, 2, 266, '0', '0', '0', '0', '0', '2024-04-24 01:23:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sena_solicitudcomite`
--

CREATE TABLE `sena_solicitudcomite` (
  `idSolicitud` int(21) NOT NULL,
  `idInstructor` int(21) NOT NULL,
  `idAprendiz` int(11) NOT NULL,
  `tipoSolicitud` varchar(45) NOT NULL,
  `tipoAtencion` varchar(45) NOT NULL,
  `codigoFicha` varchar(45) NOT NULL,
  `fechaIncidente` datetime NOT NULL,
  `fechaHoraAgendada` datetime NOT NULL,
  `hechos` text NOT NULL,
  `nombrePrograma` text NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'Solicitado',
  `entidad` varchar(15) NOT NULL,
  `statut` varchar(10) NOT NULL DEFAULT '0',
  `fechaSolicitud` datetime NOT NULL DEFAULT '2024-01-01 01:01:01' ON UPDATE current_timestamp(),
  `maj` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sena_solicitudcomite`
--

INSERT INTO `sena_solicitudcomite` (`idSolicitud`, `idInstructor`, `idAprendiz`, `tipoSolicitud`, `tipoAtencion`, `codigoFicha`, `fechaIncidente`, `fechaHoraAgendada`, `hechos`, `nombrePrograma`, `estado`, `entidad`, `statut`, `fechaSolicitud`, `maj`) VALUES
(51, 26, 6, 'DISCIPLINA', 'MEDIO-Grave', 'SC--26-51', '2023-09-11 19:00:00', '2023-11-18 18:44:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :vgvgvgvgvgsadssadasddsadsdasdasdasdxasdaxzczxc', 'undefined', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-13 16:42:50'),
(55, 47, 4, 'ACADEMICO', 'Leve', 'SC-20230911T200000Z-47-55', '2023-11-03 18:00:00', '2023-11-18 22:40:00', 'gdfgdfgdfgdfg', 'undefined', 'AGENDADA', 'senaV1', '1', '2024-06-08 03:00:00', '2024-06-06 00:46:21'),
(56, 47, 5, 'DISCIPLINA', 'Leve', 'SC-20230911T200000Z-47-56', '2023-09-12 01:00:00', '2023-11-18 20:06:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecuci?n de la Formaci?n Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atenci?n por el sidddd', 'undefined', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-18 18:04:26'),
(57, 47, 5, 'ACADEMICO', 'Leve', 'SC-20230911T200000Z-47-57', '2023-09-11 20:00:00', '2023-11-10 22:59:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecuci?n de la Formaci?n Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atenci?n por el siguiente motivo: Hechos', 'undefined', 'AGENDADA', 'senaV1', '1', '2024-06-05 23:43:55', '2024-06-05 23:43:55'),
(58, 47, 5, 'ACADEMICO Y DISCIPLINARIO', 'Gravisimas', 'SC-20230914T200000Z-47-58', '2023-09-14 20:00:00', '2023-09-20 06:24:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo fdfdfdfdffyyyy', 'undefined', 'AGENDADA', 'senaV1', '1', '2024-06-13 02:00:00', '2024-06-06 00:47:07'),
(59, 47, 5, 'DISCIPLINARIO', 'Gravisimas', 'SC-20230914T220000Z-47-59', '2023-09-14 22:00:00', '2023-09-21 15:25:00', ' Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención ', 'undefined', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-10-19 14:29:18'),
(60, 26, 3, 'DISCIPLINARIO', 'MEDIO-Leve', 'SC-20230915T190000Z-26-60', '2023-09-15 19:00:00', '2023-11-18 11:43:00', 'undefined', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2024-04-14 14:15:11'),
(61, 47, 1, 'ACADEMICO Y DISCIPLINARIO', 'Grave', 'SC-20230916T010000Z-47-61', '2023-09-16 01:00:00', '2023-09-29 01:00:00', 'Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo ', 'DESARROLLO DE SOFTWARE', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-10-19 14:26:23'),
(62, 48, 4, 'DISCIPLINA', 'Grave', 'SC-20230918T150000Z-47-62', '2023-09-18 15:00:00', '2023-09-21 00:18:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :undefined', 'undefined', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-18 21:00:45'),
(63, 48, 3, 'DISCIPLINA', 'Grave', 'SC-20230919T000000Z-48-63', '2023-09-19 00:00:00', '2023-11-18 22:29:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecuci?n de la Formaci?n Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atenci?n por el siguiente motivo. xxxxx', 'undefined', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-20 20:27:58'),
(64, 48, 5, 'DISCIPLINA', 'Grave', 'SC-20230919T000000Z-48-64', '2023-09-19 00:00:00', '2023-11-18 22:35:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecuci?n de la Formaci?n Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atenci?n por el siguiente motivo. xxxsss', 'undefined', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-20 20:36:08'),
(65, 48, 3, 'DISCIPLINA', 'Grave', 'SC-20230919T000000Z-48-65', '2023-09-19 00:00:00', '2023-11-02 22:29:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecuci?n de la Formaci?n Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atenci?n por el siguiente motivo.xx', 'undefined', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-20 21:29:10'),
(66, 48, 3, 'DISCIPLINA', 'Grave', 'SC-20230919T000000Z-48-66', '2023-09-19 00:00:00', '2023-09-24 08:33:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :undefined', 'undefined', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-20 15:30:42'),
(67, 48, 3, 'DISCIPLINA', 'Grave', 'SC-20230919T000000Z-48-67', '2023-09-19 00:00:00', '2023-09-22 18:17:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :undefined', 'undefined', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-20 15:17:35'),
(68, 48, 3, 'DISCIPLINA', 'Grave', 'SC-20230919T000000Z-48-68', '2023-09-19 00:00:00', '2023-11-11 23:30:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecuci?n de la Formaci?n Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atenci?n por el siguiente motivo: :xxx', 'DESARROLLO DE SOFTWARE', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-20 21:30:01'),
(69, 48, 6, 'DISCIPLINA', 'Grave', 'SC-20230919T000000Z-48-69', '2023-09-19 00:00:00', '2023-09-16 19:19:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :hghghgfdgdf gfhreteffvgfdgfdggfhggfhgfhfgfghfghgfhgfhfhfghhgfghjgfdfdgxcvxfdfdgdfgdfhfghdsdsffsdffgfdggfhdsffghfcvvcxffdgxcdsdfdg', 'DESARROLLO DE SOFTWARE', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-20 15:16:16'),
(70, 48, 1, 'DISCIPLINA', 'Leve', 'SC-20230919T160000Z-48-70', '2023-09-19 16:00:00', '2023-09-19 18:13:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :kjkjkjkjk l?l{?lnmbnmbnmhgfhfg,bvcbc', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-20 15:09:42'),
(71, 26, 1, 'DISCIPLINA', 'Grave', 'SC-20230920T110000Z-26-71', '2023-09-20 11:00:00', '2023-09-30 07:54:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :asdasdas', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-20 15:45:03'),
(72, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T120000Z-48-72', '2023-09-21 12:00:00', '2023-11-18 23:39:00', 'hechos', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-20 21:38:00'),
(73, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T120000Z-48-73', '2023-09-21 12:00:00', '2023-11-29 22:46:00', 'fgfghfgh', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-22 20:44:49'),
(74, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T120000Z-48-74', '2023-09-21 12:00:00', '2023-11-11 12:41:00', 'hECHOSSS', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-20 21:39:18'),
(75, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T120000Z-48-75', '2023-09-21 12:00:00', '2023-11-04 12:18:00', 'HECHOSS', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-20 21:16:13'),
(76, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T120000Z-48-76', '2023-09-21 12:00:00', '2024-04-18 22:34:00', 'sadasdasd', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2024-04-23 20:32:35', '2024-04-23 20:32:35'),
(77, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T120000Z-48-77', '2023-09-21 12:00:00', '2023-11-01 21:02:00', ' La Instructora informa que la aprendiz llega en repetidas ocasiones tarde al ambiente de formaci?n. Este comportamiento ha sido repetitivo en varias competencias acumulando un gran numero de llamados de atenci?n. Es importante comentar que la aprendiz cuenta con contrato de aprendizaje con la entidad FUNDACION OFTALMOLOGICA DE SANTANDER -\nFOSCAL, por consiguiente, la responsabilidad con su proceso de formaci?n es mayor.', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-22 20:02:02'),
(78, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T120000Z-48-78', '2023-09-21 12:00:00', '2024-04-04 03:20:00', 'sdasdasd', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2024-04-14 22:47:50', '2024-04-14 22:47:50'),
(79, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T120000Z-48-79', '2023-09-21 12:00:00', '2023-11-01 23:41:00', 'sdfsdfsdfsdf', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-22 22:40:42'),
(80, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T120000Z-48-80', '2023-09-21 12:00:00', '2024-06-06 05:25:00', 'dfgdfgdfg', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2024-06-06 03:23:48', '2024-06-06 03:23:48'),
(81, 48, 1, 'DISCIPLINA', 'Leve', 'SC-20230921T130000Z-48-81', '2023-09-21 13:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 06:09:41'),
(82, 48, 5, 'DISCIPLINA', 'Grave', 'SC-20230921T130000Z-48-82', '2023-09-21 13:00:00', '2023-11-01 07:19:00', 'ewrfdgfdgdf', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-22 20:20:13'),
(83, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-83', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 06:25:37'),
(84, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-84', '2023-09-21 12:00:00', '2024-06-07 04:26:00', 'bcvbcvb', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2024-06-06 03:27:08', '2024-06-06 03:27:08'),
(85, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-85', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 06:38:09'),
(86, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-86', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 06:40:27'),
(87, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-87', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 06:49:37'),
(88, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-88', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 06:52:07'),
(89, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-89', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 06:56:08'),
(90, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-90', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 06:57:36'),
(91, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-91', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 06:58:22'),
(92, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-92', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:00:36'),
(93, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-93', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:04:26'),
(94, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-94', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:05:04'),
(95, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-95', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:06:20'),
(96, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-96', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:07:09'),
(97, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-97', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:08:13'),
(98, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-98', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:10:13'),
(99, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-99', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:12:05'),
(100, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-100', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:13:11'),
(101, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-101', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:14:02'),
(102, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-102', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:18:46'),
(103, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-103', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:19:32'),
(104, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-104', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:20:21'),
(105, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-105', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.   ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:21:05'),
(106, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-106', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:21:33'),
(107, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-107', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:40:59'),
(108, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-108', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:42:03'),
(109, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-109', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:42:31'),
(110, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-110', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:47:28'),
(111, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-111', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:48:04'),
(112, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-112', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:49:58'),
(113, 48, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T120000Z-48-113', '2023-09-21 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 07:50:56'),
(114, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-114', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 08:48:12'),
(115, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-115', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 08:51:30'),
(116, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-116', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 08:52:49'),
(117, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-117', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 08:53:43'),
(118, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-118', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus..', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 08:55:17'),
(119, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-119', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 08:57:26');
INSERT INTO `sena_solicitudcomite` (`idSolicitud`, `idInstructor`, `idAprendiz`, `tipoSolicitud`, `tipoAtencion`, `codigoFicha`, `fechaIncidente`, `fechaHoraAgendada`, `hechos`, `nombrePrograma`, `estado`, `entidad`, `statut`, `fechaSolicitud`, `maj`) VALUES
(120, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-120', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 08:59:41'),
(121, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-121', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:01:19'),
(122, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-122', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:03:05'),
(123, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-123', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus..', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:07:40'),
(124, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-124', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:11:23'),
(125, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-125', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:20:47'),
(126, 26, 1, 'DISCIPLINA', 'Leve', 'SC-20230921T140554Z-26-126', '2023-09-21 14:05:54', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :vhghjggjg', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:27:24'),
(127, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-127', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:27:53'),
(128, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-128', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:30:06'),
(129, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-129', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:34:54'),
(130, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-130', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:36:50'),
(131, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-131', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:38:15'),
(132, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-132', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:39:22'),
(133, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-133', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:40:26'),
(134, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-134', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:41:28'),
(135, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-135', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:42:46'),
(136, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-136', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:43:38'),
(137, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-137', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.   ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:44:27'),
(138, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-138', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:45:20'),
(139, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-139', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:46:16'),
(140, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-140', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:47:01'),
(141, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-141', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:47:41'),
(142, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-142', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:48:23'),
(143, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-143', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:49:01'),
(144, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-144', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:49:55'),
(145, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-145', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:50:51'),
(146, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-146', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:51:36'),
(147, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-147', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:52:16'),
(148, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-148', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:53:27'),
(149, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-149', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:54:48'),
(150, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-150', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 09:57:56'),
(151, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-151', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:00:14'),
(152, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-152', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:00:58'),
(153, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-153', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:02:10'),
(154, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-154', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:03:21'),
(155, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-155', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:03:58'),
(156, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-156', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:04:27'),
(157, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-157', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:05:20'),
(158, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-158', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:06:10'),
(159, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-159', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:06:57'),
(160, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-160', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:08:06'),
(161, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-161', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:08:56'),
(162, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-162', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:09:38'),
(163, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-163', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:10:26'),
(164, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-164', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:12:33'),
(165, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-165', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.   ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:14:18'),
(166, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-166', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:16:12'),
(167, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-167', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.   ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:19:39');
INSERT INTO `sena_solicitudcomite` (`idSolicitud`, `idInstructor`, `idAprendiz`, `tipoSolicitud`, `tipoAtencion`, `codigoFicha`, `fechaIncidente`, `fechaHoraAgendada`, `hechos`, `nombrePrograma`, `estado`, `entidad`, `statut`, `fechaSolicitud`, `maj`) VALUES
(168, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-168', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.    ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:20:47'),
(169, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-169', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.   ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:21:29'),
(170, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-170', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:24:01'),
(171, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-171', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:24:37'),
(172, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-172', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:26:24'),
(173, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-173', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:27:07'),
(174, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-174', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:28:05'),
(175, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-175', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:32:24'),
(176, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-176', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:33:22'),
(177, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-177', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:34:23'),
(178, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-178', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:35:48'),
(179, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-179', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:36:39'),
(180, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-180', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:37:24'),
(181, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-181', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:39:44'),
(182, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-182', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:40:18'),
(183, 48, 4, 'DISCIPLINA', 'Leve', 'SC-20230921T133629Z-48-183', '2023-09-21 13:36:29', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:43:49'),
(184, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T160000Z-48-184', '2023-09-21 16:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:47:40'),
(185, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T160000Z-48-185', '2023-09-21 16:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:49:15'),
(186, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T160000Z-48-186', '2023-09-21 16:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:50:05'),
(187, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T160000Z-48-187', '2023-09-21 16:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:51:31'),
(188, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T160000Z-48-188', '2023-09-21 16:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.   ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:52:53'),
(189, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T160000Z-48-189', '2023-09-21 16:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.    ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:53:45'),
(190, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T160000Z-48-190', '2023-09-21 16:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:54:36'),
(191, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T160000Z-48-191', '2023-09-21 16:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:55:55'),
(192, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T160000Z-48-192', '2023-09-21 16:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:56:44'),
(193, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230921T160000Z-48-193', '2023-09-21 16:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 10:57:32'),
(194, 26, 2, 'DISCIPLINA', 'Grav?simas', 'SC-20230921T190000Z-26-194', '2023-09-21 19:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.\n', 'DESARROLLO DE SOFTWARE', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 15:55:00'),
(195, 48, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T000000Z-48-195', '2023-09-22 00:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :[object Object]', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 17:17:45'),
(196, 48, 2, 'DISCIPLINA', 'Grave', 'SC-20230921T220000Z-48-196', '2023-09-21 22:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :[object Object]', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 17:26:36'),
(197, 48, 2, 'DISCIPLINA', 'Leve', 'SC-20230921T210000Z-48-197', '2023-09-21 21:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 17:28:55'),
(198, 48, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T010000Z-48-198', '2023-09-22 01:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'DESARROLLO DE SOFTWARE', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 20:17:19'),
(199, 48, 1, 'DISCIPLINA', 'Grave', 'SC-20230922T020000Z-48-199', '2023-09-22 02:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 20:18:32'),
(200, 48, 3, 'ACADEMICO', 'Grave', 'SC-20230922T020000Z-48-200', '2023-09-22 02:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-10-07 17:50:23'),
(201, 26, 3, 'DISCIPLINA', 'Grave', 'SC-20230922T030000Z-26-201', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 21:10:37'),
(202, 26, 1, 'DISCIPLINA', 'Leve', 'SC-20230922T030000Z-26-202', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :fdgfdgPeuueba', 'DESARROLLO DE SOFTWARE', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 21:23:55'),
(203, 26, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T020000Z-26-203', '2023-09-22 02:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :    Hechos\n  constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5\n  d?as programados para la formaci?n transversal corresondiente a la\n  Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y\n  con la naturaleza en los contextos laboral y social y RAPS: Asumir\n  responsablemente los criterios de preservaci?n y conservaci?n del Medio\n  Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral\n  y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas\n  que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 21:36:23'),
(204, 26, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T000000Z-26-204', '2023-09-22 00:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :    Hechos\n  constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5\n  d?as programados para la formaci?n transversal corresondiente a la\n  Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y\n  con la naturaleza en los contextos laboral y social y RAPS: Asumir\n  responsablemente los criterios de preservaci?n y conservaci?n del Medio\n  Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral\n  y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas\n  que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'DESARROLLO DE SOFTWARE', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 21:41:52'),
(205, 26, 5, 'ACADEMICO ', 'Grave', 'SC-20230922T000000Z-26-205', '2023-09-22 00:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expr esado, estan registrados en el aplicativo Sofia Plus', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 21:48:40'),
(206, 26, 2, 'DISCIPLINA', 'Grav?simas', 'SC-20230922T000000Z-26-206', '2023-09-22 00:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 21:52:53'),
(207, 26, 2, 'DISCIPLINA', 'Grav?simas', 'SC-20230922T000000Z-26-207', '2023-09-22 00:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 21:53:43'),
(208, 26, 2, 'ACADEMICO ', 'Leve', 'SC-20230922T030000Z-26-208', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 21:58:58'),
(209, 26, 2, 'ACADEMICO ', 'Leve', 'SC-20230922T030000Z-26-209', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en e l aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:01:32'),
(210, 26, 2, 'ACADEMICO ', 'Grav?simas', 'SC-20230922T020000Z-26-210', '2023-09-22 02:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:05:25'),
(211, 26, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T030000Z-26-211', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:16:28'),
(212, 26, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T000000Z-26-212', '2023-09-22 00:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :    Hechos\n  constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5\n  d?as programados para la formaci?n transversal corresondiente a la\n  Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y\n  con la naturaleza en los contextos laboral y social y RAPS: Asumir\n  responsablemente los criterios de preservaci?n y conservaci?n del Medio\n  Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral\n  y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas\n  que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.  ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:18:21'),
(213, 26, 1, 'DISCIPLINA', 'Grave', 'SC-20230922T030000Z-26-213', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el  aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:22:55'),
(214, 26, 2, 'DISCIPLINA', 'Leve', 'SC-20230922T020000Z-26-214', '2023-09-22 02:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:26:31'),
(215, 26, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T020000Z-26-215', '2023-09-22 02:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:28:26'),
(216, 26, 5, 'DISCIPLINA', 'Leve', 'SC-20230922T010000Z-26-216', '2023-09-22 01:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:30:07');
INSERT INTO `sena_solicitudcomite` (`idSolicitud`, `idInstructor`, `idAprendiz`, `tipoSolicitud`, `tipoAtencion`, `codigoFicha`, `fechaIncidente`, `fechaHoraAgendada`, `hechos`, `nombrePrograma`, `estado`, `entidad`, `statut`, `fechaSolicitud`, `maj`) VALUES
(217, 26, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T010000Z-26-217', '2023-09-22 01:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:31:20'),
(218, 26, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230922T030000Z-26-218', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:35:14'),
(219, 26, 3, 'DISCIPLINA', 'Grav?simas', 'SC-20230922T030000Z-26-219', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:35:58'),
(220, 26, 4, 'DISCIPLINA', 'Grav?simas', 'SC-20230922T020000Z-26-220', '2023-09-22 02:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:40:27'),
(221, 26, 3, 'DISCIPLINA', 'Grave', 'SC-20230922T010000Z-26-221', '2023-09-22 01:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:42:46'),
(222, 26, 5, 'DISCIPLINA', 'Grave', 'SC-20230922T020000Z-26-222', '2023-09-22 02:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:44:55'),
(223, 26, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T030000Z-26-223', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :DEBERES DEL APRENDIZ. En el  articulo 9, numeral 1 &quot;Cumplir con todas las actividades propias de su proceso de aprendizaje o del plan de mejoramiento, definidas durante su etapa lectiva y productiva. Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:46:53'),
(224, 26, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T030000Z-26-224', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:48:31'),
(225, 26, 1, 'ACADEMICO ', 'Leve', 'SC-20230922T010000Z-26-225', '2023-09-22 01:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:54:43'),
(226, 26, 2, 'ACADEMICO ', 'Grave', 'SC-20230922T030000Z-26-226', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:56:30'),
(227, 26, 2, 'ACADEMICO ', 'Leve', 'SC-20230922T010000Z-26-227', '2023-09-22 01:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :Hechos constitutivos de la presunta falta: El aprendiz se ausent? 4 d?as de los 5 d?as programados para la formaci?n transversal corresondiente a la Competencia: Promover la interacci?n id?nea consigo mismo, con los dem?s y con la naturaleza en los contextos laboral y social y RAPS: Asumir responsablemente los criterios de preservaci?n y conservaci?n del Medio Ambiente y de Desarrollo Sostenible, en el ejercicio de su desempe?o laboral y social; cuyos motivos manifestados por el aprendiz sin presentar pruebas que soporten lo expresado, estan registrados en el aplicativo Sofia Plus.', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:58:01'),
(228, 26, 3, 'ACADEMICO ', 'Leve', 'SC-20230922T000000Z-26-228', '2023-09-22 00:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :sdfdsf', 'DESARROLLO DE SOFTWARE', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 22:59:57'),
(229, 26, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T030000Z-26-229', '2023-09-22 03:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :nnnbbnmbnm', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 23:01:55'),
(230, 26, 1, 'ACADEMICO ', 'Grave', 'SC-20230922T040246Z-26-230', '2023-09-22 04:02:46', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :bnbvn', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-21 23:03:06'),
(231, 26, 2, 'ACADEMICO ', 'Grave', 'SC-20230922T120000Z-26-231', '2023-09-22 12:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :asdasdasdasdasdasd', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-22 12:15:08'),
(233, 26, 1, 'ACADEMICO ', 'Grave', 'SC-20230922T204143Z-26-233', '2023-09-22 20:41:43', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :FALTO 3 DIAS ', 'DESARROLLO DE SOFTWARE', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-22 15:47:29'),
(234, 26, 6, 'DISCIPLINA', 'Leve', 'SC-20230922T213123Z-26-234', '2023-09-22 21:31:23', '2024-02-08 03:53:00', 'ASSADSDASDASD', 'DESARROLLO DE SOFTWARE', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2024-02-01 00:51:09'),
(235, 26, 2, 'DISCIPLINA', 'Grave', 'SC-20230922T220000Z-26-235', '2023-09-22 22:00:00', '2023-09-14 20:33:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: :bhjvguvuhbjknljkl', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-22 17:30:34'),
(236, 26, 2, 'ACADEMICO ', 'Grave', 'SC-20230922T220000Z-26-236', '2023-09-22 22:00:00', '0000-00-00 00:00:00', 'n hbh', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-10-02 12:20:03'),
(237, 48, 2, 'DISCIPLINA', 'Grave', 'SC-20230924T010000Z-48-237', '2023-09-24 01:00:00', '0000-00-00 00:00:00', ':bnvbnvbnbvn', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-23 18:30:10'),
(238, 48, 2, 'ACADEMICO Y DISCIPLINARIO', 'Gravisimas', 'SC-20230924T010000Z-48-238', '2023-09-24 01:00:00', '0000-00-00 00:00:00', '111111', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-09-28 16:15:31'),
(243, 26, 3, 'ACADEMICO Y DISCIPLINARIO', 'Grave', 'SC-20231002T172116Z-26-243', '2023-10-02 17:21:16', '0000-00-00 00:00:00', ':dssdadasdasd', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-10-02 13:22:53'),
(244, 26, 4, 'DISCIPLINARIO', 'Gravisimas', 'SC-20231002T203856Z-26-244', '2023-10-02 20:38:56', '0000-00-00 00:00:00', 'asdasdasd', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-10-04 12:26:21'),
(245, 26, 2, 'DISCIPLINARIO', 'Leve', 'SC-20231004T170000Z-26-245', '2023-10-04 17:00:00', '2023-10-05 06:33:00', ':dedasdasdasdasd', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-10-04 12:46:36'),
(248, 26, 5, 'ACADEMICO Y DISCIPLINARIO', 'Leve', 'SC-20231005T000000Z-26-248', '2023-10-05 00:00:00', '2023-11-01 10:09:00', 'asASasAS', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:25:37', '2023-11-22 21:00:15'),
(249, 47, 6, 'ACADEMICO Y DISCIPLINARIO', 'Grave', 'SC-20231017T003542Z-47-249', '2023-10-17 00:35:42', '2023-11-01 08:43:00', 'sdadasdasdasd', 'DESARROLLO DE SOFTWARE', 'AGENDADA', 'senaV1', '1', '2023-10-16 19:47:27', '2023-11-22 20:58:59'),
(250, 47, 3, 'DISCIPLINARIO', 'Leve', 'SC-20231017T020000Z-47-250', '2023-10-28 17:00:00', '0000-00-00 00:00:00', 'Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-16 20:00:38', '2023-10-20 05:00:27'),
(251, 26, 2, 'DISCIPLINARIO', 'Grave', 'SC-20231017T120000Z-26-251', '2023-10-17 12:00:00', '0000-00-00 00:00:00', ':ASDASDASDASDASDASDASDASD', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-17 08:52:36', '2023-10-18 01:37:49'),
(252, 26, 2, 'DISCIPLINARIO', 'Gravisimas', 'SC-20231018T100000Z-26-252', '2023-10-18 10:00:00', '0000-00-00 00:00:00', ':asdasdasdasd', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-18 01:42:54', '2023-10-18 17:09:01'),
(253, 26, 2, 'DISCIPLINARIO', 'Leve', 'SC-20231019T080000Z-26-253', '2023-10-19 08:00:00', '0000-00-00 00:00:00', 'okayyyy', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-10-19 00:29:13', '2023-10-19 22:05:07'),
(254, 26, 6, 'DISCIPLINARIO', 'Grave', 'SC-20231021T020821Z-26-254', '2023-10-21 02:08:21', '2023-11-01 08:40:00', 'asdasdasdasdasdasdasdasd23wsadsad', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2023-10-20 11:15:31', '2023-11-22 20:53:48'),
(255, 26, 1, 'DISCIPLINARIO', 'Grave', 'SC-20231109T211042Z-26-255', '2023-11-09 21:10:42', '0000-00-00 00:00:00', ':Microsoft Excel es una potente herramienta de hoja de `[-?[-?-]YH-?H-]-[-^?H--\\?H-??[?^?\\?--[?[-^?\\?-H-?\\?X[-^?\\?--]-??--H-\\]{H-[?H-?{XH-?\\?X?H-???H-??[?-]-[-^?\\?-^-?[-', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-11-20 06:12:20', '2023-11-20 06:12:20'),
(256, 26, 4, 'ACADEMICO', 'Grave', 'SC-20231125T013817Z-26-256', '2023-11-25 01:38:17', '0000-00-00 00:00:00', ':citacion ausenias', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2023-11-23 10:40:44', '2023-11-23 10:40:44'),
(257, 26, 1, 'ACADEMICO', 'Grave', 'SC-20240201T060000Z-26-257', '2024-02-01 06:00:00', '0000-00-00 00:00:00', ':Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno est?ndar de las industrias desde\n ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2024-01-31 13:04:50', '2024-01-31 13:04:50'),
(258, 26, 2, 'DISCIPLINARIO', 'Grave', 'SC-20240201T180000Z-26-258', '2024-02-01 18:00:00', '0000-00-00 00:00:00', ':ASDASDASD', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2024-02-01 00:56:20', '2024-02-01 00:56:20'),
(260, 26, 1, 'ACADEMICO Y DISCIPLINARIO', 'Gravisimas', 'SC-20240214T074758Z-26-260', '2024-02-14 07:47:58', '0000-00-00 00:00:00', ':Lorem Ipsum es simplemente el texto de relleno de las \nimprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno \nest?nda\nPageMaker, el cual incluye versiones de Lorem Ipsum. ', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2024-02-05 17:11:01', '2024-02-05 17:15:54'),
(261, 26, 2, 'DISCIPLINARIO', 'Grave', 'SC-20240209T060000Z-26-261', '2024-02-09 06:00:00', '0000-00-00 00:00:00', 'hola', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2024-02-08 15:28:52', '2024-02-08 15:29:42'),
(262, 26, 1, 'ACADEMICO Y DISCIPLINARIO', 'Gravisimas', 'SC-20240422T021113Z-26-262', '0000-00-00 00:00:00', '2024-04-11 02:43:00', 'sdasdasdasd', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2024-04-15 01:42:38', '2024-04-15 01:42:38'),
(263, 26, 1, 'ACADEMICO Y DISCIPLINARIO', 'Gravisimas', 'SC-20240422T021113Z-26-263', '0000-00-00 00:00:00', '2024-04-05 02:44:00', 'SDASDASDASDASDA', 'APOYO ADMINISTRATIVO EN SALUD', 'AGENDADA', 'senaV1', '1', '2024-04-15 01:44:02', '2024-04-15 01:44:02'),
(264, 26, 7, 'DISCIPLINARIO', 'Grave', 'SC-20240415T010000Z-26-264', '2024-04-21 18:00:00', '0000-00-00 00:00:00', 'dasdasdsadasd', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2024-04-14 22:47:27', '2024-04-14 22:47:27'),
(265, 26, 1, 'DISCIPLINARIO', 'Grave', 'SC-20240416T130000Z-26-265', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'sadasdasdasdasdkjasdkjaskd', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2024-04-16 09:27:24', '2024-04-16 09:27:24'),
(266, 26, 2, 'DISCIPLINARIO', 'Leve', 'SC-20240424T010000Z-26-266', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'sdasdasdasd', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2024-04-23 20:23:58', '2024-04-23 20:23:58'),
(267, 47, 1, 'DISCIPLINARIO', 'Leve', 'SC-20240606T020000Z-47-267', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'vbcbcvbcvbcgdfgdfgdfgdf', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2024-06-05 23:28:55', '2024-06-05 23:28:55'),
(268, 47, 8, 'DISCIPLINARIO', 'Grave', 'SC-20240606T020000Z-47-268', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'fghhfghfghfghfgh', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2024-06-05 23:29:50', '2024-06-05 23:29:50'),
(269, 47, 1, 'ACADEMICO Y DISCIPLINARIO', 'Leve', 'SC-20230921T080000Z-47-269', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'fgdfgdfgdfgdfgdfg', 'APOYO ADMINISTRATIVO EN SALUD', 'SIN AGENDA', 'senaV1', '1', '2024-06-06 00:48:54', '2024-06-06 00:48:54');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apis_autorizaciones`
--
ALTER TABLE `apis_autorizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMenu` (`idMenu`),
  ADD KEY `idSubmenu` (`idSubmenu`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `apis_menu`
--
ALTER TABLE `apis_menu`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indices de la tabla `apis_roles`
--
ALTER TABLE `apis_roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `apis_submenus`
--
ALTER TABLE `apis_submenus`
  ADD PRIMARY KEY (`idSubmenu`),
  ADD KEY `idMenu` (`idMenu`);

--
-- Indices de la tabla `api_articles`
--
ALTER TABLE `api_articles`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `id_rubrique` (`id_rubrique`),
  ADD KEY `id_secteur` (`id_secteur`),
  ADD KEY `id_trad` (`id_trad`),
  ADD KEY `lang` (`lang`),
  ADD KEY `statut` (`statut`,`date`);

--
-- Indices de la tabla `api_auteurs`
--
ALTER TABLE `api_auteurs`
  ADD PRIMARY KEY (`id_auteur`),
  ADD KEY `login` (`login`),
  ADD KEY `statut` (`statut`),
  ADD KEY `en_ligne` (`en_ligne`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `api_auteurs_liens`
--
ALTER TABLE `api_auteurs_liens`
  ADD PRIMARY KEY (`id_auteur`,`id_objet`,`objet`),
  ADD KEY `id_auteur` (`id_auteur`),
  ADD KEY `id_objet` (`id_objet`),
  ADD KEY `objet` (`objet`);

--
-- Indices de la tabla `api_depots`
--
ALTER TABLE `api_depots`
  ADD PRIMARY KEY (`id_depot`);

--
-- Indices de la tabla `api_depots_plugins`
--
ALTER TABLE `api_depots_plugins`
  ADD PRIMARY KEY (`id_depot`,`id_plugin`);

--
-- Indices de la tabla `api_documents`
--
ALTER TABLE `api_documents`
  ADD PRIMARY KEY (`id_document`),
  ADD KEY `id_vignette` (`id_vignette`),
  ADD KEY `mode` (`mode`),
  ADD KEY `extension` (`extension`);

--
-- Indices de la tabla `api_documents_liens`
--
ALTER TABLE `api_documents_liens`
  ADD PRIMARY KEY (`id_document`,`id_objet`,`objet`),
  ADD KEY `id_document` (`id_document`),
  ADD KEY `id_objet` (`id_objet`),
  ADD KEY `objet` (`objet`);

--
-- Indices de la tabla `api_forum`
--
ALTER TABLE `api_forum`
  ADD PRIMARY KEY (`id_forum`),
  ADD KEY `id_auteur` (`id_auteur`),
  ADD KEY `id_parent` (`id_parent`),
  ADD KEY `id_thread` (`id_thread`),
  ADD KEY `optimal` (`statut`,`id_parent`,`id_objet`,`objet`,`date_heure`);

--
-- Indices de la tabla `api_groupes_mots`
--
ALTER TABLE `api_groupes_mots`
  ADD PRIMARY KEY (`id_groupe`);

--
-- Indices de la tabla `api_jobs`
--
ALTER TABLE `api_jobs`
  ADD PRIMARY KEY (`id_job`),
  ADD KEY `date` (`date`),
  ADD KEY `status` (`status`);

--
-- Indices de la tabla `api_jobs_liens`
--
ALTER TABLE `api_jobs_liens`
  ADD PRIMARY KEY (`id_job`,`id_objet`,`objet`),
  ADD KEY `id_job` (`id_job`);

--
-- Indices de la tabla `api_meta`
--
ALTER TABLE `api_meta`
  ADD PRIMARY KEY (`nom`);

--
-- Indices de la tabla `api_mots`
--
ALTER TABLE `api_mots`
  ADD PRIMARY KEY (`id_mot`),
  ADD KEY `id_groupe` (`id_groupe`);

--
-- Indices de la tabla `api_mots_liens`
--
ALTER TABLE `api_mots_liens`
  ADD PRIMARY KEY (`id_mot`,`id_objet`,`objet`),
  ADD KEY `id_mot` (`id_mot`),
  ADD KEY `id_objet` (`id_objet`),
  ADD KEY `objet` (`objet`);

--
-- Indices de la tabla `api_paquets`
--
ALTER TABLE `api_paquets`
  ADD PRIMARY KEY (`id_paquet`),
  ADD KEY `id_plugin` (`id_plugin`);

--
-- Indices de la tabla `api_plugins`
--
ALTER TABLE `api_plugins`
  ADD PRIMARY KEY (`id_plugin`),
  ADD KEY `prefixe` (`prefixe`);

--
-- Indices de la tabla `api_referers`
--
ALTER TABLE `api_referers`
  ADD PRIMARY KEY (`referer_md5`);

--
-- Indices de la tabla `api_referers_articles`
--
ALTER TABLE `api_referers_articles`
  ADD PRIMARY KEY (`id_article`,`referer_md5`),
  ADD KEY `referer_md5` (`referer_md5`);

--
-- Indices de la tabla `api_rubriques`
--
ALTER TABLE `api_rubriques`
  ADD PRIMARY KEY (`id_rubrique`),
  ADD KEY `lang` (`lang`),
  ADD KEY `id_parent` (`id_parent`);

--
-- Indices de la tabla `api_syndic`
--
ALTER TABLE `api_syndic`
  ADD PRIMARY KEY (`id_syndic`),
  ADD KEY `id_rubrique` (`id_rubrique`),
  ADD KEY `id_secteur` (`id_secteur`),
  ADD KEY `statut` (`statut`,`date_syndic`);

--
-- Indices de la tabla `api_syndic_articles`
--
ALTER TABLE `api_syndic_articles`
  ADD PRIMARY KEY (`id_syndic_article`),
  ADD KEY `id_syndic` (`id_syndic`),
  ADD KEY `statut` (`statut`),
  ADD KEY `url` (`url`(255));

--
-- Indices de la tabla `api_types_documents`
--
ALTER TABLE `api_types_documents`
  ADD PRIMARY KEY (`extension`),
  ADD KEY `inclus` (`inclus`);

--
-- Indices de la tabla `api_urls`
--
ALTER TABLE `api_urls`
  ADD PRIMARY KEY (`id_parent`,`url`),
  ADD KEY `type` (`type`,`id_objet`),
  ADD KEY `langue` (`langue`),
  ADD KEY `url` (`url`);

--
-- Indices de la tabla `api_usuarios`
--
ALTER TABLE `api_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rol` (`idRol`) USING BTREE;

--
-- Indices de la tabla `api_versions`
--
ALTER TABLE `api_versions`
  ADD PRIMARY KEY (`id_version`,`id_objet`,`objet`),
  ADD KEY `id_version` (`id_version`),
  ADD KEY `id_objet` (`id_objet`),
  ADD KEY `objet` (`objet`);

--
-- Indices de la tabla `api_versions_fragments`
--
ALTER TABLE `api_versions_fragments`
  ADD PRIMARY KEY (`id_objet`,`objet`,`id_fragment`,`version_min`);

--
-- Indices de la tabla `api_visites`
--
ALTER TABLE `api_visites`
  ADD PRIMARY KEY (`date`);

--
-- Indices de la tabla `api_visites_articles`
--
ALTER TABLE `api_visites_articles`
  ADD PRIMARY KEY (`date`,`id_article`);

--
-- Indices de la tabla `brevess`
--
ALTER TABLE `brevess`
  ADD PRIMARY KEY (`id_breve`);

--
-- Indices de la tabla `sena_actacomite`
--
ALTER TABLE `sena_actacomite`
  ADD PRIMARY KEY (`idActaComite`),
  ADD KEY `idSolicitud` (`idSolicitud`),
  ADD KEY `idApoyo` (`idApoyo`),
  ADD KEY `sena_actaComite_ibfk_1` (`idDirectivo`);

--
-- Indices de la tabla `sena_actas`
--
ALTER TABLE `sena_actas`
  ADD PRIMARY KEY (`idActa`);

--
-- Indices de la tabla `sena_actas_conceptos`
--
ALTER TABLE `sena_actas_conceptos`
  ADD PRIMARY KEY (`idConcepto`),
  ADD KEY `idActa` (`idActa`),
  ADD KEY `idSolicitud` (`idSolicitud`);

--
-- Indices de la tabla `sena_agenda`
--
ALTER TABLE `sena_agenda`
  ADD PRIMARY KEY (`idAgenda`),
  ADD KEY `idApoyo` (`idApoyo`),
  ADD KEY `idSolicitud` (`idSolicitud`);

--
-- Indices de la tabla `sena_apoyo`
--
ALTER TABLE `sena_apoyo`
  ADD PRIMARY KEY (`idApoyo`);

--
-- Indices de la tabla `sena_aprendiz`
--
ALTER TABLE `sena_aprendiz`
  ADD PRIMARY KEY (`idAprendiz`);

--
-- Indices de la tabla `sena_aprendizacademico`
--
ALTER TABLE `sena_aprendizacademico`
  ADD PRIMARY KEY (`idAprendizAcademico`),
  ADD KEY `idAprendiz` (`idAprendiz`);

--
-- Indices de la tabla `sena_asistencias`
--
ALTER TABLE `sena_asistencias`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD KEY `idActa` (`idActa`);

--
-- Indices de la tabla `sena_directivo`
--
ALTER TABLE `sena_directivo`
  ADD PRIMARY KEY (`idDirectivo`);

--
-- Indices de la tabla `sena_evidencia`
--
ALTER TABLE `sena_evidencia`
  ADD PRIMARY KEY (`idEvidencia`);

--
-- Indices de la tabla `sena_instructor`
--
ALTER TABLE `sena_instructor`
  ADD PRIMARY KEY (`idInstructor`);

--
-- Indices de la tabla `sena_modelo_historial_incidencias`
--
ALTER TABLE `sena_modelo_historial_incidencias`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `idAprendiz` (`idAprendiz`),
  ADD KEY `idInstructor` (`idInstructor`);

--
-- Indices de la tabla `sena_modelo_novedades`
--
ALTER TABLE `sena_modelo_novedades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sena_planmejora`
--
ALTER TABLE `sena_planmejora`
  ADD PRIMARY KEY (`idPlanMejora`),
  ADD KEY `idActaComite` (`idActaComite`),
  ADD KEY `idSolicitud` (`idSolicitud`);

--
-- Indices de la tabla `sena_sancionesanteriores`
--
ALTER TABLE `sena_sancionesanteriores`
  ADD PRIMARY KEY (`idSancion`),
  ADD KEY `idAprendiz` (`idAprendiz`),
  ADD KEY `idSolicitud` (`idSolicitud`);

--
-- Indices de la tabla `sena_solicitudcomite`
--
ALTER TABLE `sena_solicitudcomite`
  ADD PRIMARY KEY (`idSolicitud`),
  ADD KEY `idInstructor` (`idInstructor`),
  ADD KEY `idAprendiz` (`idAprendiz`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apis_autorizaciones`
--
ALTER TABLE `apis_autorizaciones`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `apis_menu`
--
ALTER TABLE `apis_menu`
  MODIFY `idMenu` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `apis_roles`
--
ALTER TABLE `apis_roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `apis_submenus`
--
ALTER TABLE `apis_submenus`
  MODIFY `idSubmenu` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `api_articles`
--
ALTER TABLE `api_articles`
  MODIFY `id_article` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_auteurs`
--
ALTER TABLE `api_auteurs`
  MODIFY `id_auteur` bigint(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `api_depots`
--
ALTER TABLE `api_depots`
  MODIFY `id_depot` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_documents`
--
ALTER TABLE `api_documents`
  MODIFY `id_document` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_forum`
--
ALTER TABLE `api_forum`
  MODIFY `id_forum` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_groupes_mots`
--
ALTER TABLE `api_groupes_mots`
  MODIFY `id_groupe` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_jobs`
--
ALTER TABLE `api_jobs`
  MODIFY `id_job` bigint(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3117;

--
-- AUTO_INCREMENT de la tabla `api_mots`
--
ALTER TABLE `api_mots`
  MODIFY `id_mot` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_paquets`
--
ALTER TABLE `api_paquets`
  MODIFY `id_paquet` bigint(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `api_plugins`
--
ALTER TABLE `api_plugins`
  MODIFY `id_plugin` bigint(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `api_rubriques`
--
ALTER TABLE `api_rubriques`
  MODIFY `id_rubrique` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_syndic`
--
ALTER TABLE `api_syndic`
  MODIFY `id_syndic` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_syndic_articles`
--
ALTER TABLE `api_syndic_articles`
  MODIFY `id_syndic_article` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_usuarios`
--
ALTER TABLE `api_usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `brevess`
--
ALTER TABLE `brevess`
  MODIFY `id_breve` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sena_actacomite`
--
ALTER TABLE `sena_actacomite`
  MODIFY `idActaComite` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `sena_actas`
--
ALTER TABLE `sena_actas`
  MODIFY `idActa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `sena_actas_conceptos`
--
ALTER TABLE `sena_actas_conceptos`
  MODIFY `idConcepto` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `sena_agenda`
--
ALTER TABLE `sena_agenda`
  MODIFY `idAgenda` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `sena_apoyo`
--
ALTER TABLE `sena_apoyo`
  MODIFY `idApoyo` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `sena_aprendiz`
--
ALTER TABLE `sena_aprendiz`
  MODIFY `idAprendiz` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `sena_aprendizacademico`
--
ALTER TABLE `sena_aprendizacademico`
  MODIFY `idAprendizAcademico` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sena_asistencias`
--
ALTER TABLE `sena_asistencias`
  MODIFY `id_asistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `sena_directivo`
--
ALTER TABLE `sena_directivo`
  MODIFY `idDirectivo` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sena_evidencia`
--
ALTER TABLE `sena_evidencia`
  MODIFY `idEvidencia` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sena_instructor`
--
ALTER TABLE `sena_instructor`
  MODIFY `idInstructor` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `sena_modelo_historial_incidencias`
--
ALTER TABLE `sena_modelo_historial_incidencias`
  MODIFY `idHistorial` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `sena_modelo_novedades`
--
ALTER TABLE `sena_modelo_novedades`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sena_planmejora`
--
ALTER TABLE `sena_planmejora`
  MODIFY `idPlanMejora` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sena_sancionesanteriores`
--
ALTER TABLE `sena_sancionesanteriores`
  MODIFY `idSancion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `sena_solicitudcomite`
--
ALTER TABLE `sena_solicitudcomite`
  MODIFY `idSolicitud` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apis_autorizaciones`
--
ALTER TABLE `apis_autorizaciones`
  ADD CONSTRAINT `apis_autorizaciones_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `apis_roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apis_autorizaciones_ibfk_2` FOREIGN KEY (`idMenu`) REFERENCES `apis_menu` (`idMenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apis_autorizaciones_ibfk_3` FOREIGN KEY (`idSubmenu`) REFERENCES `apis_submenus` (`idSubmenu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `apis_submenus`
--
ALTER TABLE `apis_submenus`
  ADD CONSTRAINT `apis_submenus_ibfk_1` FOREIGN KEY (`idMenu`) REFERENCES `apis_menu` (`idMenu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sena_actacomite`
--
ALTER TABLE `sena_actacomite`
  ADD CONSTRAINT `sena_actaComite_ibfk_1` FOREIGN KEY (`idDirectivo`) REFERENCES `sena_directivo` (`idDirectivo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sena_actaComite_ibfk_2` FOREIGN KEY (`idApoyo`) REFERENCES `sena_apoyo` (`idApoyo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sena_aprendizacademico`
--
ALTER TABLE `sena_aprendizacademico`
  ADD CONSTRAINT `sena_aprendizAcademico_ibfk_1` FOREIGN KEY (`idAprendiz`) REFERENCES `sena_aprendiz` (`idAprendiz`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sena_planmejora`
--
ALTER TABLE `sena_planmejora`
  ADD CONSTRAINT `sena_planMejora_ibfk_1` FOREIGN KEY (`idActaComite`) REFERENCES `sena_actacomite` (`idActaComite`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sena_solicitudcomite`
--
ALTER TABLE `sena_solicitudcomite`
  ADD CONSTRAINT `sena_solicitudComite_ibfk_1` FOREIGN KEY (`idInstructor`) REFERENCES `sena_instructor` (`idInstructor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
