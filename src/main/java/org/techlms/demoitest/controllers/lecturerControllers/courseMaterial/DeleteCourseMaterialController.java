package org.techlms.demoitest.controllers.lecturerControllers.courseMaterial;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.ChoiceBox;
import org.techlms.demoitest.model.course.CourseMaterial;
import org.techlms.demoitest.service.lecturerService.LecturerService;

import java.net.URL;
import java.util.ResourceBundle;

public class DeleteCourseMaterialController implements Initializable {

    private final LecturerService service = new LecturerService();

    @FXML
    private ChoiceBox<String> selectMaterial;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        loadMaterialNames();
    }

    private void loadMaterialNames() {
        selectMaterial.getItems().clear(); // Clear existing items to avoid duplication
        selectMaterial.getItems().addAll(service.getCourseMaterial("ict2113", "l0001"));
        selectMaterial.setOnAction(event -> {
            String title = selectMaterial.getSelectionModel().getSelectedItem();
            if (title != null) {
                int courseMaterialId = service.getCourseMaterialId("ict2113", title);
                handleMaterialSelection(courseMaterialId);
            }
        });
    }

    private void handleMaterialSelection(int courseMaterialId) {
        CourseMaterial selectedMaterial = service.getCourseMaterialById(courseMaterialId);
        if (selectedMaterial == null) {
            showAlert(Alert.AlertType.ERROR, "Error", "Failed to load course material details.");
        }
    }

    @FXML
    void deleteCourseMaterial(ActionEvent event) {
        String selectedTitle = selectMaterial.getSelectionModel().getSelectedItem();

        if (selectedTitle == null || selectedTitle.isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a course material to delete.");
            return;
        }

        int courseMaterialId = service.getCourseMaterialId("ict2113", selectedTitle);

        boolean success = service.deleteCourseMaterial(courseMaterialId);
        if (success) {
            showAlert(Alert.AlertType.INFORMATION, "Success", "Course material deleted successfully.");
            loadMaterialNames(); // Refresh the list after deletion
            selectMaterial.setValue(null); // Reset the selection to indicate no material is selected
        } else {
            showAlert(Alert.AlertType.ERROR, "Error", "Failed to delete course material. Please try again.");
        }
    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setHeaderText(null); // Remove header text for a cleaner alert
        alert.setContentText(message);
        alert.showAndWait(); // Ensures user acknowledgment before proceeding
    }
}
