package org.techlms.demoitest.controllers.adminControllers;

import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import org.techlms.demoitest.model.util.TimeTable;
import org.techlms.demoitest.service.adminService.AdminService;

import java.net.URL;
import java.util.ResourceBundle;

public class AdminTimeTablePageController implements Initializable {
    private final AdminService service = new AdminService();
    @FXML
    private VBox contentContainer;

    @FXML
    private TableColumn<TimeTable, String> courseCode;

    @FXML
    private TableColumn<TimeTable, String> courseType;

    @FXML
    private TableColumn<TimeTable, String> department;

    @FXML
    private TableColumn<TimeTable, String> lectureHall;

    @FXML
    private VBox lecturer;

    @FXML
    private TableColumn<TimeTable ,String> batch ;

    @FXML
    private TableColumn<TimeTable, String> lecturerId;

    @FXML
    private TableColumn<TimeTable, String> timeSlot;

    @FXML
    private TableView<TimeTable> timeTable;

    @FXML
    private TableColumn<TimeTable, String> weekDay;

    @FXML
    void addNewTimeSlot(MouseEvent event) {

    }

    @FXML
    void deleteTimeSlot(MouseEvent event) {

    }

    @FXML
    void updateTimeSlot(MouseEvent event) {

    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {

        loadTimeTable();

    }


    public void  loadTimeTable(){

        timeTable.getItems().clear();
        courseCode.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getCourseId()));

        timeSlot.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getTimeSlot()));

        weekDay.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getDayOfWeek()));

        department.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getDepartment()));

        lectureHall.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getLectureHall()));

        courseType.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getCourseId()));

        lecturerId.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getLecturerId()));

        batch.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getBatch()));

        timeTable.getItems().setAll(service.fetchTimeTable());

    }
}
