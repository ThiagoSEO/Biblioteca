-- MySQL Script generated by MySQL Workbench
-- Sat Sep  7 15:57:18 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PROJECTO
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PROJECTO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PROJECTO` DEFAULT CHARACTER SET utf8 ;
USE `PROJECTO` ;

-- -----------------------------------------------------
-- Table `PROJECTO`.`Colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROJECTO`.`Colaborador` (
  `CPF_ID` INT NOT NULL,
  `NOME_ID` VARCHAR(100) NOT NULL,
  `EMAIL_ID` VARCHAR(100) NOT NULL,
  `CARGO_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`CPF_ID`),
  UNIQUE INDEX `CPF_ID_UNIQUE` (`CPF_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROJECTO`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROJECTO`.`Livro` (
  `ISBN_ID` INT NOT NULL,
  `NOME_ID` VARCHAR(43) NOT NULL,
  `AUTOR_ID` VARCHAR(43) NOT NULL,
  `PAGINAS_ID` INT NOT NULL,
  PRIMARY KEY (`ISBN_ID`),
  UNIQUE INDEX `ISBN_ID_UNIQUE` (`ISBN_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROJECTO`.`Empréstimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROJECTO`.`Empréstimo` (
  `ID_ID` INT NOT NULL,
  `DATAEMPRESTIMO_ID` DATE NOT NULL,
  `DATADEVOLUÇÃO_ID` VARCHAR(43) NOT NULL,
  `LIVROISBN_ID` INT NOT NULL,
  `COLABCPF_ID` INT NOT NULL,
  `ALUNORA_ID` INT NOT NULL,
  PRIMARY KEY (`ID_ID`),
  UNIQUE INDEX `ID_ID_UNIQUE` (`ID_ID` ASC) VISIBLE,
  INDEX `ID_IDCPF_idx` (`COLABCPF_ID` ASC) VISIBLE,
  INDEX `FK_ID_ID_ISBN_ID_idx` (`LIVROISBN_ID` ASC, `ALUNORA_ID` ASC) VISIBLE,
  CONSTRAINT `FK_ID_ID_ISBN_ID`
    FOREIGN KEY (`LIVROISBN_ID` , `ALUNORA_ID`)
    REFERENCES `PROJECTO`.`Livro` (`ISBN_ID` , `ISBN_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_IDCPF`
    FOREIGN KEY (`COLABCPF_ID`)
    REFERENCES `PROJECTO`.`Colaborador` (`CPF_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROJECTO`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROJECTO`.`Aluno` (
  `RA_ID` INT NOT NULL,
  `NOME_ID` VARCHAR(100) NOT NULL,
  `EMAIL_ID` VARCHAR(100) NOT NULL,
  `TELEFONE_ID` VARCHAR(45) NOT NULL,
  `EMPRESTIMO_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RA_ID`),
  UNIQUE INDEX `RA_ID_UNIQUE` (`RA_ID` ASC) VISIBLE,
  CONSTRAINT `ALUNORA`
    FOREIGN KEY (`RA_ID`)
    REFERENCES `PROJECTO`.`Empréstimo` (`ALUNORA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
