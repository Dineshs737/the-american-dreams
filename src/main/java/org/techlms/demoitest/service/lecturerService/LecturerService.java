package org.techlms.demoitest.service.lecturerService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.model.util.Attendance;
import org.techlms.demoitest.util.GetStudents;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

}
