package org.techlms.demoitest.users;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Student extends User{
    public Student(String user_id, String name, String password, String email, String contactNo, String role) {
        super(user_id, name, password, email, contactNo, "student");
    }
}
