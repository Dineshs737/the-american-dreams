package org.techlms.demoitest.model.users;

public class Admin extends User {
    private String adminID;



//    public Admin(String userName, String password, String name, String email, String contactNumber, String role, String gender, String dateOfBirth, byte[] userProfile, String adminID) {
//        super(userName, password, name, email, contactNumber, role, gender, dateOfBirth, userProfile);
//        this.adminID = adminID;
//    }

    public Admin(int userID, String name, String role, String adminID) {
        super(userID, name, role);
        this.adminID = adminID;
    }



    //admin user create
    public Admin(String userName, String password, String name, String email, String contactNumber, String role, String gender, String address, byte[] userProfile , String adminID) {
//        this.userName = userName;
//        this.password = password;
//        this.name = name;
//        this.email = email;
//        this.contactNumber = contactNumber;
//        this.role = role;
//        this.gender = gender;
//        this.address = address;
//        this.userProfile = userProfile;
        super(userName, password, name, email, contactNumber, role, gender, address, userProfile);
        this.adminID = adminID;
    }

    public Admin(String userName, String password, String name, String email, String contactNumber, String gender, byte[] userProfile, String role, String adminID) {
        super(userName, password, name, email, contactNumber, gender, userProfile, role);
        this.adminID = adminID;
    }

    public String getAdminID() {
        return adminID;
    }

    public void setAdminID(String adminID) {
        this.adminID = adminID;
    }

    public static boolean isValidAdminId(String adminId) {

        String pattern = "^admin\\d{3}$"; // Starts with 'admin', followed by exactly 3 digits.
        return adminId != null && adminId.matches(pattern);

    }

}