package org.techlms.demoitest.controllers.lecturerControllers.courseMaterial;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import org.techlms.demoitest.controllers.lecturerControllers.CourseManagerialController;
import org.techlms.demoitest.model.course.CourseMaterial;
import org.techlms.demoitest.service.lecturerService.LecturerService;
import org.techlms.demoitest.util.FileUtils;

import java.io.File;
import java.io.IOException;

public class LecturerUploadCourseMaterialController {

    private final LecturerService service = new LecturerService();

    @FXML
    private File selectedFile;

    @FXML
    private HBox buttonContainer;

    @FXML
    private TextField courseTitle;

    @FXML
    private VBox medicalUpdateMenu;

    @FXML
    private VBox selectCourseMaterial;

    @FXML
    private Button submitButton;



    @FXML
    void selectCourseMaterial(ActionEvent event) {

        FileChooser fileChooser = new FileChooser();
        fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("PDF Files", "*.pdf"));
        Stage stage = new Stage();
        selectedFile = fileChooser.showOpenDialog(stage);

        if (selectedFile != null) {
            System.out.println("Selected file: " + selectedFile.getAbsolutePath());
        }

    }

    @FXML
    void submit(ActionEvent event) {
        try {
            // Validate inputs
            if (selectedFile == null || !selectedFile.getName().endsWith(".pdf")) {
                showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a valid course material (PDF file).");
                return;
            }

            if (courseTitle.getText().isEmpty()) {
                showAlert(Alert.AlertType.ERROR, "Validation Error", "Please enter the course title.");
                return;
            }

            // Convert file to byte array
            byte[] fileBytes = FileUtils.convertFileToByteArray(selectedFile);

            // Create CourseMaterial object
            CourseMaterial courseMaterial = new CourseMaterial(
                    "l0001", // Replace with dynamic lecturer ID
                    "ict2113", // Replace with dynamic course ID
                    courseTitle.getText(),
                    fileBytes
            );

            // Save to the database
            boolean success = service.saveCourseMaterial(courseMaterial);

            if (success) {
                showAlert(Alert.AlertType.INFORMATION, "Success", "Course material saved successfully");

            } else {
                showAlert(Alert.AlertType.ERROR, "Error", "Failed to save course material");
            }
        } catch (IOException e) {
            showAlert(Alert.AlertType.ERROR, "Error", "An error occurred while saving the course material. Please try again.");
            e.printStackTrace();
        }
    }



    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.show();
    }
}
