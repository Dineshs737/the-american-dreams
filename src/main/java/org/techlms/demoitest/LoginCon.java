package org.techlms.demoitest;

import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

public class LoginCon {
    @FXML
    private TextField username;
    @FXML
    private TextField password;
    @FXML
    private Label loginError;

    public void login() {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle("Error");
        alert.setHeaderText("Login Error");
        alert.setContentText("Username or Password is incorrect");
        alert.showAndWait();
        
        // Alternatively, you can print the credentials to the console if that's desired:
        System.out.println(username.getText() + " " + password.getText());
    }
}
