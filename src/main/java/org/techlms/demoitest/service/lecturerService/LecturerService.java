package org.techlms.demoitest.service.lecturerService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.model.course.CourseMaterial;
import org.techlms.demoitest.model.util.Attendance;
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
                courseMaterialTitle.add(. rs.getString(2));
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

}
