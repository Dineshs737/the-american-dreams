package org.techlms.demoitest.service.lecturerService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.dto.lecturerDTO.LecturerCourseDTO;
import org.techlms.demoitest.model.course.Course;
import org.techlms.demoitest.util.SessionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LecturerCourseService {
    public List<Course> getAllLecturerCourses() {
        SessionManager user =  SessionManager.getInstance();
        List<Course> lecturerCourses = new ArrayList<>();
        String sql =
                """
                SELECT c.course_code , c.name, c.course_image, c.course_semester FROM course c JOIN lecturing lec ON c.course_code = lec.course_id
                WHERE lec.lecturer_id = ( SELECT l.lecturer_id FROM lecturer l JOIN user u ON l.user_id = u.user_id WHERE u.user_id = ? AND u.role = ?);
                 """;
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,user.getUserid());
            ps.setString(2,user.getRole());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){


//                System.out.println(rs.getString(1));

                String courseCode = rs.getString(1);
                String courseName = rs.getString(2);
                byte[] courseImage =rs.getBytes(3);
                String courseSemester = rs.getString(4);

                /**********
                 *
                 *
                 *
                 *
                 *
                 *      public Course(String courseCode, String courseName, byte[] courseImage, String courseSemester) {
                 *         this.courseCode = courseCode;
                 *         this.courseName = courseName;
                 *         this.courseImage = courseImage;
                 *         this.courseSemester = courseSemester;
                 *     }
                 *
                 *
                 */

                lecturerCourses.add(new Course(courseCode,courseName,courseImage,courseSemester));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lecturerCourses;
    }
}
