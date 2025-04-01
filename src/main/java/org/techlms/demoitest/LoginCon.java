package org.techlms.demoitest;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;
import org.techlms.demoitest.SessionManager;
import org.techlms.demoitest.dto.LoginDTO;
import org.techlms.demoitest.service.AuthService;
import org.techlms.demoitest.users.User;

public class LoginCon {

    @FXML
    private TextField username;
    @FXML
    private TextField password;

    private AuthService authService;

    public LoginCon() {
        this.authService = new AuthService();  // Initialize authService here
    }

    public void login() {
        String username = this.username.getText().trim();
        String password = this.password.getText().trim();

        // Create LoginDTO
        LoginDTO loginDTO = new LoginDTO(username, password);
        User user = authService.authenticate(loginDTO);

        if (user != null) {
            // Set session
            SessionManager.getInstance().setUser(user.getUser_id(), user.getUser_name(), user.getRole());
            System.out.println("Logged in");
        } else {
            System.out.println("Login failed");
        }
    }
}
