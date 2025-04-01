DROP
DATABASE IF EXISTS `techlms`;
CREATE
DATABASE `techlms`;
USE
`techlms`;

-- Drop the table if it exists
DROP TABLE IF EXISTS `user`;

-- Create the user table
-- Drop the table if it exists
DROP TABLE IF EXISTS user;

-- Create the user table
CREATE TABLE user
(
    user_id    INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(50)  NOT NULL,
    email      VARCHAR(100) UNIQUE,
    username   VARCHAR(50)  NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    contact_no VARCHAR(15),
    role       ENUM('Admin', 'Lecturer', 'Student', 'Technical Officer') NOT NULL,
    `course_image` LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- Student user data insert
INSERT INTO `user` (`user_id`, `username`, `name`, `email`, `role`, `contact_no`, `password`)
VALUES (1, 'tg1062', 'D.Jamper', 'Jamper999@gmail.com', 'Student', '761234654',
        'dae5992a6320223d208f6277f7c1cb9e04fea726f16a1d16458963067cf7bb52'),
       (2, 'tg1063', 'O.Otara87', 'otara87@gmail.com', 'Student', '761234789',
        '06d913e979383fbec4ad1a4fed98c7af0206407a5de747adf2eaa3c968b07ab8'),
       (3, 'tg1064', 'M.Manodra', 'manodra@gmail.com', 'Student', '761234678',
        '64701c078db4c0dd283d04fa9c4d80ebb4eb919b2f83c1043dfe6eb3476ecb69'),
       (4, 'tg1414', 'R.Rajapaksha', 'rajapaksha@gmail.com', 'Student', '761234565',
        '85b408c39db526dfbfb59797ffcc5d300a874e7d1167cde9c70726f7db140e7e'),
       (5, 'tg1413', 'A.Asmaakram2', 'asmaakram2@gmail.com', 'Student', '761234564',
        '1055dd50f255c86a66ecadf4762aaca3358cfa24e4872dfe913fce2e036b09da'),
       (6, 'tg1345', 'K.Kanadipudayan', 'kanadipudayan@gmail.com', 'Student', '718032400',
        '1cbf767dcbbdd1cf3dfe005ee7eeb0d7a658685654cc2a535be32268c856a2fe'),
       (7, 'tg1067', 'S.Shalini52', 'shalini52@gmail.com', 'Student', '761234567',
        '8b20e9620a8858b94909f00f68b5c87c91c7091d5c9ffcd75a14aa9f0004ab78'),
       (8, 'tg1415', 'P.Pema00', 'pema00@gmail.com', 'Student', '718032468',
        '902237776fa6387dc42703e536b9cc68f3a8637a077ff550f70e3d9f1ec762ba'),
       (9, 'tg1417', 'A.AnpuSin', 'anpuSin@gmail.com', 'Student', '761234573',
        '7a7225adee04214c7ab27bffc4f4d77ea8b827d1ffe2f8166242c6caf36ed2fd'),
       (10, 'tg1416', 'D.Dinesh', 'dinesh@gmail.com', 'Student', '749900223',
        '50fdaaa812210d14ea648296b131844e23c1a9d51662ad969a81f3c4eef627f2'),
       (11, 'tg1418', 'K.Kaviya', 'kaviya@gmail.com', 'Student', '788765432',
        '499cbdc7ecd89d158fe7e4731f8943f0b0df7ed2080b28e8694e0be3393a64f1'),
       (12, 'tg1419', 'D.Dhanu', 'dhanu@gmail.com', 'Student', '745432188',
        'b110d14482421f6d6e5afb454c4e308fae086c64a87b1966525a0ae11b23868b'),
       (13, 'tg1420', 'D.Dharshi', 'dharshi@gmail.com', 'Student', '751234509',
        'd30a052c2cdd472d612cb4138f5b088ef94c97e6b3ffd90cea5718a1cefc854e'),
       (14, 'tg1421', 'T.Thinesh', 'thinesh@gmail.com', 'Student', '750987653',
        'faa5f49f088dcabb4cee316f0bf24b2b49ddcdb2a87a54cd6118f1f28a58bc5d'),
       (15, 'tg1422', 'A.Akram', 'akram@gmail.com', 'Student', '764545456',
        '8c2012bcd0dabb0bcba27ab1cbb2c87b2f392486183548f0fdac95f405ed4223'),
       (16, 'tg1423', 'T.Thak', 'thak@gmail.com', 'Student', '761234098',
        '3cacb5d972d86adb6ecb75a89a58e47f1ea3eec8aaa2df826c03b4ac826c1224'),
       (17, 'tg1424', 'K.Keerthan', 'keerthan@gmail.com', 'Student', '789876588',
        '210a29ba180e17d8178c978893f1e86beba7187d5805e1d9c766e7245a9cb8f0'),
       (18, 'tg1425', 'V.Madhu', 'madhu@gmail.com', 'Student', '753456789',
        'dcdb51b664e5dd3077bd929e41115683d36b84a7367021d228c32d1eb4621a46'),
       (19, 'tg1426', 'S.Suba', 'suba@gmail.com', 'Student', '747474745',
        'cef9bb6c0e55d1f0fa1733a0695e055fa796476459c9534b7ce55eef729ce5c5'),
       (20, 'tg1427', 'P.Praveen', 'praveen@gmail.com', 'Student', '757698089',
        '85a9c28876bb35b406100c4cbad1636e2461acf4308033f18fca68216d2c0422'),
       (21, 'tg1428', 'S.Sajeeya', 'Sajeeya@gmail.com', 'Student', '718562347',
        '269ecb47ff8ebb12f4433c628a65a2ba5b4bf2fd24f5069c22ce0f277123761e'),
       (22, 'tg1429', 'A.Asma', 'Asma@gmail.com', 'Student', '768534547',
        '9fee23448017ed22508482bf9682107ed4fa9b58a1bf26d026dc6328ce0b5c71'),
       (23, 'tg1430', 'U.Umesha', 'Umesha@gmail.com', 'Student', '775340058',
        '4c6457f45036f181284bd111c9c0c5e2b581017b18edc71155ceda70c7c5149d'),
       (24, 'tg1431', 'D.Danith', 'Danith@gmail.com', 'Student', '718032400',
        'a3129d8ceff0d71abb0851597f207f62e988e977f6133aac69e979d379c58159'),
       (25, 'tg1432', 'D.Dasun', 'Dasun@gmail.com', 'Student', '761234687',
        'bdbdd2efdcfc779afa44c991daae58928cea35a53606b74516d9439f1fbc83bf');

-- Technical_officer user data insert
INSERT INTO `user` (`user_id`, `username`, `name`, `email`, `role`, `contact_no`, `password`)
VALUES (26, 'tech001', 'K.Vaja', 'kavindi@gmail.com', 'Technical Officer', '769870000',
        '8d93cc2a76b00161ec7f372d7fdd1d45e5cba7d3b74cb0c068d07ff1e807ba17'),
       (27, 'tech002', 'R.Raja', 'raja@gmail.com', 'Technical Officer', '755566799',
        'feffe1e1a73b6443c229f162e1c82d82295b08ebb576068566ecc71d6efd5c4f'),
       (28, 'tech003', 'K.Kamal', 'kamal@gmail.com', 'Technical Officer', '760987654',
        '4bb09b01c9012bff610927871af0ae59a6620a204efd6f2a251eb92b0a1c8d56'),
       (29, 'tech004', 'V.Vihanga', 'vihanga@gmail.com', 'Technical Officer', '760000987',
        '6989c62b46aeb11517ca743a00aa38d37dce2757141353c526ee682682ccbf06'),
       (30, 'tech005', 'M.Mithu', 'mithu@gmail.com', 'Technical Officer', '756677665',
        '5c3544e502ee2eb2ec924c34916c117be8d09708865b28210c74b7a1cfa7ac0a');

-- Admin user data insert
INSERT INTO `user` (`user_id`, `username`, `name`, `email`, `role`, `contact_no`, `password`)
VALUES (31, 'admin001', 'S.Suman', 'suman@gmail.com', 'Admin', '719877898',
        'e69eae4b4fc3a940114ddc693737292d838d8cabb299e8d5a1d84b5e97c0e68b');

-- Lecturer user data insert
INSERT INTO `user` (`user_id`, `username`, `name`, `email`, `role`, `contact_no`, `password`)
VALUES (32, 'l0001', 'M.Aayansah', 'aayansh@gmail.com', 'Lecturer', '0712345678',
        'cb50b522a8f61e8a869ed009e71fbe3f12a50fe3708ad9f4c3cfda9e682f6047'),
       (33, 'l0002', 'M.Kavid', 'kavind@gmail.com', 'Lecturer', '0781234567',
        'd7b674e3d1dbab1d05abfcd6fae2e35d1bb8e99a254208fc49d85dbd163ec1de'),
       (34, 'l0003', 'M.Nadeesha', 'nadeesha@gmail.com', 'Lecturer', '0745678123',
        '204dd7de4295107a97b4a9b1759d5ca956ac1f3b33fa31790e592f1d0260635e'),
       (35, 'l0004', 'M.Tharindu', 'tharindu@gmail.com', 'Lecturer', '0712348765',
        '19f2e2b7340b853f3833992f5d2d9c23840d872c59975dbab98e7d87561f0981'),
       (36, 'l0005', 'M.Ishara', 'ishara@gmail.com', 'Lecturer', '0787654321',
        '189f91ff8321b6b69430243895a2d8cba292d6854c4950be42c32138cd3f399d'),
       (37, 'l0006', 'M.Lakal', 'lakal@gmail.com', 'Lecturer', '0741234567',
        '0b225a4da41b27d4d59441681010f95bbf9071e88cf76d72c09c4a72c4bfb988'),
       (38, 'l0007', 'M.Ruwan', 'ruwan@gmail.com', 'Lecturer', '0712349876',
        '82d35f15bc8d4e974b2788e7ecb8655d0f2b9e586bfa34021ac0b10d0a846689'),
       (39, 'l0008', 'M.Nishan', 'nishan@gmail.com', 'Lecturer', '0789123456',
        '9a17a599e04b0e3d430bbfe707be83f58e5400cdce2eab0b2148d328cc0d91a5'),
       (40, 'l0009', 'M.Shaneeka', 'shaneeka@gmail.com', 'Lecturer', '0712346589',
        'ee46b712b7c2855283e7e522b82d7a96d92a2acb8d70896f5d99007b50d6220f'),
       (41, 'l0010', 'M.Kusum', 'kusum@gmail.com', 'Lecturer', '0745678901',
        'fdcdcd062d7b8e5b77147cc5a02a062e7425b0710410ad9a1257f9e8b0bb04d9');



CREATE TABLE `student`
(
    `student_id`       INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `student_username` VARCHAR(50) NOT NULL,
    `batch`            VARCHAR(10) NOT NULL,
    `gender`           CHAR(1)     NOT NULL,
    `department`       VARCHAR(50) NOT NULL
);


INSERT INTO `student` (`student_id`, `student_username`, `batch`, `gender`, `department`)
VALUES (1, 'tg1062', '2022', 'm', 'ict'),
       (2, 'tg1063', '2022', 'm', 'ict'),
       (3, 'tg1064', '2022', 'm', 'ict'),
       (4, 'tg1414', '2022', 'm', 'ict'),
       (5, 'tg1413', '2022', 'f', 'ict'),
       (6, 'tg1345', '2022', 'm', 'ict'),
       (7, 'tg1067', '2022', 'f', 'ict'),
       (8, 'tg1415', '2022', 'm', 'ict'),
       (9, 'tg1417', '2022', 'm', 'ict'),
       (10, 'tg1416', '2022', 'm', 'ict'),
       (11, 'tg1418', '2022', 'f', 'ict'),
       (12, 'tg1419', '2022', 'f', 'ict'),
       (13, 'tg1420', '2022', 'f', 'ict'),
       (14, 'tg1421', '2022', 'm', 'ict'),
       (15, 'tg1422', '2022', 'm', 'ict'),
       (16, 'tg1423', '2022', 'm', 'ict'),
       (17, 'tg1424', '2022', 'm', 'ict'),
       (18, 'tg1425', '2022', 'f', 'ict'),
       (19, 'tg1426', '2022', 'f', 'ict'),
       (20, 'tg1427', '2022', 'm', 'ict'),
       (21, 'tg1428', '2022', 'f', 'ict'),
       (22, 'tg1429', '2022', 'f', 'ict'),
       (23, 'tg1430', '2022', 'f', 'ict'),
       (24, 'tg1431', '2022', 'm', 'ict'),
       (25, 'tg1432', '2022', 'm', 'ict');


CREATE TABLE `department` (
`dep_id` INT AUTO_INCREMENT PRIMARY KEY,
`dep_code` VARCHAR(10),
`DepName` VARCHAR(20) DEFAULT NULL
);

INSERT INTO `department` (`dep_id`,`dep_code`, `DepName`) VALUES
(1,'ict', 'Information and Communication Technology'),
(2,'ict', 'Business Studies'),
(3,'ict', 'Engineering Technology');






DROP TABLE IF EXISTS `lecturer`;

CREATE TABLE IF NOT EXISTS `lecturer` (
    `lecturer_id` INT AUTO_INCREMENT PRIMARY KEY,  -- AUTO_INCREMENT for lecturer_id
    `username` CHAR(50),
    `department` VARCHAR(50)  -- Added department column
    );

INSERT INTO `lecturer` (`lecturer_id`, `username`, `department`) VALUES
(32, 'l0001', 'ict'),
(33, 'l0002', 'ict'),
(34, 'l0003', 'ict'),
(35, 'l0004', 'ict'),
(36, 'l0005', 'ict'),
(37, 'l0006', 'ict'),
(38, 'l0007', 'ict'),
(39, 'l0008', 'ict'),
(40, 'l0009', 'ict'),
(41, 'l0010', 'ict');





DROP TABLE IF EXISTS `technical_Officer`;

CREATE TABLE IF NOT EXISTS `technical_Officer` (
`tech_id` INT AUTO_INCREMENT PRIMARY KEY,  -- Changed 'id' to 'tech_id'
`username` CHAR(10) NOT NULL  -- 'username' column remains
);

INSERT INTO `technical_Officer` (`tech_id`,`username`) VALUES
(26,'tech001'),
(27,'tech002'),
(28,'tech003'),
(29,'tech004'),
(30,'tech005');


DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
`admin_id` INT AUTO_INCREMENT,   -- Admin ID (auto-incremented)
`username` CHAR(50) PRIMARY KEY   -- Admin username
);

