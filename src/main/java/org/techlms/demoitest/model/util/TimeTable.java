package org.techlms.demoitest.model.util;

public class TimeTable {
    private  int timeTableId;
    private String lecturerId;
    private String courseId;
    private String batch;
    private String department;
    private String timeSlot;
    private String dayOfWeek;
    private String lectureHall;
    private String startTime;
    private String endTime;


    public TimeTable( String lecturerId, String courseId, String batch, String department, String timeSlot, String dayOfWeek, String lectureHall) {
        this.lecturerId = lecturerId;
        this.courseId = courseId;
        this.batch = batch;
        this.department = department;
        this.timeSlot = timeSlot;
        this.dayOfWeek = dayOfWeek;
        this.lectureHall = lectureHall;
    }

    private String monday;
    private String tuesday;
    private String wednesday;
    private String thursday;
    private String friday;


    public TimeTable(String timeSlot, String monday, String tuesday, String wednesday, String thursday, String friday) {
        this.timeSlot = timeSlot;
        this.monday = monday;
        this.tuesday = tuesday;
        this.wednesday = wednesday;
        this.thursday = thursday;
        this.friday = friday;
    }


    public String getMonday() {
        return monday;
    }

    public void setMonday(String monday) {
        this.monday = monday;
    }

    public String getTuesday() {
        return tuesday;
    }

    public void setTuesday(String tuesday) {
        this.tuesday = tuesday;
    }

    public String getWednesday() {
        return wednesday;
    }

    public void setWednesday(String wednesday) {
        this.wednesday = wednesday;
    }

    public String getThursday() {
        return thursday;
    }

    public void setThursday(String thursday) {
        this.thursday = thursday;
    }

    public String getFriday() {
        return friday;
    }

    public void setFriday(String friday) {
        this.friday = friday;
    }

    public TimeTable(int timeTableId, String lecturerId, String courseId, String batch, String department, String startTime, String endTime, String dayOfWeek, String lectureHall) {
        this.timeTableId = timeTableId;
        this.lecturerId = lecturerId;
        this.courseId = courseId;
        this.batch = batch;
        this.department = department;
        this.startTime = startTime;
        this.endTime = endTime;
        this.dayOfWeek = dayOfWeek;
        this.lectureHall = lectureHall;
    }








    public int getTimeTableId() {
        return timeTableId;
    }

    public void setTimeTableId(int timeTableId) {
        this.timeTableId = timeTableId;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getLectureHall() {
        return lectureHall;
    }

    public void setLectureHall(String lectureHall) {
        this.lectureHall = lectureHall;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getLecturerId() {
        return lecturerId;
    }

    public void setLecturerId(String lecturerId) {
        this.lecturerId = lecturerId;
    }


    @Override
    public String toString() {
        return "TimeTable{" +
                "timeSlot='" + timeSlot + '\'' +
                ", monday='" + monday + '\'' +
                ", tuesday='" + tuesday + '\'' +
                ", wednesday='" + wednesday + '\'' +
                ", thursday='" + thursday + '\'' +
                ", friday='" + friday + '\'' +
                '}';
    }
}
