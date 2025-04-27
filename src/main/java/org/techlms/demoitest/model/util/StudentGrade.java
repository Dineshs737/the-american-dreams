package org.techlms.demoitest.model.util;

public class StudentGrade {
    private String studentID;
    private String semester;
    private double SGPA;
    private int semesterCredits;
    private String department;
    private double CGPA;
    private int totalCredits;



    // Constructor
    public StudentGrade(String studentID, String semester, double SGPA, int semesterCredits, String department) {
        this.studentID = studentID;
        this.semester = semester;
        this.SGPA = SGPA;
        this.semesterCredits = semesterCredits;
        this.department = department;
    }

    public StudentGrade(String studentID, double CGPA, double SGPA, int semesterCredits, int totalCredits) {
        this.studentID = studentID;
        this.CGPA = CGPA;
        this.SGPA = SGPA;
        this.semesterCredits = semesterCredits;
        this.totalCredits = totalCredits;
    }


    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public int getTotalCredits() {
        return totalCredits;
    }

    public void setTotalCredits(int totalCredits) {
        this.totalCredits = totalCredits;
    }

    public double getCGPA() {
        return CGPA;
    }

    public void setCGPA(double CGPA) {
        this.CGPA = CGPA;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setSemesterCredits(int semesterCredits) {
        this.semesterCredits = semesterCredits;
    }

    public void setSGPA(double SGPA) {
        this.SGPA = SGPA;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    // Getters and setters
    public String getStudentID() {
        return studentID;
    }

    public String getSemester() {
        return semester;
    }

    public double getSGPA() {
        return SGPA;
    }

    public int getSemesterCredits() {
        return semesterCredits;
    }

    public String getDepartment() {
        return department;
    }
}