INSERT INTO `admin` (`admin_id`, `username`) VALUES
(31, 'admin001');


DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
`course_id` INT AUTO_INCREMENT PRIMARY KEY,
`course_code` VARCHAR(10),
`dep_code`,VARCHAR(10)
`name` VARCHAR(100),
`credit` INT,
`week` VARCHAR(20),
`course_image` LONGBLOB
);

INSERT INTO `course`(`course_id`, `course_code`,`dep_code`, `name`, `credit`, `week`, `course_image`)
VALUES (1, 'ict2113','ict', 'Data Structures and Algorithms', 3, '15', null),
       (2, 'ict2133','ict' ,'E-Commerce Implementation, Management and Security', 3, '15', null),
       (3, 'ict2122','ict' ,'Object Oriented Analysis and Design', 2, '15', null),
       (4, 'ict2142','ict' ,'Object Oriented Programming Practicum', 2, '15', null),
       (5, 'ict2152','ict' ,'Object Oriented Programming', 2, '15', null);



CREATE TABLE `attendance` (
`att_id` int primary key AUTO_INCREMENT,
`username` varchar(10) NOT NULL,
`date` date DEFAULT NULL,
`session` varchar(50) NOT NULL,
`year` varchar(20) DEFAULT NULL,
`courseCode` varchar(50) DEFAULT NULL,
`department` varchar(50) NOT NULL,
`status` varchar(10) DEFAULT NULL
);












































































































## `attendance` table structure
DROP TABLE  IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `student_id` varchar(10) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `week_01` varchar(2) DEFAULT NULL,
  `week_02` varchar(2) DEFAULT NULL,
  `week_03` varchar(2) DEFAULT NULL,
  `week_04` varchar(2) DEFAULT NULL,
  `week_05` varchar(2) DEFAULT NULL,
  `week_06` varchar(2) DEFAULT NULL,
  `week_07` varchar(2) DEFAULT NULL,
  `week_08` varchar(2) DEFAULT NULL,
  `week_09` varchar(2) DEFAULT NULL,
  `week_10` varchar(2) DEFAULT NULL,
  `week_11` varchar(2) DEFAULT NULL,
  `week_12` varchar(2) DEFAULT NULL,
  `week_13` varchar(2) DEFAULT NULL,
  `week_14` varchar(2) DEFAULT NULL,
  `week_15` varchar(2) DEFAULT NULL,
  `total_attended` int(11) GENERATED ALWAYS AS (
      CASE WHEN `week_01` = 'AB' THEN 0 WHEN `week_01` = 'MC' THEN 1 ELSE CAST(`week_01` AS SIGNED) END +
      CASE WHEN `week_02` = 'AB' THEN 0 WHEN `week_02` = 'MC' THEN 1 ELSE CAST(`week_02` AS SIGNED) END +
      CASE WHEN `week_03` = 'AB' THEN 0 WHEN `week_03` = 'MC' THEN 1 ELSE CAST(`week_03` AS SIGNED) END +
      CASE WHEN `week_04` = 'AB' THEN 0 WHEN `week_04` = 'MC' THEN 1 ELSE CAST(`week_04` AS SIGNED) END +
      CASE WHEN `week_05` = 'AB' THEN 0 WHEN `week_05` = 'MC' THEN 1 ELSE CAST(`week_05` AS SIGNED) END +
      CASE WHEN `week_06` = 'AB' THEN 0 WHEN `week_06` = 'MC' THEN 1 ELSE CAST(`week_06` AS SIGNED) END +
      CASE WHEN `week_07` = 'AB' THEN 0 WHEN `week_07` = 'MC' THEN 1 ELSE CAST(`week_07` AS SIGNED) END +
      CASE WHEN `week_08` = 'AB' THEN 0 WHEN `week_08` = 'MC' THEN 1 ELSE CAST(`week_08` AS SIGNED) END +
      CASE WHEN `week_09` = 'AB' THEN 0 WHEN `week_09` = 'MC' THEN 1 ELSE CAST(`week_09` AS SIGNED) END +
      CASE WHEN `week_10` = 'AB' THEN 0 WHEN `week_10` = 'MC' THEN 1 ELSE CAST(`week_10` AS SIGNED) END +
      CASE WHEN `week_11` = 'AB' THEN 0 WHEN `week_11` = 'MC' THEN 1 ELSE CAST(`week_11` AS SIGNED) END +
      CASE WHEN `week_12` = 'AB' THEN 0 WHEN `week_12` = 'MC' THEN 1 ELSE CAST(`week_12` AS SIGNED) END +
      CASE WHEN `week_13` = 'AB' THEN 0 WHEN `week_13` = 'MC' THEN 1 ELSE CAST(`week_13` AS SIGNED) END +
      CASE WHEN `week_14` = 'AB' THEN 0 WHEN `week_14` = 'MC' THEN 1 ELSE CAST(`week_14` AS SIGNED) END +
      CASE WHEN `week_15` = 'AB' THEN 0 WHEN `week_15` = 'MC' THEN 1 ELSE CAST(`week_15` AS SIGNED) END
  ) VIRTUAL,
  `attendance_percentage` DECIMAL(5, 2) GENERATED ALWAYS AS (
      CASE
          WHEN `total_attended` IS NULL OR 15 = 0 THEN 0
          ELSE (`total_attended` / 15.0) * 100
      END
  ) VIRTUAL,
  PRIMARY KEY (`student_id`, `course_id`)  -- Assuming a composite primary key based on student and course
) ;
#ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



## insert data into `attendance`
##SART

