package org.techlms.demoitest.users;

public class Admin extends User{

    public Admin(int user_id, String user_name, String name, String password, String email, String contactNo, String role) {
        super(user_id, user_name, name, password, email, contactNo, "admin");
    }

    public void createUser(String role){
        role = role.toLowerCase();
        switch(role){
            case "admin" -> createAdmin();
            case "student" -> createStudent();
            case "lecturer" -> createLecturer();
            case "technical officer" -> createTechnicalOfficer();
            default -> System.out.println("....... user not exits");
        }

    }
    // user creation methods
    private void createTechnicalOfficer() {

    }

    private void createLecturer() {
    }

    private void createStudent() {
    }

    private void createAdmin() {
    }

    // userprofile update methods



}
