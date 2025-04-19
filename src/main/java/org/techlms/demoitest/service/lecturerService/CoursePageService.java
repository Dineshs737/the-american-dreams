package org.techlms.demoitest.service.lecturerService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.model.users.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CoursePageService {

    /******************
     *
     * SELECT u.user_profile , s.student_id, u.name , s.batch_year,u.email
     * FROM user u
     * JOIN student s ON u.user_id = s.user_id
     * JOIN course_enrollment ce ON s.student_id = ce.student_id
     * WHERE ce.course_code = 'ict2113';
     * get all student register with  each subject
     *
     */


    /**************
     *
     * fetch data list of students
     *
     */

    public List<Student> getStudentsInformation(String courseCode){
        List<Student> students = new ArrayList<Student>();
        Connection conn = DBConnection.getConnection();
        try{
            String sql =
"""
SELECT u.user_profile , u.name ,u.email, u.gender, s.student_id, s.batch_year
FROM user u
JOIN student s ON u.user_id = s.user_id
JOIN course_enrollment ce ON s.student_id = ce.student_id
WHERE ce.course_code = ?;
""";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, courseCode);
            ResultSet rs = ps.executeQuery();
            /***********
             *
             *    public Student(byte[] userProfile, String name, String email, String gender, String studentId, String branch) {
             *         super(userProfile, name, email, gender);
             *         this.studentId = studentId;
             *         this.branch = branch;
             *     }
             */
            while(rs.next()){
                students.add( new Student(
                rs.getBytes(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5),
                rs.getString(6))
                );
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return students;
    }
}
