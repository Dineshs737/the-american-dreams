package org.techlms.demoitest.controllers.techOfficerControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Alert;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import org.techlms.demoitest.model.util.Medical;
import org.techlms.demoitest.service.techOfficerService.TechnicalOfficerService;
import org.techlms.demoitest.util.FileUtils;

import java.io.File;
import java.io.IOException;

public class StudentUpdateMedicalPopController {
    NewMedicalPageController newMedicalPageController;
    @FXML
    private File selectedFile;
    private  final TechnicalOfficerService service = new TechnicalOfficerService();

    private Medical existingMedical;

    @FXML
    private VBox container;

    @FXML
    private DatePicker medicalEndDate;

    @FXML
    private DatePicker medicalStartDate;

    @FXML
    private TextField studentId;

    @FXML
    private ChoiceBox<String> selectBatch;

    @FXML
    void selectMedical(ActionEvent event) {

        FileChooser fileChooser = new FileChooser();
        fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("PDF Files", "*.pdf"));

        // Step 2: Show the file chooser dialog
        Stage stage = new Stage();  // Use the existing stage if necessary
        selectedFile = fileChooser.showOpenDialog(stage);

        if (selectedFile != null) {
            // Step 3: If a file is selected, process it
            System.out.println("Selected file: " + selectedFile.getAbsolutePath());
        }

    }



public void setMedicalData(Medical medical){

        this.existingMedical = medical;
        studentId.clear();
        studentId.setText(medical.getStudentId());

        medicalStartDate.setValue(java.time.LocalDate.parse(medical.getMedicalStartDate()));
        medicalEndDate.setValue(java.time.LocalDate.parse(medical.getMedicalEndDate()));

        selectBatch.setValue(medical.getBatch());
        selectBatch.getItems().setAll(service.getBatchYears());



}

    @FXML
    void updatedMedical(ActionEvent event) {
        if (existingMedical == null) {
            showAlert(Alert.AlertType.ERROR, "Error", "No existing medical record to update.");
            return;
        }

        if (medicalStartDate.getValue() == null || medicalEndDate.getValue() == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select start and end dates.");
            return;
        }

        try {
            byte[] fileBytes = selectedFile != null
                    ? FileUtils.convertFileToByteArray(selectedFile)
                    : existingMedical.getMedicalData();

            Medical updatedMedical = new Medical(
                    studentId.getText().trim(),
                    existingMedical.getBatch(),
                    existingMedical.getDepartment(),
                    medicalStartDate.getValue().toString(),
                    medicalEndDate.getValue().toString(),
                    fileBytes
            );

            boolean success = service.updateStudentMedicalRecord(existingMedical, updatedMedical);

            if (success) {
                showAlert(Alert.AlertType.INFORMATION, "Success", "Medical record updated successfully.");
                if (newMedicalPageController != null) {
                    newMedicalPageController.refreshTable();
                }
                closePopup(event); // Close the popup
            } else {
                showAlert(Alert.AlertType.ERROR, "Error", "Failed to update medical record.");
            }
        } catch (IOException e) {
            e.printStackTrace();
            showAlert(Alert.AlertType.ERROR, "Error", "Failed to process the selected file.");
        }
    }

    // Method to close the popup
    private void closePopup(ActionEvent event) {
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        stage.close();
    }



    private boolean validateStudentId() {
        String studentIdText = studentId.getText().trim();
        if (studentIdText.isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Student ID cannot be empty.");
            return false;
        }

        boolean exists = service.studentVaidate(
                studentId.getText().trim().toLowerCase(),
                existingMedical.getBatch(),
                existingMedical.getDepartment()

        );

        if (!exists) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Invalid Student ID ");
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

//    public void setRootController(NewMedicalPageController newMedicalPageController) {
//            this.newMedicalPageController = newMedicalPageController;
//    }
}
