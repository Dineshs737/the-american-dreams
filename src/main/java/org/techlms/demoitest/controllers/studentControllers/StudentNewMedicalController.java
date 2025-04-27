package org.techlms.demoitest.controllers.studentControllers;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableCell;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.stage.FileChooser;
import org.techlms.demoitest.model.util.Medical;
import org.techlms.demoitest.service.studentService.StudentService;
import org.techlms.demoitest.util.SessionManager;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.util.ResourceBundle;

public class StudentNewMedicalController implements Initializable {

    private final SessionManager sessionManager = SessionManager.getInstance();

    private  final StudentService service = new StudentService();
    @FXML
    private TableColumn<Medical, String> endDate;

    @FXML
    private TableColumn<Medical, Integer> medicalNo;

    @FXML
    private TableColumn<Medical, String> medicalResource;

    @FXML
    private TableView<Medical> medicalTable;

    @FXML
    private TableColumn<Medical, String> startDate;

    @FXML
    private TableColumn<Medical, String> studentId;

    @FXML
    private TableColumn<Medical, String> studentName;


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        loadMedicalTable();

    }

    private  void loadMedicalTable(){

        medicalTable.getItems().clear();
        medicalNo.setCellValueFactory(cellData-> {
                    int rowIndex = medicalTable.getItems().indexOf(cellData.getValue()) + 1; // rowIndex starts from 1
                    return new SimpleIntegerProperty(rowIndex).asObject();
                }
        );

        studentId.setCellValueFactory(cellData->

                new SimpleStringProperty(
                        cellData.getValue().getStudentId()
                ));

        studentName.setCellValueFactory(cellData->{

                    return new SimpleStringProperty(
                            service.getStudentNameByStudentId(cellData.getValue().getStudentId())
                    );
                }
        );



        startDate.setCellValueFactory(cellData->
                new SimpleStringProperty(
                        cellData.getValue().getMedicalStartDate()
                ));

        endDate.setCellValueFactory(cellData->
                new SimpleStringProperty(
                        cellData.getValue().getMedicalEndDate()
                ));

        medicalResource();


        medicalTable.getItems().setAll(service.getALlMedicalsByStudentId(
                service.getStudentIdByUserId(sessionManager.getUserid())
                )
        );
    }


    private void medicalResource(){
        medicalResource.setCellFactory(
                col -> new TableCell<>() {
                    Button downloadButton = new Button("Download");
                    {
                        downloadButton.setOnAction(event ->{
                            System.out.println("Button clicked");
                            Medical dto = getTableView().getItems().get(getIndex());
                            byte[] medicalData =   dto.getMedicalData();
                            // open file chooser
                            FileChooser fileChooser = new FileChooser();
                            fileChooser.setTitle("Save File");
                            fileChooser.setInitialFileName("medical".trim() + dto.getMedicalId() + ".pdf");

                            File file = fileChooser.showSaveDialog(getScene().getWindow());
                            if (file != null) {
                                try {
                                    // Save the notice data to the file
                                    Files.write(file.toPath(), medicalData);
                                } catch (IOException e) {
                                    e.printStackTrace();
//                                    showError("Failed to save the file.");
                                    System.out.println("Failed to save the file.");
                                }
                            }
                        });

                        downloadButton.setStyle("-fx-background-color: #2D336B; -fx-text-fill: white; -fx-background-radius: 10px 5px 5px 10px; -fx-font-size: 15px; -fx-cursor: hand;-fx-font-weight: bold");
                    }

                    @Override
                    protected void updateItem(String item, boolean empty) {
                        super.updateItem(item, empty);
                        setGraphic(empty ? null : downloadButton);
                    }




                });




    }
}
