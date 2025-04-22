package org.techlms.demoitest.controllers.techOfficerControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.Objects;
import java.util.Optional;


public class TechController {


    @FXML
    private Button attendanceButton;

    @FXML
    private Button medicalManageButton;

    @FXML
    private Button profileSettingButton;

    @FXML
    private Button timeTableManageButton;

    @FXML
    private Button viweNotiesButton;


    @FXML
    void goToAttendance(ActionEvent event) {
        try {
            Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/tech-attendance.fxml")));
            Stage stage = (Stage) attendanceButton.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Attendance");
            stage.show();
        } catch (IOException e) {
            System.out.println("Failed to load page: " + "Attendance");
            e.printStackTrace();
        }

    }


    @FXML
    void goToMedical(ActionEvent event) {

        try {
            Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/tech-medical.fxml")));
            Stage stage = (Stage) medicalManageButton.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Medical");
            stage.show();
        } catch (IOException e) {
            System.out.println("Failed to load page: " + "Attendance");
            e.printStackTrace();
        }



    }

    @FXML
    void goToNoties(ActionEvent event) {

        try {
            Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/tech-noties.fxml")));
            Stage stage = (Stage) viweNotiesButton.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("ViweNoties");
            stage.show();
        } catch (IOException e) {
            System.out.println("Failed to load page: " + "Attendance");
            e.printStackTrace();
        }


    }

    @FXML
    void goToStting(ActionEvent event) {

        try {
            Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/tech-manage-profile.fxml")));
            Stage stage = (Stage) profileSettingButton.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("ProfileSetting");
            stage.show();
        } catch (IOException e) {
            System.out.println("Failed to load page: " + "Attendance");
            e.printStackTrace();
        }


    }

    @FXML
    void gotoTimeTable(ActionEvent event) {

        try {
            Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/tech-time-table.fxml")));
            Stage stage = (Stage) timeTableManageButton.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("TimeTable");
            stage.show();
        } catch (IOException e) {
            System.out.println("Failed to load page: " + "Attendance");
            e.printStackTrace();
        }


    }


    @FXML
    void logOut(ActionEvent event) {
        Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
        alert.setTitle("Logout Confirmation");
        alert.setHeaderText(null);
        alert.setContentText("Are you sure you want to log out?");

        Optional<ButtonType> result = alert.showAndWait();
        if (result.isPresent() && result.get() == ButtonType.OK) {
            FXMLLoader fxmlLoader = new FXMLLoader(this.getClass().getResource("/org/techlms/demoitest/util/new-login.fxml"));
            Scene scene = null;
            try {
                scene = new Scene(fxmlLoader.load());
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            stage.setScene(scene);
            stage.centerOnScreen();
            stage.show();
        }
    }


}
