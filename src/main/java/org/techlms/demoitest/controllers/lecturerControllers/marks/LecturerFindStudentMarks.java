package org.techlms.demoitest.controllers.lecturerControllers.marks;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;
import javafx.stage.Stage;
import org.techlms.demoitest.model.util.Marks;
import org.techlms.demoitest.service.lecturerService.LecturerService;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class LecturerFindStudentMarks implements Initializable {
    private  LecturerStudentMarksPageController lecturerStudentMarksPageController;
    private final LecturerService service = new LecturerService();
    @FXML
    private ChoiceBox<String> examSelection;

    @FXML
    private VBox medicalContainer;

    @FXML
    private TextField studentId;

    @FXML
    void findMarks(ActionEvent event) {
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

                showAlert(Alert.AlertType.INFORMATION, "Success", "Marks record found");
                clearInputFields();
                loadUpdateMarksPopup(enteredStudentId, selectedExam, courseCode);
            } else {
                showAlert(Alert.AlertType.ERROR, "Error", "Marks is empty");
            }
        } else {
            showAlert(Alert.AlertType.ERROR, "Error", "Student is not enrolled in the course");
        }
    }

    private void loadUpdateMarksPopup(String studentId, String examType, String courseCode) {
        try {
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lecturer-student-marks-and-gpa/lecturer-student-marks-update-pop.fxml"));


            Parent root = loader.load();
            LecturerUpdateStudentMarks lecturerUpdateStudentMarksController = loader.getController();
            lecturerUpdateStudentMarksController.setRootController(lecturerStudentMarksPageController);

            LecturerUpdateStudentMarks controller = loader.getController();
            Double existingMarks = service.getExamMarks(studentId, courseCode, examType);

            controller.exisingMarksRecord(studentId, examType, existingMarks);

            Stage popupStage = new Stage();
            popupStage.initModality(Modality.APPLICATION_MODAL); // Block input to other windows
            popupStage.setTitle("Update Student Marks");
            popupStage.setScene(new Scene(root));
            popupStage.setResizable(false);
            popupStage.showAndWait();

        } catch (IOException e) {
            e.printStackTrace();
            showAlert(Alert.AlertType.ERROR, "Error", "An error occurred while loading the update window");
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
        studentId.clear();
        examSelection.getSelectionModel().clearSelection();
    }

    public void setRootController(LecturerStudentMarksPageController lecturerStudentMarksPageController) {
    this.lecturerStudentMarksPageController = lecturerStudentMarksPageController;
    }
}
