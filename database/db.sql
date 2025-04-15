DROP
DATABASE IF EXISTS `techlms`;
CREATE
DATABASE `techlms`;
USE
`techlms`;



DROP TABLE IF EXISTS `batch`;

-- Create the batch table
CREATE TABLE `batch` (
    `batch_id` INT PRIMARY KEY AUTO_INCREMENT,
    `batch_year` VARCHAR(4) NOT NULL UNIQUE,
    `current_student_semester` VARCHAR(50) NOT NULL UNIQUE
);


-- Insert batch years with specific batch_id for one of the entries
INSERT INTO `batch` (`batch_id`, `batch_year`, `current_student_semester`)
VALUES
    (1, '2020', 'l4s2'),
    (2, '2021', 'l3s2'),
    (3, '2022', 'l2s1'),
    (4, '2023', 'l1s1');




CREATE TABLE `department` (
                              `dep_id` INT AUTO_INCREMENT PRIMARY KEY,  -- Primary key
                              `dep_code` VARCHAR(10) UNIQUE,            -- Make dep_code unique
                              `DepName` VARCHAR(100) DEFAULT NULL
);


INSERT INTO `department` (`dep_id`, `dep_code`, `DepName`) VALUES
                                                               (1, 'ict', 'Information and Communication Technology'),
                                                               (2, 'bst', 'Business Studies'),
                                                               (3, 'et', 'Engineering Technology');









-- Drop the table if it exists
DROP TABLE IF EXISTS `user`;


