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

public class LecturerDeleteStudentMarks implements Initializable {
    private LecturerStudentMarksPageController lecturerStudentMarksPageController;
    private final LecturerService  service = new LecturerService();


    @FXML
    private ChoiceBox<String> examSelection;

    @FXML
    private VBox medicalContainer;

    @FXML
    private TextField studentId;

    @FXML
    void delete(ActionEvent event) {
// Validate inputs
        if (examSelection.getSelectionModel().getSelectedItem() == null) {
            showAlert(Alert.AlertType.ERROR, "Please select an exam", "Please select an exam");
            return;
        }
        if (studentId.getText().isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Error", "Please enter a student ID");
            return;
        }

        String selectedExam = examSelection.getSelectionModel().getSelectedItem();
        String enteredStudentId = studentId.getText().trim().toLowerCase();
        String courseCode = "ict2113";

        if (service.validateStudentId(enteredStudentId, courseCode)) {
            boolean isMarksEmpty = service.isNotExamMarksExists(enteredStudentId, courseCode, selectedExam);

            if (!isMarksEmpty) {
//                showAlert(Alert.AlertType.INFORMATION, "Success", "Marks record found");
//                clearInputFields();

//                loadUpdateMarksPopup(enteredStudentId, selectedExam, courseCode);
               if(service.deleteMarks(enteredStudentId, courseCode, selectedExam) ){
                   clearInputFields();
                    lecturerStudentMarksPageController.loadStudentMarks();
                   showAlert(Alert.AlertType.INFORMATION, "Success", "Marks record deleted");
                }
            } else {
                showAlert(Alert.AlertType.ERROR, "Error", "Marks is empty");
            }
        } else {
            showAlert(Alert.AlertType.ERROR, "Error", "Student is not enrolled in the course");
        }
    }



    @Override
    public void initialize(URL location, ResourceBundle resources) {

       examSelection.getItems().addAll( Marks.getTypeOfExams());

    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.showAndWait();
    }

    private void clearInputFields() {
        studentId.clear(); // Clear the student ID input box
        examSelection.getSelectionModel().clearSelection(); // Reset the dropdown selection
    }

    public void setRootController(LecturerStudentMarksPageController lecturerStudentMarksPageController) {
        this.lecturerStudentMarksPageController = lecturerStudentMarksPageController;
    }
}
