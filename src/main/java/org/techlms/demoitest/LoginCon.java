package org.techlms.demoitest;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.IOException;

public class LoginCon{
    @FXML
    private TextField username;
    @FXML
    private TextField password;



    public void login() {
    /*    try {
            // Load the new FXML file for the error message
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("errorMessage.fxml"));
            Scene scene = new Scene(fxmlLoader.load());

            // Get the current stage and set the new scene
            Stage stage = (Stage) username.getScene().getWindow();
            stage.setScene(scene);
            stage.show();
        } catch (IOException e) {
            // Log the error and optionally show an alert to the user
            System.err.println("Error loading the FXML file: " + e.getMessage());
            e.printStackTrace();
        }
    }
    */
//        Alert alert = new Alert(Alert.AlertType.ERROR);
//        alert.setTitle("Error");
//        alert.setHeaderText("Login Error");
//        alert.setContentText("Username or Password is incorrect");
//
//        alert.showAndWait();
//
//        // Alternatively, you can print the credentials to the console if that's desired:
//        System.out.println(username.getText() + " " + password.getText());

        ErrorController controller = new ErrorController();
        controller.showErrorMessage("this is custom error message");

    }
}


