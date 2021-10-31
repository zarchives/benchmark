-- Dumping database structure for demoapp
CREATE DATABASE IF NOT EXISTS `demo_app` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `demo_app`;
 
-- Dumping structure for table myapp.student
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `student_code` varchar(10) NOT NULL,
  `student_class` varchar(10) DEFAULT NULL,
  `last_attended_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_student_code` (`student_code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
 
-- Dumping data for table myapp.student: ~33 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`, `student_name`, `dob`, `student_code`, `student_class`, `last_attended_on`) VALUES
    (1, 'JOHN', '2010-01-02', 'SD9000', '5', '2021-02-06 10:25:05'),
    (2, 'JOHN', '2010-01-02', 'SD9001', '5', '2021-02-06 10:25:07'),
    (3, 'ROSE', '2012-05-02', 'DC9001', '3', '2021-02-06 10:25:07'),
    (4, 'PETER', '2010-01-02', 'SD900', '5', NULL),
    (5, 'JOHN', '2010-01-02', 'SD9010', '5', NULL),
    (6, 'JOHN', '2010-01-02', 'SD9002', '5', NULL),
    (7, 'KONE PETER', '2010-01-02', 'SD9003', '5', NULL),
    (8, 'JOHN', '2010-01-02', 'SD9004', '5', NULL),
    (9, 'JOHN', '2010-01-02', 'SD9005', '5', NULL),
    (10, 'JOHN', '2010-01-02', 'SD9006', '5', NULL),
    (11, 'JOHN', '2010-01-02', 'SD9007', '5', NULL),
    (12, 'JOHN PAUL', '2010-01-02', 'SD90012', '5', NULL),
    (13, 'JOHN SNOW', '2010-01-02', 'SD90002', '5', NULL),
    (14, 'ALYSSA', '2010-01-02', 'SD90003', '5', NULL),
    (15, 'JOHN SNOW', '2010-01-02', 'SD90004', '5', NULL),
    (16, 'PETER', '2010-01-02', 'SD90006', '5', NULL),
    (17, 'MONTI', '2001-01-01', 'SD2001', '4', NULL),
    (18, 'MONTI', '2011-01-01', 'SD200', '4', NULL),
    (19, 'MONTI', '2010-01-02', 'SD2000', '4', NULL),
    (20, 'PETERSON', '2010-01-01', 'SD1234', '5', NULL),
    (21, 'MONTI', '2010-01-02', 'SD900056', '4', NULL),
    (22, 'MONTI', '2010-01-02', 'SD000', '5', '2021-02-06 10:25:05'),
    (23, 'MONTI', '2010-01-02', 'SD5000', '5', '2021-02-06 10:25:05'),
    (24, 'JACKSON', '2012-07-07', 'SD2345', '4', NULL),
    (25, 'KEVIN', '2011-09-09', 'SD3456', '4', NULL),
    (26, 'KATE', '2014-08-08', 'SD5432', '7', NULL),
    (27, 'KELVIN', '2015-01-01', 'SD678', '6', NULL),
    (28, 'TEST', '2011-09-09', 'SD1999', '8', NULL),
    (29, 'JOY', '2008-01-02', 'SD6000', '8', NULL),
    (30, 'DAN', '2010-02-10', 'SD60001', '6', NULL),
    (31, 'Test student', '2000-09-09', 'sn0001', '5', NULL),
    (32, 'ADD STD', '2010-07-05', 'SD2600', '6', NULL),
    (33, 'sksuper', '2021-06-06', '121212', 'english', NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table myapp.marks
CREATE TABLE IF NOT EXISTS `marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam` varchar(10) NOT NULL,
  `student_code` varchar(10) NOT NULL,
  `english` decimal(10,2) DEFAULT NULL,
  `maths` decimal(10,2) DEFAULT NULL,
  `science` decimal(10,2) DEFAULT NULL,
  `tamil` decimal(10,2) DEFAULT NULL,
  `history` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_exam_student_code` (`exam`,`student_code`),
  KEY `FK_marks_student_code` (`student_code`),
  CONSTRAINT `FK_marks_student_code` FOREIGN KEY (`student_code`) REFERENCES `student` (`student_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
 
-- Dumping data for table myapp.marks: ~7 rows (approximately)
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` (`id`, `exam`, `student_code`, `english`, `maths`, `science`, `tamil`, `history`) VALUES
    (1, 'EX01', 'SD9000', 90.00, 85.00, 90.00, NULL, NULL),
    (2, 'EX21', 'DC9001', 76.00, 90.00, 95.00, NULL, NULL),
    (3, 'EX03', 'SD9000', 90.00, 85.00, 90.00, 86.00, 75.00),
    (4, 'EX03', 'SD200', 90.00, 85.00, 90.00, 86.00, 75.00),
    (5, 'EX03', 'SD9010', 90.00, 85.00, 90.00, 86.00, 75.00),
    (6, 'EX01', 'SD60001', 65.00, 95.00, 89.00, 85.00, 90.00),
    (7, 'EX02', 'SD60001', 67.00, 97.00, 91.00, 87.00, 92.00);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
 
