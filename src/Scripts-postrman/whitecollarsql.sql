-- MySQL Script generated by MySQL Workbench
-- Mon Mar 15 12:16:33 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema white_collar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema white_collar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `white_collar` DEFAULT CHARACTER SET utf8 ;
USE `white_collar` ;

-- -----------------------------------------------------
-- Table `white_collar`.`tienda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `white_collar`.`tienda` ;

CREATE TABLE IF NOT EXISTS `white_collar`.`tienda` (
  `id_tienda` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `capacity` INT NULL,
  PRIMARY KEY (`id_tienda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `white_collar`.`cuadro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `white_collar`.`cuadro` ;

CREATE TABLE IF NOT EXISTS `white_collar`.`cuadro` (
  `id_cuadro` INT NOT NULL AUTO_INCREMENT,
  `tittle` VARCHAR(200) NULL,
  `author` VARCHAR(45) NULL DEFAULT 'Anonimo',
  `prize` DOUBLE NULL,
  PRIMARY KEY (`id_cuadro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `white_collar`.`cuadros_tiendas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `white_collar`.`cuadros_tiendas` ;

CREATE TABLE IF NOT EXISTS `white_collar`.`cuadros_tiendas` (
  `tienda_id` INT NOT NULL,
  `cuadro_id` INT NOT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`tienda_id`, `cuadro_id`),
  INDEX `fkcuadro_id_idx` (`cuadro_id` ASC) VISIBLE,
  UNIQUE INDEX `cuadro_id_UNIQUE` (`cuadro_id` ASC) VISIBLE,
  CONSTRAINT `fktienda_id`
    FOREIGN KEY (`tienda_id`)
    REFERENCES `white_collar`.`tienda` (`id_tienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkcuadro_id`
    FOREIGN KEY (`cuadro_id`)
    REFERENCES `white_collar`.`cuadro` (`id_cuadro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `white_collar` ;

-- -----------------------------------------------------
-- Placeholder table for view `white_collar`.`tiendaview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `white_collar`.`tiendaview` (`id_tienda` INT, `name` INT, `capacity` INT, `occupation` INT);

-- -----------------------------------------------------
-- View `white_collar`.`tiendaview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `white_collar`.`tiendaview`;
DROP VIEW IF EXISTS `white_collar`.`tiendaview` ;
USE `white_collar`;
CREATE  OR REPLACE VIEW `tiendaview` (id_tienda, name, capacity, occupation)
AS SELECT 
	tienda.id_tienda, 
    tienda.name,
    tienda.capacity, 
    COUNT(cuadros_tiendas.cuadro_id) AS occupation 
FROM tienda INNER JOIN cuadros_tiendas 
	ON tienda.id_tienda = cuadros_tiendas.tienda_id
GROUP BY id_tienda;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `white_collar`.`tienda`
-- -----------------------------------------------------
START TRANSACTION;
USE `white_collar`;
INSERT INTO `white_collar`.`tienda` (`id_tienda`, `name`, `capacity`) VALUES (1, 'Todo Cuadro', 25);
INSERT INTO `white_collar`.`tienda` (`id_tienda`, `name`, `capacity`) VALUES (2, 'La Cuadreria', 10);
INSERT INTO `white_collar`.`tienda` (`id_tienda`, `name`, `capacity`) VALUES (3, 'Los Mejores Cuadros', 80);

COMMIT;


-- -----------------------------------------------------
-- Data for table `white_collar`.`cuadro`
-- -----------------------------------------------------
START TRANSACTION;
USE `white_collar`;
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (1, 'Las Meninas', 'Velazquez', 1200000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (2, 'La Gioconda', 'Da Vinci', 1800000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (3, 'El amanecer dorado', 'Jose Luis Vazquez', 500);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (4, 'El Guernika', 'Picasso', 800000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (5, 'Bodegon espa??ol', 'Daniel Martinez', 600);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (6, 'La noche estrellada', 'Van Gogh', 900000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (7, 'La ??ltima cena ', 'Da Vinci', 5000000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (8, 'La creaci??n de Ad??n', 'Miguel ??ngel', 2200000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (9, 'La Persistencia de la Memoria', 'Dal??', 2000000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (10, 'El Grito', 'Munch', 900000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (11, 'El Jardin de las delicias', 'Bosco', 850000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (12, 'El Nacimiento de Venis', 'Bottichelli', 700000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (13, 'La Virgen del Pilar', 'Goya', 800000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (14, 'Sue??o causado por el vuelo de una abeja alrededor de una granada un segundo antes de despertar', 'Dali', 1500000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (15, 'Figura en una finestra', 'Dali', 1200000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (16, 'Arbol Golpeado por el Viento', 'Van Gogh', 750000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (17, 'Vaca Acostada', 'Van Gogh', 800000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (18, 'El Estrellato', 'Marcos ruiz', 2000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (19, 'Las Se??oritas de Avignon', 'Picasso', 400000);
INSERT INTO `white_collar`.`cuadro` (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (20, 'Los Tres Musicos', 'Picasso', 250000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `white_collar`.`cuadros_tiendas`
-- -----------------------------------------------------
START TRANSACTION;
USE `white_collar`;
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 1, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 3, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 10, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 2, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 4, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 5, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 6, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 7, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 8, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 9, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 11, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 12, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 13, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 15, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 16, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 17, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 18, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 19, '2021/03/08');
INSERT INTO `white_collar`.`cuadros_tiendas` (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 20, '2021/03/08');

COMMIT;

