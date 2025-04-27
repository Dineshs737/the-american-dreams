package org.techlms.demoitest.controllers.lecturerControllers.marks;

import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import org.techlms.demoitest.model.util.Marks;
import org.techlms.demoitest.service.lecturerService.LecturerService;


import java.net.URL;
import java.util.ResourceBundle;

public class LecturerStudentGradsPageController implements Initializable {
    private  final LecturerService service = new LecturerService();

    @FXML
    private TableColumn<Marks, String> assignment1;

    @FXML
    private TableColumn<Marks, String> assignment2;

    @FXML
    private TableColumn<Marks, String> courseCode;

    @FXML
    private TableColumn<Marks, String> courseName;

    @FXML
    private TableColumn<Marks, String> grades;

    @FXML
    private TableColumn<Marks, String> quiz1;

    @FXML
    private TableColumn<Marks, String> quiz2;

    @FXML
    private TableColumn<Marks, String> quiz3;



    @FXML
    private TableColumn<Marks, Double> GPA;

    @FXML
    private TableColumn<Marks, String> quiz4;

    @FXML
    private TableView<Marks> studentMarksTable;


    @Override
    public void initialize(URL location, ResourceBundle resources) {
//        Marks.isStudentCaPass();
        courseCode.setCellValueFactory(cellData ->{


            Marks.isStudentCaPass(cellData.getValue());
           return  new SimpleStringProperty(
                    cellData.getValue().getCourseId().toUpperCase()
           );
        });

        courseName.setCellValueFactory(cellData ->
                new SimpleStringProperty(
                        service.getCourseNameByCourseCode(cellData.getValue().getCourseId())
                ));

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

        grades.setCellValueFactory(cellData ->{
           String grad =  Marks.studentGrads(
                    Marks.finalTotalMarks(cellData.getValue())
            );

           return new SimpleStringProperty(grad);
        });

        GPA.setCellValueFactory(cellData ->{

           double gpa =  Marks.studentGradPoint(Marks.studentGrads(
                    Marks.finalTotalMarks(cellData.getValue())
            ));

           return new SimpleDoubleProperty(gpa).asObject();

        });








        studentMarksTable.getItems().setAll(service.getStudentMarksByStudentId("tg/2022/1413"));
        studentMarksTable.setFixedCellSize(150);

//        System.out.println(Marks.studentGradPointAverage(service.getStudentMarksByStudentId("tg/2022/1413")));




    }


}
