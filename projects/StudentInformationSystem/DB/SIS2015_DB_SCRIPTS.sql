SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `sisdb2015` ;
CREATE SCHEMA IF NOT EXISTS `sisdb2015` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sisdb2015` ;

-- -----------------------------------------------------
-- Table `sisdb2015`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sisdb2015`.`user` ;

CREATE TABLE IF NOT EXISTS `sisdb2015`.`user` (
  `userid` INT NOT NULL,
  `uname` VARCHAR(45) NOT NULL,
  `upwd` VARCHAR(45) NOT NULL,
  `lastloggedin` DATETIME NULL,
  `isactive` TINYINT(1) NOT NULL,
  `utype` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sisdb2015`.`sem_master`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sisdb2015`.`sem_master` ;

CREATE TABLE IF NOT EXISTS `sisdb2015`.`sem_master` (
  `semid` INT NOT NULL,
  `semname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`semid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sisdb2015`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sisdb2015`.`student` ;

CREATE TABLE IF NOT EXISTS `sisdb2015`.`student` (
  `sid` INT NOT NULL,
  `sname` VARCHAR(45) NOT NULL,
  `dob` DATE NULL,
  `email` VARCHAR(25) NULL,
  `phno` VARCHAR(15) NULL,
  `lastdegree` VARCHAR(20) NULL,
  `rollno` VARCHAR(20) NULL,
  `image` BLOB NULL,
  `currentsem` INT(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`sid`),
  INDEX `fk_student_sem_idx` (`currentsem` ASC),
  CONSTRAINT `sid`
    FOREIGN KEY (`sid`)
    REFERENCES `sisdb2015`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_sem`
    FOREIGN KEY (`currentsem`)
    REFERENCES `sisdb2015`.`sem_master` (`semid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sisdb2015`.`faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sisdb2015`.`faculty` ;

CREATE TABLE IF NOT EXISTS `sisdb2015`.`faculty` (
  `fid` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `doj` DATE NULL,
  `phno` VARCHAR(15) NULL,
  `email` VARCHAR(25) NULL,
  PRIMARY KEY (`fid`),
  CONSTRAINT `fid`
    FOREIGN KEY (`fid`)
    REFERENCES `sisdb2015`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sisdb2015`.`courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sisdb2015`.`courses` ;

CREATE TABLE IF NOT EXISTS `sisdb2015`.`courses` (
  `cid` INT NOT NULL,
  `cname` VARCHAR(45) NOT NULL,
  `credits` INT(11) NOT NULL,
  `csyllabus` LONGTEXT NOT NULL,
  `isactive` TINYINT(1) NOT NULL,
  PRIMARY KEY (`cid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sisdb2015`.`grade_master`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sisdb2015`.`grade_master` ;

CREATE TABLE IF NOT EXISTS `sisdb2015`.`grade_master` (
  `gid` INT NOT NULL,
  `grade_gname` VARCHAR(5) NOT NULL,
  `weightage` DECIMAL NOT NULL,
  `passorfail` CHAR NOT NULL,
  PRIMARY KEY (`gid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sisdb2015`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sisdb2015`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `sisdb2015`.`enrollment` (
  `cid` INT NOT NULL,
  `sid` INT NOT NULL,
  `gid` INT(11) NULL,
  `year` DATE NULL,
  `sem` INT(11) NOT NULL,
  PRIMARY KEY (`cid`, `sid`),
  INDEX `fk_courses_has_student_student1_idx` (`sid` ASC),
  INDEX `fk_enrollment_idx` (`gid` ASC),
  INDEX `fk_sem_idx` (`sem` ASC),
  CONSTRAINT `fk_courses_has_student_courses1`
    FOREIGN KEY (`cid`)
    REFERENCES `sisdb2015`.`courses` (`cid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_has_student_student1`
    FOREIGN KEY (`sid`)
    REFERENCES `sisdb2015`.`student` (`sid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment`
    FOREIGN KEY (`gid`)
    REFERENCES `sisdb2015`.`grade_master` (`gid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sem`
    FOREIGN KEY (`sem`)
    REFERENCES `sisdb2015`.`sem_master` (`semid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sisdb2015`.`teaches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sisdb2015`.`teaches` ;

CREATE TABLE IF NOT EXISTS `sisdb2015`.`teaches` (
  `fid` INT NOT NULL,
  `cid` INT NOT NULL,
  `semid` INT(11) NOT NULL,
  PRIMARY KEY (`fid`, `cid`),
  INDEX `fk_faculty_has_courses_courses1_idx` (`cid` ASC),
  INDEX `fk_faculty_has_courses_faculty1_idx` (`fid` ASC),
  INDEX `fk_teaches_sem_idx` (`semid` ASC),
  CONSTRAINT `fk_faculty_has_courses_faculty1`
    FOREIGN KEY (`fid`)
    REFERENCES `sisdb2015`.`faculty` (`fid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_faculty_has_courses_courses1`
    FOREIGN KEY (`cid`)
    REFERENCES `sisdb2015`.`courses` (`cid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teaches_sem`
    FOREIGN KEY (`semid`)
    REFERENCES `sisdb2015`.`sem_master` (`semid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sisdb2015`.`news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sisdb2015`.`news` ;

CREATE TABLE IF NOT EXISTS `sisdb2015`.`news` (
  `nid` INT NOT NULL,
  `ndetails` MEDIUMTEXT NOT NULL,
  `cid` INT(11) NULL,
  `fid` INT(11) NULL,
  `expirytime` DATETIME NULL,
  PRIMARY KEY (`nid`),
  INDEX `fk_news_1_idx` (`cid` ASC),
  INDEX `fk_news_2_idx` (`fid` ASC),
  CONSTRAINT `fk_news_1`
    FOREIGN KEY (`cid`)
    REFERENCES `sisdb2015`.`courses` (`cid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_news_2`
    FOREIGN KEY (`fid`)
    REFERENCES `sisdb2015`.`faculty` (`fid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sisdb2015`.`friends`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sisdb2015`.`friends` ;

CREATE TABLE IF NOT EXISTS `sisdb2015`.`friends` (
  `sid` INT NOT NULL,
  `sid1` INT NOT NULL,
  PRIMARY KEY (`sid`, `sid1`),
  INDEX `fk_student_has_student_student2_idx` (`sid1` ASC),
  INDEX `fk_student_has_student_student1_idx` (`sid` ASC),
  CONSTRAINT `fk_student_has_student_student1`
    FOREIGN KEY (`sid`)
    REFERENCES `sisdb2015`.`student` (`sid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_student_student2`
    FOREIGN KEY (`sid1`)
    REFERENCES `sisdb2015`.`student` (`sid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO user1;
 DROP USER user1;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'user1';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-------------------changes-----------------------------------------------------------------
ALTER TABLE `sisdb2015`.`user` 
ADD UNIQUE INDEX `uname_UNIQUE` (`uname` ASC);

ALTER TABLE `sisdb2015`.`user` 
CHANGE COLUMN `lastloggedin` `lastloggedin` DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01' ;

ALTER TABLE `sisdb2015`.`user` 
ADD COLUMN `userimage` LONGBLOB  NULL AFTER `utype`;

ALTER TABLE `sisdb2015`.`student` 
DROP COLUMN `image`;

ALTER TABLE `sisdb2015`.`news` 
CHANGE COLUMN `ndetails` `ndetails` LONGTEXT NOT NULL ,
CHANGE COLUMN `expirytime` `isactive` TINYINT NULL DEFAULT NULL ,
ADD COLUMN `ntitle` VARCHAR(100) NOT NULL AFTER `nid`;

ALTER TABLE `sisdb2015`.`courses` 
ADD COLUMN `ccode` VARCHAR(45) NOT NULL AFTER `cid`;

ALTER TABLE `sisdb2015`.`student` 
CHANGE COLUMN `rollno` `rollno` VARCHAR(20) NOT NULL ,
ADD UNIQUE INDEX `rollno_UNIQUE` (`rollno` ASC);

ALTER TABLE `sisdb2015`.`user` 
CHANGE COLUMN `userid` `userid` INT(11) NOT NULL AUTO_INCREMENT ;

INSERT INTO `sisdb2015`.`courses` (`cid`, `code`,`cname`, `credits`, `csyllabus`) VALUES ('1', 'News', 'General', '0', 'For News');
INSERT INTO `sisdb2015`.`faculty` (`fid`, `fname`, `doj`, `phno`) VALUES ('1', 'FAC_ADMIN', '', '123456789');
INSERT INTO `sisdb2015`.`news` (`nid`, `ntitle`, `ndetails`, `cid`, `fid`, `isactive`) VALUES ('1', 'SPIC_MACY', 'IIITB', '1', '1', '1');

INSERT INTO `sisdb2015`.`sem_master` (`semid`, `semname`) VALUES ('1', '1');
INSERT INTO `sisdb2015`.`sem_master` (`semid`, `semname`) VALUES ('2', '2');
INSERT INTO `sisdb2015`.`sem_master` (`semid`, `semname`) VALUES ('3', '3');
INSERT INTO `sisdb2015`.`sem_master` (`semid`, `semname`) VALUES ('4', '4');

INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('1', 'A', '4.0', 'P');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('2', 'A-', '3.7', 'P');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('3', 'B+', '3.4', 'P');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('4', 'B', '3.0', 'P');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('5', 'B-', '2.7', 'P');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('6', 'C+', '2.4', 'P');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('7', 'C', '2.0', 'F');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('8', 'C-', '1.7', 'F');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('9', 'D+', '1.4', 'F');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('10', 'D', '1.0', 'F');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('11', 'F+', '0.7', 'F');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('12', 'F', '0.4', 'F');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `grade_gname`, `weightage`, `passorfail`) VALUES ('13', 'F-', '0.0', 'F');
INSERT INTO `sisdb2015`.`grade_master` (`gid`, `gname`, `weightage`, `passorfail`) VALUES ('14', 'NA', '0.0', '-');