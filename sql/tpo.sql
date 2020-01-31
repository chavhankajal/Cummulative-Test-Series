/*
MySQL Data Transfer
Source Host: localhost
Source Database: tpo
Target Host: localhost
Target Database: tpo
Date: 12-12-2018 13:50:48
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin_registration
-- ----------------------------
DROP TABLE IF EXISTS `admin_registration`;
CREATE TABLE `admin_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for admin_table
-- ----------------------------
DROP TABLE IF EXISTS `admin_table`;
CREATE TABLE `admin_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for alumini_details
-- ----------------------------
DROP TABLE IF EXISTS `alumini_details`;
CREATE TABLE `alumini_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(255) DEFAULT NULL,
  `company_org` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `hr_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `salary_package` double DEFAULT NULL,
  `offer_letter_path` varchar(255) DEFAULT NULL,
  `passout_year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for alumini_registration
-- ----------------------------
DROP TABLE IF EXISTS `alumini_registration`;
CREATE TABLE `alumini_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for document_table
-- ----------------------------
DROP TABLE IF EXISTS `document_table`;
CREATE TABLE `document_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `document_web_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for education_details
-- ----------------------------
DROP TABLE IF EXISTS `education_details`;
CREATE TABLE `education_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `qual` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `perc` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for faculty_registration
-- ----------------------------
DROP TABLE IF EXISTS `faculty_registration`;
CREATE TABLE `faculty_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for internship_details
-- ----------------------------
DROP TABLE IF EXISTS `internship_details`;
CREATE TABLE `internship_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `internship_name` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `test_subject` varchar(255) DEFAULT NULL,
  `marks` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for notes_table
-- ----------------------------
DROP TABLE IF EXISTS `notes_table`;
CREATE TABLE `notes_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes_name` varchar(255) DEFAULT NULL,
  `notes_path` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for options_table
-- ----------------------------
DROP TABLE IF EXISTS `options_table`;
CREATE TABLE `options_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quetion_id` bigint(11) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  `question_alphabets` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for question_table
-- ----------------------------
DROP TABLE IF EXISTS `question_table`;
CREATE TABLE `question_table` (
  `quetion_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `quetion` varchar(255) DEFAULT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`quetion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for resume_personal_details
-- ----------------------------
DROP TABLE IF EXISTS `resume_personal_details`;
CREATE TABLE `resume_personal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `objective` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `hobby` varchar(255) DEFAULT NULL,
  `languages` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for student_criteria
-- ----------------------------
DROP TABLE IF EXISTS `student_criteria`;
CREATE TABLE `student_criteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `test_subject` varchar(255) DEFAULT NULL,
  `marks` double DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for student_project_details
-- ----------------------------
DROP TABLE IF EXISTS `student_project_details`;
CREATE TABLE `student_project_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `project_lang` varchar(255) DEFAULT NULL,
  `project_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for student_registration
-- ----------------------------
DROP TABLE IF EXISTS `student_registration`;
CREATE TABLE `student_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resume_path` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for subject_details
-- ----------------------------
DROP TABLE IF EXISTS `subject_details`;
CREATE TABLE `subject_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tpo_registration
-- ----------------------------
DROP TABLE IF EXISTS `tpo_registration`;
CREATE TABLE `tpo_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin_registration` VALUES ('1', 'admin', 'admin', 'admin@gmail.com', 'Admin@123');
INSERT INTO `admin_registration` VALUES ('2', 'admin', 'chaitanya', 'chat@gmail.com', 'Chat@123');
INSERT INTO `admin_registration` VALUES ('3', 'admin', 'xyz', 'xyz@gmail.com', 'Xyz@1234');
INSERT INTO `admin_table` VALUES ('1', 'admin@gmail.com', 'Admin@123');
INSERT INTO `alumini_details` VALUES ('1', null, '2.6', '2.6', '2.6', '2.6', '2.6', null, null);
INSERT INTO `alumini_details` VALUES ('2', null, null, null, null, null, null, null, null);
INSERT INTO `alumini_details` VALUES ('3', null, null, null, null, null, null, null, null);
INSERT INTO `alumini_details` VALUES ('4', null, null, null, null, null, null, null, null);
INSERT INTO `alumini_details` VALUES ('5', null, null, null, null, null, null, null, null);
INSERT INTO `alumini_details` VALUES ('6', null, null, null, null, null, null, null, null);
INSERT INTO `alumini_details` VALUES ('7', null, null, null, null, null, null, null, null);
INSERT INTO `alumini_details` VALUES ('8', null, 'abc', null, null, null, null, null, null);
INSERT INTO `alumini_details` VALUES ('9', null, 'abc', 'java', null, null, null, null, null);
INSERT INTO `alumini_details` VALUES ('10', null, 'abc', 'java', 'nikhil', null, null, null, null);
INSERT INTO `alumini_details` VALUES ('11', null, 'abc', 'java', 'nikhil', 'nikhil@gmail.com', null, null, null);
INSERT INTO `alumini_details` VALUES ('12', null, 'abc', 'java', 'nikhil', 'nikhil@gmail.com', '3.4', null, null);
INSERT INTO `alumini_details` VALUES ('13', null, 'abc', null, null, null, null, null, null);
INSERT INTO `alumini_details` VALUES ('14', null, 'abc', 'developer', null, null, null, null, null);
INSERT INTO `alumini_details` VALUES ('15', null, 'abc', 'developer', 'neha', null, null, null, null);
INSERT INTO `alumini_details` VALUES ('16', null, 'abc', 'developer', 'neha', 'neha@gmail.com', null, null, null);
INSERT INTO `alumini_details` VALUES ('17', null, 'abc', 'developer', 'neha', 'neha@gmail.com', '3.2', null, null);
INSERT INTO `alumini_details` VALUES ('18', null, 'abc', 'developer', 'neha', 'neha@gmail.com', '3.2', 'C:\\pdf\\\\Capture.PNG', null);
INSERT INTO `alumini_details` VALUES ('19', null, 'abc', 'kjkj', 'jkjk', 'hjhj', '1.5', 'C:\\pdf\\\\Capture.PNG', null);
INSERT INTO `alumini_details` VALUES ('20', null, 'klcldk', 'jkfdk', ',lldfldkldk', ';l;dlf;dlf', '4.5', 'C:\\pdf\\\\chatting document.docx', null);
INSERT INTO `alumini_details` VALUES ('21', 'asas', 'dsds', 'dsds', 'dsds', 'mlklk', '5.7', 'C:\\pdf\\\\chatting document.docx', '2018');
INSERT INTO `alumini_details` VALUES ('22', null, null, null, null, null, null, 'C:\\pdf\\\\Deduplication screenshot.docx', null);
INSERT INTO `alumini_details` VALUES ('23', null, null, null, null, null, null, 'C:\\pdf\\\\Deduplication screenshot.docx', null);
INSERT INTO `alumini_details` VALUES ('24', null, null, null, null, null, null, 'C:\\pdf\\\\Deduplication screenshot.docx', null);
INSERT INTO `alumini_details` VALUES ('25', null, null, null, null, null, null, 'C:\\pdf\\\\AdminSerlvet.txt', null);
INSERT INTO `alumini_details` VALUES ('26', null, null, null, null, null, null, 'C:\\pdf\\\\AdminSerlvet.txt', null);
INSERT INTO `alumini_details` VALUES ('27', 'nkjk', 'jkjk', 'kkj', 'njhjh', 'jkjk', '1.8', 'C:\\pdf\\\\download.jpg', '2018');
INSERT INTO `alumini_registration` VALUES ('1', 'alumini', 'abcd', 'abcd@gmail.com', 'Abcd@123');
INSERT INTO `alumini_registration` VALUES ('2', 'alumini', 'Neha', 'neha@gmail.com', 'neha@123');
INSERT INTO `alumini_registration` VALUES ('3', 'alumini', 'Pooja', 'pooja@gmail.com', 'Pooja@123');
INSERT INTO `document_table` VALUES ('1', '1', 'ssc', 'C:\\pdf\\\\ssc.png', null);
INSERT INTO `document_table` VALUES ('2', '1', 'hsc', 'C:\\pdf\\\\hsc.jpg', null);
INSERT INTO `document_table` VALUES ('3', '1', 'certification', 'C:\\pdf\\\\certification.PNG', null);
INSERT INTO `document_table` VALUES ('4', '1', 'certification', 'C:\\pdf\\\\certification.txt', 'C:\\trainingandplacement\\TrainingandPlacement\\WebContent\\documents\\certification.txt');
INSERT INTO `document_table` VALUES ('5', '1', 'mmmm', 'C:\\pdf\\\\mmmm.txt', 'C:\\trainingandplacement\\TrainingandPlacement\\WebContent\\documents\\mmmm.txt');
INSERT INTO `education_details` VALUES ('1', '1', '1', 'X', '2017', 'mum', '88');
INSERT INTO `faculty_registration` VALUES ('1', 'faculty', 'Neha', 'neha@gmail.com', 'Neha@123');
INSERT INTO `internship_details` VALUES ('1', 'JAVA Intership', 'B.E', '65', 'java', '65');
INSERT INTO `internship_details` VALUES ('2', 'Android Internship', 'B.E', '60', 'android', '60');
INSERT INTO `internship_details` VALUES ('3', 'Android', 'B.E', '60', 'android', '60');
INSERT INTO `internship_details` VALUES ('4', 'JAVA Internship', 'B.E', '60', 'java', '60');
INSERT INTO `notes_table` VALUES ('1', 'Adnan Sami Maahiya song___SHASHI.mp4', 'C:\\notes\\\\Adnan Sami Maahiya song___SHASHI.mp4', 'video');
INSERT INTO `notes_table` VALUES ('2', 'OpTransactionHistory01-08-2018 (1).pdf', 'C:\\notes\\\\OpTransactionHistory01-08-2018 (1).pdf', 'pdf');
INSERT INTO `notes_table` VALUES ('3', '2mrw doc.txt', 'C:\\notes\\\\2mrw doc.txt', 'document');
INSERT INTO `options_table` VALUES ('1', '1', 'Programming Language', '1');
INSERT INTO `options_table` VALUES ('2', '1', 'markup language', '2');
INSERT INTO `options_table` VALUES ('3', '1', 'library', '3');
INSERT INTO `options_table` VALUES ('4', '1', 'class', '4');
INSERT INTO `options_table` VALUES ('5', '2', 'mnop', '1');
INSERT INTO `options_table` VALUES ('6', '2', 'abcd', '2');
INSERT INTO `options_table` VALUES ('7', '2', 'analysis and manipulation of signals', '3');
INSERT INTO `options_table` VALUES ('8', '2', 'jklm', '4');
INSERT INTO `question_table` VALUES ('1', 'computer', 'Java', 'What is Java', '1');
INSERT INTO `question_table` VALUES ('2', 'electronic', 'Signal processing ', 'Types of Signal processing ', '3');
INSERT INTO `resume_personal_details` VALUES ('1', '1', 'Pooja', 'pooja@gmail.com', '9664062963', 'nerul', 'lkkkk', 'female', '1994-07-03', 's', 'k', 'k', 'mum');
INSERT INTO `student_criteria` VALUES ('4', 'snehal', 'B.E', '66', 'java', '80', 'snehalkeni20@gmail.com');
INSERT INTO `student_criteria` VALUES ('7', 'Ajay', 'B.E', '85', 'php', '75', 'aj.kumar.hitm@gmail.com');
INSERT INTO `student_criteria` VALUES ('17', 'kishor', 'B.E', '75', 'java', '85', 'kishorpawar093@gmail.com');
INSERT INTO `student_criteria` VALUES ('18', 'pooja', 'B.E', '65', 'java', '70', 'manjal3636@gmail.com');
INSERT INTO `student_project_details` VALUES ('1', '1', '1', '44444444444', '44444444444444444', '44444444444444444');
INSERT INTO `student_registration` VALUES ('1', 'pooja', 'pooja@gmail.com', 'Pooja@123', 'c:\\pdf\\Pooja', 'student');
INSERT INTO `subject_details` VALUES ('5', 'xyz', 'lskls');
INSERT INTO `subject_details` VALUES ('6', 'JAVA Internship', 'Starting date: 1 dec 2018\nTiming: 11.00 A.M\nLocation: Airoli, Navi Mumbai');
INSERT INTO `subject_details` VALUES ('7', 'JAVA Internship', 'Starting Date : 1 dec 2018\nTiming : 11.00 A.M\nLocation :   Airoli, Navi Mumbai');
INSERT INTO `tpo_registration` VALUES ('1', 'tpo', 'Ruchita', 'ruchi@gmail.com', 'Ruchi@123');
