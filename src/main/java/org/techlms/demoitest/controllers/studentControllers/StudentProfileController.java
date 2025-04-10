package org.techlms.demoitest.controllers.studentControllers;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;

public class StudentProfileController {

    @FXML
    private Circle profilePicture;

    @FXML
    private TextField userNameField;

    @FXML
    private TextField emailField;

    @FXML
    private Button saveProfileButton;

    @FXML
    private Button logoutButton;

    public void initialize() {
        try {
            // Set a default profile picture
            String imagePath = this.getClass().getResource("/org/techlms/demoitest/resources/default-profile.png").toExternalForm();
            Image defaultImage = new Image(imagePath);
            profilePicture.setFill(new ImagePattern(defaultImage));
        } catch (Exception e) {
            System.err.println("Failed to load default profile image: " + e.getMessage());
        }

        // Save profile button logic
        saveProfileButton.setOnAction(event -> saveProfile());

        // Logout button logic
        logoutButton.setOnAction(event -> logout());
    }

    private void saveProfile() {
        String userName = userNameField.getText();
        String email = emailField.getText();
        System.out.println("Profile saved: Username = " + userName + ", Email = " + email);
    }

    private void logout() {
        System.out.println("Logged out");
    }
}