INSERT INTO `attendance` (`student_id`, `course_id`, `week_01`, `week_02`, `week_03`, `week_04`, `week_05`, `week_06`, `week_07`, `week_08`, `week_09`, `week_10`, `week_11`, `week_12`, `week_13`, `week_14`, `week_15`) VALUES
('TG1062', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1062', 'ICT1222', '1', '1', '1', 'AB', '1', '1', '1', '1', '1', 'MC', '1', 'AB', '1', '1', '1'),
('TG1062', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1062', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1062', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1062', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1062', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1062', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1062', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1062', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1063', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1063', 'ICT1222', '1', '1', '1', '1', 'AB', '1', 'AB', '1', '1', '1', '1', 'AB', '1', 'AB', '1'),
('TG1063', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1063', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1063', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1063', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1063', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1', '1', '1', '1'),
('TG1063', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1063', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1063', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1064', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1064', 'ICT1222', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1064', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1064', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1064', 'ICT1253', '1', 'AB', '1', '1', 'AB', '1', 'AB', '1', 'AB', '1', '1', 'AB', '1', 'AB', '1'),
('TG1064', 'ICT1261', '1', 'MC', '1', '1', 'AB', '1', '1', '1', 'AB', '1', '1', '1', '1', '1', '1'),
('TG1064', 'ICT1271', '1', 'MC', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1', '1', '1', '1'),
('TG1064', 'ICT1283', '1', 'MC', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1', '1', '1', '1'),
('TG1064', 'ICT1293', '1', 'MC', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1', '1', '1', '1'),
('TG1064', 'ICT12102', '1', 'MC', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1', '1', '1', '1'),
('TG1414', 'ICT1213' ,'1', 'MC', '1', '1', '1', '1', 'AB', '1', 'AB', '1', '1', 'AB', '1', 'AB', '1'),
('TG1414', 'ICT1222', '1', 'MC', '1', '1', 'AB', '1', 'AB', '1', 'AB', '1', 'AB', '1', 'AB', '1', '1'),
('TG1414', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1414', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1414', 'ICT1252', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1414', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1414', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1414', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1414', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1414', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1413', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1413', 'ICT1222', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1413', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1413', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1413', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1413', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1413', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1413', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1413', 'ICT1293', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1413', 'ICT12102', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1415', 'ICT1213', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1415', 'ICT1222', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1415', 'ICT1233', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1415', 'ICT1242', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1415', 'ICT1253', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1415', 'ICT1261', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1415', 'ICT1271', '1', '1', 'AB', '1', '1', 'AB', '1', 'AB', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1415', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1415', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1415', 'ICT12102', '1', '1', 'AB', '1', 'AB', 'AB', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1417', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1417', 'ICT1222', '1', '1', 'AB', '1', 'AB', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1417', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1417', 'ICT1242', '1', '1', 'AB', '1', 'AB', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1417', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1417', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1417', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1417', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1417', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1417', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1067', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1067', 'ICT1222', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1067', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1067', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1067', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1067', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1067', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1067', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1067', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1067', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1416', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1416', 'ICT1222', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1416', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1416', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1416', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1416', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1416', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1416', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1416', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1416', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1345', 'ICT1213', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1345', 'ICT1222', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1345', 'ICT1233', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1345', 'ICT1242', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1345', 'ICT1261', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1345', 'TCS1271', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1345', 'ICT1283', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1345', 'ICT1293', '1', '1', 'AB', '1', '1', 'AB', '1', 'AB', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1345', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1418', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1418', 'ICT1222', '1', '1', '1', 'AB', '1', '1', '1', '1', '1', 'MC', '1', 'AB', '1', '1', '1'),
('TG1418', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1418', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1418', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1418', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1418', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1418', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1418', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1418', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1419', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1419', 'ICT1222', '1', '1', '1', '1', 'AB', '1', 'AB', '1', '1', '1', '1', 'AB', '1', 'AB', '1'),
('TG1419', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1419', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1419', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1419', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1'),
('TG1419', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', '1', '1', '1', '1'),
('TG1419', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1419', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1419', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1420', 'ICT1213', '1', 'MC', '1', '1', '1', '1', 'AB', '1', 'AB', '1', '1', 'AB', '1', 'AB', '1'),
('TG1420', 'ICT1222', '1', 'MC', '1', '1', 'AB', '1', 'AB', '1', 'AB', '1', 'AB', '1', 'AB', '1', '1'),
('TG1420', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1420', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1420', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1420', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1420', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1420', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1420', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1420', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1421', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1421', 'ICT1222', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1421', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1421', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1421', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1421', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1421', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1421', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1421', 'ICT1293', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1421', 'ICT12103', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1422', 'ICT1213', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1422', 'ICT1222', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1422', 'ICT1233', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1422', 'ICT1242', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1422', 'TCS1253', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1422', 'ICT1261', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1422', 'ICT1271', '1', '1', 'AB', '1', '1', 'AB', '1', 'AB', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1422', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1422', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1422', 'ICT12102', '1', '1', 'AB', '1', 'AB', 'AB', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1423', 'ICT1213', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1423', 'ICT1222', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1423', 'ICT1233', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1423', 'ICT1242', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1423', 'ICT1253', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1423', 'ICT1261', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1423', 'ICT1271', '1', '1', 'AB', '1', '1', 'AB', '1', 'AB', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1423', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1423', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1423', 'ICT12102', '1', '1', 'AB', '1', 'AB', 'AB', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1424', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1424', 'ICT1222', '1', '1', 'AB', '1', 'AB', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1424', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1424', 'ICT1242', '1', '1', 'AB', '1', 'AB', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1424', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1424', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1424', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1424', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1424', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1424', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1425', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1425', 'ICT1222', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1425', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1425', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1425', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1425', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1425', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1425', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1425', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1425', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1426', 'ICT1213', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1426', 'ICT1222', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1426', 'ICT1233', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1426', 'ICT1242', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1426', 'ICT1253', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1426', 'ICT1261', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1426', 'ICT1271', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1426', 'ICT1283', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1426', 'ICT1293', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1426', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1427', 'ICT1213', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1427', 'ICT1222', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1427', 'ICT1233', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1427', 'ICT1242', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1427', 'ICT1253', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1427', 'ICT1261', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1427', 'ICT1271', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1427', 'ICT1283', '1', '1', 'MC', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1'),
('TG1427', 'ICT1293', '1', '1', 'AB', '1', '1', 'AB', '1', 'AB', '1', 'AB', '1', '1', 'AB', '1', 'MC'),
('TG1427', 'ICT12102', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'AB', '1', '1', 'AB', '1', 'MC');



SELECT * FROM  `attendance`;


## TABLE STRUCTURE ICT1213_course_marks

DROP TABLE IF EXISTS ICT1213_course_marks;
CREATE TABLE ICT1213_course_marks (
student_id varchar(10) NOT NULL,
  quiz_1 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_2 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_3 decimal(5,2) NOT NULL DEFAULT 0.00,
  inclass_test_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  final_quiz_marks decimal(5,2) GENERATED ALWAYS AS ((quiz_1 + quiz_2 + quiz_3 - least(quiz_1,quiz_2,quiz_3)) / 3 * 0.10) STORED,
  final_assignment_marks decimal(5,2) GENERATED ALWAYS AS (inclass_test_marks * 0.05) STORED,
  mid_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  end_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  CA_total_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25) STORED,
  final_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25 + end_exam_marks * 0.60) STORED
) ;

##INSERT ICT1213_course_marks DATA
INSERT INTO ICT1213_course_marks (student_id, quiz_1, quiz_2, quiz_3, inclass_test_marks, mid_exam_marks, end_exam_marks) VALUES
('TG1062', 85.00, 90.00, 75.00, 80.00, 85.00, 88.00),
('TG1063', 78.00, 80.00, 75.00, 90.00, 85.00, 76.00),
('TG1064', 10.00, 30.00, 20.00, 20.00, 0.00, 0.00),
('TG1067', 100.00, 90.00, 80.00, 90.00, 85.00, 54.00),
('TG1345', 100.00, 100.00, 90.00, 90.00, 95.00, 90.00),
('TG1413', 87.00, 90.70, 68.50, 90.00, 85.00, 98.00),
('TG1414', 80.50, 90.50, 65.00, 59.00, 65.00, 58.00),
('TG1415', 88.00, 90.00, 75.50, 80.00, 85.00, 75.00),
('TG1416', 70.00, 80.00, 60.00, 80.00, 75.00, 73.00),
('TG1417', 88.00, 90.00, 34.50, 90.00, 75.00, 87.00),
('TG1418', 90.00, 80.00, 80.00, 85.00, 67.00, 89.00),
('TG1419', 80.00, 80.00, 70.00, 65.00, 87.00, 90.00),
('TG1420', 90.00, 80.00, 80.00, 85.00, 89.00, 76.00),
('TG1421', 60.00, 60.50, 70.50, 85.00, 77.00, 88.00),
('TG1422', 60.80, 80.70, 80.00, 85.00, 90.00, 87.00),
('TG1423', 90.00, 70.00, 80.00, 85.00, 65.00, 78.00),
('TG1424', 50.00, 70.00, 40.00, 85.00, 78.00, 89.00),
('TG1425', 90.00, 80.00, 80.00, 95.00, 57.00, 92.00),
('TG1426', 60.00, 80.00, 70.00, 67.00, 87.00, 77.00),
('TG1427', 95.00, 100.00, 85.00, 100.00, 90.00, 85.00),
##repeat student
('TG901', 75.00, 80.00, 70.00, 85.00, 90.00, 88.00),
('TG997', 85.00, 90.00, 80.00, 88.00, 82.00, 91.00),
('TG998', 90.00, 85.00, 78.00, 82.00, 80.00, 86.00),
('TG999', 70.00, 75.00, 80.00, 76.00, 78.00, 80.00),
('TG1002', 80.00, 82.00, 75.00, 80.00, 85.00, 87.00);



## TABLE STRUCTURE ICT1222_course_marks

DROP TABLE IF EXISTS ICT1222_course_marks ;

CREATE TABLE ICT1222_course_marks (
student_id varchar(10) NOT NULL,
  quiz_1 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_2 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_3 decimal(5,2) NOT NULL DEFAULT 0.00,
  inclass_test_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  final_quiz_marks decimal(5,2) GENERATED ALWAYS AS ((quiz_1 + quiz_2 + quiz_3 - least(quiz_1,quiz_2,quiz_3)) / 3 * 0.10) STORED,
  final_assignment_marks decimal(5,2) GENERATED ALWAYS AS (inclass_test_marks * 0.05) STORED,
  mid_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  end_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  CA_total_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25) STORED,
  final_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25 + end_exam_marks * 0.60) STORED
) ;



INSERT INTO ICT1222_course_marks (student_id, quiz_1, quiz_2, quiz_3, inclass_test_marks, mid_exam_marks, end_exam_marks) VALUES
('TG1067', 85.00, 100.00, 75.00, 99.00, 90.00, 75.00),
('TG1417', 98.00, 80.00, 94.50, 90.00, 85.00, 97.00),
('TG1414', 80.50, 93.50, 75.00, 89.00, 55.00, 88.00),
('TG1415', 88.00, 80.00, 85.50, 88.00, 85.00, 85.00),
('TG1413', 87.50, 90.90, 78.50, 90.00, 95.00, 88.00),
('TG1064', 80.00, 50.00, 50.00, 70.00, 60.00, 60.00),
('TG1063', 79.00, 84.00, 76.00, 95.00, 85.50, 76.50),
('TG1067', 90.00, 90.00, 84.00, 90.00, 85.50, 54.00),
('TG1416', 80.00, 88.00, 65.00, 90.50, 75.50, 73.00),
('TG1345', 90.00, 90.50, 80.50, 90.50, 98.00, 80.00),
('TG1418', 90.00, 80.00, 85.00, 75.00, 67.50, 89.00),
('TG1419', 80.00, 87.00, 77.00, 65.00, 97.00, 96.00),
('TG1420', 90.50, 80.00, 80.00, 85.00, 89.50, 77.00),
('TG1421', 70.00, 64.50, 76.50, 85.50, 77.50, 79.00),
('TG1422', 70.80, 85.70, 81.50, 96.50, 90.50, 89.00),
('TG1423', 94.00, 80.00, 86.00, 65.00, 55.00, 68.50),
('TG1424', 70.00, 80.60, 77.50, 86.60, 88.60, 90.80),
('TG1425', 97.00, 70.00, 80.50, 95.60, 77.00, 90.00),
('TG1426', 70.00, 83.50, 73.90, 77.50, 87.50, 79.50),
('TG1427', 85.00, 99.50, 95.50, 92.50, 99.50, 95.50),
('TG901', 80.00, 85.00, 90.00, 80.00, 90.00, 85.00),
('TG997', 85.50, 70.50, 60.50, 75.50, 80.50, 75.50),
('TG998', 75.00, 85.00, 65.00, 70.00, 75.00, 80.00),
('TG999', 80.50, 90.00, 85.00, 90.00, 85.00, 95.00),
('TG1002', 70.00, 75.50, 80.00, 70.00, 75.00, 70.50);

DROP TABLE IF EXISTS ICT1233_course_marks ;

CREATE TABLE ICT1233_course_marks (
student_id varchar(10) NOT NULL,
  quiz_1 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_2 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_3 decimal(5,2) NOT NULL DEFAULT 0.00,
  inclass_test_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  final_quiz_marks decimal(5,2) GENERATED ALWAYS AS ((quiz_1 + quiz_2 + quiz_3 - least(quiz_1,quiz_2,quiz_3)) / 3 * 0.10) STORED,
  final_assignment_marks decimal(5,2) GENERATED ALWAYS AS (inclass_test_marks * 0.05) STORED,
  mid_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  end_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  CA_total_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25) STORED,
  final_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25 + end_exam_marks * 0.60) STORED
) ;


INSERT INTO ICT1233_course_marks (student_id, quiz_1, quiz_2, quiz_3, inclass_test_marks, mid_exam_marks, end_exam_marks) VALUES
('TG1067', 75.00, 99.00, 85.00, 100.00, 90.00, 85.00),
('TG1417', 98.00, 90.50, 95.50, 91.00, 95.00, 100.00),
('TG1414', 81.00, 94.50, 75.50, 89.00, 95.00, 98.00),
('TG1415', 82.00, 83.50, 86.00, 89.00, 75.00, 85.50),
('TG1413', 87.50, 91.00, 77.00, 91.00, 96.00, 89.00),
('TG1064', 81.00, 70.00, 60.00, 71.00, 60.50, 63.00),
('TG1063', 89.00, 85.00, 76.10, 95.50, 85.60, 76.00),
('TG1067', 91.00, 50.00, 84.00, 80.00, 88.50, 64.00),
('TG1416', 81.00, 89.00, 65.50, 91.50, 85.50, 73.50),
('TG1345', 91.00, 80.50, 90.50, 70.50, 78.00, 70.00),
('TG1418', 90.10, 81.00, 85.50, 76.50, 77.50, 89.50),
('TG1419', 81.00, 88.00, 67.00, 75.10, 98.00, 99.00),
('TG1420', 93.50, 81.40, 82.00, 85.50, 89.50, 78.00),
('TG1421', 71.00, 64.00, 75.70, 85.40, 77.50, 89.00),
('TG1422', 71.60, 95.80, 81.50, 94.50, 91.20, 99.00),
('TG1423', 96.00, 84.30, 84.00, 76.00, 55.00, 68.50),
('TG1424', 70.00, 81.50, 75.50, 86.60, 68.60, 90.50),
('TG1425', 97.40, 73.00, 81.50, 95.50, 78.00, 91.00),
('TG1426', 74.00, 85.50, 73.91, 79.50, 88.50, 88.50),
('TG1427', 86.00, 99.60, 95.52, 93.50, 99.50, 95.80),
('TG901', 78.00, 88.00, 80.00, 85.00, 90.00, 88.00),
('TG997', 85.50, 70.50, 62.50, 78.00, 80.50, 75.50),
('TG998', 75.00, 85.00, 65.00, 75.00, 85.00, 80.00),
('TG999', 80.50, 90.00, 85.00, 85.00, 95.00, 92.00),
('TG1002', 70.00, 75.50, 78.00, 70.00, 80.00, 70.50);


DROP TABLE IF EXISTS ICT1242_course_marks ;

CREATE TABLE ICT1242_course_marks (
student_id varchar(10) NOT NULL,
  quiz_1 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_2 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_3 decimal(5,2) NOT NULL DEFAULT 0.00,
  inclass_test_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  final_quiz_marks decimal(5,2) GENERATED ALWAYS AS ((quiz_1 + quiz_2 + quiz_3 - least(quiz_1,quiz_2,quiz_3)) / 3 * 0.10) STORED,
  final_assignment_marks decimal(5,2) GENERATED ALWAYS AS (inclass_test_marks * 0.05) STORED,
  mid_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  end_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  CA_total_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25) STORED,
  final_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25 + end_exam_marks * 0.60) STORED
) ;


INSERT INTO ICT1242_course_marks (student_id, quiz_1, quiz_2, quiz_3, inclass_test_marks, mid_exam_marks, end_exam_marks) VALUES
('TG1067', 90.00, 80.00, 80.00, 85.00, 67.00, 89.00),
('TG1417', 80.00, 80.00, 70.00, 65.00, 87.00, 90.00),
('TG1414', 90.00, 80.00, 80.00, 85.00, 89.00, 76.00),
('TG1415', 60.00, 60.50, 70.50, 85.00, 77.00, 88.00),
('TG1413', 60.80, 80.70, 80.00, 85.00, 90.00, 87.00),
('TG1064', 90.00, 70.00, 80.00, 85.00, 65.00, 78.00),
('TG1063', 50.00, 70.00, 40.00, 85.00, 78.00, 89.00),
('TG1067', 90.00, 80.00, 80.00, 95.00, 57.00, 92.00),
('TG1416', 60.00, 80.00, 70.00, 67.00, 87.00, 77.00),
('TG1345', 95.00, 100.00, 85.00, 100.00, 90.00, 85.00),
('TG1418', 88.00, 90.00, 34.50, 90.00, 75.00, 87.00),
('TG1419', 80.50, 90.50, 65.00, 59.00, 65.00, 58.00),
('TG1420', 88.00, 90.00, 75.50, 80.00, 85.00, 75.00),
('TG1421', 87.00, 90.70, 68.50, 90.00, 85.00, 98.00),
('TG1422', 10.00, 30.00, 20.00, 20.00, 0.00, 0.00),
('TG1423', 78.00, 80.00, 75.00, 90.00, 85.00, 76.00),
('TG1424', 100.00, 90.00, 80.00, 90.00, 85.00, 54.00),
('TG1425', 70.00, 80.00, 60.00, 80.00, 75.00, 73.00),
('TG1426', 100.00, 100.00, 90.00, 90.00, 95.00, 90.00),
('TG1427', 86.00, 99.60, 95.52, 93.50, 99.50, 95.80),
('TG901', 85.00, 75.00, 65.00, 80.00, 85.00, 70.00),
('TG997', 77.00, 65.00, 50.00, 70.00, 80.00, 60.00),
('TG998', 60.00, 70.00, 55.00, 75.00, 68.00, 65.00),
('TG999', 88.00, 85.00, 90.00, 92.00, 95.00, 89.00),
('TG1002', 78.00, 80.00, 70.00, 78.00, 88.00, 79.00);



DROP TABLE IF EXISTS ICT1253_course_marks ;

CREATE TABLE ICT1253_course_marks (
student_id varchar(10) NOT NULL,
  quiz_1 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_2 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_3 decimal(5,2) NOT NULL DEFAULT 0.00,
  inclass_test_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  final_quiz_marks decimal(5,2) GENERATED ALWAYS AS ((quiz_1 + quiz_2 + quiz_3 - least(quiz_1,quiz_2,quiz_3)) / 3 * 0.10) STORED,
  final_assignment_marks decimal(5,2) GENERATED ALWAYS AS (inclass_test_marks * 0.05) STORED,
  mid_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  end_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  CA_total_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25) STORED,
  final_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25 + end_exam_marks * 0.60) STORED
) ;




INSERT INTO ICT1253_course_marks (student_id, quiz_1, quiz_2, quiz_3, inclass_test_marks, mid_exam_marks, end_exam_marks) VALUES
('TG1067', 80.00, 80.00, 70.00, 65.00, 87.00, 90.00),
('TG1417', 90.00, 80.00, 80.00, 85.00, 89.00, 76.00),
('TG1414', 60.00, 60.50, 70.50, 85.00, 77.00, 88.00),
('TG1415', 60.80, 80.70, 80.00, 85.00, 90.00, 87.00),
('TG1413', 90.00, 70.00, 80.00, 85.00, 65.00, 78.00),
('TG1064', 50.00, 70.00, 40.00, 85.00, 78.00, 89.00),
('TG1063', 90.00, 80.00, 80.00, 95.00, 57.00, 92.00),
('TG1067', 60.00, 80.00, 70.00, 67.00, 87.00, 77.00),
('TG1416', 95.00, 100.00, 85.00, 100.00, 90.00, 85.00),
('TG1345', 88.00, 90.00, 34.50, 90.00, 75.00, 87.00),
('TG1418', 80.50, 90.50, 65.00, 59.00, 65.00, 58.00),
('TG1419', 88.00, 90.00, 75.50, 80.00, 85.00, 75.00),
('TG1420', 87.00, 90.70, 68.50, 90.00, 85.00, 98.00),
('TG1421', 40.00, 30.00, 20.00, 50.00, 0.00, 10.00),
('TG1422', 79.00, 80.00, 76.00, 90.00, 85.00, 77.00),
('TG1423', 100.00, 90.00, 81.00, 90.00, 85.00, 54.00),
('TG1424', 70.00, 81.00, 60.00, 80.00, 85.00, 83.00),
('TG1425', 100.00, 100.00, 91.00, 90.00, 95.00, 90.50),
('TG1426', 90.00, 87.00, 97.00, 90.06, 95.50, 80.00),
('TG1427', 80.00, 80.00, 70.00, 65.00, 87.00, 90.00),
('TG901', 78.00, 67.00, 50.00, 70.00, 80.00, 65.00),
('TG997', 72.00, 65.00, 55.00, 68.00, 75.00, 60.00),
('TG998', 63.00, 70.00, 50.00, 73.00, 70.00, 68.00),
('TG999', 89.00, 85.00, 90.00, 90.00, 95.00, 88.00),
('TG1002', 77.00, 75.00, 65.00, 80.00, 85.00, 72.00);


DROP TABLE IF EXISTS ICT1261_course_marks ;

CREATE TABLE ICT1261_course_marks (
student_id varchar(10) NOT NULL,
  quiz_1 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_2 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_3 decimal(5,2) NOT NULL DEFAULT 0.00,
  inclass_test_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  final_quiz_marks decimal(5,2) GENERATED ALWAYS AS ((quiz_1 + quiz_2 + quiz_3 - least(quiz_1,quiz_2,quiz_3)) / 3 * 0.10) STORED,
  final_assignment_marks decimal(5,2) GENERATED ALWAYS AS (inclass_test_marks * 0.05) STORED,
  mid_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  end_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  CA_total_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25) STORED,
  final_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25 + end_exam_marks * 0.60) STORED
) ;


