package org.techlms.demoitest.service.lecturerService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.model.course.CourseMaterial;
import org.techlms.demoitest.model.util.Attendance;
import org.techlms.demoitest.model.util.Marks;
import org.techlms.demoitest.util.GetStudents;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LecturerService implements GetStudents {


    @Override
    public List<String> getStudentID() {
        Connection con = DBConnection.getConnection();
        List<String> students = new ArrayList<String>();
        try{
            String sql = "select student_id from course_enrollment where  course_code in (select course_id  from lecturing where  lecturer_id = 'l0001'  );";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                students.add(rs.getString(1));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return students;
    }



    public List<Attendance> getAttendance(String courseCode) {
        Connection con = DBConnection.getConnection();
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



    public String getStudentName(String studentID) {
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


    public List<CourseMaterial> getCourseMaterialByCourseCodeAndLecturerId(String lecturedId , String courseCode){
        List<CourseMaterial> courseMaterials = new ArrayList<CourseMaterial>();
        Connection con = DBConnection.getConnection();
        try{

/*******
 *
 * DROP TABLE IF EXISTS course_material;
 * CREATE TABLE course_material (
 *     material_id INT AUTO_INCREMENT PRIMARY KEY,
 *     course_id VARCHAR(10) NOT NULL,
 *     lecture_title VARCHAR(100) NOT NULL,
 *     create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 *     resource LONGBLOB,
 *     lecturer_id CHAR(15) NOT NULL
 * );
 *
 * SELECT lecturer_id ,  course_id , lecture_title , create_date , resource FROM course_material WHERE course_id = 'ict2113' AND lecturer_id = 'l0001';
 */


            String sql = "SELECT material_id,lecturer_id ,  course_id , lecture_title , create_date , resource FROM course_material WHERE lecturer_id = ?  AND course_id = ? ;";
            PreparedStatement ps = con.prepareStatement(sql);
            /****
             *     public CourseMaterial(String lectureId, String courseCode, String lectureTitle, String lectureDate, byte[] courseResource) {
             *         this.lectureId = lectureId;
             *         this.courseCode = courseCode;
             *         this.lectureTitle = lectureTitle;
             *         this.lectureDate = lectureDate;
             *         this.courseResource = courseResource;
             *     }
             */


            ps.setString(1, lecturedId.toLowerCase().trim());
            ps.setString(2, courseCode.toLowerCase().trim());
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                System.out.println(rs.getString(1));
                courseMaterials.add(
                        new CourseMaterial(
                                rs.getInt(1),
                                rs.getString(2).toLowerCase(),
                                rs.getString(3).toLowerCase(),
                                rs.getString(4),
                                rs.getDate(5).toString(),
                                rs.getBytes(6)

                        )
                );
            }



        }catch (SQLException e){
            e.printStackTrace();
        }
        return courseMaterials;
    }


    public boolean saveCourseMaterial(CourseMaterial courseMaterial){
        Connection con = DBConnection.getConnection();
        try{
//            INSERT INTO course_material (lecturer_id, course_id, lecture_title, create_date, resource)
    //VALUES (?, ?, ?, ?, ?);
            /*****
             * CREATE TABLE course_material (
             *     material_id INT AUTO_INCREMENT PRIMARY KEY,
             *     course_id VARCHAR(10) NOT NULL,
             *     lecture_title VARCHAR(100) NOT NULL,
             *     create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
             *     resource LONGBLOB,
             *     lecturer_id CHAR(15) NOT NULL
             * );
             */

            String sql = "INSERT INTO course_material (lecturer_id, course_id, lecture_title, resource) VALUES (?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,courseMaterial.getLectureId());
            ps.setString(2,courseMaterial.getCourseCode());
            ps.setString(3,courseMaterial.getLectureTitle());
            ps.setBytes(4,courseMaterial.getCourseResource());



            int result = ps.executeUpdate();
            if(result > 0){
                return true;
            }



        }catch (SQLException e){
            e.printStackTrace();

        }

        return false;
    }


    public List<String> getCourseMaterial(String courseCode, String lectureId){
        List<String> courseMaterialTitle = new ArrayList<String>();
        Connection con = DBConnection.getConnection();
        try{
            String sql = "select material_id, lecture_title from course_material where lecturer_id = ?  AND course_id = ?  ;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, lectureId.toLowerCase().trim());
            ps.setString(2, courseCode.toLowerCase().trim());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                courseMaterialTitle.add(rs.getString(2));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return courseMaterialTitle;
    }

    public CourseMaterial getCourseMaterialById(int materialId){
        CourseMaterial courseMaterial = null;
        Connection con = DBConnection.getConnection();
        try{
        String sql = "select material_id , lecturer_id , course_id ,   lecture_title ,  create_date , resource from course_material  where material_id = ?;";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, materialId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            courseMaterial = new CourseMaterial(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getDate(5).toString(),
                    rs.getBytes(6)
            );
        }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return courseMaterial;
    }


    public boolean updateCourseMaterial(CourseMaterial oldCourseMaterial , CourseMaterial newCourseMaterial){
        Connection con = DBConnection.getConnection();
        try{
            con.setAutoCommit(false);
            String sql = """
                    UPDATE course_material
                    SET
                        course_id = ?, 
                        lecture_title = ?,      
                        resource = ?,                         
                        lecturer_id = ?       
                    WHERE
                        material_id = ?; 
                    
                    """;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,newCourseMaterial.getCourseCode().toLowerCase().trim());
            ps.setString(2,newCourseMaterial.getLectureTitle().trim());
            ps.setBytes(3,newCourseMaterial.getCourseResource());
            ps.setString(4,newCourseMaterial.getLectureId());

            ps.setInt(5,oldCourseMaterial.getCourseMaterialId());

            System.out.println(ps);
            if(ps.executeUpdate() > 0){
                con.commit();
                return true;
            }

        }catch (SQLException e){
            try{
                con.rollback();
            }catch (SQLException ex){
                ex.printStackTrace();
            }

            e.printStackTrace();

        }

        return false;
    }


    public boolean deleteCourseMaterial(int materialId){
        Connection con = DBConnection.getConnection();
        try{
            con.setAutoCommit(false);
            String sql = "DELETE FROM course_material WHERE material_id = ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,materialId);
            System.out.println(ps);
            if(ps.executeUpdate() > 0){
                con.commit();
                return true;
            }
        }catch (SQLException e){
            try{
                con.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            e.printStackTrace();
        }
        return false;
    }

    public  int getCourseMaterialId( String courseCode , String title ){
        Connection con = DBConnection.getConnection();
        int courseMaterialId = 0;
        try{
            String sql = "select material_id from course_material where course_id = ? AND lecture_title = ? ;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, courseCode);
            ps.setString(2, title);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                courseMaterialId = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courseMaterialId;

    }


//    public List<Marks> getStudentMarksByStudentId(String studentId){
//        Connection con = DBConnection.getConnection();
//        List<Marks> marksList = new ArrayList<Marks>();
//        String sql = """
//                select studentID , courseID, Quiz1 , Quiz2 , Quiz3,  Quiz4, Assignment1 , Assignment2  , Midterm , FinalPrac , FinalTheory  from marks where courseID = ?;
//                """;
//        try{
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1,studentId);
//            ResultSet rs = ps.executeQuery();
//            while(rs.next()){
//                /*****
//                 *     public Marks(String studentId, String courseId, double quiz1, double quiz2, double quiz3, double quiz4, double assignment1, double assignment2, double midterm, double finalPrac, double finalTheory) {
//                 *         this.studentId = studentId;
//                 *         this.courseId = courseId;
//                 *         this.quiz1 = quiz1;
//                 *         this.quiz2 = quiz2;
//                 *         this.quiz3 = quiz3;
//                 *         this.quiz4 = quiz4;
//                 *         this.assignment1 = assignment1;
//                 *         this.assignment2 = assignment2;
//                 *         this.midterm = midterm;
//                 *         this.finalPrac = finalPrac;
//                 *         this.finalTheory = finalTheory;
//                 *     }
//                 */
//
//                marksList.add(new Marks(
//                        rs.getString(1),
//                        rs.getString(2),
//                        rs.getDouble(3),
//                        rs.getDouble(4),
//                        rs.getDouble(5),
//                        rs.getDouble(6),
//                        rs.getDouble(7),
//                        rs.getDouble(8),
//                        rs.getDouble(9),
//                        rs.getDouble(10),
//                        rs.getDouble(11)
//
//
//                ));
//            }
//
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return marksList;
//    }

    public boolean validateStudentId(String studentId, String courseCode) {
        try {
            Connection con = DBConnection.getConnection();
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

    public boolean submitStudentMarksByStudentIdAndExamType(String StudentId, String courseCode, String examType, double marks) {
        Connection con = DBConnection.getConnection();
        String sql;

        if (isStudentMarksRecordExist(StudentId, courseCode)) {
            // Update only if the examType is NULL
            sql = "UPDATE marks SET " + examType + " = ? WHERE studentID = ? AND courseID = ? AND " + examType + " IS NULL;";
        } else {
            // Insert a new record
            sql = "INSERT INTO marks(studentID, courseID, " + examType + ") VALUES(?, ?, ?);";
        }

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            System.out.println("Executing query: " + ps);
            if (isStudentMarksRecordExist(StudentId, courseCode)) {
                ps.setDouble(1, marks); // Set marks
                ps.setString(2, StudentId); // Bind student ID
                ps.setString(3, courseCode); // Bind course code
            } else {
                ps.setString(1, StudentId); // Bind student ID
                ps.setString(2, courseCode); // Bind course code
                ps.setDouble(3, marks); // Set marks
            }

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Return true if the operation was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateExamMarks(String studentId, String courseCode, String examType, double marks) {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE marks SET " + examType + " = ? , studentID = ?  WHERE studentID = ? AND courseID = ? AND " + examType + " IS NOT NULL;";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDouble(1, marks);
            ps.setString(2, studentId);
            ps.setString(3, studentId);
            ps.setString(4, courseCode);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteMarks(String studentId, String courseCode, String examType) {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE marks SET " + examType + " = NULL WHERE studentID = ? AND courseID = ? AND " + examType + " IS NOT NULL;";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, studentId);
            ps.setString(2, courseCode);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }








    public boolean isStudentMarksRecordExist(String studentId, String courseCode) {
        Connection con = DBConnection.getConnection();
        String sql = "select count(`MarkID`) from `marks` where `studentID` = ? AND `courseID` = ?;";
        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setString(1, studentId);
            ps.setString(2, courseCode);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                if(rs.getInt(1) == 1){
                    return true;
                } else if (rs.getInt(1) > 1) {
                    throw new IllegalArgumentException("Student marks record does not exist.");
                }
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }


    public boolean isNotExamMarksExists(String studentId, String courseCode, String examType) {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT " + examType + " FROM marks WHERE studentID = ? AND courseID = ?;";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, studentId);
            ps.setString(2, courseCode);
            ResultSet rs = ps.executeQuery();


            if (rs.next()) {
                if (rs.getObject(1) == null) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    public Double getExamMarks(String studentId, String courseCode, String examType) {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT " + examType + " FROM marks WHERE studentID = ? AND courseID = ?;";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, studentId);
            ps.setString(2, courseCode);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Get the exam marks for the specified examType
                return rs.getDouble(examType);  // If marks exist, return them
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;  // Return null if no record is found
    }

    public boolean isExamMarksNull(String studentId, String courseCode, String examType) {
        Double marks = getExamMarks(studentId, courseCode, examType);
        return marks == null || marks == 0.0;  // Check if marks are null or zero
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


    public List<Marks> getStudentMarksByStudentId(String CourseId){
        System.out.println(CourseId);
        Connection con = DBConnection.getConnection();
        List<Marks> marksList = new ArrayList<Marks>();
        String sql = """
                select studentID , courseID, Quiz1 , Quiz2 , Quiz3,  Quiz4, Assignment1 , Assignment2  , Midterm , FinalPrac , FinalTheory  from marks where courseID = ?;
                """;
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, CourseId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                /*****
                 *     public Marks(String CourseId, String courseId, double quiz1, double quiz2, double quiz3, double quiz4, double assignment1, double assignment2, double midterm, double finalPrac, double finalTheory) {
                 *         this.CourseId = CourseId;
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


}
