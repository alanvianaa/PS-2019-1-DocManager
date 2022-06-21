-- MySQL Script generated by MySQL Workbench
-- sex 21 jun 2019 10:15:45 -03
-- Model: Sakila Full    Version: 2.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema DocManager
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DocManager
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DocManager` ;
USE `DocManager` ;

-- -----------------------------------------------------
-- Table `DocManager`.`permissao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DocManager`.`permissao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocManager`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DocManager`.`usuario` (
  `id` INT NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NULL,
  `nome_completo` VARCHAR(45) NULL,
  `cpf` VARCHAR(11) NULL,
  `email` VARCHAR(45) NULL,
  `permissao_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `permissao_id`),
  INDEX `id_idx` (`permissao_id` ASC),
  CONSTRAINT `fk_permissao`
    FOREIGN KEY (`permissao_id`)
    REFERENCES `DocManager`.`permissao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocManager`.`tipo_Permissao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DocManager`.`tipo_Permissao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocManager`.`membros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DocManager`.`membros` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocManager`.`tipo_documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DocManager`.`tipo_documento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocManager`.`Documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DocManager`.`Documento` (
  `id` INT NOT NULL,
  `tipo_documento` INT NOT NULL,
  `Versao` VARCHAR(45) NOT NULL,
  `documento_Original` VARCHAR(45) NULL,
  `documento_PDF` VARCHAR(45) NULL,
  `data_validacao` DATE NULL,
  `data_vencimento` DATE NULL,
  `descricao` VARCHAR(45) NULL,
  `local` VARCHAR(45) NULL,
  `extensaoDOC` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Documento_1_idx` (`tipo_documento` ASC),
  CONSTRAINT `fk_Documento_1`
    FOREIGN KEY (`tipo_documento`)
    REFERENCES `DocManager`.`tipo_documento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocManager`.`verificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DocManager`.`verificacao` (
  `id` INT NOT NULL,
  `membros_id` INT NOT NULL,
  `documento_id` INT NOT NULL,
  `data_hora_validacao` DATETIME NULL,
  `status` VARCHAR(8) NULL,
  `detalhamento` VARCHAR(150) NULL,
  PRIMARY KEY (`id`, `membros_id`, `documento_id`),
  INDEX `fk_verificacao_1_idx` (`membros_id` ASC),
  INDEX `fk_verificacao_2_idx` (`documento_id` ASC),
  CONSTRAINT `fk_verificacao_1`
    FOREIGN KEY (`membros_id`)
    REFERENCES `DocManager`.`membros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_verificacao_2`
    FOREIGN KEY (`documento_id`)
    REFERENCES `DocManager`.`Documento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocManager`.`lista_permissao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DocManager`.`lista_permissao` (
  `permissao_id` INT NOT NULL,
  `tipo_permissao_id` INT NOT NULL,
  INDEX `fk_lista_permissao_1_idx` (`tipo_permissao_id` ASC),
  CONSTRAINT `fk_lista_permissao`
    FOREIGN KEY (`permissao_id`)
    REFERENCES `DocManager`.`permissao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista_permissao_1`
    FOREIGN KEY (`tipo_permissao_id`)
    REFERENCES `DocManager`.`tipo_Permissao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocManager`.`lista_membros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DocManager`.`lista_membros` (
  `membros_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  `data_hora_validacao` DATETIME NULL,
  `status` VARCHAR(8) NULL,
  `detalhamento` VARCHAR(300) NULL,
  INDEX `fk_lista_membros_1_idx` (`membros_id` ASC),
  INDEX `fk_lista_membros_2_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_lista_membros_1`
    FOREIGN KEY (`membros_id`)
    REFERENCES `DocManager`.`membros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista_membros_2`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `DocManager`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocManager`.`elaboracao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DocManager`.`elaboracao` (
  `id` INT NOT NULL,
  `membros_id` INT NOT NULL,
  `documento_id` INT NOT NULL,
  `data_hora_validacao` DATETIME NULL,
  `status` VARCHAR(8) NULL,
  `detalhamento` VARCHAR(150) NULL,
  PRIMARY KEY (`id`, `membros_id`, `documento_id`),
  INDEX `fk_verificacao_1_idx` (`membros_id` ASC),
  INDEX `fk_verificacao_2_idx` (`documento_id` ASC),
  CONSTRAINT `fk_verificacao_10`
    FOREIGN KEY (`membros_id`)
    REFERENCES `DocManager`.`membros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_verificacao_20`
    FOREIGN KEY (`documento_id`)
    REFERENCES `DocManager`.`Documento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocManager`.`aprovacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DocManager`.`aprovacao` (
  `id` INT NOT NULL,
  `membros_id` INT NOT NULL,
  `documento_id` INT NOT NULL,
  `data_hora_validacao` DATETIME NULL,
  `status` VARCHAR(8) NULL,
  `detalhamento` VARCHAR(150) NULL,
  PRIMARY KEY (`id`, `membros_id`, `documento_id`),
  INDEX `fk_verificacao_1_idx` (`membros_id` ASC),
  INDEX `fk_verificacao_2_idx` (`documento_id` ASC),
  CONSTRAINT `fk_verificacao_11`
    FOREIGN KEY (`membros_id`)
    REFERENCES `DocManager`.`membros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_verificacao_21`
    FOREIGN KEY (`documento_id`)
    REFERENCES `DocManager`.`Documento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `DocManager`.`permissao`
-- -----------------------------------------------------
START TRANSACTION;
USE `DocManager`;
INSERT INTO `DocManager`.`permissao` (`id`, `descricao`) VALUES (1, 'Diretor');
INSERT INTO `DocManager`.`permissao` (`id`, `descricao`) VALUES (2, 'Gestor de Qualidade');
INSERT INTO `DocManager`.`permissao` (`id`, `descricao`) VALUES (3, 'Gestor de Setor');
INSERT INTO `DocManager`.`permissao` (`id`, `descricao`) VALUES (4, 'Colaborador');

COMMIT;


-- -----------------------------------------------------
-- Data for table `DocManager`.`tipo_Permissao`
-- -----------------------------------------------------
START TRANSACTION;
USE `DocManager`;
INSERT INTO `DocManager`.`tipo_Permissao` (`id`, `Descricao`) VALUES (1, 'Gerar Documento');
INSERT INTO `DocManager`.`tipo_Permissao` (`id`, `Descricao`) VALUES (2, 'Excluir Documento');
INSERT INTO `DocManager`.`tipo_Permissao` (`id`, `Descricao`) VALUES (3, 'Inserir Membro');
INSERT INTO `DocManager`.`tipo_Permissao` (`id`, `Descricao`) VALUES (4, 'Excluir membro');

COMMIT;


-- -----------------------------------------------------
-- Data for table `DocManager`.`tipo_documento`
-- -----------------------------------------------------
START TRANSACTION;
USE `DocManager`;
INSERT INTO `DocManager`.`tipo_documento` (`id`, `descricao`) VALUES (DEFAULT, 'Contrato de Trabalho');
INSERT INTO `DocManager`.`tipo_documento` (`id`, `descricao`) VALUES (DEFAULT, 'Comunicado Interno');
INSERT INTO `DocManager`.`tipo_documento` (`id`, `descricao`) VALUES (DEFAULT, 'Planilha de Controle de estoque');
INSERT INTO `DocManager`.`tipo_documento` (`id`, `descricao`) VALUES (DEFAULT, 'Termo de Rescisão');
INSERT INTO `DocManager`.`tipo_documento` (`id`, `descricao`) VALUES (DEFAULT, 'Plano de Contigência');

COMMIT;
