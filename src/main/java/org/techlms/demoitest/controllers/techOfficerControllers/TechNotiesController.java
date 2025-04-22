package org.techlms.demoitest.controllers.techOfficerControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.Objects;

public class TechNotiesController {

    @FXML
    private Button goBack;

    @FXML
    void goBack(ActionEvent event) {


        try {
            Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/technical-officer.fxml")));
            Stage stage = (Stage) goBack.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("dashboard");
            stage.show();
        } catch (IOException e) {
            System.out.println("Failed to load page: " + "Attendance");
            e.printStackTrace();
        }

    }


}
