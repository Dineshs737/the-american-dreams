package org.techlms.demoitest.controllers.lecturerControllers;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.chart.PieChart;
import javafx.scene.control.Label;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class CourseManagerialController {

    @FXML
    private VBox lecturer;

    @FXML
    private Label totalAdminCount;

    @FXML
    private Label totalLecturerCount;

    @FXML
    private Label totalStudentCount;

    @FXML
    private Label totalTechnicalOfficerCount;

    @FXML
    private VBox userDataCard;

    @FXML
    private PieChart userPIChart;

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
    void undergaduatesMarks(MouseEvent event) {

    }

}
