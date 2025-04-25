package org.techlms.demoitest.controllers.techOfficerControllers;

import javafx.beans.property.SimpleStringProperty;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import org.techlms.demoitest.model.course.Course;
import org.techlms.demoitest.model.util.Attendance;
import org.techlms.demoitest.model.util.Batch;
import org.techlms.demoitest.service.techOfficerService.TechnicalOfficerService;

import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;

public class TechnicalOfficerStudentAttendanceController implements Initializable {
    private final TechnicalOfficerService   service = new TechnicalOfficerService();
    @FXML
    private ChoiceBox<String> selectCourse;

    @FXML
    private TableColumn<Attendance, String> numberOfAbsent;

    @FXML
    private TableColumn<Attendance, String> numberOfPrcent;

    @FXML
    private TableColumn<Attendance, String> percentageParticipate;

    @FXML
    private ChoiceBox<String> selectStudentBatch;

    @FXML
    private TableView<Attendance> studentAttendance;

    @FXML
    private TableColumn<Attendance, String> studentId;

    @FXML
    private TableColumn<Attendance, String> studentName;

    @Override
    public void initialize(URL location, ResourceBundle resources) {



        List <Batch> batchList = service.getAllBatchYearsAndSemester();
        String[] batchChoice = batchList.stream()
                .map(Batch::getBatchYar)
                .toArray(String[]::new);

        selectStudentBatch.getItems().addAll(batchChoice);

        selectStudentBatch.setOnAction(event ->
                loadCourseNames(selectStudentBatch.getSelectionModel().getSelectedItem())
                );

;

//        selectCourse.getItems().addAll()

    }

    private void loadCourseNames(String courseYear){
        System.out.println(courseYear);
     List<Course> courses =  service.getAllCourseByYearsAndDepartment(courseYear,"ict");
        String[] courseName = courses.stream()
                .map(Course::getCourseName)
                .toArray(String[]::new);

        selectCourse.getItems().clear();
        selectCourse.getItems().addAll(courseName);

        selectCourse.setOnAction(event ->{
            System.out.println(selectCourse.getSelectionModel().getSelectedItem());
            loadStudentAttendance(service.
                    getCourseCodeByCourseName(
                            selectCourse
                            .getSelectionModel()
                            .getSelectedItem().trim()
                    )
            );


        });


    }

    private void loadStudentAttendance( String courseCode){

        studentAttendance.getItems().clear();

        studentId.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        cellData.getValue().getStudentId()
                ));


        studentName.setCellValueFactory(cellData ->
                {
//                    service.getStudentNameByStudentId(cellData.getValue().getStudentId());
                    return new SimpleStringProperty(
                            service.getStudentNameByStudentId(
                                    cellData.getValue()
                                    .getStudentId()
                            ));
                }
                );

        numberOfPrcent.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                      String.valueOf(
                              cellData.getValue()
                              .getTotalPercentCount()
                      )
                ));



        numberOfAbsent.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        String.valueOf(
                                cellData.getValue().
                                        getTotalAttendance()
                                        -
                                cellData.getValue()
                                        .getTotalPercentCount()
                        )
                ));

        percentageParticipate.setCellValueFactory(cellData ->{
            String formattedPercentage = Attendance.AttendanceFormatPercentage(
                    cellData.getValue().getTotalPercentCount(),
                    cellData.getValue().getTotalAttendance()
            );

            return new SimpleStringProperty(formattedPercentage);

           });

        System.out.println(courseCode);
        studentAttendance.getItems().addAll(service.getAttendanceById(courseCode));
        studentAttendance.focusedProperty().addListener((obs, wasFocused, isNowFocused) -> {
            if (!isNowFocused) {
//                studentAttendance.refresh();
                System.out.println("unfocused");
            }
            else{
                System.out.println("focused");
//                studentAttendance.;
            }
        });

    }
}