-- Create the user table
CREATE TABLE user
(
    user_id    INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(50)  NOT NULL,
    email      VARCHAR(100) UNIQUE,
    username   VARCHAR(50)  NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    contact_no VARCHAR(15),
    role       ENUM('admin', 'lecturer', 'student', 'technical officer') NOT NULL,
    gender     CHAR(1),
    user_profile LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- Student user data insert
INSERT INTO `user` (`user_id`, `username`, `name`, `email`, `role`, `contact_no`, `password`, `gender`) 
VALUES
-- Students
(1, 'tg1062', 'D.Jamper', 'Jamper999@gmail.com', 'student', '761234654', 'dae5992a6320223d208f6277f7c1cb9e04fea726f16a1d16458963067cf7bb52', 'M'),
(2, 'tg1063', 'O.Otara87', 'otara87@gmail.com', 'student', '761234789', '06d913e979383fbec4ad1a4fed98c7af0206407a5de747adf2eaa3c968b07ab8', 'F'),
(3, 'tg1064', 'M.Manodra', 'manodra@gmail.com', 'student', '761234678', '64701c078db4c0dd283d04fa9c4d80ebb4eb919b2f83c1043dfe6eb3476ecb69', 'M'),
(4, 'tg1414', 'R.Rajapaksha', 'rajapaksha@gmail.com', 'student', '761234565', '85b408c39db526dfbfb59797ffcc5d300a874e7d1167cde9c70726f7db140e7e', 'M'),
(5, 'tg1413', 'A.Asmaakram2', 'asmaakram2@gmail.com', 'student', '761234564', '1055dd50f255c86a66ecadf4762aaca3358cfa24e4872dfe913fce2e036b09da', 'F'),
(6, 'tg1345', 'K.Kanadipudayan', 'kanadipudayan@gmail.com', 'student', '718032400', '1cbf767dcbbdd1cf3dfe005ee7eeb0d7a658685654cc2a535be32268c856a2fe', 'M'),
(7, 'tg1067', 'S.Shalini52', 'shalini52@gmail.com', 'student', '761234567', '8b20e9620a8858b94909f00f68b5c87c91c7091d5c9ffcd75a14aa9f0004ab78', 'F'),
(8, 'tg1415', 'P.Pema00', 'pema00@gmail.com', 'student', '718032468', '902237776fa6387dc42703e536b9cc68f3a8637a077ff550f70e3d9f1ec762ba', 'F'),
(9, 'tg1417', 'A.AnpuSin', 'anpuSin@gmail.com', 'student', '761234573', '7a7225adee04214c7ab27bffc4f4d77ea8b827d1ffe2f8166242c6caf36ed2fd', 'M'),
(10, 'tg1416', 'D.Dinesh', 'dinesh@gmail.com', 'student', '749900223', 'dinesh01', 'M'),
(11, 'tg1418', 'K.Kaviya', 'kaviya@gmail.com', 'student', '788765432', '499cbdc7ecd89d158fe7e4731f8943f0b0df7ed2080b28e8694e0be3393a64f1', 'F'),
(12, 'tg1419', 'D.Dhanu', 'dhanu@gmail.com', 'student', '745432188', 'b110d14482421f6d6e5afb454c4e308fae086c64a87b1966525a0ae11b23868b', 'M'),
(13, 'tg1420', 'D.Dharshi', 'dharshi@gmail.com', 'student', '751234509', 'd30a052c2cdd472d612cb4138f5b088ef94c97e6b3ffd90cea5718a1cefc854e', 'F'),
(14, 'tg1421', 'T.Thinesh', 'thinesh@gmail.com', 'student', '750987653', 'faa5f49f088dcabb4cee316f0bf24b2b49ddcdb2a87a54cd6118f1f28a58bc5d', 'M'),
(15, 'tg1422', 'A.Akram', 'akram@gmail.com', 'student', '764545456', '8c2012bcd0dabb0bcba27ab1cbb2c87b2f392486183548f0fdac95f405ed4223', 'M'),
(16, 'tg1423', 'T.Thak', 'thak@gmail.com', 'student', '761234098', '3cacb5d972d86adb6ecb75a89a58e47f1ea3eec8aaa2df826c03b4ac826c1224', 'M'),
(17, 'tg1424', 'K.Keerthan', 'keerthan@gmail.com', 'student', '789876588', '210a29ba180e17d8178c978893f1e86beba7187d5805e1d9c766e7245a9cb8f0', 'M'),
(18, 'tg1425', 'V.Madhu', 'madhu@gmail.com', 'student', '753456789', 'dcdb51b664e5dd3077bd929e41115683d36b84a7367021d228c32d1eb4621a46', 'F'),
(19, 'tg1426', 'S.Suba', 'suba@gmail.com', 'student', '747474745', 'cef9bb6c0e55d1f0fa1733a0695e055fa796476459c9534b7ce55eef729ce5c5', 'F'),
(20, 'tg1427', 'P.Praveen', 'praveen@gmail.com', 'student', '757698089', '85a9c28876bb35b406100c4cbad1636e2461acf4308033f18fca68216d2c0422', 'M'),
(21, 'tg1428', 'S.Sajeeya', 'Sajeeya@gmail.com', 'student', '718562347', '269ecb47ff8ebb12f4433c628a65a2ba5b4bf2fd24f5069c22ce0f277123761e', 'F'),
(22, 'tg1429', 'A.Asma', 'Asma@gmail.com', 'student', '768534547', '9fee23448017ed22508482bf9682107ed4fa9b58a1bf26d026dc6328ce0b5c71', 'F'),
(23, 'tg1430', 'U.Umesha', 'Umesha@gmail.com', 'student', '775340058', '4c6457f45036f181284bd111c9c0c5e2b581017b18edc71155ceda70c7c5149d', 'F'),
(24, 'tg1431', 'D.Danith', 'Danith@gmail.com', 'student', '718032400', 'a3129d8ceff0d71abb0851597f207f62e988e977f6133aac69e979d379c58159', 'M'),
(25, 'tg1432', 'D.Dasun', 'Dasun@gmail.com', 'student', '761234687', 'bdbdd2efdcfc779afa44c991daae58928cea35a53606b74516d9439f1fbc83bf', 'M');

INSERT INTO `user` (`user_id`, `username`, `name`, `email`, `role`, `contact_no`, `password`, `gender`) 
VALUES
-- Technical Officers
(26, 'tech001', 'K.Vaja', 'kavindi@gmail.com', 'technical officer', '769870000', '8d93cc2a76b00161ec7f372d7fdd1d45e5cba7d3b74cb0c068d07ff1e807ba17', 'F'),
(27, 'tech002', 'R.Raja', 'raja@gmail.com', 'technical officer', '755566799', 'feffe1e1a73b6443c229f162e1c82d82295b08ebb576068566ecc71d6efd5c4f', 'M'),
(28, 'tech003', 'K.Kamal', 'kamal@gmail.com', 'technical officer', '760987654', '4bb09b01c9012bff610927871af0ae59a6620a204efd6f2a251eb92b0a1c8d56', 'M'),
(29, 'tech004', 'V.Vihanga', 'vihanga@gmail.com', 'technical officer', '760000987', '6989c62b46aeb11517ca743a00aa38d37dce2757141353c526ee682682ccbf06', 'F'),
(30, 'tech005', 'M.Mithu', 'mithu@gmail.com', 'technical officer', '756677665', '5c3544e502ee2eb2ec924c34916c117be8d09708865b28210c74b7a1cfa7ac0a', 'M');

-- Admin user data insert
INSERT INTO `user` (`user_id`, `username`, `name`, `email`, `role`, `contact_no`, `password`, `gender`)
VALUES
-- Admin
(31, 'admin001', 'A.Admin', 'admin@gmail.com', 'admin', '700000001', 
 'dinesh01', 'm');


-- Lecturer user data insert
INSERT INTO `user` (`user_id`, `username`, `name`, `email`, `role`, `contact_no`, `password`, `gender`)
VALUES
    (32, 'l0001', 'M.Aayansah', 'aayansh@gmail.com', 'lecturer', '0712345678', 'dinesh01', 'M'),
    (33, 'l0002', 'M.Kavid', 'kavind@gmail.com', 'lecturer', '0781234567', 'dinesh02', 'M'),
    (34, 'l0003', 'M.Nadeesha', 'nadeesha@gmail.com', 'lecturer', '0745678123', '204dd7de4295107a97b4a9b1759d5ca956ac1f3b33fa31790e592f1d0260635e', 'F'),
    (35, 'l0004', 'M.Tharindu', 'tharindu@gmail.com', 'lecturer', '0712348765', '19f2e2b7340b853f3833992f5d2d9c23840d872c59975dbab98e7d87561f0981', 'M'),
    (36, 'l0005', 'M.Ishara', 'ishara@gmail.com', 'lecturer', '0787654321', '189f91ff8321b6b69430243895a2d8cba292d6854c4950be42c32138cd3f399d', 'F'),
    (37, 'l0006', 'M.Lakal', 'lakal@gmail.com', 'lecturer', '0741234567', '0b225a4da41b27d4d59441681010f95bbf9071e88cf76d72c09c4a72c4bfb988', 'M'),
    (38, 'l0007', 'M.Ruwan', 'ruwan@gmail.com', 'lecturer', '0712349876', '82d35f15bc8d4e974b2788e7ecb8655d0f2b9e586bfa34021ac0b10d0a846689', 'M'),
    (39, 'l0008', 'M.Nishan', 'nishan@gmail.com', 'lecturer', '0789123456', '9a17a599e04b0e3d430bbfe707be83f58e5400cdce2eab0b2148d328cc0d91a5', 'M'),
    (40, 'l0009', 'M.Shaneeka', 'shaneeka@gmail.com', 'lecturer', '0712346589', 'ee46b712b7c2855283e7e522b82d7a96d92a2acb8d70896f5d99007b50d6220f', 'F'),
    (41, 'l0010', 'M.Kusum', 'kusum@gmail.com', 'lecturer', '0745678901', 'fdcdcd062d7b8e5b77147cc5a02a062e7425b0710410ad9a1257f9e8b0bb04d9', 'F');

CREATE VIEW UserRoleCounts AS
SELECT 
    SUM(CASE WHEN role = 'student' THEN 1 ELSE 0 END) AS StudentCount,
    SUM(CASE WHEN role = 'lecturer' THEN 1 ELSE 0 END) AS LecturerCount,
    SUM(CASE WHEN role = 'admin' THEN 1 ELSE 0 END) AS AdminCount,
    SUM(CASE WHEN role = 'technical officer' THEN 1 ELSE 0 END) AS TechnicalOfficerCount
FROM 
    `user`;
    
    select * from UserRoleCounts;



-- Drop the student table if it already exists
DROP TABLE IF EXISTS `student`;


-- Create the student table
CREATE TABLE `student` (
    `user_id` INT PRIMARY KEY,
    `student_id` CHAR(15) NOT NULL UNIQUE,
    `department` VARCHAR(10) NOT NULL,
    `batch_year` VARCHAR(4) NOT NULL,
    CONSTRAINT fk_student_user FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
    CONSTRAINT fk_student_dept FOREIGN KEY (`department`) REFERENCES `department` (`dep_code`),
    CONSTRAINT fk_student_batch FOREIGN KEY (`batch_year`) REFERENCES `batch` (`batch_year`) ON DELETE CASCADE
);

-- Insert data into the student table with the batch_year as a foreign key
INSERT INTO `student` (`user_id`, `student_id`, `batch_year`, `department`)
VALUES
    (1, 'tg/2022/1062', '2022', 'ict'),
    (2, 'tg/2022/1063', '2022', 'ict'),
    (3, 'tg/2022/1064', '2022', 'ict'),
    (4, 'tg/2022/1414', '2022', 'ict'),
    (5, 'tg/2022/1413', '2022', 'ict'),
    (6, 'tg/2022/1345', '2022', 'ict'),
    (7, 'tg/2022/1067', '2022', 'ict'),
    (8, 'tg/2022/1415', '2022', 'ict'),
    (9, 'tg/2022/1417', '2022', 'ict'),
    (10, 'tg/2022/1416', '2022', 'ict'),
    (11, 'tg/2022/1418', '2022', 'ict'),
    (12, 'tg/2022/1419', '2022', 'ict'),
    (13, 'tg/2022/1420', '2022', 'ict'),
    (14, 'tg/2022/1421', '2022', 'ict'),
    (15, 'tg/2022/1422', '2022', 'ict'),
    (16, 'tg/2022/1423', '2022', 'ict'),
    (17, 'tg/2022/1424', '2022', 'ict'),
    (18, 'tg/2022/1425', '2022', 'ict'),
    (19, 'tg/2022/1426', '2022', 'ict'),
    (20, 'tg/2022/1427', '2022', 'ict'),
    (21, 'tg/2022/1428', '2022', 'ict'),
    (22, 'tg/2022/1429', '2022', 'ict'),
    (23, 'tg/2022/1430', '2022', 'ict'),
    (24, 'tg/2022/1431', '2022', 'ict'),
    (25, 'tg/2022/1432', '2022', 'ict');




DROP TABLE IF EXISTS `lecturer`;

CREATE TABLE IF NOT EXISTS `lecturer` (
                                          user_id      INT PRIMARY KEY,
                                          lecturer_id  CHAR(15) NOT NULL UNIQUE,
    department   VARCHAR(10) NOT NULL,  -- Change from ENUM to VARCHAR(10)
    CONSTRAINT fk_lecturer_user FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_lecturer_dept FOREIGN KEY (department) REFERENCES department(dep_code)
    );

-- Insert values for lecturers, assuming user_ids 32–41 already exist in the `user` table
INSERT INTO lecturer (user_id, lecturer_id, department) VALUES
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
                                                   user_id                INT PRIMARY KEY,
                                                   technical_Officer_id   CHAR(15) NOT NULL UNIQUE,
    department             VARCHAR(10) NOT NULL,  -- Change from ENUM to VARCHAR(10)
    CONSTRAINT fk_technical_officer_user FOREIGN KEY (user_id)
    REFERENCES user(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_technical_Officer_dept FOREIGN KEY (department) REFERENCES department(dep_code)
    );

-- Insert values for technical officers
INSERT INTO `technical_Officer` (user_id, technical_Officer_id, department) VALUES
                                                                                (26, 'tech001', 'ict'),
                                                                                (27, 'tech002', 'ict'),
                                                                                (28, 'tech003', 'ict'),
                                                                                (29, 'tech004', 'ict'),
                                                                                (30, 'tech005', 'ict');



DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
                         user_id   INT PRIMARY KEY,
                         admin_id  CHAR(15) UNIQUE,
                         CONSTRAINT fk_admin_user FOREIGN KEY (user_id)
                             REFERENCES user(user_id) ON DELETE CASCADE
);

