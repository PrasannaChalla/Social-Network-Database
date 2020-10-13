
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Bio` VARCHAR(500) NULL,
  `Age` INT NULL,
  `Mobile` VARCHAR(45) NULL,
   `AgeStatus` VARCHAR(45) NULL,
  `Created_at` DATETIME NULL,
  `Updated_at` DATETIME NULL,
  `DOB` DATETIME NULL,
  PRIMARY KEY (`User_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Account` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Account` (
  `Account_ID` int NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Status` TINYINT NOT NULL,
  `User_User_ID` INT NOT NULL,
  PRIMARY KEY (`Account_ID`),
  INDEX `fk_Account_User_idx` (`User_User_ID` ASC),
  CONSTRAINT `fk_Account_User`
    FOREIGN KEY (`User_User_ID`)
    REFERENCES `mydb`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Post` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Post` (
  `Post_ID` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  `Created_at` DATETIME NOT NULL DEFAULT NOW(),
  `Updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  `User_User_ID` INT NOT NULL,
  PRIMARY KEY (`Post_ID`),
  INDEX `fk_Post_User1_idx` (`User_User_ID` ASC),
  CONSTRAINT `fk_Post_User1`
    FOREIGN KEY (`User_User_ID`)
    REFERENCES `mydb`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hashtag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Hashtag` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Hashtag` (
  `Hashtag_ID` INT NOT NULL AUTO_INCREMENT,
  `Hashtag` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Hashtag_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Like`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Like` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Like` (
  `User_User_ID` INT NOT NULL,
  `Post_Post_ID` INT NOT NULL,
  PRIMARY KEY (`User_User_ID`, `Post_Post_ID`),
  INDEX `fk_Like_Post1_idx` (`Post_Post_ID` ASC),
  CONSTRAINT `fk_Like_User1`
    FOREIGN KEY (`User_User_ID`)
    REFERENCES `mydb`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Like_Post1`
    FOREIGN KEY (`Post_Post_ID`)
    REFERENCES `mydb`.`Post` (`Post_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tag` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tag` (
  `User_User_ID` INT NOT NULL,
  `Post_Post_ID` INT NOT NULL,
  PRIMARY KEY (`User_User_ID`, `Post_Post_ID`),
  INDEX `fk_Comment_Post1_idx` (`Post_Post_ID` ASC),
  CONSTRAINT `fk_Comment_User1`
    FOREIGN KEY (`User_User_ID`)
    REFERENCES `mydb`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_Post1`
    FOREIGN KEY (`Post_Post_ID`)
    REFERENCES `mydb`.`Post` (`Post_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Page` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Page` (
  `Page_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  `Post_Post_ID` INT NOT NULL,
  PRIMARY KEY (`Page_ID`),
  INDEX `fk_Page_Post1_idx` (`Post_Post_ID` ASC),
  CONSTRAINT `fk_Page_Post1`
    FOREIGN KEY (`Post_Post_ID`)
    REFERENCES `mydb`.`Post` (`Post_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Account_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Account_page` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Account_page` (
  `Account_Account_ID` INT NOT NULL,
  `Page_Page_ID` INT NOT NULL,
  PRIMARY KEY (`Account_Account_ID`, `Page_Page_ID`),
  INDEX `fk_Account_page_Page1_idx` (`Page_Page_ID` ASC),
  CONSTRAINT `fk_Account_page_Account1`
    FOREIGN KEY (`Account_Account_ID`)
    REFERENCES `mydb`.`Account` (`Account_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_page_Page1`
    FOREIGN KEY (`Page_Page_ID`)
    REFERENCES `mydb`.`Page` (`Page_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Post_hashtag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Post_hashtag` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Post_hashtag` (
  `Post_Post_ID` INT NOT NULL,
  `Hashtag_Hashtag_ID` INT NOT NULL,
  PRIMARY KEY (`Post_Post_ID`, `Hashtag_Hashtag_ID`),
  INDEX `fk_Post_hashtag_Hashtag1_idx` (`Hashtag_Hashtag_ID` ASC),
  CONSTRAINT `fk_Post_hashtag_Post1`
    FOREIGN KEY (`Post_Post_ID`)
    REFERENCES `mydb`.`Post` (`Post_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Post_hashtag_Hashtag1`
    FOREIGN KEY (`Hashtag_Hashtag_ID`)
    REFERENCES `mydb`.`Hashtag` (`Hashtag_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Comment` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Comment` (
  `Comment_ID` INT NOT NULL AUTO_INCREMENT,
  `Comment` VARCHAR(45) NULL,
  `User_User_ID` INT NOT NULL,
  `Post_Post_ID` INT NOT NULL,
  PRIMARY KEY (`Comment_ID`),
  INDEX `fk_Comment_User2_idx` (`User_User_ID` ASC),
  INDEX `fk_Comment_Post2_idx` (`Post_Post_ID` ASC),
  CONSTRAINT `fk_Comment_User2`
    FOREIGN KEY (`User_User_ID`)
    REFERENCES `mydb`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_Post2`
    FOREIGN KEY (`Post_Post_ID`)
    REFERENCES `mydb`.`Post` (`Post_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Group` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Group` (
  `Group_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  `Created_at` DATETIME NULL,
  `Updated_at` DATETIME NULL,
  PRIMARY KEY (`Group_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Group_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Group_user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Group_user` (
  `Group_Group_ID` INT NOT NULL,
  `User_User_ID` INT NOT NULL,
  PRIMARY KEY (`Group_Group_ID`, `User_User_ID`),
  INDEX `fk_Group_user_User1_idx` (`User_User_ID` ASC),
  CONSTRAINT `fk_Group_user_Group1`
    FOREIGN KEY (`Group_Group_ID`)
    REFERENCES `mydb`.`Group` (`Group_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_user_User1`
    FOREIGN KEY (`User_User_ID`)
    REFERENCES `mydb`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Group_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Group_post` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Group_post` (
  `User_User_ID` INT NOT NULL,
  `Post_Post_ID` INT NOT NULL,
  PRIMARY KEY (`User_User_ID`, `Post_Post_ID`),
  INDEX `fk_Group_post_Post1_idx` (`Post_Post_ID` ASC),
  CONSTRAINT `fk_Group_post_User1`
    FOREIGN KEY (`User_User_ID`)
    REFERENCES `mydb`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_post_Post1`
    FOREIGN KEY (`Post_Post_ID`)
    REFERENCES `mydb`.`Post` (`Post_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Follow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Follow` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Follow` (
  `Follower_User_ID` INT NOT NULL,
  `Followind_User_ID` INT NOT NULL,
  PRIMARY KEY (`Follower_User_ID`, `Followind_User_ID`),
  INDEX `fk_Follow_User2_idx` (`Followind_User_ID` ASC),
  CONSTRAINT `fk_Follow_User1`
    FOREIGN KEY (`Follower_User_ID`)
    REFERENCES `mydb`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Follow_User2`
    FOREIGN KEY (`Followind_User_ID`)
    REFERENCES `mydb`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Message` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Message` (
  `Message_ID` INT NOT NULL AUTO_INCREMENT,
  `Text` VARCHAR(45) NULL,
  `User_User_ID` INT NOT NULL,
  `Sender_User_ID` INT NOT NULL,
  PRIMARY KEY (`Message_ID`),
  INDEX `fk_Message_User1_idx` (`User_User_ID` ASC),
  INDEX `fk_Message_User2_idx` (`Sender_User_ID` ASC),
  CONSTRAINT `fk_Message_User1`
    FOREIGN KEY (`User_User_ID`)
    REFERENCES `mydb`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Message_User2`
    FOREIGN KEY (`Sender_User_ID`)
    REFERENCES `mydb`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`Notification` ;

CREATE TABLE `mydb`.`Notification` (
  `idNotification` INT NOT NULL AUTO_INCREMENT,
  `Text` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `From_user_Id` INT NULL,
  `To_User_ID` INT NULL,
  PRIMARY KEY (`idNotification`));

ALTER TABLE `mydb`.`Notification` 
ADD INDEX `From_user_Id_idx` (`From_user_Id` ASC) VISIBLE,
ADD INDEX `To_User_ID_idx` (`To_User_ID` ASC) VISIBLE;
;
ALTER TABLE `mydb`.`Notification` 
ADD CONSTRAINT `From_user_Id`
  FOREIGN KEY (`From_user_Id`)
  REFERENCES `mydb`.`User` (`User_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `To_User_ID`
  FOREIGN KEY (`To_User_ID`)
  REFERENCES `mydb`.`User` (`User_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



