package org.techlms.demoitest.service.studentService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.model.users.Student;
import org.techlms.demoitest.model.util.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class StudentService {

    private List<String> getStudentRegisteredCourses(String studentId) {
        List<String> studentRegisteredCourses = new ArrayList<>();
        Connection conn = DBConnection.getConnection();
        try {
            String sql = "select   course_code from course_enrollment where  student_id = ? ";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                studentRegisteredCourses.add(rs.getString(1));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentRegisteredCourses;

    }

    private String getStudentId(int userId) {
        Connection conn = DBConnection.getConnection();
        String studentId = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select `student_id` from `student` where `user_id` = ? ;");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                studentId = rs.getString(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return studentId;
    }

    public String getCourseNameByCourseCode(String courseCode) {
        Connection con = DBConnection.getConnection();
        String courseName = null;
        try {
            PreparedStatement ps = con.prepareStatement("select name from course where course_code = ? ;");
            ps.setString(1, courseCode);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                courseName = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courseName;
    }


    public List<Attendance> getAttendance(int UserId) {
        List<Attendance> attendanceList = new ArrayList<Attendance>();
        Connection con = DBConnection.getConnection();
        String studentId = getStudentId(UserId);

        List<String> studentRegisteredCourses = getStudentRegisteredCourses("tg/2022/1416");

        try {
            String sql =
                    """
            
                            SELECT   `course_code` ,  SUM(CASE WHEN status = 'present' THEN 1 ELSE 0 END) AS present_count ,  COUNT(`att_id`) AS total_attendance FROM
            `attendance`  WHERE student_id = ? AND `course_code` = ? GROUP BY `course_code`;
            """;
            for(String studentRegisteredCourse : studentRegisteredCourses){
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, studentId);
//                System.out.println("studentC " + studentRegisteredCourse);
                ps.setString(2, studentRegisteredCourse);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    attendanceList.add(new Attendance(rs.getString(1), rs. getDouble(2),rs.getDouble(3)));
                } }


        }catch(SQLException e){
            e.printStackTrace();
        }
        return attendanceList;
    }
    /***********
     *
     *
     *
     * TIME TABLE
     *
     */

//
//    public List<TimeTable> getTimeTable(int UserId){
//        List<TimeTable> timeTableList = new ArrayList<>();
//        Connection con = DBConnection.getConnection();
////        String sql = "select start_time , end_time , course_code, batch_name ,day_of_week ,  location  from timetable_entry where  batch_name = (select batch_year from student where user_id = 1 );";
//        String sql = "select start_time , end_time , course_code, batch_name ,day_of_week ,  location  from timetable_entry ;";
//
//        try{
//            PreparedStatement ps = con.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//
//            while(rs.next()){
//
//                /**
//                 *
//                 *     public TimeTable(String startTime, String endTime, String courseCode, String dayOfWeek, String location) {
//                 *         this.startTime = startTime;
//                 *         this.endTime = endTime;
//                 *         this.courseCode = courseCode;
//                 *         this.dayOfWeek = dayOfWeek;
//                 *         this.location = location;
//                 *     }
//                 */
//                timeTableList.add(new TimeTable(
//                        rs.getTime("start_time").toString(),
//                        rs.getTime("end_time").toString(),
//                        rs.getString("course_code"),
//                        rs.getString("batch_name"),
//                        rs.getString("day_of_week"),
//                        rs.getString("location")
//                ));
//
//            }
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//
//        return  timeTableList;
//    }


    /**************
     *
     * technical officer timetable method
     * @param batchYear
     * @param department
     * @return
     */

    public List<TimeTable> getTimeTable(String batchYear ,String department){
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
        return timeTableList;
    }

    public String getLecturerNameByCourseCode(String courseCode) {
        Connection con = DBConnection.getConnection();
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


    public List<Marks> getStudentMarksByStudentId(String studentId){
        Connection con = DBConnection.getConnection();
        List<Marks> marksList = new ArrayList<Marks>();
        String sql = """
                select studentID , courseID, Quiz1 , Quiz2 , Quiz3,  Quiz4, Assignment1 , Assignment2  , Midterm , FinalPrac , FinalTheory  from marks where studentID = ?;
                """;
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,studentId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                /*****
                 *     public Marks(String studentId, String courseId, double quiz1, double quiz2, double quiz3, double quiz4, double assignment1, double assignment2, double midterm, double finalPrac, double finalTheory) {
                 *         this.studentId = studentId;
                 *         this.courseId = courseId;
                 *         this.quiz1 = quiz1;
                 *         this.quiz2 = quiz2;
                 *         this.quiz3 = quiz3;
                 *         this.quiz4 = quiz4;
                 *         this.assignment1 = assignment1;
                 *         this.assignment2 = assignment2;
                 *         this.midterm = midterm;
                 *         this.finalPrac = finalPrac;
                 *         this.finalTheory = finalTheory;
                 *     }
                 */

                marksList.add(new Marks(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getDouble(8),
                        rs.getDouble(9),
                        rs.getDouble(10),
                        rs.getDouble(11)


                ));
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return marksList;
    }


    public Student getStudentProfile(int userId , String userRole){

        Student student = null;
        Connection con = DBConnection.getConnection();

        String sql = """
                SELECT
                    u.user_profile,
                    u.username,
                    u.email,
                    u.name,
                    u.gender,
                    u.contact_no,
                    u.address,
                    s.student_id,
                    s.department,
                    s.`batch_year`
                
                FROM
                    user u
                INNER JOIN
                    student s ON u.user_id = s.user_id where u.user_id = ? and u.role = ?;
                """;

        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setInt(1,userId);
            ps.setString(2,userRole);
            ResultSet rs =  ps.executeQuery();
            System.out.println(ps);
            if(rs.next()){
                /************
                 *     public User(byte[] userProfile , String userName , String email, String name , String gender , String contactNumber , String address) {
                 *         this.userName = userName;
                 *         this.name = name;
                 *         this.email = email;
                 *         this.contactNumber = contactNumber;
                 *         this.gender = gender;
                 *         this.userProfile = userProfile;
                 *         this.address = address;
                 *     }
                 */
                student = new Student(
                        rs.getBytes(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)

                );

            }


        }catch (SQLException e){
            e.printStackTrace();
        }




        return student;


    }


    public boolean updateStudentProfile(Student newStudentProfile, int userId) {

        Connection con = DBConnection.getConnection();
        String sql = """
    UPDATE user
    SET
        user_profile = ?,
        email = ?,
        contact_no = ?,
        address = ?
    WHERE
        user_id = ?;
    """;


        try(PreparedStatement ps = con.prepareStatement(sql)){
            con.setAutoCommit(false);
            ps.setBytes(1,newStudentProfile.getUserProfile());
            ps.setString(2,newStudentProfile.getEmail());
            ps.setString(3,newStudentProfile.getContactNumber());
            ps.setString(4,newStudentProfile.getAddress());

            // set  user id
            ps.setInt(5,userId);

            System.out.println(ps);

            if(ps.executeUpdate()>0){

                con.commit();
                return true;
            }
            con.rollback();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;

}

public StudentGrade getStudentGradsByStudentId(String studentId){

        Connection con = DBConnection.getConnection();
        StudentGrade studentGrade = null;
        String sql = """
                SELECT
                    sc.studentID,
                    sc.CGPA,
                    sg.SGPA,
                    sg.semesterCredits,
                    sc.totalCredits
                FROM
                    student_cgpa sc,
                    student_grades sg
                WHERE
                    sc.studentID = ?
                    AND sg.studentID = ?
                """;

        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setString(1,studentId);
            ps.setString(2,studentId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                studentGrade = new StudentGrade(

                                rs.getString("studentID"),
                                rs.getDouble("CGPA"),
                                rs.getDouble("SGPA"),
                                rs.getInt("semesterCredits"),
                                rs.getInt("totalCredits")
                );
            }

//            public StudentGrade(String studentID, double CGPA, double SGPA, int semesterCredits, int totalCredits) {
//                this.studentID = studentID;
//                this.CGPA = CGPA;
//                this.SGPA = SGPA;
//                this.semesterCredits = semesterCredits;
//                this.totalCredits = totalCredits;
//            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return studentGrade;
}

public String getStudentIdByUserId(int userId){
        Connection con = DBConnection.getConnection();
        String sql = "select student_id from student where user_id =  (select user_id from user where user_id = ?);";
        String studentId = null;
        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setInt(1,userId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                studentId = rs.getString(1);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return studentId;
}

    public String getStudentNameByStudentId(String studentID) {
        Connection con = DBConnection.getConnection();
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



    public List<Medical> getALlMedicalsByStudentId(String studentId){
        Connection con = DBConnection.getConnection();

        List<Medical> medicals = new ArrayList<Medical>();
        try{
            String sql = "select `medical_id` , `student_id` , `batch` ,`medical_start_date` , `medical_end_date` , `medical_data`   from medical where student_id = ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, studentId);
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
}
