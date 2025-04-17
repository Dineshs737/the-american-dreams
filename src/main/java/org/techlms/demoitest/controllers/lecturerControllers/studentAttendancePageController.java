package org.techlms.demoitest.controllers.lecturerControllers;

import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import org.techlms.demoitest.model.course.Course;
import org.techlms.demoitest.model.util.Attendance;
import org.techlms.demoitest.service.lecturerService.LecturerService;

import java.net.URL;
import java.util.ResourceBundle;

public class studentAttendancePageController implements Initializable {
    LecturerService lecturerService = new LecturerService();

    Course courseManager = Course.courseSessionManager();
    private ObservableList<Attendance> attendanceList;
    @FXML
    private TableColumn<Attendance, String> nonParticipate;

    @FXML
    private TableView<Attendance> studentAttendance;

    @FXML
    private TableColumn<Attendance, String> studentId;

    @FXML
    private TableColumn<Attendance, String> studentName;

    @FXML
    private TableColumn<Attendance, String> totalAttempt;

    @FXML
    private TableColumn<Attendance, String> totalPercentage;

    @Override
    public void initialize(URL location, ResourceBundle resources) {

        System.out.println(courseManager.getCourseCode());
        attendanceList = FXCollections.observableArrayList(lecturerService.getAttendance("ict2113"));
        studentId.setCellValueFactory(cellData ->
                new SimpleStringProperty(cellData.getValue().getStudentId()));

        nonParticipate.setCellValueFactory(cellData
                ->new SimpleStringProperty(
                        String.valueOf(
                                cellData.getValue().getTotalAttendance() -
                                   cellData.getValue().getTotalPercentCount())
                )
        );


        totalAttempt.setCellValueFactory(cellData
                        ->new SimpleStringProperty(
                        String.valueOf(
                                cellData.getValue().getTotalPercentCount())
                )
        );


        totalPercentage.setCellValueFactory(cellData
                        ->new SimpleStringProperty(
                formatPercentage( cellData.getValue().getTotalPercentCount(),  cellData.getValue().getTotalAttendance() ))
        );

        studentName.setCellValueFactory(cellData
                ->new SimpleStringProperty(lecturerService.getStudentName(cellData.getValue().getStudentId())));

        studentAttendance.setItems(attendanceList);



    }


    private String formatPercentage(double participateCount, double totalAttendance) {
        if (totalAttendance == 0) {
            return "0%";
        }
        double percentage = (participateCount * 100.0) / totalAttendance;
        return String.format("%.2f%%", percentage);
    }

}