INSERT INTO `admin` (user_id, admin_id) VALUES
    (31, 'admin001');






DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
                          `course_id` INT AUTO_INCREMENT PRIMARY KEY,
                          `course_code` VARCHAR(10) NOT NULL UNIQUE,
                          `dep_code` VARCHAR(10),
                          `name` VARCHAR(100),
                          `credit` INT,
                          `week` VARCHAR(20),
                          `course_semester` VARCHAR(50),
                          `course_image` LONGBLOB

);

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
                          `course_id` INT AUTO_INCREMENT PRIMARY KEY,
                          `course_code` VARCHAR(10) NOT NULL UNIQUE,
                          `dep_code` VARCHAR(10),
                          `name` VARCHAR(100),
                          `credit` INT,
                          `week` VARCHAR(20),
                          `course_semester` VARCHAR(5),
                          `course_image` LONGBLOB

);

INSERT INTO `course`(`course_id`, `course_code`, `dep_code`, `name`, `credit`, `week`, `course_image`, `course_semester`)
VALUES
    (1, 'ict2113', 'ict', 'Data Structures and Algorithms', 3, '15', null, 'l2s1'),
    (2, 'ict2133', 'ict', 'E-Commerce Implementation, Management and Security', 3, '15', null, 'l2s1'),
    (3, 'ict2122', 'ict', 'Object Oriented Analysis and Design', 2, '15', null, 'l2s1'),
    (4, 'ict2142', 'ict', 'Object Oriented Programming Practicum', 2, '15', null, 'l2s1'),
    (5, 'ict2152', 'ict', 'Object Oriented Programming', 2, '15', null, 'l2s1'),
    (6, 'ict1023', 'ict', 'Web technologies', 2, '15', null, 'l1s1'),
    (7, 'ict1033', 'ict', 'Multimedia technology', 2, '15', null, 'l1s1'),
    (8, 'ict1043', 'ict', 'Database management systems', 3, '15', null, 'l1s1'),
    (9, 'ict1045', 'ict', 'Computer networks', 2, '15', null, 'l1s1'),
    (10, 'ict1034', 'ict', 'Server side scripting', 2, '15', null, 'l1s1'),
    (11, 'ict3014', 'ict', 'Advance programming', 4, '15', null, 'l3s1'),
    (12, 'ict3012', 'ict', 'Advance database management system', 4, '15', null, 'l3s1'),
    (13, 'ict3031', 'ict', 'Operating system', 2, '15', null, 'l3s1'),
    (14, 'ict4021', 'ict', 'Software development', 4, '15', null, 'l4s1');

