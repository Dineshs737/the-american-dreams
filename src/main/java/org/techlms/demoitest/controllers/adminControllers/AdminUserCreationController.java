package org.techlms.demoitest.controllers.adminControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;

public class AdminUserCreationController {

    @FXML
    private TextField address;

    @FXML
    private TextField department;

    @FXML
    private TextField email;

    @FXML
    private TextField gender;

    @FXML
    private TextField password;

    @FXML
    private TextField phoneNumber;

    @FXML
    private ChoiceBox<?> selectRole;

    @FXML
    private VBox userCreationCard;

    @FXML
    private Button userProfile;

    @FXML
    private TextField username;

    @FXML
    void cancleMenu(ActionEvent event) {
        System.out.println("canceled");


    }

    @FXML
    void createUser(ActionEvent event) {
        System.out.println("Creating user");

    }

    @FXML
    void selectUserProfile(ActionEvent event) {
        System.out.println("Select user profile");

    }

}
