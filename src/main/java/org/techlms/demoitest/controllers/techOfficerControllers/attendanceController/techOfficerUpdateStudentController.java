package org.techlms.demoitest.controllers.techOfficerControllers.attendanceController;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import org.techlms.demoitest.model.course.Course;
import org.techlms.demoitest.model.util.Attendance;
import org.techlms.demoitest.service.techOfficerService.TechnicalOfficerService;

import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;

public class techOfficerUpdateStudentController implements Initializable {
    private final TechnicalOfficerService service = new TechnicalOfficerService();
    private  final ToggleGroup attendanceStatus = new ToggleGroup();

    @FXML
    private RadioButton absent;

    @FXML
    private HBox findDataMenu;

    @FXML
    private VBox attendanceStatusCard;

    @FXML
    private HBox buttonContainer;

    @FXML
    private RadioButton present;

    @FXML
    private DatePicker selectAttendanceDate;

    @FXML
    private ChoiceBox<String> selectBatch;

    @FXML
    private ChoiceBox<String> selectCourse;

    @FXML
    private TextField studentId;


    private  Attendance oldAttendance;

    @FXML
    void update(ActionEvent event) {





        //refresh  the page
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/attendancePages/attendanceUpdate/give-student-attendance-by-tech-officer-page.fxml"));
            Parent root = loader.load();
            Stage stage = (Stage) buttonContainer.getScene().getWindow();
            Scene scene = new Scene(root);
            stage.setScene(scene);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


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

        // Validate student ID and course
        if (!validateStudentId()) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Invalid Student ID for the selected course.");
            return;
        }

        // Proceed with attendance submission
        System.out.println("Attendance submitted successfully.");
        showAlert(Alert.AlertType.INFORMATION, "Success", "Attendance submitted successfully.");

        /***********
         * fetch  student attendance to database
         *
         * pass data to this attendance object
         *
         *   public Attendance(String studentId, String courseId, String attendanceDate, String batch, String department, String status) {
         *         this.studentId = studentId;
         *         this.courseId = courseId;
         *         this.attendanceDate = attendanceDate;
         *         this.batch = batch;
         *         this.department = department;
         *         this.status = status;
         *     }
         *
         *
         */


//        //using this we can get attendance status
//        RadioButton selectedStatus =
//                (RadioButton) attendanceStatus.getSelectedToggle();
//
////        System.out.println("Selected Status: " + selectedStatus.getText());


        // Create the attendance object
//        Attendance attendance = new Attendance(
////                studentId.getText().trim().toLowerCase(),
////                service.getCourseCodeByCourseName(selectCourse.getSelectionModel().getSelectedItem().trim()),
////                selectAttendanceDate.getValue().toString(),
////                selectBatch.getSelectionModel().getSelectedItem().toLowerCase(),
////                "ict", // replace with tech officer department important
////                selectedStatus.getText().trim().toLowerCase()
//        );

        // Save attendance
//        service.saveStudentAttendance(attendance);


        oldAttendance = service.getStudentAttendance("Ded","D","d");


loadStudentAttendance();

findDataMenu.setVisible(false);
findDataMenu.setPrefHeight(0);
findDataMenu.setPrefWidth(0);



    }

    private void loadStudentAttendance() {
        attendanceStatus.getToggles().clear();
//                RadioButton selectedStatus =
//                (RadioButton) attendanceStatus.getSelectedToggle();
//                selectedStatus.;
        if (oldAttendance.getStatus().equals("present")) {
            present.setSelected(true);
        } else {
            absent.setSelected(true);
        }

        ;
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

        absent.setToggleGroup(attendanceStatus);
        present.setToggleGroup(attendanceStatus);
//        absent.setSelected(true);

        studentId.focusedProperty().addListener((observable, oldValue, newValue) -> {
            if (!newValue && !studentId.getText().trim().isEmpty()) {
                validateStudentId();
            }
        });
    }

    private void loadCourseNames(String courseYear) {
        List<Course> courses = service.getAllCourseByYearsAndDepartment(courseYear, "ict");
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