select * from course;







DROP TABLE IF EXISTS `medical`;
CREATE TABLE `medical` (
                           `medical_id` INT PRIMARY KEY AUTO_INCREMENT,
                           `student_username` VARCHAR(50),
                           `medical_data` LONGBLOB,
                           `medical_start_date` DATE NOT NULL,
                           `medical_end_date` DATE NOT NULL
);

-- Corrected INSERT statements with unique medical_id values and valid date format
INSERT INTO `medical` (`medical_id`, `student_username`, `medical_start_date`, `medical_end_date`) VALUES
                                                                                                       (1, 'tg1416', '2025-03-04', '2025-06-04'),
                                                                                                       (2, 'tg1415', '2025-03-05', '2025-09-04'),
                                                             (3, 'tg1413', '2025-03-03', '2025-06-03');
DROP TABLE IF EXISTS `timetable_entry`;      
CREATE TABLE timetable_entry (
    entry_id INT AUTO_INCREMENT PRIMARY KEY,
    batch_name VARCHAR(5),
    course_code CHAR(10),
    day_of_week ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    location VARCHAR(100)
);



INSERT INTO timetable_entry (batch_name, course_code, day_of_week, start_time, end_time, location) 
VALUES 
-- Batch 2023
('2023', 'TMS1113', 'Monday', '08:00:00', '10:00:00', 'LH 250'),
('2023', 'ICT1142', 'Tuesday', '10:00:00', '12:00:00', 'ICT Lab 11'),
('2023', 'ENG1114', 'Wednesday', '13:00:00', '15:00:00', 'ICT'),
('2023', 'ICT1132', 'Thursday', '15:00:00', '16:00:00', 'ICT Lab 11'),
('2023', 'ICT1191', 'Friday', '16:00:00', '17:00:00', 'ICT Lab 10'),

