package org.techlms.demoitest.controllers.adminControllers.notice;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import org.techlms.demoitest.model.util.Notice;
import org.techlms.demoitest.service.adminService.AdminService;
import org.techlms.demoitest.util.FileUtils;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class AdminNoticeUpdateController implements Initializable {
    private File selectedFile;
    private Notice existingNotice;
    private final AdminService service = new AdminService();

    @FXML
    private VBox container;

    @FXML
    private TextField noticeTitle;

    @FXML
    private ChoiceBox<String> selectNoticeTitle;

    @FXML
    private VBox userCreationCard;

    @FXML
    private VBox usercCeatemenuContainer;

    @FXML
    void cancelMenu(ActionEvent event) {
        // Close the current window
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        stage.close();
    }

    @FXML
    void selectNotice(ActionEvent event) {
        // File chooser to select the PDF file
        FileChooser fileChooser = new FileChooser();
        fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("PDF Files", "*.pdf"));

        // Show file chooser and get the selected file
        Stage stage = new Stage();
        selectedFile = fileChooser.showOpenDialog(stage);

//        if (selectedFile != null) {
//            // If file is selected, print its path for debugging
//            System.out.println("Selected file: " + selectedFile.getAbsolutePath());
//        }
    }

    @FXML
    void update(ActionEvent event) {
        // Validate inputs
        if (existingNotice == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "No notice selected. Please select a notice to update.");
            return;
        }

        String updatedNoticeTitle = noticeTitle.getText().trim();
        if (updatedNoticeTitle.isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Notice title cannot be empty.");
            return;
        }

        String selectedNotice = selectNoticeTitle.getValue();
        if (selectedNotice == null || selectedNotice.isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a notice title from the dropdown.");
            return;
        }

        byte[] fileBytes = null;
        // Only validate file if existing notice has no file data
        if (existingNotice.getNoticeData() == null && selectedFile == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a PDF file for the notice.");
            return;
        }

        // If a new file is selected, convert it to byte array
        if (selectedFile != null) {
            try {
                fileBytes = FileUtils.convertFileToByteArray(selectedFile);
            } catch (IOException e) {
                showAlert(Alert.AlertType.ERROR, "File Error", "Error reading file: " + e.getMessage());
                return;
            }
        } else {
            // If no new file is selected, retain existing file data (if any)
            fileBytes = existingNotice.getNoticeData();
        }

        // Update notice with new title and file data (or existing file data)
        boolean pass = service.updateNotice(new Notice(updatedNoticeTitle, fileBytes) , existingNotice);

        if (pass) {
            showAlert(Alert.AlertType.CONFIRMATION, "Success", "Notice updated successfully.");
            loadNoticeTitle(); // Reload titles
        } else {
            showAlert(Alert.AlertType.ERROR, "Update Failed", "Failed to update notice. Please try again.");
        }
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        loadNoticeTitle();  // Load all the notice titles when the controller is initialized
    }

    private void loadNoticeTitle() {
        // Load all notice titles and update the choice box
        selectNoticeTitle.getItems().clear();
        selectNoticeTitle.getItems().setAll(service.getAllNoticeTitle());
        selectNoticeTitle.setOnAction(event -> loadExistingNotice());
    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        // Create and show an alert with the specified parameters
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.showAndWait();
    }

    private void loadExistingNotice() {
        String selectedTitle = selectNoticeTitle.getSelectionModel().getSelectedItem();
        this.existingNotice = service.getNoticeByTitle(selectedTitle);
        if (existingNotice != null) {
            noticeTitle.setText(existingNotice.getNoticeTitle());
        }
    }
}
