package org.techlms.demoitest.model.users;


import java.util.Arrays;

public class Student extends User {
    private String studentId;
    private String branch;
    private String currentSemester;
    private String department;


    public Student(String userName, String password, String name, String email, String contactNumber, String gender, byte[] userProfile, String role, String studentId, String branch, String department) {
        super(userName, password, name, email, contactNumber, gender, userProfile, role);
        this.studentId = studentId;
        this.branch = branch;
        this.department = department;
    }

//    public Student(String userName, String password, String name, String email, String contactNumber, String role, String gender, String dateOfBirth, byte[] userProfile, String studentId, String branch, String currentSemester, String department) {
//        super(userName, password, name, email, contactNumber, role, gender, dateOfBirth, userProfile);
//        this.studentId = studentId;
//        this.branch = branch;
//        this.currentSemester = currentSemester;
//        this.department = department;
//    }

    //fetch with student id
    public Student(int userID,String userName, String password, String name, String email, String contactNumber, String role, String gender, String address, byte[] userProfile , String studentId, String branch, String department) {
        super(userID ,userName, password, name, email, contactNumber, role, gender, address, userProfile);
        this.studentId = studentId;
        this.branch = branch;
        this.department = department;
    }



    //student create
    public Student(String userName, String password, String name, String email, String contactNumber, String role, String gender, String address, byte[] userProfile , String studentId, String branch, String department) {
        super(userName, password, name, email, contactNumber, role, gender, address, userProfile);
        this.studentId = studentId;
        this.branch = branch;
        this.department = department;
    }



//    public Student(String userName, String password, String email, String name, String gender, String contactNumber, String address, String role, byte[] userProfile, String studentId, String branch, String department) {
//        super(userName, password, email, name, gender, contactNumber, address, role, userProfile);
//        this.studentId = studentId;
//        this.branch = branch;
//        this.department = department;
//    }

    public Student(byte[] userProfile, String name, String email, String gender, String studentId, String branch) {
        super(userProfile, name, email, gender);
        this.studentId = studentId;
        this.branch = branch;
    }

    public Student(int userID, String name, String role, String studentId, String branch, String currentSemester, String department) {
        super(userID, name, role);
        this.studentId = studentId;
        this.branch = branch;
        this.currentSemester = currentSemester;
        this.department = department;
    }

    public Student(byte[] userProfile, String userName, String email, String name, String gender, String contactNumber, String address, String studentId, String department, String branch) {
        super(userProfile, userName, email, name, gender, contactNumber, address);
        this.studentId = studentId;
        this.department = department;
        this.branch = branch;
    }

    public Student(byte[] userProfile, String userName, String email, String name, String gender, String contactNumber, String address, String studentId, String department) {
        super(userProfile, userName, email, name, gender, contactNumber, address);
        this.studentId = studentId;
        this.department = department;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getCurrentSemester() {
        return currentSemester;
    }

    public void setCurrentSemester(String currentSemester) {
        this.currentSemester = currentSemester;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }


    public static boolean isValidStudentId(String studentId, String bachYear){

        String patten = "^tg/" + bachYear +"/\\d{4}$";
        return studentId != null && studentId.matches(patten);


    }


    @Override
    public String toString() {
        return "Student{" +
                "studentId='" + studentId + '\'' +
                ", branch='" + branch + '\'' +
                ", currentSemester='" + currentSemester + '\'' +
                ", department='" + department + '\'' +
                ", userID=" + userID +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", contactNumber='" + contactNumber + '\'' +
                ", role='" + role + '\'' +
                ", gender='" + gender + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                ", userProfile=" + Arrays.toString(userProfile) +
                '}';
    }
}
