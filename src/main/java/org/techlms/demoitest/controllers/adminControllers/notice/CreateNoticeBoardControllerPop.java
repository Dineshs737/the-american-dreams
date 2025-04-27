package org.techlms.demoitest.controllers.adminControllers.notice;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import org.techlms.demoitest.model.util.Notice;
import org.techlms.demoitest.service.adminService.AdminService;
import org.techlms.demoitest.util.FileUtils;

import java.io.File;
import java.io.IOException;

public class CreateNoticeBoardControllerPop {
    private File selectedFile;
    private final AdminService service = new AdminService();

    @FXML
    private VBox container;

    @FXML
    private TextField noiceTitle;

    @FXML
    private VBox userCreationCard;

    @FXML
    private VBox usercCeatemenuContainer;

    public void cancelMenu(ActionEvent event) {
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        stage.close();

    }



    @FXML
    void create(ActionEvent event) {
        // Validate inputs
        if (noiceTitle.getText().isBlank()) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Notice title cannot be empty.");
            return;
        }
        if (selectedFile == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a PDF file.");
            return;
        }

        // Disable the Create button to prevent multiple submissions
//        createButton.setDisable(true);

        try {

            byte[] fileBytes = FileUtils.convertFileToByteArray(selectedFile);

            boolean pass = service.saveNotice(new Notice("testAdmin", noiceTitle.getText().trim(), fileBytes));

            if (pass) {
                showAlert(Alert.AlertType.INFORMATION, "Success", "Notice created successfully.");
                // Clear form
                noiceTitle.clear();
                selectedFile = null;
//                createButton.setDisable(false); // Re-enable the Create button
            } else {
                showAlert(Alert.AlertType.ERROR, "Error", "Failed to save notice.");
            }
        } catch (IOException e) {
            showAlert(Alert.AlertType.ERROR, "Error", "Failed to create notice: " + e.getMessage());
            e.printStackTrace();  // Helpful for debugging
        } finally {
            // Re-enable the Create button in case of an error
//            .setDisable(false);
        }
    }

    @FXML
    void selectNoticeFile(ActionEvent event) {
        FileChooser fileChooser = new FileChooser();
        fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("PDF Files", "*.pdf"));

        // Use the current stage
        Stage stage = (Stage) container.getScene().getWindow();
        selectedFile = fileChooser.showOpenDialog(stage);

        if (selectedFile != null) {
            showAlert(Alert.AlertType.INFORMATION, "File Selected", "Selected file: " + selectedFile.getName());
        }
    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

}
