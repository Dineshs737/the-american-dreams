package org.techlms.demoitest.controllers.adminControllers.course;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import org.techlms.demoitest.model.course.Course;
import org.techlms.demoitest.service.adminService.AdminService;

import java.net.URL;
import java.util.ResourceBundle;

public class AdminCoursePageController implements Initializable {
    private final AdminService service = new AdminService();
    @FXML
    private VBox contentContainer;

    @FXML
    private TableColumn<Course, String> courseCode;

    @FXML
    private TableColumn<Course, String> courseName;

    @FXML
    private TableColumn<Course, String> courseSemester;

    @FXML
    private TableView<Course> courseTable;

    @FXML
    private TableColumn<Course, String> courseType;

    @FXML
    private TableColumn<Course, String> createdDate;

    @FXML
    private TableColumn<Course, Integer> credit;

    @FXML
    private TableColumn<Course, String> department;

    @FXML
    private VBox lecturer;

    @FXML
    private TableColumn<Course, String> updatedDate;

    @FXML
    void createCourse(MouseEvent event) {

    }

    @FXML
    void deleteCourse(MouseEvent event) {

    }

    @FXML
    void updateCourse(MouseEvent event) {

    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        loadCoursesTable();

    }


    private void loadCoursesTable(){
        courseCode.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getCourseCode().toUpperCase()));

        courseName.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getCourseName()));

        credit.setCellValueFactory(cellData->
                new SimpleIntegerProperty(cellData.getValue().getCourseCredit()).asObject());

           courseSemester.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getCourseSemester().toUpperCase()));

        department.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getDepartment().toUpperCase()));

courseType.setCellValueFactory(cellData->
        new SimpleStringProperty(cellData.getValue().getCourseType().toUpperCase()));

createdDate.setCellValueFactory(cellData->
        new SimpleStringProperty(cellData.getValue().getCreatedDate()));

updatedDate.setCellValueFactory(cellData->
        new SimpleStringProperty(cellData.getValue().getUpdatedDate()));

        courseTable.getItems().setAll(service.getAllCourse());
        courseTable.setStyle("-fx-alignment: center; -fx-font-size: 10px;");






    }
}
