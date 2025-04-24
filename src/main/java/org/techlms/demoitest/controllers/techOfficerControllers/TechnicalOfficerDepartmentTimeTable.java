package org.techlms.demoitest.controllers.techOfficerControllers;

import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import org.techlms.demoitest.model.util.CourseDataSplitter;
import org.techlms.demoitest.model.util.TimeTable;
import org.techlms.demoitest.service.techOfficerService.TechnicalOfficerService;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.function.Function;

public class TechnicalOfficerDepartmentTimeTable implements Initializable {

    private final TechnicalOfficerService service = new TechnicalOfficerService();

    @FXML
    private TableColumn<TimeTable, String> friday;

    @FXML
    private TableView<TimeTable> departmentTimeTable;

    @FXML
    private TableColumn<TimeTable, String> monday;

    @FXML
    private ChoiceBox<String> selectStudentBatch;

    @FXML
    private TableColumn<TimeTable, String> thursday;

    @FXML
    private TableColumn<TimeTable, String> timeSlot;

    @FXML
    private TableColumn<TimeTable, String> tuesday;

    @FXML
    private TableColumn<TimeTable, String> wednesday;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        selectStudentBatch.getItems().setAll(service.getBatchYears());
        selectStudentBatch.setOnAction(event -> {
            loadTimeTable(
                    selectStudentBatch.getSelectionModel().getSelectedItem()
            );
        });

    }

    private void loadTimeTable(String batchYear) {

        departmentTimeTable.getItems().clear();
        System.out.println("Loading time table for " + batchYear);
        timeSlot.setCellValueFactory(cellData->
                {
                    System.out.println(cellData.getValue().getTimeSlot());
                    return new SimpleStringProperty(cellData.getValue().getTimeSlot());
                }
        );
            monday.setCellValueFactory(cellData -> {
                String processedData = processDayData(cellData.getValue().getMonday());
                return new SimpleStringProperty(processedData.isEmpty() ? " " : processedData);
            });

            tuesday.setCellValueFactory(cellData -> {
                String processedData = processDayData(cellData.getValue().getTuesday());
                return new SimpleStringProperty(processedData.isEmpty() ? " " : processedData);
            });


//        tuesday.setCellValueFactory(cellData->
//                new SimpleStringProperty(cellData.getValue().getTuesday()));

        wednesday.setCellValueFactory(cellData->{
            String processedData = processDayData(cellData.getValue().getWednesday());
            return new SimpleStringProperty(processedData.isEmpty() ? " " : processedData);
                }
        );
        thursday.setCellValueFactory(cellData->
                {

                    String processedData = processDayData(cellData.getValue().getThursday());
                    return new SimpleStringProperty(processedData.isEmpty() ? " " : processedData);
                }
                );

        friday.setCellValueFactory(cellData->{
            {
                String processedData = processDayData(cellData.getValue().getFriday());
                return new SimpleStringProperty(processedData.isEmpty() ? " " : processedData);
            }
        });


        departmentTimeTable.getItems().setAll(service.getTimeTable(
                selectStudentBatch.getSelectionModel().getSelectedItem(),
                "ict"
        ));
        departmentTimeTable.setFixedCellSize(200);
        departmentTimeTable.setStyle("-fx-alignment: CENTER; -fx-font-size: 14px");
        departmentTimeTable.setEditable(false);




    }


    private String processDayData(String dayData) {
        if (dayData == null) {
            dayData = "";
        }
        Map<String, String> datasource = CourseDataSplitter.splitCourseData(dayData);
        String courseCode = datasource.getOrDefault("courseCode", "").toLowerCase().trim();
        String courseName = service.getCourseNameByCourseCode(courseCode);
        System.out.println(courseCode);
        String lecturerName = service.getLecturerNameByCourseCode(courseCode);
        System.out.println(lecturerName);
        courseName = (courseName != null) ? courseName : "";
        lecturerName = (lecturerName != null) ? lecturerName : "";

        System.out.println(courseCode + " " + courseName + " " + lecturerName);

        // Build the final timetable string with the day data, course name, and lecturer name
        return dayData.toUpperCase() +
                (courseName.isEmpty() ? "" : "\n" + courseName) +
                (lecturerName.isEmpty() ? "" : "\n" + lecturerName);
    }


}
