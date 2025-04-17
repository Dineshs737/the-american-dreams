package org.techlms.demoitest.model.users;

public class Admin extends User {
    private String adminID;



    public Admin(String userName, String password, String name, String email, String contactNumber, String role, String gender, String dateOfBirth, byte[] userProfile, String adminID) {
        super(userName, password, name, email, contactNumber, role, gender, dateOfBirth, userProfile);
        this.adminID = adminID;
    }

    public Admin(int userID, String name, String role, String adminID) {
        super(userID, name, role);
        this.adminID = adminID;
    }

    public String getAdminID() {
        return adminID;
    }

    public void setAdminID(String adminID) {
        this.adminID = adminID;
    }
}