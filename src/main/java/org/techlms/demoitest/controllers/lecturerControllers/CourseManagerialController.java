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
import javafx.scene.layout.Priority;
import javafx.scene.layout.Region;
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

public class CourseManagerialController implements Initializable {

    private final LecturerService service = new LecturerService();

    @FXML
    private VBox lecturer;

    @FXML
    private VBox userDataCard;

    @FXML
    private VBox contentContainer;

    @FXML
    private TableView<CourseMaterial> courseMaterialTable;

    @FXML
    private TableColumn<CourseMaterial, Integer> materialNumber;

    @FXML
    private TableColumn<CourseMaterial, CourseMaterial> lectureResource;

    @FXML
    private TableColumn<CourseMaterial, String> lectureTitle;

    @FXML
    private TableColumn<CourseMaterial, String> lectureUploadDate;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // Initialize TableView columns
        courseMaterialTable.getItems().clear();

        materialNumber.setCellValueFactory(cellData ->
                new SimpleIntegerProperty(cellData.getValue().getCourseMaterialId()).asObject());

        lectureTitle.setCellValueFactory(cellData ->
                new SimpleStringProperty(cellData.getValue().getLectureTitle()));

        lectureUploadDate.setCellValueFactory(cellData ->
                new SimpleStringProperty(cellData.getValue().getLectureDate()));

        // Set up download button for each course material
        setupDownloadResourceButton();

        // Load course materials
        loadCourseMaterials();
    }

    private void setupDownloadResourceButton() {
        lectureResource.setCellFactory(col -> new TableCell<>() {
            Button downloadButton = new Button("Download");

            {
                downloadButton.setOnAction(event -> {
                    CourseMaterial courseMaterial = getTableView().getItems().get(getIndex());
                    byte[] courseResource = courseMaterial.getCourseResource();

                    FileChooser fileChooser = new FileChooser();
                    fileChooser.setTitle("Save File");
                    fileChooser.setInitialFileName(courseMaterial.getLectureTitle().trim() + ".pdf");

                    File file = fileChooser.showSaveDialog(getScene().getWindow());
                    if (file != null) {
                        try {
                            Files.write(file.toPath(), courseResource);
                        } catch (IOException e) {
                            System.err.println("Failed to save the file: " + e.getMessage());
                            e.printStackTrace();
                        }
                    }
                });

                downloadButton.setStyle("-fx-background-color: #2D336B; -fx-text-fill: white; -fx-background-radius: 10px 5px 5px 10px; -fx-font-size: 15px; -fx-cursor: hand;-fx-font-weight: bold");
            }

            @Override
            protected void updateItem(CourseMaterial item, boolean empty) {
                super.updateItem(item, empty);
                setGraphic(empty ? null : downloadButton);
            }
        });
    }

    private void loadCourseMaterials() {
        try {
            courseMaterialTable.getItems().setAll(service.getCourseMaterialByCourseCodeAndLecturerId("l0001", "ict2113"));
        } catch (Exception e) {
            System.err.println("Error loading course materials: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @FXML
    void switchToEligibilityPage(MouseEvent event) {
        // Navigate to eligibility page logic here
    }

    @FXML
    void switchToUndergraduateMarksPage(MouseEvent event) {
        // Navigate to undergraduate marks page logic here
    }

    @FXML
    void switchToUndergraduatesPage(MouseEvent event) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lectuererCourseComponents/show-all-student-page.fxml"));
            Parent undergraduatePage = fxmlLoader.load();
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(undergraduatePage);
        } catch (IOException e) {
            System.err.println("Error loading undergraduates page: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @FXML
    void createCourseMaterial(MouseEvent event) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lectuererCourseComponents/upload-student-material.fxml"));
            Parent courseMaterialPage = fxmlLoader.load();
            Stage popUpStage = new Stage();
            popUpStage.setTitle("Create Course Material");
            popUpStage.initModality(Modality.APPLICATION_MODAL);
            popUpStage.initOwner(contentContainer.getScene().getWindow());
            popUpStage.setScene(new Scene(courseMaterialPage));

            popUpStage.setOnHiding(windowEvent -> {
                System.out.println("Pop-up closed. Reloading main content...");
                reloadMainContent(); // Call the method to reload main content
            });

            popUpStage.showAndWait();
        } catch (IOException e) {
            System.err.println("Error loading course material creation page: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void refreshCourseMaterialTable() {
        System.out.println("Refreshing course material table...");
        loadCourseMaterials();
    }
    private void reloadMainContent() {
        try {
            // Load the updated FXML for the main content
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lectuererCourseComponents/lecturer-course-material-page.fxml"));
            Parent newContent = fxmlLoader.load();

            // Replace the content in the `contentContainer`
            if (contentContainer != null) {
                contentContainer.getChildren().clear();
                contentContainer.getChildren().add(newContent);
            } else {
                System.err.println("contentContainer is null. Cannot reload main content.");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void switchUserUpdatePage(MouseEvent event) {
    }

    public void switchToEligiblity(MouseEvent event) {
    }

    public void switchGetAllUsersPage(MouseEvent event) {
    }

    public void switchtoUndergaduatesMedicalPage(MouseEvent event) {
    }

    public void switchDeletePage(MouseEvent event) {
    }

    public void undergaduatesMarks(MouseEvent event) {
    }

    public void switchUndergraduatesPage(MouseEvent event) {
    }
}
