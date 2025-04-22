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

public class AttendanceController {




    @FXML
    private Button goBackId;

    @FXML
    void goBack(ActionEvent event) {

        try {
            Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/technical-officer.fxml")));
            Stage stage = (Stage) goBackId.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("dashboard");
            stage.show();
        } catch (IOException e) {
            System.out.println("Failed to load page: " + "Attendance");
            e.printStackTrace();
        }

    }

    @FXML
    void goToAddAttendance(ActionEvent event) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/attendance-add-pop.fxml"));
        Parent root = fxmlLoader.load();
        Stage stage = new Stage();
        stage.setScene(new Scene(root));
        stage.show();
    }

    @FXML
    void goToUpdate(ActionEvent event) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/attendance-update-pop.fxml"));
        Parent root = fxmlLoader.load();
        Stage stage = new Stage();
        stage.setScene(new Scene(root));
        stage.show();
    }



}
