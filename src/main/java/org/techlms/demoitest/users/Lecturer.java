package org.techlms.demoitest.users;


public class Lecturer extends  User{
    public Lecturer(int user_id, String user_name, String name, String password, String email, String contactNo, String role) {
        super(user_id, user_name, name, password, email, contactNo, "lecturer");
    }
}
