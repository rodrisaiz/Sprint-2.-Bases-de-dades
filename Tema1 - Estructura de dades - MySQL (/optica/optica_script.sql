CREATE TABLE `cliente` (
  `id` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido1` varchar(60) DEFAULT NULL,
  `apellido2` varchar(60) DEFAULT NULL,
  `telefono` varchar(60) DEFAULT NULL,
  `correo_electronico` varchar(60) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `id_direccion` int DEFAULT NULL,
  `cliente_recomendacion` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';

CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL,
  `calle` varchar(60) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `piso` int DEFAULT NULL,
  `puerta` varchar(3) DEFAULT NULL,
  `ciudad` varchar(60) DEFAULT NULL,
  `codigo_postal` varchar(60) DEFAULT NULL,
  `pais` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `empleado` (
  `id` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `gafas` (
  `id` int NOT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `graduacion_derecha` float DEFAULT NULL,
  `graduacion_izquierda` float DEFAULT NULL,
  `montura` varchar(60) DEFAULT NULL,
  `montura_color` varchar(60) DEFAULT NULL,
  `color_vidrio_izquierdo` varchar(60) DEFAULT NULL,
  `color_vidrio_derecho` varchar(60) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `proveedor` (
  `id` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `fax` int DEFAULT NULL,
  `nif` varchar(9) DEFAULT NULL,
  `id_gafas` int DEFAULT NULL,
  `id_direccion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `venta` (
  `id` int NOT NULL,
  `id_empleado` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `id_gafas` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
