package org.techlms.demoitest.controllers.techOfficerControllers.attendanceController;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import org.techlms.demoitest.model.course.Course;
import org.techlms.demoitest.model.util.Attendance;
import org.techlms.demoitest.service.techOfficerService.TechnicalOfficerService;

import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;

public class AttendanceFindPopController implements Initializable {
    private final TechnicalOfficerService service = new TechnicalOfficerService();
    private final ToggleGroup attendanceStatus = new ToggleGroup();

    @FXML
    private VBox container;

    @FXML
    private HBox findDataMenu;

    @FXML
    private DatePicker selectAttendanceDate;

    @FXML
    private ChoiceBox<String> selectBatch;

    @FXML
    private ChoiceBox<String> selectCourse;

    @FXML
    private TextField studentId;

    @FXML
    void findAttendanceRecord(ActionEvent event) {
        // Validate inputs
        if (selectCourse.getSelectionModel().getSelectedItem() == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a course.");
            return;
        }

        if (selectBatch.getSelectionModel().getSelectedItem() == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a batch year.");
            return;
        }

        if (selectAttendanceDate.getValue() == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select an attendance date.");
            return;
        }

        if (!validateStudentId()) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Invalid Student ID for the selected course.");
            return;
        }

        // Load the update page FXML and its controller
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/attendancePages/attendanceUpdate/attendance-update-pop.fxml"));
            VBox childContent = loader.load();

            TechOfficerAttendanceEditPopController childController = loader.getController();

            // Pass data to the child controller
//            childController.setAttendanceDetails(
////                    studentId.getText().trim(),
////                    service.getCourseCodeByCourseName(selectCourse.getSelectionModel().getSelectedItem()),
////                    selectAttendanceDate.getValue().toString(),
////                    selectBatch.getSelectionModel().getSelectedItem(),
////                    "ICT", // Assuming "ICT" is the department
////                    "Absent" // Default attendance status
//
//
//            );

            Attendance attendance = service.getStudentAttendance(studentId.getText().trim(),selectAttendanceDate.getValue().toString(),service.getCourseCodeByCourseName(selectCourse.getSelectionModel().getSelectedItem().trim()));
            childController.setAttendanceDetails( attendance);
            // Clear the current container and add the child content
            container.getChildren().clear();
            container.getChildren().add(childContent);

        } catch (Exception e) {
            e.printStackTrace();
            showAlert(Alert.AlertType.ERROR, "Error", "Unable to load the attendance update page.");
        }
    }

    private boolean validateStudentId() {
        String studentIdText = studentId.getText().trim();
        if (studentIdText.isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Student ID cannot be empty.");
            return false;
        }

        String selectedCourse = selectCourse.getSelectionModel().getSelectedItem();
        if (selectedCourse == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a course.");
            return false;
        }

        boolean exists = service.validateStudentId(studentIdText, service.getCourseCodeByCourseName(selectedCourse));
        if (!exists) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Student ID does not exist for the selected course.");
            studentId.clear();
        }

        return exists;
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        selectBatch.getItems().setAll(service.getBatchYears());
        selectBatch.setOnAction(event -> loadCourseNames(selectBatch.getSelectionModel().getSelectedItem()));

        studentId.focusedProperty().addListener((observable, oldValue, newValue) -> {
            if (!newValue && !studentId.getText().trim().isEmpty()) {
                validateStudentId();
            }
        });
    }

    private void loadCourseNames(String courseYear) {
        List<Course> courses = service.getAllCourseByYearsAndDepartment(courseYear, "ICT");
        String[] courseNames = courses.stream()
                .map(Course::getCourseName)
                .toArray(String[]::new);

        selectCourse.getItems().clear();
        selectCourse.getItems().addAll(courseNames);

        selectCourse.setOnAction(event -> {
            System.out.println("Selected Course: " + selectCourse.getSelectionModel().getSelectedItem());
        });
    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.show();
    }
}
