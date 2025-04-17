package org.techlms.demoitest.model.course;

import org.techlms.demoitest.util.SessionManager;

import java.util.Arrays;

public class Course {
    private  static Course instance;
    private int courseId;
    private String courseCode;
    private String courseName;
    private int courseCredit;
    private String courseDescription;
    private String courseSemester;
    private byte[] courseImage;


    public Course(String courseCode, String courseName, String courseDescription, String courseSemester, byte[] courseImage) {
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.courseDescription = courseDescription;
        this.courseSemester = courseSemester;
        this.courseImage = courseImage;
    }

    //select course_code  , name , credit , course_semester , course_image  from course;


    public Course(String courseCode, String courseName, int courseCredit, String courseSemester, byte[] courseImage) {
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.courseCredit = courseCredit;
        this.courseSemester = courseSemester;
        this.courseImage = courseImage;
    }

    public Course() {

    }

    public static Course courseSessionManager(){
        if (instance== null) {
            instance = new Course();
        }
        return  instance;

    }

    public void setCourse(String courseCode,String courseName) {
        this.courseCode = courseCode;
        this.courseName = courseName;
    }

    public Course(String courseCode, String courseName, byte[] courseImage, String courseSemester) {
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.courseImage = courseImage;
        this.courseSemester = courseSemester;
    }

    public int getCourseCredit() {
        return courseCredit;
    }



    public void setCourseCredit(int courseCredit) {
        this.courseCredit = courseCredit;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseDescription() {
        return courseDescription;
    }

    public void setCourseDescription(String courseDescription) {
        this.courseDescription = courseDescription;
    }

    public String getCourseSemester() {
        return courseSemester;
    }

    public void setCourseSemester(String courseSemester) {
        this.courseSemester = courseSemester;
    }

    public byte[] getCourseImage() {
        return courseImage;
    }

    public void setCourseImage(byte[] courseImage) {
        this.courseImage = courseImage;
    }


    @Override
    public String toString() {
        return "Course{" +
                "courseId=" + courseId +
                ", courseCode='" + courseCode + '\'' +
                ", courseName='" + courseName + '\'' +
                ", courseCredit=" + courseCredit +
                ", courseDescription='" + courseDescription + '\'' +
                ", courseSemester='" + courseSemester + '\'' +
                ", courseImage=" + Arrays.toString(courseImage) +
                '}';
    }
}
