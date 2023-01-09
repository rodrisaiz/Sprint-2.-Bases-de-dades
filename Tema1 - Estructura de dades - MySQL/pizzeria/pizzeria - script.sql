CREATE TABLE `bebidas` (
  `id` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `descripcion` varchar(120) DEFAULT NULL,
  `imagen` longblob,
  `precio` float DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `categoria` (
  `id` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `id_pizza` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cliente` (
  `id` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `codigo_postal` varchar(60) DEFAULT NULL,
  `localidad` varchar(60) DEFAULT NULL,
  `provincia` varchar(60) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `empleado` (
  `id` int NOT NULL,
  `id_tienda` int DEFAULT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `nif` varchar(10) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';

CREATE TABLE `entrega` (
  `id` int NOT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hamburguesas` (
  `id` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `descripcion` varchar(120) DEFAULT NULL,
  `imagen` longblob,
  `precio` float DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pedido` (
  `id` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `reparto` set('tienda','domicilio') DEFAULT NULL,
  `pizzas_cantidad` int DEFAULT NULL,
  `hamburguesas_cantidad` int DEFAULT NULL,
  `bebidas_cantidad` int DEFAULT NULL,
  `precio_total` float DEFAULT NULL,
  `id_tienda` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pizza` (
  `id` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `descripccion` varchar(120) DEFAULT NULL,
  `imagen` longblob,
  `precio` float DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tienda` (
  `id` int NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `codigo_postal` varchar(60) DEFAULT NULL,
  `localidad` varchar(60) DEFAULT NULL,
  `provincia` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
