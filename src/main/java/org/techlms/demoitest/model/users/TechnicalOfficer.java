package org.techlms.demoitest.model.users;


public class TechnicalOfficer extends  User {
    private String technicalOfficerId;
    private String department;


    public TechnicalOfficer(byte[] userProfile , String userName , String email, String name , String gender , String contactNumber , String address , String technicalOfficerId , String department) {
//        this.userName = userName;
//        this.name = name;
//        this.email = email;
//        this.contactNumber = contactNumber;
//        this.gender = gender;
//        this.userProfile = userProfile;
//        this.address = address;
        super(userProfile, userName, email, name, gender, contactNumber, address);
        this.technicalOfficerId = technicalOfficerId;
        this.department = department;
    }
//    public TechnicalOfficer(String userName, String password, String name, String email, String contactNumber, String role, String gender, String dateOfBirth, byte[] userProfile, String technicalOfficerId, String department) {
//        super(userName, password, name, email, contactNumber, role, gender, dateOfBirth, userProfile);
//        this.technicalOfficerId = technicalOfficerId;
//        this.department = department;
//    }

    public TechnicalOfficer(String userName, String password, String name, String email, String contactNumber, String role, String gender, String address, byte[] userProfile , String technicalOfficerId , String department) {
        super(userName, password, name, email, contactNumber, role, gender, address, userProfile);
        this.technicalOfficerId = technicalOfficerId;
        this.department = department;
    }

    public TechnicalOfficer(int userID, String name, String role, String technicalOfficerId, String department) {
        super(userID, name, role);
        this.technicalOfficerId = technicalOfficerId;
        this.department = department;
    }

    public TechnicalOfficer(String userName, String password, String name, String email, String contactNumber, String gender, byte[] userProfile, String role, String technicalOfficerId, String department) {
        super(userName, password, name, email, contactNumber, gender, userProfile, role);
        this.technicalOfficerId = technicalOfficerId;
        this.department = department;
    }

    public String getTechnicalOfficerId() {
        return technicalOfficerId;
    }

    public void setTechnicalOfficerId(String technicalOfficerId) {
        this.technicalOfficerId = technicalOfficerId;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public static boolean isValidTechnicalOfficerId(String technicalOfficerId) {

        String pattern = "^tech\\d{3}$"; // Starts with 'tech', followed by exactly 3 digits.
        return technicalOfficerId != null && technicalOfficerId.matches(pattern);

    }

}
