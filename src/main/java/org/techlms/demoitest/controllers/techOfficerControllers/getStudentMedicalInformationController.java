package org.techlms.demoitest.controllers.techOfficerControllers;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.stage.FileChooser;
import org.techlms.demoitest.model.util.Medical;
import org.techlms.demoitest.service.techOfficerService.TechnicalOfficerService;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.util.ResourceBundle;

public class getStudentMedicalInformationController implements Initializable {
    private  final TechnicalOfficerService service = new TechnicalOfficerService();


    @FXML
    private TableColumn<Medical, String> batch;


    @FXML
    private TableColumn<Medical, String> endDate;

    @FXML
    private TableColumn<Medical, Integer> medicalNo;

    @FXML
    private TableColumn<Medical, String> medicalResource;

    @FXML
    private TableView<Medical> medicalTable;

    @FXML
    private ChoiceBox<String> selectStudentBatch;

    @FXML
    private TableColumn<Medical, String> startDate;

    @FXML
    private TableColumn<Medical, String> studentId;

    @FXML
    private TableColumn<Medical, String> studentName;


    @Override
    public void initialize(URL location, ResourceBundle resources) {


        selectStudentBatch.setValue("Select Batch");
        selectStudentBatch.getItems().setAll(service.getBatchYears());

        //  default  one without any selection  show all batch medical data

        if ( selectStudentBatch.getSelectionModel().isEmpty()){
            loadMedicalTable(null);
        }

        selectStudentBatch.setOnAction(event -> {
            System.out.println(selectStudentBatch.getValue());
           loadMedicalTable(selectStudentBatch.getValue());
        });






    }


    private  void loadMedicalTable(String batchYear){

        medicalTable.getItems().clear();
        medicalNo.setCellValueFactory(cellData->
                new SimpleIntegerProperty(
                      cellData.getValue().getMedicalId()
                ).asObject()
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


        batch.setCellValueFactory(cellData->
                new SimpleStringProperty(
                        cellData.getValue().getBatch()
                ));


        startDate.setCellValueFactory(cellData->
                new SimpleStringProperty(
                        cellData.getValue().getMedicalStartDate()
                ));

        endDate.setCellValueFactory(cellData->
                new SimpleStringProperty(
                        cellData.getValue().getMedicalEndDate()
                ));

    medicalResource();


        medicalTable.getItems().setAll(
                batchYear == null ? service.getALlMedicals()
                        : service.getALlMedicals(batchYear)
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
