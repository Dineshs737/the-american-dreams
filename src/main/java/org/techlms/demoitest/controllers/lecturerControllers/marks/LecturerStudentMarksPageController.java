package org.techlms.demoitest.controllers.lecturerControllers.marks;

import javafx.beans.property.SimpleStringProperty;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.stage.Modality;
import javafx.stage.Stage;
import org.techlms.demoitest.controllers.lecturerControllers.CourseManagerialController;
import org.techlms.demoitest.model.util.Marks;
import org.techlms.demoitest.service.lecturerService.LecturerService;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class LecturerStudentMarksPageController implements Initializable {
    private CourseManagerialController courseManagerialController;
    private final LecturerService service = new LecturerService();
    @FXML
    private TableColumn<Marks, String> assignment1;

    @FXML
    private TableColumn<Marks, String> assignment2;

    @FXML
    private TableColumn<Marks, String> finalPractical;

    @FXML
    private TableColumn<Marks, String> finalTheory;

    @FXML
    private TableColumn<Marks, String> midterm;

    @FXML
    private TableColumn<Marks, String> quiz1;

    @FXML
    private TableColumn<Marks, String> quiz2;

    @FXML
    private TableColumn<Marks, String> quiz3;

    @FXML
    private TableColumn<Marks, String> quiz4;

    @FXML
    private TableColumn<Marks, String> studentId;

    @FXML
    private TableView<Marks> studentMarksTable;

    @FXML
    private TableColumn<Marks, String> studentName;


    @Override
    public void initialize(URL location, ResourceBundle resources) {

loadStudentMarks();

    }

    public void loadStudentMarks() {
        studentMarksTable.getItems().clear();
        studentId.setCellValueFactory(cellData->
                new SimpleStringProperty(cellData.getValue().getStudentId().toUpperCase()));

        studentName.setCellValueFactory(cellData->{
            String name = service.getStudentName(cellData.getValue().getStudentId());
            return new SimpleStringProperty(name);
        });

        quiz1.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        String.valueOf(cellData.getValue().getQuiz1() == 0.0? "-" : cellData.getValue().getQuiz1())
                ));

        quiz2.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        String.valueOf(cellData.getValue().getQuiz2()== 0.0? "-" : cellData.getValue().getQuiz2())
                ));

        quiz3.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        String.valueOf(cellData.getValue().getQuiz3() == 0.0? "-" : cellData.getValue().getQuiz3() )
                ));

        quiz4.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        String.valueOf(cellData.getValue().getQuiz4() == 0.0? "-" : cellData.getValue().getQuiz4() )
                ));


        assignment1.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        String.valueOf(cellData.getValue().getAssignment1() == 0.0? "-" : cellData.getValue().getAssignment1())
                ));

        assignment2.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        String.valueOf(cellData.getValue().getAssignment2() == 0.0? "-" : cellData.getValue().getAssignment2())
                ));

        midterm.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        String.valueOf(cellData.getValue().getMidterm() == 0.0? "-" : cellData.getValue().getMidterm())
                ));

        finalPractical.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        String.valueOf(cellData.getValue().getFinalPrac() == 0.0? "-" : cellData.getValue().getFinalPrac())

                ));

        finalTheory.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        String.valueOf(cellData.getValue().getFinalTheory() == 0.0? "-" : cellData.getValue().getFinalTheory())

                ));

        studentMarksTable.getItems().setAll(
                service.getStudentMarksByStudentId("ict2113"));

        studentMarksTable.setStyle("-fx-alignment: center; -fx-font-size: 14px");
        studentMarksTable.setFixedCellSize(100);

    }


    @FXML
    void deleteMarks(ActionEvent event) {

        try {
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lecturer-student-marks-and-gpa/lecturer-delete-student-marks.fxml"));
            Parent root = loader.load();
            LecturerDeleteStudentMarks  controller = loader.getController();
            controller.setRootController(this);
            Stage popupStage = new Stage();
            popupStage.initModality(Modality.APPLICATION_MODAL); // Block input to other windows
            popupStage.setTitle("Delete Student Marks");
            popupStage.setScene(new Scene(root));
            popupStage.setResizable(false);
            popupStage.showAndWait();
//            loadStudentMarks();


        } catch (IOException e) {
            e.printStackTrace();
            showAlert(Alert.AlertType.ERROR, "Error", "An error occurred while loading the update window");
        }

    }

    @FXML
    void submitMarks(ActionEvent event) {
        try {
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lecturer-student-marks-and-gpa/lecturer-student-add-marks-pop.fxml"));
            Parent root = loader.load();
            LecturerStudentMarksSubmitPop controller = loader.getController();
            controller.setRootController(this);
            Stage popupStage = new Stage();
            popupStage.initModality(Modality.APPLICATION_MODAL); // Block input to other windows
            popupStage.setTitle("Submit Student Marks");
            popupStage.setScene(new Scene(root));
            popupStage.setResizable(false);
            popupStage.showAndWait();

        } catch (IOException e) {
            e.printStackTrace();
            showAlert(Alert.AlertType.ERROR, "Error", "An error occurred while loading the update window");
        }


    }

    @FXML
    void updateMarks(ActionEvent event) {

        try {
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lecturer-student-marks-and-gpa/lecturer-find-student-marks.fxml"));
            Parent root = loader.load();
            LecturerFindStudentMarks controller = loader.getController();
            controller.setRootController(this);
            Stage popupStage = new Stage();
            popupStage.initModality(Modality.APPLICATION_MODAL); // Block input to other windows
            popupStage.setTitle("Find Student Marks");
            popupStage.setScene(new Scene(root));
            popupStage.setResizable(false);
            popupStage.showAndWait();

        } catch (IOException e) {
            e.printStackTrace();
            showAlert(Alert.AlertType.ERROR, "Error", "An error occurred while loading the update window");
        }

    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.showAndWait();
    }

    public void setCourseManagerialController(CourseManagerialController courseManagerialController) {
        this.courseManagerialController = courseManagerialController;
    }

    @FXML
    public void back(ActionEvent event) {
        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lectuererCourseComponents/lecturer-course-material-page.fxml"));
            Parent clickedCourse = fxmlLoader.load();
//            VBox.setVgrow(clickedCourse, javafx.scene.layout.Priority.ALWAYS);
            this.courseManagerialController.contentContainer.getChildren().clear();
            this.courseManagerialController.contentContainer.getChildren().add(clickedCourse);
            System.out.println("Grades Page");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
