-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`bebidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`bebidas` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `descripcion` VARCHAR(120) NULL DEFAULT NULL,
  `imagen` LONGBLOB NULL DEFAULT NULL,
  `precio` FLOAT NULL DEFAULT NULL,
  `id_pedido` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`cliente` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `apellidos` VARCHAR(60) NULL DEFAULT NULL,
  `direccion` VARCHAR(60) NULL DEFAULT NULL,
  `codigo_postal` VARCHAR(60) NULL DEFAULT NULL,
  `localidad` VARCHAR(60) NULL DEFAULT NULL,
  `provincia` VARCHAR(60) NULL DEFAULT NULL,
  `telefono` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`tienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`tienda` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(60) NULL DEFAULT NULL,
  `codigo_postal` VARCHAR(60) NULL DEFAULT NULL,
  `localidad` VARCHAR(60) NULL DEFAULT NULL,
  `provincia` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '	';


-- -----------------------------------------------------
-- Table `pizzeria`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleado` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `apellidos` VARCHAR(60) NULL DEFAULT NULL,
  `nif` VARCHAR(10) NULL DEFAULT NULL,
  `telefono` INT NULL DEFAULT NULL,
  `tienda_id` INT NOT NULL,
  PRIMARY KEY (`id`, `tienda_id`),
  INDEX `fk_empleado_tienda1_idx` (`tienda_id` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_tienda1`
    FOREIGN KEY (`tienda_id`)
    REFERENCES `pizzeria`.`tienda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '	';


-- -----------------------------------------------------
-- Table `pizzeria`.`entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`entrega` (
  `id` INT NOT NULL,
  `id_empleado` INT NULL DEFAULT NULL,
  `fecha_entrega` DATE NULL DEFAULT NULL,
  `empleado_id` INT NOT NULL,
  `tienda_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_entrega_empleado1_idx` (`empleado_id` ASC) VISIBLE,
  INDEX `fk_entrega_tienda1_idx` (`tienda_id` ASC) VISIBLE,
  CONSTRAINT `fk_entrega_empleado1`
    FOREIGN KEY (`empleado_id`)
    REFERENCES `pizzeria`.`empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entrega_tienda1`
    FOREIGN KEY (`tienda_id`)
    REFERENCES `pizzeria`.`tienda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`hamburguesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`hamburguesas` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `descripcion` VARCHAR(120) NULL DEFAULT NULL,
  `imagen` LONGBLOB NULL DEFAULT NULL,
  `precio` FLOAT NULL DEFAULT NULL,
  `id_pedido` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pedido` (
  `id` INT NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `reparto` SET('tienda', 'domicilio') NULL DEFAULT NULL,
  `precio_total` FLOAT NULL DEFAULT NULL,
  `entrega_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pedido_entrega1_idx` (`entrega_id` ASC) VISIBLE,
  INDEX `fk_pedido_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_entrega1`
    FOREIGN KEY (`entrega_id`)
    REFERENCES `pizzeria`.`entrega` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `pizzeria`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`pizza_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pizza_categoria` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `descripccion` VARCHAR(120) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pizza` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `descripccion` VARCHAR(120) NULL DEFAULT NULL,
  `imagen` LONGBLOB NULL DEFAULT NULL,
  `precio` FLOAT NULL DEFAULT NULL,
  `id_pedido` INT NULL DEFAULT NULL,
  `pizza_categoria` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pizza_pizza_categoria1_idx` (`pizza_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_pizza_pizza_categoria1`
    FOREIGN KEY (`pizza_categoria`)
    REFERENCES `pizzeria`.`pizza_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedido_has_pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pedido_has_pizza` (
  `pedido_id` INT NOT NULL,
  `pizza_id` INT NOT NULL,
  PRIMARY KEY (`pedido_id`, `pizza_id`),
  INDEX `fk_pedido_has_pizza_pizza1_idx` (`pizza_id` ASC) VISIBLE,
  INDEX `fk_pedido_has_pizza_pedido1_idx` (`pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_has_pizza_pedido1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `pizzeria`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_pizza_pizza1`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `pizzeria`.`pizza` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedido_has_bebidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pedido_has_bebidas` (
  `pedido_id` INT NOT NULL,
  `bebidas_id` INT NOT NULL,
  PRIMARY KEY (`pedido_id`, `bebidas_id`),
  INDEX `fk_pedido_has_bebidas_bebidas1_idx` (`bebidas_id` ASC) VISIBLE,
  INDEX `fk_pedido_has_bebidas_pedido1_idx` (`pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_has_bebidas_pedido1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `pizzeria`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_bebidas_bebidas1`
    FOREIGN KEY (`bebidas_id`)
    REFERENCES `pizzeria`.`bebidas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedido_has_hamburguesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pedido_has_hamburguesas` (
  `pedido_id` INT NOT NULL,
  `hamburguesas_id` INT NOT NULL,
  PRIMARY KEY (`pedido_id`, `hamburguesas_id`),
  INDEX `fk_pedido_has_hamburguesas_hamburguesas1_idx` (`hamburguesas_id` ASC) VISIBLE,
  INDEX `fk_pedido_has_hamburguesas_pedido1_idx` (`pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_has_hamburguesas_pedido1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `pizzeria`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_hamburguesas_hamburguesas1`
    FOREIGN KEY (`hamburguesas_id`)
    REFERENCES `pizzeria`.`hamburguesas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
