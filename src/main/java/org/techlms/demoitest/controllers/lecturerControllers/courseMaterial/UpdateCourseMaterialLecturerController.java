package org.techlms.demoitest.controllers.lecturerControllers.courseMaterial;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import org.techlms.demoitest.model.course.CourseMaterial;
import org.techlms.demoitest.service.lecturerService.LecturerService;
import org.techlms.demoitest.util.FileUtils;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class UpdateCourseMaterialLecturerController implements Initializable {

    @FXML
    private File selectedFile;

    private CourseMaterial courseMaterial;
    private final LecturerService service = new LecturerService();

    @FXML
    private TextField newCourseTitle;

    @FXML
    private ChoiceBox<String> selectMaterial;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
    loadMaterialName();


    }


    private void loadMaterialName(){
        selectMaterial.getItems().setAll(service.getCourseMaterial("ict2113","l0001"));

        selectMaterial.setOnAction(event -> {
            System.out.println(selectMaterial.getSelectionModel().getSelectedIndex() + 1);
            loadCourseMaterial(selectMaterial.getSelectionModel().getSelectedIndex() + 1);
        });
    }

    private void loadCourseMaterial(int courseMaterialId) {
        System.out.println(service.getCourseMaterialById(selectMaterial.getSelectionModel().getSelectedIndex() + 1));
        this.courseMaterial = service.getCourseMaterialById(courseMaterialId);

        newCourseTitle.setText(courseMaterial.getLectureTitle());



    }



    @FXML
    void selectCourseMaterial(ActionEvent event) {

        FileChooser fileChooser = new FileChooser();
        fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("PDF Files", "*.pdf"));
        Stage stage = new Stage();
        selectedFile = fileChooser.showOpenDialog(stage);

        if (selectedFile != null) {
            System.out.println("Selected file: " + selectedFile.getAbsolutePath());
        }

    }

    @FXML
    void update(ActionEvent event) {
        try {
            // Validate inputs
            if (selectedFile == null || !selectedFile.getName().endsWith(".pdf")) {
                showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a valid course material (PDF file).");
                return;
            }

            if (newCourseTitle.getText().isEmpty()) {
                showAlert(Alert.AlertType.ERROR, "Validation Error", "Please enter the course title.");
                return;
            }
            if(selectMaterial.getSelectionModel().isEmpty()){
                showAlert(Alert.AlertType.ERROR,"Validation " , "Pls select course Material Title");
            }

            // Convert file to byte array
            byte[] fileBytes = FileUtils.convertFileToByteArray(selectedFile);

            // Create CourseMaterial object
            /********
             * public CourseMaterial(int courseMaterialId, String lectureId, String courseCode, String lectureTitle, String lectureDate, byte[] courseResource) {
             *         this.courseMaterialId = courseMaterialId;
             *         this.lectureId = lectureId;
             *         this.courseCode = courseCode;
             *         this.lectureTitle = lectureTitle;
             *         this.lectureDate = lectureDate;
             *         this.courseResource = courseResource;
             *     }
             *
             *     public CourseMaterial(String lectureId, String courseCode, String lectureTitle, byte[] courseResource) {
             *         this.lectureId = lectureId;
             *         this.courseCode = courseCode;
             *         this.lectureTitle = lectureTitle;
             *         this.courseResource = courseResource;
             *     }
             */
   CourseMaterial newCourseMaterial = new CourseMaterial(
           courseMaterial.getCourseMaterialId(),
           courseMaterial.getLectureId(),
           courseMaterial.getCourseCode(),
           newCourseTitle.getText().trim() == null ?courseMaterial.getLectureTitle():newCourseTitle.getText().trim(),
           courseMaterial.getLectureDate(),
           fileBytes == null ?courseMaterial.getCourseResource():fileBytes
   );
            boolean success = service.updateCourseMaterial(courseMaterial, newCourseMaterial);

            if (success) {
                showAlert(Alert.AlertType.INFORMATION, "Success", "Course material saved successfully");

                loadMaterialName();

            } else {
                showAlert(Alert.AlertType.ERROR, "Error", "Failed to save course material");
            }
        } catch (IOException e) {
            showAlert(Alert.AlertType.ERROR, "Error", "An error occurred while saving the course material. Please try again.");
            e.printStackTrace();
        }

    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.show();
    }
}