-- Batch 2022
('2022', 'ICT2113', 'Monday', '08:00:00', '10:00:00', 'ICT Lab 11'),
('2022', 'TCS2121', 'Tuesday', '10:00:00', '12:00:00', 'Lecture Hall 7001'),
('2022', 'ICT2122', 'Wednesday', '13:00:00', '14:00:00', 'ICT Lab 12'),
('2022', 'TCS2112', 'Thursday', '14:00:00', '15:00:00', 'ILT'),
('2022', 'ICT2141', 'Friday', '15:00:00', '17:00:00', 'ICT Lab 11'),

-- Batch 2021
('2021', 'ICT3112', 'Monday', '08:00:00', '10:00:00', 'ICT Lab 12'),
('2021', 'ICT3133', 'Tuesday', '10:00:00', '12:00:00', 'ILT'),
('2021', 'ICT3162', 'Wednesday', '13:00:00', '14:00:00', 'ICT Lab 12'),
('2021', 'ICT3171', 'Thursday', '14:00:00', '15:00:00', 'ICT Lab 11'),
('2021', 'ICT3183', 'Friday', '15:00:00', '17:00:00', 'ICT Workshop Lab'),

-- Batch 2020
('2020', 'ICT4163', 'Monday', '08:00:00', '10:00:00', 'ICT New Lab'),
('2020', 'ICT4010', 'Tuesday', '10:00:00', '12:00:00', 'ICT Hardware Lab'),
('2020', 'ICT4133', 'Wednesday', '13:00:00', '15:00:00', 'ICT New Lab'),
('2020', 'ICT4153', 'Thursday', '15:00:00', '16:00:00', 'ICT New Lab'),
('2020', 'ICT4142', 'Friday', '16:00:00', '17:00:00', 'ICT New Lab');

