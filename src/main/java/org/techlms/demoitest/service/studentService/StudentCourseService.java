package org.techlms.demoitest.service.studentService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.dto.studentDTO.StudentCourseDTO;
import org.techlms.demoitest.util.SessionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentCourseService {
    public List<StudentCourseDTO> getAllStudentCourses() {
        SessionManager user =  SessionManager.getInstance();
        List<StudentCourseDTO> studentCourses = new ArrayList<>();
        String sql = """
                SELECT c.name, c.course_image 
                FROM course c 
                JOIN course_enrollment ce ON c.course_code = ce.course_code
                WHERE ce.student_id = ( SELECT student_id FROM student WHERE user_id = (SELECT user_id FROM user WHERE user_id = ? AND role = ? )
                );
                """;
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,user.getUserid());
            ps.setString(2,user.getRole());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){

                String courseName = rs.getString(1);
                byte[] courseImage =rs.getBytes(2);
                studentCourses.add(new StudentCourseDTO(courseName,courseImage));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return studentCourses;
    }
}
