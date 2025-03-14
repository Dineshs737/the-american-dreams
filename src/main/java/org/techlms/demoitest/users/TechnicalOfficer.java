package org.techlms.demoitest.users;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class TechnicalOfficer extends  User {
    public TechnicalOfficer(String user_id, String name, String password, String email, String contactNo, String role) {
        super(user_id, name, password, email, contactNo, "technical_officer");
    }
}