INSERT INTO ICT1261_course_marks (student_id, quiz_1, quiz_2, quiz_3, inclass_test_marks, mid_exam_marks, end_exam_marks) VALUES
('TG1067', 95.00, 100.00, 89.00, 90.00, 85.00, 90.60),
('TG1417', 89.00, 90.00, 94.50, 75.00, 87.00, 76.80),
('TG1414', 80.50, 90.50, 65.00, 65.00, 58.00, 67.78),
('TG1415', 88.00, 70.00, 75.50, 85.00, 75.00, 78.78),
('TG1413', 67.00, 90.70, 68.50, 85.00, 78.00, 87.98),
('TG1064', 50.00, 50.00, 20.00, 20.00, 50.00, 87.00),
('TG1063', 58.00, 80.00, 65.00, 60.00, 76.00, 78.00),
('TG1067', 90.00, 90.00, 80.00, 85.00, 94.00, 98.00),
('TG1416', 60.00, 70.00, 90.00, 90.00, 80.00, 87.00),
('TG1345', 90.00, 80.00, 80.00, 67.00, 89.00, 87.70),
('TG1418', 80.50, 90.50, 65.00, 59.00, 65.00, 87.90),
('TG1419', 80.00, 80.00, 91.00, 87.50, 90.00, 89.50),
('TG1420', 70.00, 50.50, 90.00, 68.00, 76.00, 67.00),
('TG1421', 50.50, 65.50, 40.70, 67.00, 63.00, 90.00),
('TG1422', 60.80, 80.70, 80.00, 85.00, 87.00, 78.00),
('TG1423', 90.00, 70.00, 80.00, 85.00, 65.00, 89.00),
('TG1424', 70.00, 81.00, 60.00, 85.00, 83.00, 79.00),
('TG1425', 90.00, 80.00, 80.00, 95.00, 72.00, 76.00),
('TG1426', 60.00, 80.00, 70.00, 87.00, 65.00, 86.00),
('TG1427', 95.00, 100.00, 89.00, 90.00, 85.00, 99.00),
('TG901', 88.00, 90.00, 85.00, 80.00, 75.00, 70.00),
('TG997', 77.00, 80.00, 65.00, 70.00, 68.00, 82.00),
('TG998', 69.00, 75.00, 70.00, 80.00, 60.00, 80.00),
('TG999', 95.00, 90.00, 85.00, 90.00, 89.00, 88.00),
('TG1002', 76.00, 85.00, 80.00, 70.00, 78.00, 82.00);


