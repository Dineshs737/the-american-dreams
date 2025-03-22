package org.techlms.demoitest;

import javafx.fxml.FXML;
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


    System.out.println(username.getText() + " " + password.getText());
}
}
