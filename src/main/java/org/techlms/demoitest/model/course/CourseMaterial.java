package org.techlms.demoitest.model.course;

import java.util.Arrays;

public class CourseMaterial {
    private String courseMaterialId;
    private String courseCode;
    private String lectureTitle;
    private String lectureDate;
//    private String lectureDescription;
    private byte[] courseResource;

    public CourseMaterial(String courseMaterialId, String courseCode, String lectureTitle, String lectureDate, byte[] courseResource) {
        this.courseMaterialId = courseMaterialId;
        this.courseCode = courseCode;
        this.lectureTitle = lectureTitle;
        this.lectureDate = lectureDate;
        this.courseResource = courseResource;
    }

    public CourseMaterial(String courseCode, String lectureTitle, String lectureDate, byte[] courseResource) {
        this.courseCode = courseCode;
        this.lectureTitle = lectureTitle;
        this.lectureDate = lectureDate;
        this.courseResource = courseResource;
    }

    public String getLectureDate() {
        return lectureDate;
    }

    public void setLectureDate(String lectureDate) {
        this.lectureDate = lectureDate;
    }

    public String getCourseMaterialId() {
        return courseMaterialId;
    }

    public void setCourseMaterialId(String courseMaterialId) {
        this.courseMaterialId = courseMaterialId;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getLectureTitle() {
        return lectureTitle;
    }

    public void setLectureTitle(String lectureTitle) {
        this.lectureTitle = lectureTitle;
    }

    public byte[] getCourseResource() {
        return courseResource;
    }

    public void setCourseResource(byte[] courseResource) {
        this.courseResource = courseResource;
    }


    @Override
    public String toString() {
        return "CourseMaterial{" +
                "courseMaterialId='" + courseMaterialId + '\'' +
                ", courseCode='" + courseCode + '\'' +
                ", lectureTitle='" + lectureTitle + '\'' +
                ", courseResource=" + Arrays.toString(courseResource) +
                '}';
    }
}