DROP TABLE IF EXISTS ICT1271_course_marks ;

CREATE TABLE ICT1271_course_marks (
student_id varchar(10) NOT NULL,
  quiz_1 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_2 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_3 decimal(5,2) NOT NULL DEFAULT 0.00,
  inclass_test_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  final_quiz_marks decimal(5,2) GENERATED ALWAYS AS ((quiz_1 + quiz_2 + quiz_3 - least(quiz_1,quiz_2,quiz_3)) / 3 * 0.10) STORED,
  final_assignment_marks decimal(5,2) GENERATED ALWAYS AS (inclass_test_marks * 0.05) STORED,
  mid_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  end_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  CA_total_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25) STORED,
  final_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25 + end_exam_marks * 0.60) STORED
) ;


INSERT INTO ICT1271_course_marks (student_id, quiz_1, quiz_2, quiz_3, inclass_test_marks, mid_exam_marks, end_exam_marks) VALUES
('TG1067', 95.50, 90.00, 89.00, 90.00, 95.00, 89.90),
('TG1417', 89.50, 90.00, 94.50, 75.00, 87.00, 87.50),
('TG1414', 80.50, 80.50, 65.00, 75.00, 58.50, 76.70),
('TG1415', 88.50, 70.60, 79.50, 95.00, 85.00, 87.90),
('TG1413', 67.60, 90.70, 68.50, 85.00, 78.00, 56.50),
('TG1064', 40.00, 50.50, 70.00, 40.00, 50.00, 67.50),
('TG1063', 58.80, 90.00, 65.50, 65.00, 76.50, 76.50),
('TG1067', 70.00, 90.50, 70.60, 65.00, 94.50, 78.50),
('TG1416', 60.00, 60.00, 90.00, 70.50, 90.00, 78.50),
('TG1345', 90.00, 80.00, 90.00, 67.00, 89.00, 60.50),
('TG1418', 80.60, 70.50, 65.00, 89.00, 65.00, 50.50),
('TG1419', 89.00, 90.00, 44.50, 76.00, 75.00, 76.50),
('TG1420', 80.50, 90.50, 65.00, 59.00, 65.00, 76.50),
('TG1421', 89.00, 80.00, 75.50, 76.50, 95.00, 67.50),
('TG1422', 67.00, 90.70, 68.50, 76.00, 85.00, 70.00),
('TG1423', 58.00, 80.00, 65.00, 80.00, 76.00, 78.90),
('TG1424', 90.00, 90.00, 80.00, 85.00, 94.00, 76.50),
('TG1425', 70.00, 88.00, 60.00, 71.00, 73.00, 78.50),
('TG1426', 90.00, 80.00, 80.00, 90.00, 89.00, 78.80),
('TG1427', 95.50, 90.60, 88.00, 80.50, 89.00, 67.50),
('TG901', 88.00, 90.00, 85.00, 80.00, 75.00, 70.00),
('TG997', 77.00, 80.00, 65.00, 70.00, 68.00, 82.00),
('TG998', 69.00, 75.00, 70.00, 80.00, 60.00, 80.00),
('TG999', 95.00, 90.00, 85.00, 90.00, 89.00, 88.00),
('TG1002', 76.00, 85.00, 80.00, 70.00, 78.00, 82.00);


DROP TABLE IF EXISTS ICT1283_course_marks ;

CREATE TABLE ICT1283_course_marks (
student_id varchar(10) NOT NULL,
  quiz_1 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_2 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_3 decimal(5,2) NOT NULL DEFAULT 0.00,
  inclass_test_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  final_quiz_marks decimal(5,2) GENERATED ALWAYS AS ((quiz_1 + quiz_2 + quiz_3 - least(quiz_1,quiz_2,quiz_3)) / 3 * 0.10) STORED,
  final_assignment_marks decimal(5,2) GENERATED ALWAYS AS (inclass_test_marks * 0.05) STORED,
  mid_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  end_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  CA_total_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25) STORED,
  final_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25 + end_exam_marks * 0.60) STORED
) ;



INSERT INTO ICT1283_course_marks (student_id, quiz_1, quiz_2, quiz_3, inclass_test_marks, mid_exam_marks, end_exam_marks) VALUES
('TG1067', 95.50, 90.00, 89.00, 100.00, 90.00, 85.00),
('TG1417', 89.50, 90.00, 94.50, 86.00, 99.60, 95.52),
('TG1414', 80.50, 80.50, 65.00, 90.00, 85.00, 98.00),
('TG1415', 88.50, 70.60, 79.50, 100.00, 90.00, 85.00),
('TG1413', 67.60, 90.70, 68.50, 20.00, 0.00, 0.00),
('TG1064', 40.00, 50.50, 70.00, 65.00, 87.00, 90.00),
('TG1063', 58.80, 90.00, 65.50, 60.00, 73.00, 60.00),
('TG1067', 70.00, 90.50, 70.60, 90.00, 80.00, 90.00),
('TG1416', 60.00, 60.00, 90.00, 67.00, 89.00, 67.00),
('TG1345', 90.00, 80.00, 90.00, 87.00, 90.00, 87.00),
('TG1418', 80.60, 70.50, 65.00, 69.00, 76.00, 69.00),
('TG1419', 89.00, 90.00, 44.50, 67.00, 63.00, 67.00),
('TG1420', 80.50, 90.50, 65.00, 85.00, 87.00, 85.00),
('TG1421', 89.00, 80.00, 75.50, 70.00, 80.00, 60.80),
('TG1422', 67.00, 60.00, 70.00, 90.00, 76.00, 85.00),
('TG1423', 65.00, 87.00, 90.00, 65.00, 80.00, 76.00),
('TG1424', 90.00, 90.00, 90.00, 44.50, 76.00, 94.00),
('TG1425', 70.00, 88.00, 60.00, 85.00, 75.00, 85.00),
('TG1426', 90.00, 80.00, 80.00, 90.70, 68.50, 76.00),
('TG1427', 95.50, 90.60, 88.00, 94.00, 85.00, 94.00),
('TG901', 88.00, 90.00, 85.00, 80.00, 75.00, 70.00),
('TG997', 77.00, 80.00, 65.00, 70.00, 68.00, 82.00),
('TG998', 69.00, 75.00, 70.00, 80.00, 60.00, 80.00),
('TG999', 95.00, 90.00, 85.00, 90.00, 89.00, 88.00),
('TG1002', 76.00, 85.00, 80.00, 70.00, 78.00, 82.00);


DROP TABLE IF EXISTS ICT1293_course_marks ;

