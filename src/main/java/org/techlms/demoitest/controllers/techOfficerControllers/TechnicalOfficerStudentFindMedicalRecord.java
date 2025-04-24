package org.techlms.demoitest.controllers.techOfficerControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;
import javafx.stage.Stage;
import org.techlms.demoitest.controllers.techOfficerControllers.attendanceController.TechOfficerAttendanceEditPopController;
import org.techlms.demoitest.model.util.Attendance;
import org.techlms.demoitest.model.util.Medical;
import org.techlms.demoitest.service.techOfficerService.TechnicalOfficerService;


import java.io.IOException;

public class TechnicalOfficerStudentFindMedicalRecord {
    NewMedicalPageController newMedicalPageController;
    private final TechnicalOfficerService service = new TechnicalOfficerService();


    @FXML
    private VBox container;

    @FXML
    private DatePicker medicalEndDate;

    @FXML
    private DatePicker medicalStartDate;

    @FXML
    private TextField studentId;



    @FXML
    void findMedicalRecord(ActionEvent event) {
        if (medicalStartDate.getValue() == null || medicalEndDate.getValue() == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select valid start and end dates.");
            return;
        }

        if (!validateMedicalRecord()) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Medical record does not exist for the selected student.");
            return;
        }

        try {
            // Retrieve the medical record
            Medical medical = service.getMedicalData(
                    studentId.getText().trim().toLowerCase(),
                    "ict",
                    medicalStartDate.getValue().toString(),
                    medicalEndDate.getValue().toString()
            );

            // Load the update popup
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/medicalPages/medical-update-pop.fxml"));
            Parent root = loader.load();

            // Pass data to the update controller
            StudentUpdateMedicalPopController childController = loader.getController();
            childController.setMedicalData(medical);

            StudentUpdateMedicalPopController controller = loader.getController();
            controller.setRootController(newMedicalPageController);
            // Show the update popup
            Stage stage = new Stage();
            stage.setScene(new Scene(root));
            stage.initModality(Modality.APPLICATION_MODAL); // Blocks the "Find" popup until closed
            stage.showAndWait();

        } catch (IOException e) {
            e.printStackTrace();
            showAlert(Alert.AlertType.ERROR, "Error", "Unable to load the update popup.");
        }
    }




    private boolean validateMedicalRecord() {
        String studentIdText = studentId.getText().trim();
        if (studentIdText.isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Student ID cannot be empty.");
            return false;
        }

        boolean exists = service.isMedicalExists(
                studentId.getText().toString().trim(),
                "ict",
                medicalStartDate.getValue().toString(),
                medicalEndDate.getValue().toString()
        );

        if (!exists) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Medical record does not exist for the selected student.");
            studentId.clear();
        }
        return exists;
    }

private void showAlert(Alert.AlertType alertType, String title, String message) {
    Alert alert = new Alert(alertType);
    alert.setTitle(title);
    alert.setContentText(message);
    alert.show();
}

    public void setRootController(NewMedicalPageController newMedicalPageController) {
        this.newMedicalPageController = newMedicalPageController;
    }
}