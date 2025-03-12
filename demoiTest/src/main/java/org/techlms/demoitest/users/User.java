package org.techlms.demoitest.users;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class User {
    protected String user_id;
    protected String name;
    protected String password;
    protected String email;
    protected String contactNo;
    protected String role;


    public User(String user_id, String name, String password, String email, String contactNo, String role) {
        this.user_id = user_id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.contactNo = contactNo;
        this.role = role;
    }
}
