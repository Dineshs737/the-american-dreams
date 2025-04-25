package org.techlms.demoitest.controllers.techOfficerControllers.attendanceController;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import org.techlms.demoitest.model.util.Attendance;
import org.techlms.demoitest.service.techOfficerService.TechnicalOfficerService;

import javax.imageio.IIOException;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class TechOfficerAttendanceEditPopController implements Initializable {
    private Attendance existingAttendance;
    private final TechnicalOfficerService service = new TechnicalOfficerService();

    @FXML
    private RadioButton absent;

    private final ToggleGroup attendanceStatus = new ToggleGroup();

    @FXML
    private HBox buttonContainer;

    @FXML
    private VBox container;

    @FXML
    private RadioButton present;

    @FXML
    private DatePicker attendanceDate;

    @FXML
    private ChoiceBox<String> selectCourse;

    @FXML
    private TextField studentId;

    @FXML
    void update(ActionEvent event) {
        if (existingAttendance == null) {
            showAlert(Alert.AlertType.ERROR, "Error", "No attendance data to update.");
            return;
        }

        // Get updated values
        String updatedStatus = present.isSelected() ? "Present" : "Absent";
        String updatedDate = attendanceDate.getValue() != null ? attendanceDate.getValue().toString() : null;

        if (updatedDate == null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a valid date.");
            return;
        }

        // Update the attendance object
//        existingAttendance.setStatus(updatedStatus);
//        existingAttendance.setAttendanceDate(updatedDate);
        /***********
         * set student attendance to database
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
         *     */

        RadioButton selectedStatus =
                (RadioButton) attendanceStatus.getSelectedToggle();

        Attendance newAttendance = new Attendance(
                studentId.getText().toLowerCase().trim(),
                service.getCourseCodeByCourseName(selectCourse.getSelectionModel().getSelectedItem().trim().toLowerCase()),
                updatedDate,
                existingAttendance.getBatch().trim(),
                "ict",
                selectedStatus.getText().toLowerCase().trim()
                );

        System.out.println("New Attendance: " + newAttendance);

        // Call service to persist changes
        boolean success = service.updateStudentAttendance(existingAttendance ,newAttendance);
        if (success) {
            try {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/attendancePages/attendanceUpdate/student-find-attendance-recod.fxml"));
                VBox childContent = loader.load();
                container.getChildren().clear();
                container.getChildren().add(childContent);


            }catch (IOException e){
                e.printStackTrace();
            }

            showAlert(Alert.AlertType.INFORMATION, "Success", "Attendance updated successfully.");

        } else {
            showAlert(Alert.AlertType.ERROR, "Error", "Failed to update attendance.");
        }
    }

    public void setAttendanceDetails(Attendance attendance) {
        this.existingAttendance = attendance;

        // Populate UI fields with attendance data
        studentId.setText(attendance.getStudentId());
        attendanceDate.setValue(java.time.LocalDate.parse(attendance.getAttendanceDate()));

        selectCourse.getItems().clear();
        selectCourse.setValue(service.getCourseNameByCourseCode(attendance.getCourseId()));
        selectCourse.getItems().setAll(service.getCourseNamesByBachYear(attendance.getBatch(),"ict"));

        if ("present".equalsIgnoreCase(attendance.getStatus())) {
            present.setSelected(true);
        } else {
            absent.setSelected(true);
        }
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        absent.setToggleGroup(attendanceStatus);
        present.setToggleGroup(attendanceStatus);
//        absent.setSelected(true); // Default selection
    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.show();
    }
}
