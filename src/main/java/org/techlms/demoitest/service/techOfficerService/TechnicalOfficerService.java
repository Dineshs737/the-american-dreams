package org.techlms.demoitest.service.techOfficerService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.model.course.Course;
import org.techlms.demoitest.model.util.Attendance;
import org.techlms.demoitest.model.util.Batch;
import org.techlms.demoitest.model.util.Medical;
import org.techlms.demoitest.model.util.TimeTable;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TechnicalOfficerService {
private  final Connection con = DBConnection.getConnection();


    // course name
    //batch available
    //
    public List<String> getCourseNamesByBachYear(String year , String department) {
        List<String> courseNames = new ArrayList<String>();

        try {
            String sql = "SELECT name  FROM course WHERE course_semester IN (SELECT current_student_semester FROM batch WHERE batch_year = ?) AND dep_code = ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, year);
            ps.setString(2, department.toLowerCase());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                courseNames.add(rs.getString(1));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courseNames;
    }

    public String getCourseNameByCourseCode(String courseCode) {
        String courseName = null;
        try{
            PreparedStatement ps = con.prepareStatement("select name from course where course_code = ? ;");
            ps.setString(1,courseCode);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                courseName = rs.getString(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return courseName;
    }

    /**********
     *
     * batch_id, batch_year, current_student_semester
     * 1,2020,l4s2
     * 2,2021,l3s2
     * 3,2022,l2s1
     * 4,2023,l1s1
     */


// select course_code  , name , credit , course_semester , course_image  from course;
    public List<Batch> getAllBatchYearsAndSemester(){

        List<Batch> courseYear = new ArrayList<Batch>();

        try{
            String sql = "select `batch_year` , current_student_semester from `batch`;";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                courseYear.add(new Batch(rs.getString(1),rs.getString(2)));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return courseYear;


    }

    // load batch selection box data
    // OUTDO : important we will create batch class and object

// select course_code  , name , credit , course_semester , course_image  from course;
    public List<Course> getAllCourseByYearsAndDepartment(String year , String department) {

        List<Course> courseYear = new ArrayList<Course>();

        try {
            String sql = "select course_code  , name , credit , course_semester , course_image  from course where course_semester = (select  current_student_semester  from batch where batch_year = ?) and dep_code = ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, year);
            ps.setString(2, department.toLowerCase());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                courseYear.add(new Course(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getBytes(5)
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return courseYear;
    }

    public List<Attendance> getAttendanceById(String courseCode) {

        List<Attendance> attendances = new ArrayList<Attendance>();
        String sql = """
                SELECT  `course_code` , `student_id` ,    SUM(CASE WHEN status = 'present' THEN 1 ELSE 0 END) AS present_count ,  COUNT(`att_id`) AS total_attendance FROM
                `attendance`  WHERE  `course_code` = ? GROUP BY `student_id`;
                """;
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, courseCode);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                System.out.println(rs.getString(1));
                attendances.add(new Attendance(rs.getString(1), rs.getString(2), rs.getDouble(3),rs.getDouble(4)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }



        return attendances;
    }

    public String getCourseCodeByCourseName(String courseName) {
        String courseCode = null;
        try{
            PreparedStatement ps = con.prepareStatement("select course_code from course where  name = ?;");
            ps.setString(1,courseName);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                courseCode = rs.getString(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return courseCode;
    }


    public String getStudentNameByStudentId(String studentID) {
        String studentName = null;
        try{
            String sql = "select name from user where user_id = (select user_id from student where student_id = ?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, studentID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                studentName = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return studentName;
    }


    public List<String> getBatchYears(){

        List<String> courseYear = new ArrayList<String>();
        try{
            String sql = "select `batch_year` from `batch`;";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                courseYear.add(rs.getString(1));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return courseYear;


    }


    // important must check department
    public List<Medical> getALlMedicals(){

        List<Medical> medicals = new ArrayList<Medical>();
        try{
            String sql = "select `medical_id` , `student_id` , `batch` ,`medical_start_date` , `medical_end_date` , `medical_data`   from medical;";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            /********
             *
             *     public Medical(int medicalId, String studentId, String batch, String medicalStartDate, String medicalEndDate, byte[] medicalData) {
             *         this.medicalId = medicalId;
             *         this.studentId = studentId;
             *         this.batch = batch;
             *         this.medicalStartDate = medicalStartDate;
             *         this.medicalEndDate = medicalEndDate;
             *         this.medicalData = medicalData;
             *     }
             *
             *
             */

            while(rs.next()){
                medicals.add(new Medical(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4).toString(),
                        rs.getDate(5).toString(),
                        rs.getBytes(6)
                ));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return medicals;


    }


    public List<Medical> getALlMedicals(String batchYear) {

        List<Medical> medicals = new ArrayList<Medical>();
        try{
            String sql = "select `medical_id` , `student_id` , `batch` ,`medical_start_date` , `medical_end_date` , `medical_data`   from medical where batch = ? ;";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, batchYear);
            ResultSet rs = ps.executeQuery();
            /********
             *
             *     public Medical(int medicalId, String studentId, String batch, String medicalStartDate, String medicalEndDate, byte[] medicalData) {
             *         this.medicalId = medicalId;
             *         this.studentId = studentId;
             *         this.batch = batch;
             *         this.medicalStartDate = medicalStartDate;
             *         this.medicalEndDate = medicalEndDate;
             *         this.medicalData = medicalData;
             *     }
             *
             *
             */

            while(rs.next()){
                medicals.add(new Medical(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4).toString(),
                        rs.getDate(5).toString(),
                        rs.getBytes(6)
                ));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return medicals;


    }
    /*********
     *
     *
     *
     * VALIDATE STUDENT ID AND COURSE CODE FOR ATTENDANCE
     *
     *
     */

    public boolean validateStudentId(String studentId, String courseCode) {
        try {
            String sql = "SELECT COUNT(*) FROM course_enrollment WHERE student_id = ? AND course_code = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, studentId);
            ps.setString(2, courseCode);

            System.out.println("Executing query: " + ps); // debug
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                System.out.println("Validation successful.");
                return true;
            } else {
                System.out.println("Validation failed: No record found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    /********
     *
     public Attendance(String studentId, String courseId, String attendanceDate, String batch, String department, String status) {
     this.studentId = studentId;
     this.courseId = courseId;
     this.attendanceDate = attendanceDate;
     this.batch = batch;
     this.department = department;
     this.status = status;
     }
     */

    public void saveStudentAttendance(Attendance attendance) {
        try{
//            INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES ('tg/2022/1062', 'ict2113', '2025-01-01', '2022', 'ict', 'present');
           String  sql = "INSERT INTO attendance (student_id, course_code, attendance_date, batch, department, status) VALUES (?, ?, ?, ?, ?, ?);";

           con.setAutoCommit(false);

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, attendance.getStudentId());
            ps.setString(2,attendance.getCourseId());
            ps.setString(3,attendance.getAttendanceDate().toString());
            ps.setString(4,attendance.getBatch());
            ps.setString(5,attendance.getDepartment());
            ps.setString(6,attendance.getStatus());
            ps.executeUpdate();
            con.commit();
//            con.setAutoCommit(true);
            System.out.println("Attendance saved successfully");
            con.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    /********
     *
     *
     *
     * update student  attendance
     *
     *
     */


    public Attendance getStudentAttendance(String studentId , String date , String courseCode) {
//        select `student_id` ,`course_code` , `attendance_date` , `batch` ,  `department` , status  from `attendance` where `student_id` = 'tg/2022/1415' AND course_code = 'ict2113' AND attendance_date = '2025-04-16'  ;
        Attendance attendance = null;
        try{

            String sql = "select `student_id` ,`course_code` , `attendance_date` , `batch` ,  `department` , status  from `attendance` where `student_id` = ? AND course_code = ? AND attendance_date = ?  ;";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, studentId);
            ps.setString(2, courseCode);
            ps.setDate(3, Date.valueOf(date));
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                attendance = new Attendance(rs.getString(1),rs.getString(2),rs.getDate(3).toString(),rs.getString(4),rs.getString(5),rs.getString(6));

            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return attendance;
    }



    public boolean updateStudentAttendance(Attendance oldAttendance , Attendance newAttendance ) {
        System.out.println("updating attendance");
        try{
            con.setAutoCommit(false);

            /***********
             * set student attendance to database
             *
             * pass data to this attendance object
             *
             *   public Attendance(String studentId, String courseId, String attendanceDate, String batch, String department, String status) {
             *         this.studentId = studentId;
             *         this.courseId = courseId;
             *         this.attendanceDate = attendanceDate;
             *         this.batch = batch;
             *         this.department = department;
             *         this.status = status;
             *     }
             *
             *
             */
            String sql = """
                    UPDATE attendance
                    SET
                        student_id = ?,
                        course_code = ?,
                        attendance_date = ?,
                        batch = ?,
                        department = ?,
                        status = ?
                    
                    WHERE
                        student_id = ?
                        AND course_code = ?
                        AND attendance_date = ?;
                    """;
            PreparedStatement ps = con.prepareStatement(sql);
            /***************************************        NEW ATTENDANCE DATA                     ***********/
           ps.setString(1, newAttendance.getStudentId().toLowerCase());
           ps.setString(2, newAttendance.getCourseId().toLowerCase());
           ps.setString(3, newAttendance.getAttendanceDate().toString());
           ps.setString(4, newAttendance.getBatch());
           ps.setString(5, newAttendance.getDepartment());
           ps.setString(6, newAttendance.getStatus().toLowerCase());

           /***************************************************       OLD ATTENDANCE DATA       ****************/

            ps.setString(7, oldAttendance.getStudentId().toLowerCase());
            ps.setString(8, oldAttendance.getCourseId().toLowerCase());
            ps.setString(9, oldAttendance.getAttendanceDate().toString());

            System.out.println(ps); // debug

            if(ps.executeUpdate() > 0){
                System.out.println("Attendance updated successfully");
                con.commit();
//                con.setAutoCommit(true);
                return true;
            }

            con.close();

        }catch (SQLException e){
            e.printStackTrace();
        }

        return false;

    }


    /******************
     * STUDENT MEDICAL
     *
     *
     */

    public boolean studentVaidate(String studentId , String batchYear ,String department){
        try{
            String sql = "select count(user_id) from student where student_id = ? AND batch_year = ? AND `department` = ? ;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,studentId);
            ps.setString(2,batchYear);
            ps.setString(3,department);
            ResultSet rs = ps.executeQuery();
            if(rs.next() && rs.getInt(1) > 0){
                return true;
            }

        }catch (SQLException e){
            e.printStackTrace();

        }
        return  false;
    }

    /*************
     *
     *
     *
     */

    public boolean submitMedical(Medical medical) {
        Connection con = DBConnection.getConnection();
        try {
            con.setAutoCommit(false);
            String q = "INSERT INTO `medical`(`student_id` , `batch`,department ,`medical_start_date` ,`medical_end_date` ,`medical_data`   ) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(q);

            /*************
             *
             *     public Medical(String studentId, String batch, String medicalStartDate, String medicalEndDate, byte[] medicalData) {
             *         this.studentId = studentId;
             *         this.batch = batch;
             *         this.medicalStartDate = medicalStartDate;
             *         this.medicalEndDate = medicalEndDate;
             *         this.medicalData = medicalData;
             *
             -- Updated table structure
             DROP TABLE IF EXISTS `medical`;
             CREATE TABLE `medical` (
             `medical_id` INT PRIMARY KEY AUTO_INCREMENT,
             `student_id` VARCHAR(15),
             `medical_data` LONGBLOB,
             `medical_start_date` DATE NOT NULL,
             `medical_end_date` DATE NOT NULL,
             `batch` VARCHAR(10)
             );

             *     }
             */

//            String q = "INSERT INTO `medical`(`student_id` , `batch`, `medical_start_date` ,`medical_end_date` ,`medical_data`   ) VALUES (?,?,?,?,?)";
            ps.setString(1, medical.getStudentId());
            ps.setString(2, medical.getBatch());
            ps.setString(3, medical.getDepartment());
            ps.setDate(4, Date.valueOf(medical.getMedicalStartDate()));
            ps.setDate(5, Date.valueOf(medical.getMedicalEndDate()));
            ps.setBytes(6, medical.getMedicalData());

         if(ps.executeUpdate() > 0){
             con.commit();
             con.setAutoCommit(true);
             return true;
         }
            // Execute the insert query
            ps.executeUpdate();
            System.out.println("Medical data inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error saving medical data: " + e.getMessage());
        }
        return false;
    }


    public boolean isMedicalExists(String studentId  ,String department ,String startDate  , String endDate){
        try{
            String sql = """
                    SELECT COUNT(medical_id)
                    FROM `medical`
                    WHERE student_id = ?
                      AND department = ?
                      AND medical_start_date = ?
                      AND medical_end_date = ?
                    
                    """;

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,studentId.toLowerCase().trim());
            ps.setString(2,department.toLowerCase().trim());
            ps.setDate(3, Date.valueOf(startDate.toString().trim()));
            ps.setDate(4, Date.valueOf(endDate.toString().trim()));

            System.out.println(ps);
            ps.executeQuery();
            ResultSet rs = ps.executeQuery();
            if(rs.next() && rs.getInt(1) > 0){
                return true;
            }
        }catch (SQLException e){
            e.printStackTrace();

        }
        return false;
    }


    public Medical getMedicalData(String studentId  ,String department , String startDate , String endDate){
        Medical medical = null;
        try{

            /*************
             *
             *     public Medical(String studentId, String batch, String medicalStartDate, String medicalEndDate, byte[] medicalData) {
             *         this.studentId = studentId;
             *         this.batch = batch;
             *         this.medicalStartDate = medicalStartDate;
             *         this.medicalEndDate = medicalEndDate;
             *         this.medicalData = medicalData;
             *
             -- Updated table structure
             DROP TABLE IF EXISTS `medical`;
             CREATE TABLE `medical` (
             `medical_id` INT PRIMARY KEY AUTO_INCREMENT,
             `student_id` VARCHAR(15),
             `medical_data` LONGBLOB,
             `medical_start_date` DATE NOT NULL,
             `medical_end_date` DATE NOT NULL,
             `batch` VARCHAR(10)
             );
             */
            String sql = """
                    
                    SELECT
                        `student_id`,
                        `batch`,
                        `department`,
                        `medical_start_date`,
                        `medical_end_date`,
                        `medical_data`
                    FROM
                        `medical`
                    WHERE
                        `student_id` = ?
                        AND department = ?
                        AND `medical_start_date` = ?
                        AND `medical_end_date` = ?;
                    
                    
                    """;
            PreparedStatement ps  = con.prepareStatement(sql);
            ps.setString(1,studentId.toLowerCase());
            ps.setString(2,department.toLowerCase());
            ps.setDate(3, Date.valueOf(startDate.toString()));
            ps.setDate(4, Date.valueOf(endDate.toString()));

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                /*************
                 *
                 *     public Medical(String studentId, String batch, String medicalStartDate, String medicalEndDate, byte[] medicalData) {
                 *         this.studentId = studentId;
                 *         this.batch = batch;
                 *         this.medicalStartDate = medicalStartDate;
                 *         this.medicalEndDate = medicalEndDate;
                 *         this.medicalData = medicalData;
                 */
                medical = new Medical(
                        rs.getString(1).toLowerCase(),
                        rs.getString(2).toLowerCase(),
                        rs.getString(3).toLowerCase(),
                        rs.getDate(4).toString(),
                        rs.getDate(5).toString(),
                        rs.getBytes(6)
                );
            }


        }catch (SQLException e){
            e.printStackTrace();
        }
        return medical;
    }

    public boolean updateStudentMedicalRecord(Medical oldMedical, Medical newMedical) {
        System.out.println("Updating medical record...");
        String sql = """
        UPDATE `medical`
        SET
            student_id = ?,
            `batch` = ?,
            department = ?,
            `medical_start_date` = ?,
            `medical_end_date` = ?,
            `medical_data` = ?
        WHERE
            student_id = ?
            AND `medical_start_date` = ?
            AND `medical_end_date` = ?
            AND department = ?;
    """;

        boolean originalAutoCommit = true;

        try {
            // Save the original auto-commit state
            originalAutoCommit = con.getAutoCommit();
            con.setAutoCommit(false);

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                // Bind new medical data
                ps.setString(1, newMedical.getStudentId().toLowerCase());
                ps.setString(2, newMedical.getBatch());
                ps.setString(3, newMedical.getDepartment());
                ps.setDate(4, Date.valueOf(newMedical.getMedicalStartDate()));
                ps.setDate(5, Date.valueOf(newMedical.getMedicalEndDate()));
                ps.setBytes(6, newMedical.getMedicalData());

                // Bind old medical data
                ps.setString(7, oldMedical.getStudentId().toLowerCase());
                ps.setDate(8, Date.valueOf(oldMedical.getMedicalStartDate()));
                ps.setDate(9, Date.valueOf(oldMedical.getMedicalEndDate()));
                ps.setString(10, oldMedical.getDepartment());

                // Debugging parameters
                System.out.println("Executing query: " + ps.toString());

                // Execute update
                if (ps.executeUpdate() > 0) {
                    System.out.println("Medical record updated successfully.");
                    con.commit();
                    return true;
                } else {
                    System.out.println("No records updated.");
                    con.rollback();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                con.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                // Restore the original auto-commit state
                con.setAutoCommit(originalAutoCommit);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return false;
    }

    /**************
     *
     * technical officer timetable method
     * @param batchYear
     * @param department
     * @return
     */

    public List<TimeTable> getTimeTable(String batchYear , String department){
        Connection con = DBConnection.getConnection();
        List<TimeTable> timeTableList = new ArrayList<TimeTable>();
        String sql = """
                SELECT
                      time_slot,
                      GROUP_CONCAT(CASE WHEN day_of_week = 'monday' THEN CONCAT(course_code, ' (', course_type, ')') END) AS Monday,
                      GROUP_CONCAT(CASE WHEN day_of_week = 'tuesday' THEN CONCAT(course_code, ' (', course_type, ')') END) AS Tuesday,
                      GROUP_CONCAT(CASE WHEN day_of_week = 'wednesday' THEN CONCAT(course_code, ' (', course_type, ')') END) AS Wednesday,
                      GROUP_CONCAT(CASE WHEN day_of_week = 'thursday' THEN CONCAT(course_code, ' (', course_type, ')') END) AS Thursday,
                      GROUP_CONCAT(CASE WHEN day_of_week = 'friday' THEN CONCAT(course_code, ' (', course_type, ')') END) AS Friday
                  FROM timetable
                  WHERE batch = ? AND department = ?
                  GROUP BY time_slot
                  ORDER BY
                      CASE
                          WHEN time_slot = '06:00-08:00' THEN 1
                          WHEN time_slot = '08:00-10:00' THEN 2
                          WHEN time_slot = '10:00-12:00' THEN 3
                          WHEN time_slot = '12:00-14:00' THEN 4
                          WHEN time_slot = '14:00-16:00' THEN 5
                          WHEN time_slot = '16:00-18:00' THEN 6
                          ELSE 7
                      END;
                """;

        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,batchYear);
            ps.setString(2,department);
            ResultSet rs = ps.executeQuery();

            /****
             *
             *     public TimeTable(String timeSlot, String monday, String tuesday, String wednesday, String thursday, String friday) {
             *         this.timeSlot = timeSlot;
             *         this.monday = monday;
             *         this.tuesday = tuesday;
             *         this.wednesday = wednesday;
             *         this.thursday = thursday;
             *         this.friday = friday;
             *     }
             */
            while(rs.next()){
                timeTableList.add(new TimeTable(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                ));

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return  timeTableList;
    }

    public String getLecturerNameByCourseCode(String courseCode) {
        System.out.println(courseCode);
        String lecturerName = "";
        try{
            PreparedStatement ps = con.prepareStatement("select name from user where user_id  = (select user_id from lecturer where lecturer_id = (select lecturer_id from lecturing where course_id = ?))");
            ps.setString(1,courseCode);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                lecturerName = rs.getString(1);
                System.out.println(lecturerName);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
//        System.out.println("WDddddd");
        return lecturerName;
    }


//    public ObservableList<TimetableRow> getTimeTable(String batchYear , String department){
//        Connection con = DBConnection.getConnection();
//        ObservableList<TimetableRow> data = FXCollections.observableArrayList();
//        String sql = """
//            SELECT time_slot, day_of_week, course_code, course_type
//            FROM timetable
//            WHERE batch = ? AND department = ?
//            ORDER BY time_slot, day_of_week;
//                """;
//
//        try{
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1,batchYear);
//            ps.setString(2,department);
//            ResultSet rs = ps.executeQuery();
//
//            /****
//             *
//             *     public TimeTable(String timeSlot, String monday, String tuesday, String wednesday, String thursday, String friday) {
//             *         this.timeSlot = timeSlot;
//             *         this.monday = monday;
//             *         this.tuesday = tuesday;
//             *         this.wednesday = wednesday;
//             *         this.thursday = thursday;
//             *         this.friday = friday;
//             *     }
//             */
//            // Map to group data by time_slot
//            Map<String, Map<String, String>> groupedData = new LinkedHashMap<>();
//
//            while (rs.next()) {
//                String timeSlot = rs.getString("time_slot");
//                String dayOfWeek = rs.getString("day_of_week");
//                String courseCode = rs.getString("course_code");
//                String courseType = resultSet.getString("course_type");
//
//                // Initialize day map for each time slot
//                groupedData.putIfAbsent(timeSlot, new HashMap<>());
//
//                // Combine course code and type
//                String courseDetail = courseCode + " (" + courseType + ")";
//
//                // Add course details to the appropriate day
//                groupedData.get(timeSlot).merge(dayOfWeek, courseDetail, (existing, newValue) -> existing + ", " + newValue);
//            }
//
//            // Convert grouped data to ObservableList<TimetableRow>
//            for (var entry : groupedData.entrySet()) {
//                String timeSlot = entry.getKey();
//                Map<String, String> dayData = entry.getValue();
//
//                TimetableRow row = new TimetableRow(
//                        timeSlot,
//                        dayData.getOrDefault("monday", ""),
//                        dayData.getOrDefault("tuesday", ""),
//                        dayData.getOrDefault("wednesday", ""),
//                        dayData.getOrDefault("thursday", ""),
//                        dayData.getOrDefault("friday", "")
//                );
//                data.add(row);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return data;
//    }
//
//






}



