package org.techlms.demoitest.controllers.lecturerControllers.marks;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import org.techlms.demoitest.model.util.Marks;
import org.techlms.demoitest.service.lecturerService.LecturerService;

import java.net.URL;
import java.util.ResourceBundle;

public class LecturerStudentMarksSubmitPop implements Initializable {
    private LecturerStudentMarksPageController lecturerStudentMarksPageController;
    private final LecturerService service = new LecturerService();

    @FXML
    private ChoiceBox<String> examSelection;

    @FXML
    private TextField marks;

    @FXML
    private VBox medicalContainer;

    @FXML
    private TextField studentId;

    @FXML
    void submitMarks(ActionEvent event) {
        if (examSelection.getSelectionModel().getSelectedItem() == null) {
            showAlert(Alert.AlertType.ERROR, "Please select an exam", "Please select an exam");
            return; // Stop execution if validation fails
        }
        if (studentId.getText().isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Error", "Please enter a student ID");
            return;
        }
        if (marks.getText().isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Error", "Please enter marks");
            return;
        }

        if (service.validateStudentId(studentId.getText().trim().toLowerCase(), "ict2113")) {
            boolean success = service.submitStudentMarksByStudentIdAndExamType(
                    studentId.getText(),
                    "ict2113",
                    examSelection.getSelectionModel().getSelectedItem(),
                    Double.parseDouble(marks.getText())
            );

            if (success) {
                showAlert(Alert.AlertType.INFORMATION, "Success", "Marks submitted successfully!");

                // Clear input fields after success
                lecturerStudentMarksPageController.loadStudentMarks();
                clearInputFields();
            }
        } else {
            showAlert(Alert.AlertType.ERROR, "Error", "Student is not enrolled in the course");
        }
    }


    @Override
    public void initialize(URL location, ResourceBundle resources) {

        examSelection.getItems().setAll(Marks.getTypeOfExams());

    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.showAndWait();
    }

    private void clearInputFields() {
        studentId.clear(); // Clear the student ID input box
        marks.clear();     // Clear the marks input box
        examSelection.getSelectionModel().clearSelection(); // Reset the dropdown selection
    }


    public void setRootController(LecturerStudentMarksPageController lecturerStudentMarksPageController) {
        this.lecturerStudentMarksPageController = lecturerStudentMarksPageController;
    }
}
