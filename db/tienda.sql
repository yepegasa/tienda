-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-10-2020 a las 23:27:01
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldetalleventa`
--

DROP TABLE IF EXISTS `tbldetalleventa`;
CREATE TABLE IF NOT EXISTS `tbldetalleventa` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDVENTA` int(11) NOT NULL,
  `IDPRODUCTO` int(11) NOT NULL,
  `PRECIOUNITARIO` decimal(20,2) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `DESCARGADO` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDPRODUCTO` (`IDPRODUCTO`),
  KEY `IDVENTA` (`IDVENTA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbldetalleventa`
--

INSERT INTO `tbldetalleventa` (`ID`, `IDVENTA`, `IDPRODUCTO`, `PRECIOUNITARIO`, `CANTIDAD`, `DESCARGADO`) VALUES
(1, 2, 2, '429.00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblproductos`
--

DROP TABLE IF EXISTS `tblproductos`;
CREATE TABLE IF NOT EXISTS `tblproductos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Precio` decimal(20,2) NOT NULL,
  `Descripcion` text NOT NULL,
  `Imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblproductos`
--

INSERT INTO `tblproductos` (`ID`, `Nombre`, `Precio`, `Descripcion`, `Imagen`) VALUES
(1, 'Learn PHP 7', '300.00', 'This new book on PHP 7 introduces writing solid, secure, object-oriented code in the new PHP 7: you will create a complete three-tier application using a natural process of building and testing modules within each tier. This practical approach teaches you about app development and introduces PHP features when they are actually needed rather than providing you with abstract theory and contrived examples.', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4842/9781484217290.jpg'),
(2, 'Professional ASP.NET MVC 5 ', '429.00', 'MVC 5 is the newest update to the popular Microsoft technology that enables you to build dynamic, data-driven websites. Like previous versions, this guide shows you step-by-step techniques on using MVC to best advantage, with plenty of practical tutorials to illustrate the concepts. It covers controllers, views, and models; forms and HTML helpers; data annotation and validation; membership, authorization, and security.\r\n', 'https://images-na.ssl-images-amazon.com/images/I/51u-ERS1W8L._SX396_BO1,204,203,200_.jpg'),
(3, 'Learning Vue.js 2', '1005.35', '\r\n* Learn how to propagate DOM changes across the website without writing extensive jQuery callbacks code.\r\n* Learn how to achieve reactivity and easily compose views with Vue.js and understand what it does behind the scenes.\r\n* Explore the core features of Vue.js with small examples, learn how to build dynamic content into preexisting web applications, and build Vue.js applications from scratch.', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/7864/9781786469946.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblventas`
--

DROP TABLE IF EXISTS `tblventas`;
CREATE TABLE IF NOT EXISTS `tblventas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClaveTransaccion` varchar(250) NOT NULL,
  `PaypalDatos` text NOT NULL,
  `Fecha` datetime NOT NULL,
  `Correo` varchar(5000) NOT NULL,
  `Total` decimal(60,2) NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblventas`
--

INSERT INTO `tblventas` (`ID`, `ClaveTransaccion`, `PaypalDatos`, `Fecha`, `Correo`, `Total`, `status`) VALUES
(1, 'i3e4k3efb9r9bjtrp3hcndvmp5', '{\"id\":\"PAYID-L56OTKA5C391222LH707660G\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"04B52507WS856230C\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-9tiqw3130042@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"7B8BWZR7T5GC4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Lima\",\"state\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"},\"phone\":\"5169934620\",\"country_code\":\"PE\"}},\"transactions\":[{\"amount\":{\"total\":\"300.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"300.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"DANYSDYM7DCNQ\",\"email\":\"sb-eeyhb3131046@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$300.00\'\",\"custom\":\"i3e4k3efb9r9bjtrp3hcndvmp5#A3F5iOATeWULDql+3cbbrA==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Lima\",\"state\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"related_resources\":[{\"sale\":{\"id\":\"86873029A4770364N\",\"state\":\"pending\",\"amount\":{\"total\":\"300.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"300.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"reason_code\":\"RECEIVING_PREFERENCE_MANDATES_MANUAL_ACTION\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"receivable_amount\":{\"value\":\"300.00\",\"currency\":\"MXN\"},\"exchange_rate\":\"18.904664999999998\",\"parent_payment\":\"PAYID-L56OTKA5C391222LH707660G\",\"create_time\":\"2020-10-06T22:05:34Z\",\"update_time\":\"2020-10-06T22:05:34Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/86873029A4770364N\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/86873029A4770364N/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L56OTKA5C391222LH707660G\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-10-06T22:03:20Z\",\"update_time\":\"2020-10-06T22:05:34Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L56OTKA5C391222LH707660G\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-10-06 16:47:38', 'yelson.persi@gmail.com', '300.00', 'completo'),
(2, 'i3e4k3efb9r9bjtrp3hcndvmp5', '{\"id\":\"PAYID-L56OU3Q8YH79321RA9902620\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"0Y424702L65900347\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-9tiqw3130042@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"7B8BWZR7T5GC4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Lima\",\"state\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"},\"phone\":\"5169934620\",\"country_code\":\"PE\"}},\"transactions\":[{\"amount\":{\"total\":\"429.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"429.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"DANYSDYM7DCNQ\",\"email\":\"sb-eeyhb3131046@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$429.00\'\",\"custom\":\"i3e4k3efb9r9bjtrp3hcndvmp5#Nxau+I4XQmTJQ0J1i8fweQ==\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Lima\",\"state\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"related_resources\":[{\"sale\":{\"id\":\"8S062767SA209484X\",\"state\":\"pending\",\"amount\":{\"total\":\"429.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"429.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"reason_code\":\"RECEIVING_PREFERENCE_MANDATES_MANUAL_ACTION\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"receivable_amount\":{\"value\":\"429.00\",\"currency\":\"MXN\"},\"exchange_rate\":\"18.904664999999998\",\"parent_payment\":\"PAYID-L56OU3Q8YH79321RA9902620\",\"create_time\":\"2020-10-06T22:06:53Z\",\"update_time\":\"2020-10-06T22:06:53Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/8S062767SA209484X\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/8S062767SA209484X/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L56OU3Q8YH79321RA9902620\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-10-06T22:06:38Z\",\"update_time\":\"2020-10-06T22:06:53Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L56OU3Q8YH79321RA9902620\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-10-06 17:06:32', 'yelson.persi@gmail.com', '429.00', 'completo');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbldetalleventa`
--
ALTER TABLE `tbldetalleventa`
  ADD CONSTRAINT `tbldetalleventa_ibfk_1` FOREIGN KEY (`IDVENTA`) REFERENCES `tblventas` (`ID`),
  ADD CONSTRAINT `tbldetalleventa_ibfk_2` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `tblproductos` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
