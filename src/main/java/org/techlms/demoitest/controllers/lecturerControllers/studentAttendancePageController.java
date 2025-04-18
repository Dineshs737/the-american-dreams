package org.techlms.demoitest.controllers.lecturerControllers;

import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.layout.VBox;
import org.techlms.demoitest.model.course.Course;
import org.techlms.demoitest.model.util.Attendance;
import org.techlms.demoitest.service.lecturerService.LecturerService;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class studentAttendancePageController implements Initializable {
    LecturerService lecturerService = new LecturerService();

    @FXML
    private  VBox contentContainer;

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


    @FXML

    void back(ActionEvent event) {
        System.out.println("Back button clicked");

        try {
            // Load the FXML file and retrieve its root
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lectuererCourseComponents/lecturer-course-material-page.fxml"));
            Parent newContent = fxmlLoader.load();
            this.contentContainer.getChildren().clear();
            this.contentContainer.getChildren().add(newContent); // Add the new content
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




}
