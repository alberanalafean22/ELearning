-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema E-Learning Data Science
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema E-Learning Data Science
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `E-Learning Data Science` DEFAULT CHARACTER SET utf8 ;
USE `E-Learning Data Science` ;

-- -----------------------------------------------------
-- Table `E-Learning Data Science`.`Class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-Learning Data Science`.`Class` (
  `Math for Data Science` INT NULL,
  `Statistic I` VARCHAR(45) NULL,
  `Statistic II` VARCHAR(45) NULL,
  `Statistic  III` VARCHAR(45) NULL,
  `Statistic IV` VARCHAR(45) NULL,
  `Analysis Data I` VARCHAR(45) NULL,
  `Analysis Data II` VARCHAR(45) NULL,
  `Algorithm` VARCHAR(45) NULL,
  `Computational Thinking` VARCHAR(45) NULL,
  PRIMARY KEY (`Math for Data Science`),
  UNIQUE INDEX `Statistic I_UNIQUE` (`Statistic I` ASC) VISIBLE,
  UNIQUE INDEX `Statistic II_UNIQUE` (`Statistic II` ASC) VISIBLE,
  UNIQUE INDEX `Statistic  III_UNIQUE` (`Statistic  III` ASC) VISIBLE,
  UNIQUE INDEX `Statistic IV_UNIQUE` (`Statistic IV` ASC) VISIBLE,
  UNIQUE INDEX `Analysis Data I_UNIQUE` (`Analysis Data I` ASC) VISIBLE,
  UNIQUE INDEX `Analysis Data II_UNIQUE` (`Analysis Data II` ASC) VISIBLE,
  UNIQUE INDEX `Algorithm_UNIQUE` (`Algorithm` ASC) VISIBLE,
  UNIQUE INDEX `Computational Thinking_UNIQUE` (`Computational Thinking` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-Learning Data Science`.`Class Practical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-Learning Data Science`.`Class Practical` (
  `Programming Python` INT NOT NULL,
  `Programming R` INT NULL,
  `MySql` INT NULL,
  `Ms.Excel` INT NULL,
  `Cloud Computing` INT NULL,
  `Machine Learning` INT NULL,
  PRIMARY KEY (`Programming Python`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-Learning Data Science`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-Learning Data Science`.`Course` (
  `Virtual Class` INT NULL,
  `Streaming Class` INT NULL,
  `Summary Class` INT NULL,
  `Resume Class Practical` INT NULL,
  `Class_Math for Data Science` INT NOT NULL,
  `Class Practical_Programming Python` INT NOT NULL,
  PRIMARY KEY (`Virtual Class`, `Streaming Class`, `Summary Class`, `Resume Class Practical`, `Class_Math for Data Science`, `Class Practical_Programming Python`),
  INDEX `fk_Course_Class1_idx` (`Class_Math for Data Science` ASC) VISIBLE,
  INDEX `fk_Course_Class Practical1_idx` (`Class Practical_Programming Python` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Class1`
    FOREIGN KEY (`Class_Math for Data Science`)
    REFERENCES `E-Learning Data Science`.`Class` (`Math for Data Science`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_Class Practical1`
    FOREIGN KEY (`Class Practical_Programming Python`)
    REFERENCES `E-Learning Data Science`.`Class Practical` (`Programming Python`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-Learning Data Science`.`Chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-Learning Data Science`.`Chat` (
  `Private Chat` VARCHAR(100) NOT NULL,
  `Discussion Chat` VARCHAR(100) NULL,
  `Virtual Assistant` VARCHAR(100) NULL,
  PRIMARY KEY (`Private Chat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-Learning Data Science`.`Simulation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-Learning Data Science`.`Simulation` (
  `Exercise` INT NOT NULL,
  `Quiz` VARCHAR(45) NULL,
  `Exam` VARCHAR(45) NULL,
  PRIMARY KEY (`Exercise`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-Learning Data Science`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-Learning Data Science`.`Menu` (
  `Course` INT NULL,
  `Chat` VARCHAR(45) NULL,
  `Simulation` VARCHAR(45) NULL,
  `Course_Virtual Class` INT NOT NULL,
  `Course_Streaming Class` INT NOT NULL,
  `Course_Summary Class` INT NOT NULL,
  `Course_Resume Class Practical` INT NOT NULL,
  `Chat_Private Chat` VARCHAR(100) NOT NULL,
  `Simulation_Exercise` INT NOT NULL,
  PRIMARY KEY (`Course`, `Course_Virtual Class`, `Course_Streaming Class`, `Course_Summary Class`, `Course_Resume Class Practical`, `Chat_Private Chat`, `Simulation_Exercise`),
  INDEX `fk_Menu_Course1_idx` (`Course_Virtual Class` ASC, `Course_Streaming Class` ASC, `Course_Summary Class` ASC, `Course_Resume Class Practical` ASC) VISIBLE,
  INDEX `fk_Menu_Chat1_idx` (`Chat_Private Chat` ASC) VISIBLE,
  INDEX `fk_Menu_Simulation1_idx` (`Simulation_Exercise` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_Course1`
    FOREIGN KEY (`Course_Virtual Class` , `Course_Streaming Class` , `Course_Summary Class` , `Course_Resume Class Practical`)
    REFERENCES `E-Learning Data Science`.`Course` (`Virtual Class` , `Streaming Class` , `Summary Class` , `Resume Class Practical`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menu_Chat1`
    FOREIGN KEY (`Chat_Private Chat`)
    REFERENCES `E-Learning Data Science`.`Chat` (`Private Chat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menu_Simulation1`
    FOREIGN KEY (`Simulation_Exercise`)
    REFERENCES `E-Learning Data Science`.`Simulation` (`Exercise`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-Learning Data Science`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-Learning Data Science`.`Account` (
  `Profile` INT NULL,
  `Settings` INT NOT NULL,
  `Menu_Course` INT NOT NULL,
  PRIMARY KEY (`Profile`, `Settings`, `Menu_Course`),
  INDEX `fk_Akun_Menu1_idx` (`Menu_Course` ASC) VISIBLE,
  CONSTRAINT `fk_Akun_Menu1`
    FOREIGN KEY (`Menu_Course`)
    REFERENCES `E-Learning Data Science`.`Menu` (`Course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-Learning Data Science`.`Colleger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-Learning Data Science`.`Colleger` (
  `Nama` INT NULL,
  `Email` INT NULL,
  `Akun_Profil` INT NOT NULL,
  `Akun_Pengaturan` INT NOT NULL,
  PRIMARY KEY (`Nama`, `Email`, `Akun_Profil`, `Akun_Pengaturan`),
  INDEX `fk_Mahasiswa_Akun_idx` (`Akun_Profil` ASC, `Akun_Pengaturan` ASC) VISIBLE,
  CONSTRAINT `fk_Mahasiswa_Akun`
    FOREIGN KEY (`Akun_Profil` , `Akun_Pengaturan`)
    REFERENCES `E-Learning Data Science`.`Account` (`Profile` , `Settings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-Learning Data Science`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-Learning Data Science`.`Student` (
  `Nama` INT NULL,
  `Email` INT NULL,
  `Akun_Profil` INT NOT NULL,
  `Akun_Pengaturan` INT NOT NULL,
  PRIMARY KEY (`Nama`, `Email`, `Akun_Profil`, `Akun_Pengaturan`),
  INDEX `fk_Pelajar_Akun1_idx` (`Akun_Profil` ASC, `Akun_Pengaturan` ASC) VISIBLE,
  CONSTRAINT `fk_Pelajar_Akun1`
    FOREIGN KEY (`Akun_Profil` , `Akun_Pengaturan`)
    REFERENCES `E-Learning Data Science`.`Account` (`Profile` , `Settings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-Learning Data Science`.`Public`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-Learning Data Science`.`Public` (
  `Nama` INT NULL,
  `Email` INT NULL,
  `Akun_Profil` INT NOT NULL,
  `Akun_Pengaturan` INT NOT NULL,
  PRIMARY KEY (`Nama`, `Email`, `Akun_Profil`, `Akun_Pengaturan`),
  INDEX `fk_Umum_Akun1_idx` (`Akun_Profil` ASC, `Akun_Pengaturan` ASC) VISIBLE,
  CONSTRAINT `fk_Umum_Akun1`
    FOREIGN KEY (`Akun_Profil` , `Akun_Pengaturan`)
    REFERENCES `E-Learning Data Science`.`Account` (`Profile` , `Settings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-Learning Data Science`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-Learning Data Science`.`table1` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
