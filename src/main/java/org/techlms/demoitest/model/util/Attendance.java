package org.techlms.demoitest.model.util;

import org.techlms.demoitest.dbconnection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Attendance {

    private int attendanceId;
    private String studentId;
    private String courseId;
    private String attendanceDate;
    private String batch;
    private String department;
    private String status;
    private double totalAttendance;
    private double totalPercentCount;

    public Attendance(String courseId, double totalPercentCount, double totalAttendance) {
        this.courseId = courseId;
        this.totalPercentCount = totalPercentCount;
        this.totalAttendance = totalAttendance;
    }

    public Attendance(String courseId, String studentId, double totalPercentCount, double totalAttendance) {
        this.courseId = courseId;
        this.studentId = studentId;
        this.totalPercentCount = totalPercentCount;
        this.totalAttendance = totalAttendance;
    }

    public Attendance(int attendanceId, String studentId, String courseId, String attendanceDate, String batch, String department, String status) {
        this.attendanceId = attendanceId;
        this.studentId = studentId;
        this.courseId = courseId;
        this.attendanceDate = attendanceDate;
        this.batch = batch;
        this.department = department;
        this.status = status;
    }


    public Attendance(String studentId, String courseId, String attendanceDate, String batch, String department, String status) {
        this.studentId = studentId;
        this.courseId = courseId;
        this.attendanceDate = attendanceDate;
        this.batch = batch;
        this.department = department;
        this.status = status;
    }

    public int getAttendanceId() {
        return attendanceId;
    }

    public void setAttendanceId(int attendanceId) {
        this.attendanceId = attendanceId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getAttendanceDate() {
        return attendanceDate;
    }

    public void setAttendanceDate(String attendanceDate) {
        this.attendanceDate = attendanceDate;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotalAttendance() {
        return totalAttendance;
    }

    public void setTotalAttendance(double totalAttendance) {
        this.totalAttendance = totalAttendance;
    }

    public double getTotalPercentCount() {
        return totalPercentCount;
    }

    public void setTotalPercentCount(double totalPercentCount) {
        this.totalPercentCount = totalPercentCount;
    }



    public static String AttendanceFormatPercentage(double totalAttempt, double totalAttendanceCount) {
        if (totalAttendanceCount == 0) {
            return "0%";
        }
        double percentage = (totalAttempt * 100.0) / totalAttendanceCount;
        return String.format("%.2f%%", percentage);
    }

    public static boolean AttendanceEligible(String studentId, String courseId) {
        Attendance attendance = getAttendanceByStudentIdAndCourseId(studentId, courseId);

        System.out.println(attendance);

        if (attendance == null) {
            throw new IllegalArgumentException("Attendance not found");
        }

        double totalAttendance = attendance.getTotalAttendance();
        double totalPercentCount = attendance.getTotalPercentCount();

        if (totalAttendance <= 0) {
            throw new IllegalArgumentException("Invalid total attendance value");
        }

        System.out.println("student id: " + studentId + ", courseId: " + courseId + ", total attendance: " + (totalPercentCount / totalAttendance) * 100);

        double totalAttemptsPercentage = (totalPercentCount / totalAttendance) * 100;

        if (totalAttemptsPercentage > 100) {
            throw new IllegalArgumentException("Invalid attendance eligibility record");
        }

        return totalAttemptsPercentage >= 80;
    }




    public static Attendance getAttendanceByStudentIdAndCourseId(String studentId, String courseId) {
        Attendance attendance = null;
        Connection con = DBConnection.getConnection();
        String sql = """
                    SELECT
                        course_code,
                        student_id,
                      SUM(CASE WHEN status = 'present' THEN 1 ELSE 0 END) AS present_count,
                      COUNT(att_id) AS total_attendance
                      FROM
                              attendance
                      WHERE
                              course_code = ? AND student_id = ?
                      GROUP BY
                      course_code, student_id;
                """;
        try{
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, courseId);
            ps.setString(2, studentId);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                System.out.println(rs.getString(1));
                attendance = new Attendance(rs.getString(1), rs.getString(2), rs.getDouble(3),rs.getDouble(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }



        return attendance;
    }
    @Override
    public String toString() {
        return "Attendance{" +
                "attendanceId=" + attendanceId +
                ", studentId='" + studentId + '\'' +
                ", courseId='" + courseId + '\'' +
                ", attendanceDate='" + attendanceDate + '\'' +
                ", batch='" + batch + '\'' +
                ", department='" + department + '\'' +
                ", status='" + status + '\'' +
                ", totalAttendance=" + totalAttendance +
                ", totalPercentCount=" + totalPercentCount +
                '}';
    }
}
