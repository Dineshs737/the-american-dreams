package org.techlms.demoitest.service.lecturerService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.dto.lecturerDTO.LecturerCourseDTO;
import org.techlms.demoitest.util.SessionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LecturerCourseService {
    public List<LecturerCourseDTO> getAllLecturerCourses() {
        SessionManager user =  SessionManager.getInstance();
        List<LecturerCourseDTO> lecturerCourses = new ArrayList<>();
        String sql =
"""
SELECT  c.name, c.course_image, c.course_semester FROM course c JOIN lecturing lec ON c.course_code = lec.course_id
WHERE lec.lecturer_id = ( SELECT l.lecturer_id FROM lecturer l JOIN user u ON l.user_id = u.user_id WHERE u.user_id = ? AND u.role = ?);
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
                String courseSemester = rs.getString(3);
                lecturerCourses.add(new LecturerCourseDTO(courseName,courseImage,courseSemester));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lecturerCourses;
    }
}
