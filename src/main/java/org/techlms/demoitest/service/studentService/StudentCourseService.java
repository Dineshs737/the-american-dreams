package org.techlms.demoitest.service.studentDTO;

import org.techlms.demoitest.util.SessionManager;
import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.dto.studentDTO.StudentCourseDTO;

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
        String sql = "SELECT `name` , `course_image` FROM course WHERE dep_code = (SELECT department FROM student WHERE student_id = (SELECT user_id FROM user WHERE user_id = ? AND role = ?)); ";
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
