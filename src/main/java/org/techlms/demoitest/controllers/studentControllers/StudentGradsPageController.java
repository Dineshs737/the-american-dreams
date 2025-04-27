package org.techlms.demoitest.controllers.studentControllers;

import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import org.techlms.demoitest.model.util.Marks;
import org.techlms.demoitest.service.studentService.StudentService;
import org.techlms.demoitest.util.SessionManager;

import java.net.URL;
import java.util.ResourceBundle;

public class StudentGradsPageController implements Initializable {
    private  final SessionManager sessionManager = SessionManager.getInstance();
    private  final StudentService service = new StudentService();

    @FXML
    private TableColumn<Marks, String> courseCode;

    @FXML
    private TableColumn<Marks, String> courseName;

    @FXML
    private TableColumn<Marks, String> grades;

    @FXML
    private TableColumn<Marks, Double> GPA;

    @FXML
    private Label SGPA;
    @FXML
    private Label CGPA;

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








        studentMarksTable.getItems().setAll(service.getStudentMarksByStudentId(
                service.getStudentIdByUserId(sessionManager.getUserid())
        ));
        studentMarksTable.setFixedCellSize(150);

       SGPA.setText(String.valueOf(service.getStudentGradsByStudentId(service.getStudentIdByUserId(sessionManager.getUserid())).getSGPA()));
        CGPA.setText(String.valueOf(service.getStudentGradsByStudentId(
                service.getStudentIdByUserId(sessionManager.getUserid())).getCGPA()));




    }


}
