package org.techlms.demoitest.controllers.techOfficerControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import org.techlms.demoitest.model.util.Medical;
import org.techlms.demoitest.service.techOfficerService.TechnicalOfficerService;
import org.techlms.demoitest.util.FileUtils;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class TechnicalOfficerMedicalController implements Initializable {
    @FXML
    private File selectedFile;
    private final TechnicalOfficerService service = new TechnicalOfficerService();

    private NewMedicalPageController newMedicalPageController;

    @FXML
    private VBox medicalContainer;

    @FXML
    private DatePicker medicalEndDate;

    @FXML
    private DatePicker medicalStartDate;

    @FXML
    private ChoiceBox<String> selectBatch;

    @FXML
    private TextField studentId;

    @FXML
    public void selectMedical() {

        // Step 1: Create a file chooser
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

    private boolean validateStudentId() {
        String studentIdText = studentId.getText().trim();
        if (studentIdText.isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Student ID cannot be empty.");
            return false;
        }

        boolean exists = service.studentVaidate(studentId.getText().trim().toString(),
                selectBatch.getSelectionModel().getSelectedItem().trim(),
                "ict"

        );

        if (!exists) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Student ID does not exist for the selected course.");
            studentId.clear();
        }

        return exists;
    }

    @FXML
    public void submitMedical(ActionEvent event) {
        if (!validateInput()) return;

        try {
            byte[] fileBytes = FileUtils.convertFileToByteArray(selectedFile);
            Medical studentMedical = createMedicalRecord(fileBytes);

            if (!service.submitMedical(studentMedical)) {
                showAlert(Alert.AlertType.ERROR, "Error", "Unable to submit medical record.");
                return;
            }

            // Call refreshTable on the root controller
            if (newMedicalPageController != null) {
                newMedicalPageController.refreshTable();
            }

            showAlert(Alert.AlertType.INFORMATION, "Success", "Medical record submitted successfully.");

            // Close the popup
            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            stage.close();
        } catch (IOException e) {
            showAlert(Alert.AlertType.ERROR, "File Error", "Unable to process the selected file.");
            e.printStackTrace();
        }
    }

    private boolean validateInput() {
        if (medicalStartDate.getValue() == null || medicalEndDate.getValue() == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select both start and end dates.");
            return false;
        }
        if (medicalStartDate.getValue().isAfter(medicalEndDate.getValue())) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Start date cannot be after end date.");
            return false;
        }
        if (selectedFile == null || !selectedFile.getName().endsWith(".pdf")) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a valid PDF file.");
            return false;
        }
        if (selectBatch.getSelectionModel().getSelectedItem() == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a batch year.");
            return false;
        }
        return validateStudentId();
    }

    private Medical createMedicalRecord(byte[] fileBytes) {
        return new Medical(
                studentId.getText().trim().toLowerCase(),
                selectBatch.getSelectionModel().getSelectedItem().trim(),
                "ict",
                medicalStartDate.getValue().toString(),
                medicalEndDate.getValue().toString(),
                fileBytes
        );
    }






    @Override
    public void initialize(URL location, ResourceBundle resources) {
        selectBatch.getItems().setAll(service.getBatchYears());

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
