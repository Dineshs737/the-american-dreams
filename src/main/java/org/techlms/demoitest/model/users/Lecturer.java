package org.techlms.demoitest.model.users;


public class Lecturer extends  User{
    private  String lecturerID;
    private String department;

    public Lecturer(String userName, String password, String name, String email, String contactNumber, String role, String gender, String dateOfBirth, byte[] userProfile, String lecturerID, String department) {
        super(userName, password, name, email, contactNumber, role, gender, dateOfBirth, userProfile);
        this.lecturerID = lecturerID;
        this.department = department;
    }

    public Lecturer(byte[] userProfile , String userName , String email, String name , String gender , String contactNumber , String address , String lecturerID, String department) {
//        this.userName = userName;
//        this.name = name;
//        this.email = email;
//        this.contactNumber = contactNumber;
//        this.gender = gender;
//        this.userProfile = userProfile;
//        this.address = address;
        super(userProfile, userName, email, name, gender, contactNumber, address);
        this.lecturerID = lecturerID;
        this.department = department;
    }

    public Lecturer(int userID, String name, String role, String lecturerID, String department) {
        super(userID, name, role);
        this.lecturerID = lecturerID;
        this.department = department;
    }

    public Lecturer(String userName, String password, String name, String email, String contactNumber, String gender, byte[] userProfile, String role, String lecturerID, String department) {
        super(userName, password, name, email, contactNumber, gender, userProfile, role);
        this.lecturerID = lecturerID;
        this.department = department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setLecturerID(String lecturerID) {
        this.lecturerID = lecturerID;
    }

    public String getLecturerID() {
        return lecturerID;
    }

    public String getDepartment() {
        return department;
    }


    public static boolean isValidLecturerId(String lecturerId) {

        String pattern = "^l\\d{4}$"; // Starts with 'l', followed by exactly 5 digits.
        return lecturerId != null && lecturerId.matches(pattern);

    }
}
