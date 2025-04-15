package org.techlms.demoitest.dto.lecturerDTO;

public class LecturerCourseDTO
{

    private String courseName;
    private byte[] courseImage;
    private String courseYearAndSemester;

    public LecturerCourseDTO() {
        courseYearAndSemester = "L2 First Semester";
    }

    public LecturerCourseDTO(String courseName, byte[] courseImage) {
        this();
        this.courseName = courseName;
        this.courseImage = courseImage;
    }

    public LecturerCourseDTO(String courseName, byte[] courseImage, String courseYearAndSemester) {
        this.courseName = courseName;
        this.courseImage = courseImage;
        this.courseYearAndSemester = courseYearAndSemester;
    }

    public String getCourseName() {
        return courseName;
    }

    public byte[] getCourseImage() {
        return courseImage;
    }

    public String getCourseYearAndSemester() {
        return courseYearAndSemester;
    }
}