SELECT 
    batch_name, 
    day_of_week, 
    MIN(start_time) AS start_time, 
    MAX(end_time) AS end_time, 
    GROUP_CONCAT(DISTINCT course_code SEPARATOR ', ') AS course_codes, 
    location
FROM timetable_entry
GROUP BY batch_name, day_of_week, location;



DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
                           `notice_id` INT PRIMARY KEY AUTO_INCREMENT,
                           `admin_username` VARCHAR(50),
                           `notice_name` VARCHAR(255),
                           `notice_title`  VARCHAR(255),
                           `notice_data` LONGBLOB,
                           `medical_create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS `course_material`;
CREATE TABLE course_material (
    material_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id VARCHAR(10) NOT NULL,
    lecture_title VARCHAR(100) NOT NULL,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resource LONGBLOB
);


--     (1, 'ict2113', 'ict', 'Data Structures and Algorithms', 3, '15', null, 'l2s1'),
--     (2, 'ict2133', 'ict', 'E-Commerce Implementation, Management and Security', 3, '15', null, 'l2s1'),
--     (3, 'ict2122', 'ict', 'Object Oriented Analysis and Design', 2, '15', null, 'l2s1'),
--     (4, 'ict2142', 'ict', 'Object Oriented Programming Practicum', 2, '15', null, 'l2s1'),
--     (5, 'ict2152', 'ict', 'Object Oriented Programming', 2, '15', null, 'l2s1'),
-- ict2142

INSERT INTO `course_material`(material_id, course_id, lecture_title) VALUES
-- ict2113
(1, 'ict2113', 'Introduction'),
(2, 'ict2113', 'Lecture1 DSA'),
(3, 'ict2113', 'Lecture2 stacks'),
(4, 'ict2113', 'Lecture3 Linked List complete 2025'),
(5, 'ict2113', 'Lecture4 queue 2025'),
(6, 'ict2113', 'Lecture5 Trees 2025'),
(7, 'ict2113', 'Lecture6 Tree part2'),
(8, 'ict2113', 'Lecture7 Tree part2'),
(9, 'ict2113', 'Lecture9 AVL trees 2025'),
(10, 'ict2113', 'Lecture9 Tree and algorithm 2025'),

-- ict2133
(11, 'ict2133', 'Lecture01 Introduction'),
(12, 'ict2133', 'Lecture02 Overview'),
(13, 'ict2133', 'Lecture03 Advanced Topics'),
(14, 'ict2133', 'Lecture04 Security Aspects'),
(15, 'ict2133', 'Lecture05 Implementation Details'),
(16, 'ict2133', 'Lecture06 Management Techniques'),

-- ict2122
(17, 'ict2122', 'Lecture01 Introduction to OOAD'),
(18, 'ict2122', 'Lecture02 Use Cases and UML Diagrams'),
(19, 'ict2122', 'Lecture03 Class Diagrams'),
(20, 'ict2122', 'Lecture04 Object Interaction'),
(21, 'ict2122', 'Lecture05 Patterns in OOAD'),
(22, 'ict2122', 'Lecture06 Design Principles'),

-- ict2142
(23, 'ict2142', 'Lecture01 Introduction to OOP Practicum'),
(24, 'ict2142', 'Lecture02 Programming Basics'),
(25, 'ict2142', 'Lecture03 Classes and Objects'),
(26, 'ict2142', 'Lecture04 Inheritance and Polymorphism'),
(27, 'ict2142', 'Lecture05 Exception Handling'),
(28, 'ict2142', 'Lecture06 Advanced Topics'),

-- ict2152
(29, 'ict2152', 'Lecture01 Introduction to OOP'),
(30, 'ict2152', 'Lecture02 Fundamentals of OOP'),
(31, 'ict2152', 'Lecture03 Classes and Methods'),
(32, 'ict2152', 'Lecture04 Data Structures in OOP'),
(33, 'ict2152', 'Lecture05 Object Lifecycle'),
(34, 'ict2152', 'Lecture06 Advanced Concepts in OOP');



select * from  `course_material`;















DROP TABLE IF EXISTS course_enrollment;
CREATE TABLE course_enrollment (
                                   id INT AUTO_INCREMENT PRIMARY KEY,
                                   student_id CHAR(15),
                                   course_code VARCHAR(10),
                                   registered_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                   department CHAR(10),
                                   enrolled BOOLEAN DEFAULT FALSE,  -- Setting the default value of 'enrolled' to FALSE
                                   CONSTRAINT fk_course_enrollment_student FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
                                   CONSTRAINT fk_course_enrollment_course FOREIGN KEY (course_code) REFERENCES course(course_code) ON DELETE CASCADE
);



INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1062', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1062', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1062', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1062', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1062', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1063', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1063', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1063', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1063', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1063', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1064', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1064', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1064', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1064', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1064', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1414', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1414', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1414', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1414', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1414', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1413', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1413', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1413', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1413', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1413', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1345', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1345', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1345', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1345', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1345', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1067', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1067', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1067', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1067', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1067', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1415', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1415', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1415', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1415', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1415', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1417', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1417', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1417', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1417', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1417', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1416', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1416', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1416', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1416', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1416', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1418', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1418', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1418', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1418', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1418', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1419', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1419', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1419', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1419', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1419', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1420', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1420', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1420', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1420', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1420', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1421', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1421', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1421', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1421', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1421', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1422', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1422', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1422', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1422', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1422', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1423', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1423', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1423', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1423', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1423', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1424', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1424', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1424', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1424', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1424', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1425', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1425', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1425', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1425', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1425', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1426', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1426', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1426', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1426', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1426', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1427', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1427', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1427', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1427', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1427', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1428', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1428', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1428', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1428', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1428', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1429', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1429', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1429', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1429', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1429', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1430', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1430', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1430', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1430', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1430', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1431', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1431', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1431', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1431', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1431', 'ict2152', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1432', 'ict2113', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1432', 'ict2133', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1432', 'ict2122', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1432', 'ict2142', 'ict', TRUE);
INSERT INTO course_enrollment (student_id, course_code, department, enrolled) VALUES ('tg/2022/1432', 'ict2152', 'ict', TRUE);

CREATE TABLE lecturing (
                           teach_id INT AUTO_INCREMENT PRIMARY KEY,    -- Auto-incrementing primary key for teach_id
                           course_id CHAR(10),                         -- course_id column with CHAR(10)
                           lecturer_id CHAR(15),                       -- lecturer_id column with CHAR(15)
                           CONSTRAINT fk_teaching_course FOREIGN KEY (course_id) REFERENCES course(course_code) ON DELETE CASCADE,  -- Foreign key for course_code
                           CONSTRAINT fk_teaching_lecture FOREIGN KEY (lecturer_id) REFERENCES lecturer(lecturer_id) ON DELETE CASCADE  -- Foreign key for lecturer_id
);


INSERT INTO lecturing(course_id, lecturer_id) VALUES
                                                  ('ict2142', 'l0001'),
                                                  ('ict2152', 'l0001'),
                                                  ('ict1043', 'l0001'),
                                                  ('ict3014', 'l0001'),
                                                  ('ict4021', 'l0001'),
                                                  ('ict2133', 'l0002'),
                                                  ('ict1045', 'l0002'),
                                                  ('ict3031', 'l0002'),
                                                  ('ict2122', 'l0003'),
                                                  ('ict2113', 'l0004'),
                                                  ('ict1033', 'l0005');
SELECT * from lecturing;
select * from course;







select * from course_enrollment;




DROP TABLE IF EXISTS `medical`;

CREATE TABLE `medical` (
    `medical_id` INT PRIMARY KEY AUTO_INCREMENT,
    `student_id` VARCHAR(15),
    `medical_data` LONGBLOB,
    `medical_start_date` DATE NOT NULL,
    `medical_end_date` DATE NOT NULL
);

INSERT INTO `medical` (`student_id`, `medical_start_date`, `medical_end_date`) VALUES
    ('tg1416', '2025-03-04', '2025-06-04'),
    ('tg1415', '2025-03-05', '2025-09-04');


DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
 `notice_id` INT PRIMARY KEY AUTO_INCREMENT,
 `admin_username` VARCHAR(50),
 `notice_name` VARCHAR(255),
 `notice_title`  VARCHAR(255),
 `notice_data` LONGBLOB,
 `medical_create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from `notices`;
