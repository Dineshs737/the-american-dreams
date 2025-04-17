package org.techlms.demoitest.model.util;

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
