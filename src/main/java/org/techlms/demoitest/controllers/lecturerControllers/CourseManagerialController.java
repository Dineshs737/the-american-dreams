package org.techlms.demoitest.controllers.lecturerControllers;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.Modality;
import javafx.stage.Stage;
import org.techlms.demoitest.model.course.CourseMaterial;
import org.techlms.demoitest.service.lecturerService.LecturerService;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.util.ResourceBundle;

public class CourseManagerialController  implements Initializable {

    private final LecturerService service = new LecturerService();

    @FXML
    private VBox lecturer;

    @FXML
    private VBox userDataCard;

    @FXML
    private VBox contentContainer;

    @FXML
    void switchDeletePage(MouseEvent event) {

    }

    @FXML
    void switchGetAllUsersPage(MouseEvent event) {

    }

    @FXML
    void switchToEligiblity(MouseEvent event) {

    }



    @FXML
    private TableView<CourseMaterial> courseMaterialTable;

    @FXML
    private TableColumn<CourseMaterial,Integer> materialNumber;

    @FXML
    private TableColumn<CourseMaterial, CourseMaterial> lectureResource;

    @FXML
    private TableColumn<CourseMaterial, String> lectureTitle;

    @FXML
    private TableColumn<CourseMaterial, String> lectureUploadDate;


    @Override
    public void initialize(URL location, ResourceBundle resources) {

        materialNumber.setCellValueFactory(cellData->
                new SimpleIntegerProperty((
                    cellData.getValue().getCourseMaterialId()
                )).asObject());

        lectureTitle.setCellValueFactory(cellData->
                new SimpleStringProperty(
                        cellData.getValue().getLectureTitle()
                ));

        lectureUploadDate.setCellValueFactory(cellData->
                new SimpleStringProperty(
                        cellData.getValue().getLectureDate()
                ));

        lectureDownloadResource();

        courseMaterialTable.getItems().setAll(service.getCourseMaterialByCourseCodeAndLecturerId("l0001", "ict2113"));

    }


    private void lectureDownloadResource(){
        lectureResource.setCellFactory(
                col -> new TableCell<>() {
                    Button downloadButton = new Button("Download");
                    {
                        downloadButton.setOnAction(event ->{
                            System.out.println("Button clicked");
                            CourseMaterial dto = getTableView().getItems().get(getIndex());
                            byte[] lectureResource =   dto.getCourseResource();
                            // open file chooser
                            FileChooser fileChooser = new FileChooser();
                            fileChooser.setTitle("Save File");
                            fileChooser.setInitialFileName(dto.getLectureTitle().trim() + ".pdf");

                            File file = fileChooser.showSaveDialog(getScene().getWindow());
                            if (file != null) {
                                try {
                                    // Save the notice data to the file
                                    Files.write(file.toPath(), lectureResource);
                                } catch (IOException e) {
                                    e.printStackTrace();
//                                    showError("Failed to save the file.");
                                    System.out.println("Failed to save the file.");
                                }
                            }
                        });

                        downloadButton.setStyle("-fx-background-color: #2D336B; -fx-text-fill: white; -fx-background-radius: 10px 5px 5px 10px; -fx-font-size: 15px; -fx-cursor: hand;-fx-font-weight: bold");
                    }

                    protected void updateItem(CourseMaterial item, boolean empty) {
                        super.updateItem(item, empty);
                        setGraphic(empty ? null : downloadButton);
                    }




                });




    }



    @FXML
    void switchUserUpdatePage(MouseEvent event) {

    }

    @FXML
    void switchtoUndergaduatesMedicalPage(MouseEvent event) {
        FXMLLoader fxmlLoader = null;
        try {
            try {
                fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lectuererCourseComponents/show-all-student-attendance-page.fxml"));
                Parent undergraduatePage = fxmlLoader.load();

                // Create a new Stage for the pop-up
                Stage popUpStage = new Stage();
                popUpStage.setTitle("Undergraduates Page");
                popUpStage.initModality(Modality.APPLICATION_MODAL); // Set as a modal window
                popUpStage.initOwner(contentContainer.getScene().getWindow());
                popUpStage.setScene(new Scene(undergraduatePage));

                // Set window size (optional)
                popUpStage.setWidth(800);
                popUpStage.setHeight(600);

                // Show the pop-up
                popUpStage.showAndWait(); // Wait until the pop-up is closed
                System.out.println("Undergraduates Page Loaded");
            } catch (Exception e) {
                e.printStackTrace();
            }

        }catch (Exception e) {
            e.printStackTrace();
        }

    }


    @FXML
    void switchUndergraduatesPage(MouseEvent event) {

        FXMLLoader fxmlLoader = null;
        try {
            try {
                fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lectuererCourseComponents/show-all-student-page.fxml"));
                Parent undergraduatePage = fxmlLoader.load();

                // Create a new Stage for the pop-up
                Stage popUpStage = new Stage();
                popUpStage.setTitle("Undergraduates Page");
                popUpStage.initModality(Modality.APPLICATION_MODAL); // Set as a modal window
                popUpStage.initOwner(contentContainer.getScene().getWindow());
                popUpStage.setScene(new Scene(undergraduatePage));

                // Set window size (optional)
                popUpStage.setWidth(800);
                popUpStage.setHeight(600);

                // Show the pop-up
                popUpStage.showAndWait(); // Wait until the pop-up is closed
                System.out.println("Undergraduates Page Loaded");
            } catch (Exception e) {
                e.printStackTrace();
            }

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    void undergaduatesMarks(MouseEvent event) {

    }


}
