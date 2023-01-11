-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`cliente_recomendacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`cliente_recomendacion` (
  `id` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `optica`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`direccion` (
  `id_direccion` INT NOT NULL,
  `calle` VARCHAR(60) NULL DEFAULT NULL,
  `numero` VARCHAR(60) NULL DEFAULT NULL,
  `piso` VARCHAR(60) NULL DEFAULT NULL,
  `puerta` VARCHAR(10) NULL DEFAULT NULL,
  `ciudad` VARCHAR(60) NULL DEFAULT NULL,
  `codigo_postal` VARCHAR(60) NULL DEFAULT NULL,
  `pais` VARCHAR(60) NULL DEFAULT NULL,
  `proveedor_id` INT NULL,
  PRIMARY KEY (`id_direccion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`cliente` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `apellido1` VARCHAR(60) NULL DEFAULT NULL,
  `apellido2` VARCHAR(60) NULL DEFAULT NULL,
  `telefono` VARCHAR(60) NULL DEFAULT NULL,
  `correo_electronico` VARCHAR(60) NULL DEFAULT NULL,
  `fecha_registro` DATE NULL DEFAULT NULL,
  `direccion_id_direccion` INT NOT NULL,
  `cliente_recomendacion` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cliente_cliente_recomendacion_idx` (`cliente_recomendacion` ASC) VISIBLE,
  INDEX `fk_cliente_direccion_id_direccion_idx` (`direccion_id_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_cliente_recomendacion`
    FOREIGN KEY (`cliente_recomendacion`)
    REFERENCES `optica`.`cliente_recomendacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_direccion_id_direccion`
    FOREIGN KEY (`direccion_id_direccion`)
    REFERENCES `optica`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '		';


-- -----------------------------------------------------
-- Table `optica`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleado` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`gafas` (
  `id` INT NOT NULL,
  `marca` VARCHAR(60) NULL DEFAULT NULL,
  `graduacion_derecha` FLOAT NULL DEFAULT NULL,
  `graduacion_izquierda` FLOAT NULL DEFAULT NULL,
  `montura` SET('flotante', 'pasta', 'metálica') NULL DEFAULT NULL,
  `montura_color` VARCHAR(60) NULL DEFAULT NULL,
  `color_vidrio_izquierdo` VARCHAR(60) NULL DEFAULT NULL,
  `color_vidrio_derecho` VARCHAR(60) NULL DEFAULT NULL,
  `precio` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveedor` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `telefono` INT NULL DEFAULT NULL,
  `fax` INT NULL DEFAULT NULL,
  `nif` VARCHAR(9) NULL DEFAULT NULL,
  `direccion_id_direccion` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proveedor_direccion1_idx` (`direccion_id_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_proveedor_direccion1`
    FOREIGN KEY (`direccion_id_direccion`)
    REFERENCES `optica`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`marca_gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`marca_gafas` (
  `idmarca_gafas` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `proveedor_id` INT NOT NULL,
  `gafas_id` INT NOT NULL,
  PRIMARY KEY (`idmarca_gafas`),
  INDEX `fk_marca_gafas_proveedor1_idx` (`proveedor_id` ASC) VISIBLE,
  INDEX `fk_marca_gafas_gafas1_idx` (`gafas_id` ASC) VISIBLE,
  CONSTRAINT `fk_marca_gafas_proveedor1`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `optica`.`proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_marca_gafas_gafas1`
    FOREIGN KEY (`gafas_id`)
    REFERENCES `optica`.`gafas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`venta` (
  `id` INT NOT NULL,
  `empleado_id` INT NOT NULL,
  `proveedor_id` INT NOT NULL,
  `gafas_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `fecha_venta` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_venta_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_venta_gafas1_idx` (`gafas_id` ASC) VISIBLE,
  INDEX `fk_venta_proveedor1_idx` (`proveedor_id` ASC) VISIBLE,
  INDEX `fk_venta_empleado1_idx` (`empleado_id` ASC) VISIBLE,
  CONSTRAINT `fk_venta_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `optica`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_gafas1`
    FOREIGN KEY (`gafas_id`)
    REFERENCES `optica`.`gafas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_proveedor1`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `optica`.`proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_empleado1`
    FOREIGN KEY (`empleado_id`)
    REFERENCES `optica`.`empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
