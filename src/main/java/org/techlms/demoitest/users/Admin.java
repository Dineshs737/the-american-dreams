package org.techlms.demoitest.users;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class Admin extends User{

    public Admin(String user_id, String name, String password, String email, String contactNo, String role) {
        super(user_id, name, password, email, contactNo, "admin");
    }

    public void createUser(String role){
        role = role.toLowerCase();
        switch(role){
            case "admin" -> createAdmin();
            case "student" -> createStudent();
            case "lecturer" -> cerateLecturer();
            case "technical_officer" -> createTechnicalOfficer();
            default -> System.out.println("....... user not exits");
        }

    }
    // user creation methods
    private void createTechnicalOfficer() {

    }

    private void cerateLecturer() {
    }

    private void createStudent() {
    }

    private void createAdmin() {
    }

    // userprofile update methods



}
