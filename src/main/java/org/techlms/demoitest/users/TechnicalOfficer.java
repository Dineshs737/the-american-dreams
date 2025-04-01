package org.techlms.demoitest.users;


public class TechnicalOfficer extends  User {
    public TechnicalOfficer(int user_id, String user_name, String name, String password, String email, String contactNo, String role) {
        super(user_id, user_name, name, password, email, contactNo, "technical officer");
    }
}
