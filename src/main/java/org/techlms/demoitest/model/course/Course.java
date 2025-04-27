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
    private String department;
    private String courseType;
    private String createdDate;
    private String updatedDate;

    public Course(String courseCode, String courseName, int courseCredit, String courseSemester, String department, String courseType, String createdDate, String updatedDate) {
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.courseCredit = courseCredit;
        this.courseSemester = courseSemester;
        this.department = department;
        this.courseType = courseType;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
    }

    //    select `course_code` ,  `name` ,
//            `credit` ,`course_semester` , `dep_code` ,
//            `course_type` , `created_date` ,
//            `created_date` from course;





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

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
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