CREATE TABLE ICT1293_course_marks (
student_id varchar(10) NOT NULL,
  quiz_1 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_2 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_3 decimal(5,2) NOT NULL DEFAULT 0.00,
  inclass_test_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  final_quiz_marks decimal(5,2) GENERATED ALWAYS AS ((quiz_1 + quiz_2 + quiz_3 - least(quiz_1,quiz_2,quiz_3)) / 3 * 0.10) STORED,
  final_assignment_marks decimal(5,2) GENERATED ALWAYS AS (inclass_test_marks * 0.05) STORED,
  mid_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  end_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  CA_total_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25) STORED,
  final_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25 + end_exam_marks * 0.60) STORED
) ;


INSERT INTO ICT1293_course_marks (student_id, quiz_1, quiz_2, quiz_3, inclass_test_marks, mid_exam_marks, end_exam_marks) VALUES
('TG1067', 95.50, 90.00, 85.00, 90.00, 90.00, 85.00),
('TG1417', 89.50, 95.00, 100.00, 89.00, 99.60, 95.52),
('TG1414', 80.50, 90.00, 44.50, 76.00, 85.00, 98.00),
('TG1415', 88.50, 70.60, 90.50, 65.00, 59.00, 85.00),
('TG1413', 67.60, 50.00, 50.00, 20.00, 0.00, 0.00),
('TG1064', 40.00, 50.50, 70.00, 50.00, 50.00, 20.00),
('TG1063', 58.80, 90.00, 65.00, 80.00, 60.00, 60.00),
('TG1416', 60.00, 60.00, 80.00, 60.00, 70.00, 67.00),
('TG1345', 90.00, 80.00, 60.00, 70.00, 90.00, 87.00),
('TG1418', 80.60, 65.50, 40.70, 55.00, 76.00, 69.00),
('TG1419', 89.00, 90.00, 44.50, 65.50, 40.70, 55.00),
('TG1420', 80.50, 90.50, 65.00, 85.00, 87.00, 85.00),
('TG1421', 65.50, 40.70, 55.00, 70.00, 80.00, 60.80),
('TG1422', 67.00, 44.50, 76.00, 75.00, 76.00, 85.00),
('TG1423', 65.00, 87.00, 65.00, 59.00, 65.00, 76.00),
('TG1424', 90.00, 75.50, 86.50, 85.00, 76.00, 94.00),
('TG1425', 70.00, 88.00, 20.00, 26.00, 20.00, 85.00),
('TG1426', 90.00, 80.00, 65.00, 80.00, 68.50, 76.00),
('TG1427', 95.50, 90.60, 90.00, 80.00, 80.00, 94.00),
('TG901', 88.00, 90.00, 85.50, 75.00, 80.00, 82.50),
('TG997', 92.50, 89.00, 91.00, 80.00, 85.00, 88.00),
('TG998', 78.00, 85.50, 80.00, 70.00, 72.50, 74.00),
('TG999', 85.00, 95.00, 88.00, 90.00, 93.00, 91.00),
('TG1002', 80.00, 82.00, 85.00, 77.00, 79.00, 81.00);


DROP TABLE IF EXISTS ICT12101_course_marks ;

CREATE TABLE ICT12101_course_marks (
student_id varchar(10) NOT NULL,
  quiz_1 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_2 decimal(5,2) NOT NULL DEFAULT 0.00,
  quiz_3 decimal(5,2) NOT NULL DEFAULT 0.00,
  inclass_test_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  final_quiz_marks decimal(5,2) GENERATED ALWAYS AS ((quiz_1 + quiz_2 + quiz_3 - least(quiz_1,quiz_2,quiz_3)) / 3 * 0.10) STORED,
  final_assignment_marks decimal(5,2) GENERATED ALWAYS AS (inclass_test_marks * 0.05) STORED,
  mid_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  end_exam_marks decimal(5,2) NOT NULL DEFAULT 0.00,
  CA_total_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25) STORED,
  final_marks decimal(5,2) GENERATED ALWAYS AS (final_quiz_marks + final_assignment_marks + mid_exam_marks * 0.25 + end_exam_marks * 0.60) STORED
) ;

INSERT INTO ICT12101_course_marks (student_id, quiz_1, quiz_2, quiz_3, inclass_test_marks, mid_exam_marks, end_exam_marks) VALUES
('TG1062', 88.00, 90.00, 85.00, 80.00, 75.00, 88.00),
('TG1063', 92.50, 85.00, 90.00, 89.00, 95.00, 91.00),
('TG1064', 75.00, 80.00, 78.00, 70.00, 72.00, 74.00),
('TG1414', 90.00, 86.00, 80.00, 80.00, 75.00, 85.00),
('TG1413', 60.00, 70.00, 65.00, 55.00, 60.00, 68.00),
('TG1345', 82.00, 88.00, 90.00, 85.00, 80.00, 83.00),
('TG1067', 100.00, 89.00, 80.00, 90.00, 85.00, 90.00),
('TG1415', 88.00, 78.00, 75.50, 88.50, 85.00, 95.00),
('TG1417', 99.50,  98.00, 100.00, 89.50, 98.60, 99.52),
('TG1416', 60.50, 81.00, 80.00, 60.70, 70.00, 77.00),
('TG1418', 70.00, 50.50, 90.00, 85.00, 69.00, 76.00),
('TG1419', 89.00, 90.00, 44.50, 65.50, 40.70, 55.00),
('TG1420', 60.80, 80.70, 80.00, 90.00, 85.00, 87.00),
('TG1421', 90.00, 70.00, 80.00, 60.80, 85.00, 65.00),
('TG1422',  50.00, 70.00, 40.00, 80.00, 85.00, 78.00),
('TG1423', 60.00, 80.00, 70.00, 50.00, 87.00, 65.00),
('TG1424',  95.00, 100.00, 89.00, 80.00, 90.00, 85.00),
('TG1425', 67.00, 90.70, 68.50, 76.00, 85.00, 78.00),
('TG1426', 90.00, 90.00, 80.00, 80.00, 75.00, 94.00),
('TG1427', 70.00, 80.00, 60.00, 70.00, 60.00, 73.00),
('TG901', 85.00, 88.00, 90.00, 78.00, 80.00, 85.00),
('TG997', 92.00, 90.00, 95.00, 88.00, 89.00, 90.00),
('TG998', 75.00, 80.00, 70.00, 65.00, 70.00, 75.00),
('TG999', 88.50, 87.00, 85.00, 90.00, 92.00, 88.00),
('TG1002', 90.00, 92.50, 89.00, 95.00, 91.00, 90.00);



DROP TABLE IF EXISTS `student_grade`;
CREATE TABLE IF NOT EXISTS `student_grade` (
  `student_id` char(10) NOT NULL,
  `course_id` char(10) NOT NULL,
  `final_marks` decimal(5,2) NOT NULL,
  `grade` varchar(5) GENERATED ALWAYS AS (
    (CASE
      WHEN (`final_marks` < 0) THEN 'MC'
      WHEN (`final_marks` >= 90) THEN 'A+'
      WHEN (`final_marks` >= 85) THEN 'A'
      WHEN (`final_marks` >= 80) THEN 'A-'
      WHEN (`final_marks` >= 75) THEN 'B+'
      WHEN (`final_marks` >= 70) THEN 'B'
      WHEN (`final_marks` >= 65) THEN 'B-'
      WHEN (`final_marks` >= 60) THEN 'C+'
      WHEN (`final_marks` >= 55) THEN 'C'
      WHEN (`final_marks` >= 50) THEN 'C-'
      WHEN (`final_marks` >= 45) THEN 'D'
      ELSE 'E'
    END)
  ) VIRTUAL,
  `SGPA` decimal(3,2) GENERATED ALWAYS AS (
    (CASE
      WHEN (`grade` = 'A+' OR `grade` = 'A') THEN 4.00
      WHEN (`grade` = 'A-') THEN 3.70
      WHEN (`grade` = 'B+') THEN 3.30
      WHEN (`grade` = 'B') THEN 3.00
      WHEN (`grade` = 'B-') THEN 2.70
      WHEN (`grade` = 'C+') THEN 2.30
      WHEN (`grade` = 'C') THEN 2.00
      WHEN (`grade` = 'C-') THEN 1.70
      WHEN (`grade` = 'D') THEN 1.00
      WHEN (`grade` = 'E') THEN 0.00
    END)
  )
##KEY `student_id` (`student_id`),
 ## KEY `course_id` (`course_id`),
 ## CONSTRAINT `student_grade_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
 ## CONSTRAINT `student_grade_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)  -- Changed couId to course_id
);
 ##ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP PROCEDURE IF EXISTS InsertStudentGrades_ICT1213;
DELIMITER //


## GET VALUE FROM  ICT1213_course_marks table
##SART

CREATE PROCEDURE InsertStudentGrades_ICT1213()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id_char CHAR(6);
    DECLARE final_marks_value DECIMAL(5,2);

    DECLARE student_cursor CURSOR FOR
        SELECT student_id, final_marks FROM ICT1213_course_marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO student_id_char, final_marks_value;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO student_grade (student_id, course_id, final_marks)
        VALUES (student_id_char, 'ICT1213', final_marks_value);
    END LOOP;

    CLOSE student_cursor;
END //

##END

DROP PROCEDURE IF EXISTS InsertStudentGrades_ICT1222;
## GET VALUE FROM  ICT1222_course_marks table
DELIMITER //
CREATE PROCEDURE InsertStudentGrades_ICT1222()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id_char CHAR(6);
    DECLARE final_marks_value DECIMAL(5,2);

    DECLARE student_cursor CURSOR FOR
        SELECT student_id, final_marks FROM ICT1222_course_marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO student_id_char, final_marks_value;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO student_grade (student_id, course_id, final_marks)
        VALUES (student_id_char, 'ICT1222', final_marks_value);
    END LOOP;

    CLOSE student_cursor;
END //


##   GET VALUE FROM  ICT1233_course_marks table
DROP PROCEDURE IF EXISTS InsertStudentGrades_ICT1233;
DELIMITER //
CREATE PROCEDURE InsertStudentGrades_ICT1233()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id_char CHAR(6);
    DECLARE final_marks_value DECIMAL(5,2);

    DECLARE student_cursor CURSOR FOR
        SELECT student_id, final_marks FROM ICT1233_course_marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO student_id_char, final_marks_value;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO student_grade (student_id, course_id, final_marks)
        VALUES (student_id_char, 'ICT1233', final_marks_value);
    END LOOP;

    CLOSE student_cursor;
END //




