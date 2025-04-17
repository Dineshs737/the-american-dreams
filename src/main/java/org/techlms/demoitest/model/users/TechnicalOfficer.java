package org.techlms.demoitest.model.users;


public class TechnicalOfficer extends  User {
    private String technicalOfficerId;
    private String department;

    public TechnicalOfficer(String userName, String password, String name, String email, String contactNumber, String role, String gender, String dateOfBirth, byte[] userProfile, String technicalOfficerId, String department) {
        super(userName, password, name, email, contactNumber, role, gender, dateOfBirth, userProfile);
        this.technicalOfficerId = technicalOfficerId;
        this.department = department;
    }

    public TechnicalOfficer(int userID, String name, String role, String technicalOfficerId, String department) {
        super(userID, name, role);
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
}
