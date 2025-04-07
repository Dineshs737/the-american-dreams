package org.techlms.demoitest.dto.studentDTO;

public class StudentCourseDTO {
    private String courseName;
    private byte[] courseImage;


    public StudentCourseDTO(String courseName, byte[] courseImage) {
        this.courseName = courseName;
        this.courseImage = courseImage;
    }

    public String getCourseName() {
        return courseName;
    }

    public byte[] getCourseImage() {
        return courseImage;
    }
}
