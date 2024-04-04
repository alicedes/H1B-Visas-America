-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hlb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hlb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hlb` DEFAULT CHARACTER SET utf8mb4 ;
USE `hlb` ;

-- -----------------------------------------------------
-- Table `hlb`.`lawyer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hlb`.`lawyer` (
  `lawfirm_id` INT NOT NULL,
  `firmname` VARCHAR(45) NOT NULL,
  `firmstate` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`lawfirm_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hlb`.`naics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hlb`.`naics` (
  `naics_code` INT NOT NULL,
  `industry` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`naics_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hlb`.`soc_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hlb`.`soc_code` (
  `soc_id` INT NOT NULL,
  `soc_code` VARCHAR(45) NOT NULL,
  `soc_title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`soc_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hlb`.`worksite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hlb`.`worksite` (
  `worksite_id` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`worksite_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hlb`.`visa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hlb`.`visa` (
  `visa_id` INT NOT NULL,
  `received_date` DATE NOT NULL,
  `decision_date` DATE NOT NULL,
  `willful_violation` VARCHAR(3) NOT NULL,
  `continued_employment` INT NOT NULL,
  `worksite_worksite_id` INT NOT NULL,
  `soc_code_soc_id` INT NOT NULL,
  `lawyer_lawfirm_id` INT NOT NULL,
  `naics_naics_code` INT NOT NULL,
  PRIMARY KEY (`visa_id`, `worksite_worksite_id`, `soc_code_soc_id`, `lawyer_lawfirm_id`, `naics_naics_code`),
  INDEX `fk_visa_worksite1_idx` (`worksite_worksite_id` ASC) VISIBLE,
  INDEX `fk_visa_soc_code1_idx` (`soc_code_soc_id` ASC) VISIBLE,
  INDEX `fk_visa_lawyer1_idx` (`lawyer_lawfirm_id` ASC) VISIBLE,
  INDEX `fk_visa_naics1_idx` (`naics_naics_code` ASC) VISIBLE,
  CONSTRAINT `fk_visa_worksite1`
    FOREIGN KEY (`worksite_worksite_id`)
    REFERENCES `hlb`.`worksite` (`worksite_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visa_soc_code1`
    FOREIGN KEY (`soc_code_soc_id`)
    REFERENCES `hlb`.`soc_code` (`soc_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visa_lawyer1`
    FOREIGN KEY (`lawyer_lawfirm_id`)
    REFERENCES `hlb`.`lawyer` (`lawfirm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visa_naics1`
    FOREIGN KEY (`naics_naics_code`)
    REFERENCES `hlb`.`naics` (`naics_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