-- '1', 'tg/2022/1062', 'ict2113', '2025-01-01', '2022', 'ICT', 'Absent'-- 




-- Drop the table if it already exists
DROP TABLE IF EXISTS `attendance`;


-- Create the attendance table
CREATE TABLE `attendance` (
    `att_id` INT PRIMARY KEY AUTO_INCREMENT,
    `student_id` CHAR(15) NOT NULL,
    `course_code` VARCHAR(10) NOT NULL,
    `attendance_date` DATE DEFAULT NULL,
    `batch` VARCHAR(20) DEFAULT NULL,
    `department` VARCHAR(50) NOT NULL,
	status VARCHAR(10) DEFAULT 'Pending',
    CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_course_code` FOREIGN KEY (`course_code`) REFERENCES `course`(`course_code`) ON DELETE CASCADE
);
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2142', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1063', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1064', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2113', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1414', 'ict2152', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2133', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2142', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1413', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1345', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1067', 'ict2152', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1415', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2142', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1417', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1416', 'ict2152', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1418', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1419', 'ict2152', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2122', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1420', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2113', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1421', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2142', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1422', 'ict2152', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2122', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1423', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1424', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1425', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2133', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1426', 'ict2152', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2122', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1427', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2113', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2133', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2142', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1428', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2122', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1429', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-03-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-02-05', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2142', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1430', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2113', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2133', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-02-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1431', 'ict2152', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-02-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2113', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-03-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2133', '2025-04-09', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-01-15', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-01-22', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-01-29', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2122', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-01-01', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-01-08', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-02-26', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-03-12', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-03-19', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-04-02', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2142', '2025-04-09', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-01-01', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-01-08', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-01-15', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-01-22', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-01-29', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-02-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-02-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-02-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-02-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-03-05', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-03-12', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-03-19', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-03-26', '2022', 'ict', 'present');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-04-02', '2022', 'ict', 'absent');
INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1432', 'ict2152', '2025-04-09', '2022', 'ict', 'present');
select * from `attendance`;











select * from student;




select * from medical;

























select *  from batch;
select * from student;

SELECT `name` 
FROM `course` 
WHERE `course_semester` IN (
    SELECT `current_student_semester` 
    FROM `batch` 
    WHERE `batch_year` = '2022'
) 
AND `dep_code` = 'bst';



select * from course;

select * from student;





select * from `attendance`;