##   GET VALUE FROM  ICT1242_course_marks table
DROP PROCEDURE IF EXISTS InsertStudentGrades_ICT1242;
DELIMITER //
CREATE PROCEDURE InsertStudentGrades_ICT1242()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id_char CHAR(6);
    DECLARE final_marks_value DECIMAL(5,2);

    DECLARE student_cursor CURSOR FOR
        SELECT student_id, final_marks FROM ICT1242_course_marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO student_id_char, final_marks_value;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO student_grade (student_id, course_id, final_marks)
        VALUES (student_id_char, 'ICT1242', final_marks_value);
    END LOOP;

    CLOSE student_cursor;
END //





##   GET VALUE FROM  ICT1253_course_marks table
DROP PROCEDURE IF EXISTS InsertStudentGrades_ICT1253;
DELIMITER //
CREATE PROCEDURE InsertStudentGrades_ICT1253()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id_char CHAR(6);
    DECLARE final_marks_value DECIMAL(5,2);

    DECLARE student_cursor CURSOR FOR
        SELECT student_id, final_marks FROM ICT1253_course_marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO student_id_char, final_marks_value;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO student_grade (student_id, course_id, final_marks)
        VALUES (student_id_char, 'ICT1253', final_marks_value);
    END LOOP;

    CLOSE student_cursor;
END //



##   GET VALUE FROM  ICT1261_course_marks table
DROP PROCEDURE IF EXISTS InsertStudentGrades_ICT1261;
DELIMITER //
CREATE PROCEDURE InsertStudentGrades_ICT1261()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id_char CHAR(6);
    DECLARE final_marks_value DECIMAL(5,2);

    DECLARE student_cursor CURSOR FOR
        SELECT student_id, final_marks FROM ICT1261_course_marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO student_id_char, final_marks_value;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO student_grade (student_id, course_id, final_marks)
        VALUES (student_id_char, 'ICT1261', final_marks_value);
    END LOOP;

    CLOSE student_cursor;
END //


DROP PROCEDURE IF EXISTS InsertStudentGrades_ICT1293;

##   GET VALUE FROM  ICT1293_course_marks table

DELIMITER //
CREATE PROCEDURE InsertStudentGrades_ICT1293()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id_char CHAR(6);
    DECLARE final_marks_value DECIMAL(5,2);

    DECLARE student_cursor CURSOR FOR
        SELECT student_id, final_marks FROM ICT1293_course_marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO student_id_char, final_marks_value;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO student_grade (student_id, course_id, final_marks)
        VALUES (student_id_char, 'ICT1293', final_marks_value);
    END LOOP;

    CLOSE student_cursor;
END //



##   GET VALUE FROM  ICT1283_course_marks  table
DROP PROCEDURE IF EXISTS InsertStudentGrades_ICT1283;
DELIMITER //
CREATE PROCEDURE InsertStudentGrades_ICT1283()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id_char CHAR(6);
    DECLARE final_marks_value DECIMAL(5,2);

    DECLARE student_cursor CURSOR FOR
        SELECT student_id, final_marks FROM ICT1283_course_marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO student_id_char, final_marks_value;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO student_grade (student_id, course_id, final_marks)
        VALUES (student_id_char, 'ICT1283', final_marks_value);
    END LOOP;

    CLOSE student_cursor;
END //



##   GET VALUE FROM  ICT1271_course_marks  table
DROP PROCEDURE IF EXISTS InsertStudentGrades_ICT1271;
DELIMITER //
CREATE PROCEDURE InsertStudentGrades_ICT1271()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id_char CHAR(6);
    DECLARE final_marks_value DECIMAL(5,2);

    DECLARE student_cursor CURSOR FOR
        SELECT student_id, final_marks FROM ICT1271_course_marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO student_id_char, final_marks_value;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO student_grade (student_id, course_id, final_marks)
        VALUES (student_id_char, 'ICT1271', final_marks_value);
    END LOOP;

    CLOSE student_cursor;
END //




##   GET VALUE FROM  ICT12101_course_marks  table
DROP PROCEDURE IF EXISTS InsertStudentGrades_ICT12101;
DELIMITER //
CREATE PROCEDURE InsertStudentGrades_ICT12101()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id_char CHAR(6);
    DECLARE final_marks_value DECIMAL(5,2);

    DECLARE student_cursor CURSOR FOR
        SELECT student_id, final_marks FROM ICT12101_course_marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO student_id_char, final_marks_value;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO student_grade (student_id, course_id, final_marks)
        VALUES (student_id_char, 'ICT12101', final_marks_value);
    END LOOP;

    CLOSE student_cursor;
END //
DELIMITER ;


CALL InsertStudentGrades_ICT12101();
CALL InsertStudentGrades_ICT1271();
CALL InsertStudentGrades_ICT1283();
CALL InsertStudentGrades_ICT1293();
CALL InsertStudentGrades_ICT1261();
CALL InsertStudentGrades_ICT1253();
CALL InsertStudentGrades_ICT1242();
CALL InsertStudentGrades_ICT1283();
CALL InsertStudentGrades_ICT1271();
CALL InsertStudentGrades_ICT12101();


SELECT * FROM `student_grade`;

SHOW COLUMNS FROM student;
SHOW COLUMNS FROM student_grade;



SELECT * FROM `course`;


#ALTER TABLE `student_grade`
#MODIFY COLUMN `student_id` CHAR(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;

#ALTER TABLE `student_grade`
#MODIFY COLUMN `course_id` CHAR(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
#ALTER TABLE `student_grade`
#ADD CONSTRAINT `fk_course_gread_student`
#FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`);

select   * from `student_grade`;

ALTER TABLE student_grade
MODIFY COLUMN student_id CHAR(10) NOT NULL;

ALTER TABLE student_grade
MODIFY COLUMN student_id CHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL;

/*SELECT student_id
FROM `student_grade`
WHERE student_id NOT IN (SELECT student_id FROM `student`);*/

SELECT * FROM `student_grade`;

ALTER TABLE student_grade
ADD CONSTRAINT fk_course_grade_student FOREIGN KEY (student_id) REFERENCES student(student_id);



DROP TABLE IF EXISTS Student_Performance;
CREATE TABLE Student_Performance (
    student_id VARCHAR(12) NOT NULL,
    semester_no INT,
    SGPA DECIMAL(3,2),
    CGPA DECIMAL(3,2),
    GPA DECIMAL(3,2),
    PRIMARY KEY (student_id, semester_no)
);

SELECT * FROM Student_Performance;

INSERT INTO Student_Performance (student_id, semester_no,SGPA, CGPA, GPA)
SELECT
    sg.student_id,
    1 AS semester_no,
    (SUM(c.`credit` * CASE
        WHEN sg.Final_marks >= 90 THEN 4.00
        WHEN sg.Final_marks >= 85 THEN 3.70
        WHEN sg.Final_marks >= 80 THEN 3.30
        WHEN sg.Final_marks >= 75 THEN 3.00
        WHEN sg.Final_marks >= 70 THEN 2.70
        WHEN sg.Final_marks >= 65 THEN 2.30
        WHEN sg.Final_marks >= 60 THEN 2.00
        WHEN sg.Final_marks >= 55 THEN 1.70
        WHEN sg.Final_marks >= 50 THEN 1.30
        WHEN sg.Final_marks >= 45 THEN 1.00
        ELSE 0.00
    END) / NULLIF(SUM(c.credit), 0)) AS SGPA,
    NULL AS CGPA,
    NULL AS GPA
FROM
    student_grade AS sg
JOIN
    course AS c ON sg.course_id = c.course_id
GROUP BY
    sg.student_id;

SELECT * FROM `student_grade`;

SET SQL_SAFE_UPDATES = 0;


UPDATE Student_Performance AS sp
JOIN (
    SELECT
        student_id,
        AVG(SGPA) AS Avg_CGPA
    FROM
        Student_Performance
    GROUP BY
        student_id
) AS avg_cgpa ON sp.student_id = avg_cgpa.student_id
SET sp.CGPA = avg_cgpa.Avg_CGPA;

SET SQL_SAFE_UPDATES = 1;





SET SQL_SAFE_UPDATES = 0;
UPDATE Student_Performance sp
JOIN (
    SELECT
        student_id,
        AVG(SGPA) AS avg_full_sgpa
    FROM
        Student_Performance
    GROUP BY
        student_id
) AS avg_sp ON sp.student_id = avg_sp.student_id
SET sp.GPA = avg_sp.avg_full_sgpa;
SET SQL_SAFE_UPDATES = 1;



DELIMITER //
CREATE PROCEDURE VIEW_STUDENT_GRADES_AS_BATCH(IN batch CHAR(4))
BEGIN
    SELECT sg.*
    FROM `student_grade` sg
    JOIN `student` s ON sg.`student_id` = s.`student_id`
    WHERE s.`batch` = batch;
END //
DELIMITER ;

## get proper student grads
CALL VIEW_STUDENT_GRADES_AS_BATCH('2022');


## get repeat student grads
CALL VIEW_STUDENT_GRADES_AS_BATCH('2021');


