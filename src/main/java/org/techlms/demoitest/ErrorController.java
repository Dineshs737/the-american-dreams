package org.techlms.demoitest;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.IOException;

public class ErrorController {

    @FXML
     private Label error;




    public void showErrorMessage(String message) {
        try {
            // Load the FXML file for the error message
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("errorMessage.fxml"));
            Scene scene = new Scene(fxmlLoader.load());

            // Retrieve the controller associated with the FXML
            ErrorController controller = fxmlLoader.getController();

            // Set the error message
            controller.error.setText(message);

            // Create a new Stage for the alert box
            Stage alertStage = new Stage();
            alertStage.setTitle("Error");
            alertStage.setScene(scene);
            alertStage.setResizable(false);

            // Make it modal (block interaction with other windows until closed)
            alertStage.initModality(Modality.APPLICATION_MODAL);

            // Show the alert box
            alertStage.showAndWait();
        } catch (IOException e) {
            // Log the error and optionally show an alert to the user
            System.err.println("Error loading the FXML file: " + e.getMessage());
            e.printStackTrace();
        }
    }



}
