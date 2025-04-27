package org.techlms.demoitest.controllers.studentControllers;

import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import org.techlms.demoitest.model.util.Attendance;
import org.techlms.demoitest.service.studentService.StudentService;
import org.techlms.demoitest.util.SessionManager;

import java.net.URL;
import java.util.ResourceBundle;

public class AttendanceController implements Initializable {

    private final SessionManager sessionManager = SessionManager.getInstance();
    private final StudentService studentService = new StudentService();
//    private ObservableList<Attendance> attendanceList;

    @FXML
    private TableView<Attendance> studentAttendance;

    @FXML
    private TableColumn<Attendance, String> codeCode;

    @FXML
    private TableColumn<Attendance, String> codeName;
;

    @FXML
    private TableColumn<Attendance, String> nonParticipate;

    @FXML
    private TableColumn<Attendance, String> totalAttempt;

    @FXML
    private TableColumn<Attendance, String> totalPercentage;


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // Fetch attendance data
//        attendanceList = FXCollections.observableArrayList(studentService.getAttendance(sessionManager.getUserid()));

        // Initialize table columns
        codeCode.setCellValueFactory(cellData ->
                new SimpleStringProperty(String.valueOf(cellData.getValue().getCourseId())));

        codeName.setCellValueFactory(cellData->
                new SimpleStringProperty(
                        studentService.getCourseNameByCourseCode(
                                cellData.getValue()
                                        .getCourseId()
                        )
                ));




        totalAttempt.setCellValueFactory(cellData ->
                new SimpleStringProperty(String.valueOf(cellData.getValue().getTotalPercentCount())));

        nonParticipate.setCellValueFactory(cellData ->
                new SimpleStringProperty(String.valueOf(cellData.getValue().getTotalAttendance() - cellData.getValue().getTotalPercentCount())));

        totalPercentage.setCellValueFactory(cellData ->
                new SimpleStringProperty(formatPercentage(cellData.getValue().getTotalPercentCount(), cellData.getValue().getTotalAttendance())));

        studentAttendance.getItems().setAll(studentService.getAttendance(sessionManager.getUserid()));
        studentAttendance.setFixedCellSize(120);
        // Populate table

    }

    private String formatPercentage(double participateCount, double totalAttendance) {
        if (totalAttendance == 0) {
            return "0%";
        }
        double percentage = (participateCount * 100.0) / totalAttendance;
        return String.format("%.2f%%", percentage);
    }
}