#### get GetStudentDetailsByBatch  student grads AND detalis
DELIMITER //
CREATE PROCEDURE GetStudentDetailsByBatch(
    IN batch CHAR(4)
)
BEGIN
    SELECT
        S.student_id,
        S.name AS StudentName,
        COALESCE(
            CASE
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ENG1222' AND student_id = S.student_id) IS NULL THEN 'No Repeat'
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ENG1222' AND student_id = S.student_id) IN ('C', 'C+') THEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ENG1222' AND student_id = S.student_id)
                ELSE 'C+'
            END, 'No Repeat'
        ) AS ENG1222,
        COALESCE(
            CASE
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1212' AND student_id = S.student_id) IS NULL THEN 'No Repeat'
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1212' AND student_id = S.student_id) IN ('C', 'C+') THEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1212' AND student_id = S.student_id)
                ELSE 'C+'
            END, 'No Repeat'
        ) AS ICT1212,
        COALESCE(
            CASE
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1222' AND student_id = S.student_id) IS NULL THEN 'No Repeat'
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1222' AND student_id = S.student_id) IN ('C', 'C+') THEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1222' AND student_id = S.student_id)
                ELSE 'C+'
            END, 'No Repeat'
        ) AS ICT1222,
        COALESCE(
            CASE
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1233' AND student_id = S.student_id) IS NULL THEN 'No Repeat'
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1233' AND student_id = S.student_id) IN ('C', 'C+') THEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1233' AND student_id = S.student_id)
                ELSE 'C+'
            END, 'No Repeat'
        ) AS ICT1233,
        COALESCE(
            CASE
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1242' AND student_id = S.student_id) IS NULL THEN 'No Repeat'
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1242' AND student_id = S.student_id) IN ('C', 'C+') THEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1242' AND student_id = S.student_id)
                ELSE 'C+'
            END, 'No Repeat'
        ) AS ICT1242,
        COALESCE(
            CASE
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1253' AND student_id = S.student_id) IS NULL THEN 'No Repeat'
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1253' AND student_id = S.student_id) IN ('C', 'C+') THEN (SELECT grade FROM `student_grade` WHERE Course_id = 'ICT1253' AND student_id = S.student_id)
                ELSE 'C+'
            END, 'No Repeat'
        ) AS ICT1253,
        COALESCE(
            CASE
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'TCS1212' AND student_id = S.student_id) IS NULL THEN 'No Repeat'
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'TCS1212' AND student_id = S.student_id) IN ('C', 'C+') THEN (SELECT grade FROM `student_grade` WHERE Course_id = 'TCS1212' AND student_id = S.student_id)
                ELSE 'C+'
            END, 'No Repeat'
        ) AS TCS1212,
        COALESCE(
            CASE
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'TMS1233' AND student_id = S.student_id) IS NULL THEN 'No Repeat'
                WHEN (SELECT grade FROM `student_grade` WHERE Course_id = 'TMS1233' AND student_id = S.student_id) IN ('C', 'C+') THEN (SELECT grade FROM `student_grade` WHERE Course_id = 'TMS1233' AND student_id = S.student_id)
                ELSE 'C+'
            END, 'No Repeat'
        ) AS TMS1233,
        SP.SGPA,
        SP.CGPA
    FROM
        `student` AS S
    JOIN
        Student_Performance AS SP ON S.student_id = SP.student_id
    WHERE
        S.batch = batch;
END //

DELIMITER ;


CALL GetStudentDetailsByBatch('2021');
# repeat student


ALTER TABLE `user`
MODIFY COLUMN `NIC` CHAR(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;

ALTER TABLE `lecturer`
MODIFY COLUMN `NIC` CHAR(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;


ALTER TABLE `lecturer`
ADD CONSTRAINT `fk_lecturer_user`
FOREIGN KEY (`NIC`) REFERENCES `user`(`NIC`)
ON DELETE CASCADE
ON UPDATE CASCADE;




ALTER TABLE `admin`
MODIFY COLUMN `NIC` CHAR(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

ALTER TABLE `admin`
ADD CONSTRAINT `fk_admin_user`
FOREIGN KEY (`NIC`) REFERENCES `user`(`NIC`)
ON DELETE CASCADE
ON UPDATE CASCADE;


ALTER TABLE `dean`
MODIFY COLUMN `NIC` CHAR(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

ALTER TABLE `dean`
ADD CONSTRAINT `fk_dean_user`
FOREIGN KEY (`NIC`) REFERENCES `user`(`NIC`)
ON DELETE CASCADE
ON UPDATE CASCADE;


ALTER TABLE `technical_Officer`
MODIFY COLUMN `NIC` CHAR(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

ALTER TABLE `technical_Officer`
ADD CONSTRAINT `fk_technical_Officer_user`
FOREIGN KEY (`NIC`) REFERENCES `user`(`NIC`)
ON DELETE CASCADE
ON UPDATE CASCADE;


ALTER TABLE `student`
MODIFY COLUMN `NIC` CHAR(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

ALTER TABLE `student`
ADD CONSTRAINT `fk_technical_student_user`
FOREIGN KEY (`NIC`) REFERENCES `user`(`NIC`)
ON DELETE CASCADE
ON UPDATE CASCADE;
##END







-- create  function show cource data
DROP PROCEDURE IF EXISTS showALLCourses;
DELIMITER //

CREATE PROCEDURE showALLCourses()
BEGIN
    SELECT * FROM `course`;
END //

DELIMITER ;


CALL showALLCourses();
-- SELECT * FROM  CourceName;


-- create view for courceID , cource Name


CREATE VIEW CourceName AS
SELECT `course_id` AS ID , `name` AS  course FROM `course`;

-- SELECT * FROM  CourceName;

-- SHOW ALL DATA FROM  Database_management_system marks

CREATE VIEW `get_databaseManagementSystemMarks` AS
SELECT student_id AS `TG NUMBER` ,
quiz_1 AS `QUIZ ONE` ,
quiz_2 AS `QUIZ TWO`,
quiz_3 AS `QUIZ THREE`,
inclass_test_marks AS `IN CLASS TEST`,
mid_exam_marks AS `MID EXAM`,
end_exam_marks AS `END EXAM`
FROM ICT1213_course_marks;

-- SELECT * FROM `get_databaseManagementSystemMarks`;




-- get all data from computer_architecture marks

CREATE VIEW `get_Computer_architectureMarks` AS
SELECT student_id AS `TG NUMBER` ,
quiz_1 AS `QUIZ ONE` ,
quiz_2 AS `QUIZ TWO`,
quiz_3 AS `QUIZ THREE`,
inclass_test_marks AS `IN CLASS TEST`,
mid_exam_marks AS `MID EXAM`,
end_exam_marks AS `END EXAM`
FROM ICT1222_course_marks;


-- SELECT * FROM `get_Computer_architectureMarks`;

-- get all data from network subject marks
CREATE VIEW `get_Computer_networkMarks` AS
SELECT student_id AS `TG NUMBER` ,
quiz_1 AS `QUIZ ONE` ,
quiz_2 AS `QUIZ TWO`,
quiz_3 AS `QUIZ THREE`,
inclass_test_marks AS `IN CLASS TEST`,
mid_exam_marks AS `MID EXAM`,
end_exam_marks AS `END EXAM`
FROM ICT1233_course_marks;

-- SELECT * FROM `get_Computer_networkMarks`;


-- get all data from Server side web development marks
CREATE VIEW `get_Server_side_web_developmentMarks` AS
SELECT student_id AS `TG NUMBER` ,
quiz_1 AS `QUIZ ONE` ,
quiz_2 AS `QUIZ TWO`,
quiz_3 AS `QUIZ THREE`,
inclass_test_marks AS `IN CLASS TEST`,
mid_exam_marks AS `MID EXAM`,
end_exam_marks AS `END EXAM`
FROM ICT1242_course_marks;

-- SELECT * FROM `get_Server_side_web_developmentMarks`;

-- get all data from Computer_programing marks

CREATE VIEW `get_Computer_programingMarks` AS
SELECT student_id AS `TG NUMBER` ,
quiz_1 AS `QUIZ ONE` ,
quiz_2 AS `QUIZ TWO`,
quiz_3 AS `QUIZ THREE`,
inclass_test_marks AS `IN CLASS TEST`,
mid_exam_marks AS `MID EXAM`,
end_exam_marks AS `END EXAM`
FROM ICT1253_course_marks;

-- SELECT * FROM `get_Computer_programingMarks`;



-- get all data from Muiltimedia_technology marks

CREATE VIEW `get_Muiltimedia_technologyMarks` AS
SELECT student_id AS `TG NUMBER` ,
quiz_1 AS `QUIZ ONE` ,
quiz_2 AS `QUIZ TWO`,
quiz_3 AS `QUIZ THREE`,
inclass_test_marks AS `IN CLASS TEST`,
mid_exam_marks AS `MID EXAM`,
end_exam_marks AS `END EXAM`
FROM ICT1261_course_marks;

-- SELECT * FROM `get_Muiltimedia_technologyMarks`;


-- get all data from Muiltimedia_technology marks

CREATE VIEW `get_Fundamendal_of_ISMarks` AS
SELECT student_id AS `TG NUMBER` ,
quiz_1 AS `QUIZ ONE` ,
quiz_2 AS `QUIZ TWO`,
quiz_3 AS `QUIZ THREE`,
inclass_test_marks AS `IN CLASS TEST`,
mid_exam_marks AS `MID EXAM`,
end_exam_marks AS `END EXAM`
FROM ICT1271_course_marks;

-- SELECT * FROM `get_Fundamendal_of_ISMarks`;

-- get all data from Web_technology marks
CREATE VIEW `get_Web_technologyMarks` AS
SELECT student_id AS `TG NUMBER` ,
quiz_1 AS `QUIZ ONE` ,
quiz_2 AS `QUIZ TWO`,
quiz_3 AS `QUIZ THREE`,
inclass_test_marks AS `IN CLASS TEST`,
mid_exam_marks AS `MID EXAM`,
end_exam_marks AS `END EXAM`
FROM ICT1283_course_marks;


-- SELECT * FROM `get_Web_technologyMarks`;

-- get all data from Artificial_inteligence marks
CREATE VIEW `Artificial_inteligenceMarks` AS
SELECT student_id AS `TG NUMBER` ,
quiz_1 AS `QUIZ ONE` ,
quiz_2 AS `QUIZ TWO`,
quiz_3 AS `QUIZ THREE`,
inclass_test_marks AS `IN CLASS TEST`,
mid_exam_marks AS `MID EXAM`,
end_exam_marks AS `END EXAM`
FROM ICT1293_course_marks;


-- SELECT * FROM `Artificial_inteligenceMarks`;


-- get all data from Artificial_inteligence marks
CREATE VIEW `Software_engineeringMarks` AS
SELECT student_id AS `TG NUMBER` ,
quiz_1 AS `QUIZ ONE` ,
quiz_2 AS `QUIZ TWO`,
quiz_3 AS `QUIZ THREE`,
inclass_test_marks AS `IN CLASS TEST`,
mid_exam_marks AS `MID EXAM`,
end_exam_marks AS `END EXAM`
FROM ICT12101_course_marks;



-- SELECT * FROM `Software_engineeringMarks`;







ALTER TABLE `attendance`
MODIFY COLUMN `student_id` CHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;


SELECT student_id
FROM `attendance`
WHERE student_id NOT IN (SELECT student_id FROM `student`);

ALTER TABLE `attendance`
ADD CONSTRAINT `fk_attendance_student`
FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`)
ON DELETE CASCADE
ON UPDATE CASCADE;


CREATE VIEW seeAllAttendance AS
SELECT * FROM  `attendance` ;

SELECT * FROM seeAllAttendance;

CREATE VIEW Attendance_Eligibility AS
SELECT DISTINCT
    SA.student_id,
    S.name AS StudentName,
    (CASE
        WHEN SA.attendance_percentage >= 80.00 THEN 'Eligible'
        ELSE 'Not Eligible'
    END) AS eligibility
FROM
    attendance AS SA
JOIN
    student AS S ON SA.student_id = S.student_id;

SELECT * FROM Attendance_Eligibility;






