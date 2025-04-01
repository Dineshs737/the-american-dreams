package org.techlms.demoitest.users;



public class User {
    protected int user_id;
    protected String user_name;
    protected String name;
    protected String password;
    protected String email;
    protected String contactNo;
    protected String role;


    // remove user id
    public User(int user_id ,String user_name , String name, String password, String email, String contactNo, String role) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.name = name;
        this.password = password;
        this.email = email;
        this.contactNo = contactNo;
        this.role = role;
    }

    public User(int user_id, String user_name, String role) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.role = role;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getContactNo() {
        return contactNo;
    }

    public String getRole() {
        return role;
    }


    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
}
