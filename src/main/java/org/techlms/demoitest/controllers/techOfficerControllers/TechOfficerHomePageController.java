package org.techlms.demoitest.controllers.techOfficerControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import org.techlms.demoitest.model.users.User;
import org.techlms.demoitest.util.SessionManager;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ResourceBundle;

public class TechOfficerHomePageController  implements Initializable {
    @FXML private Circle userprofile;
    @FXML
    private Label HomePage;

    @FXML
    private VBox contentContainer;



    @FXML
    void logout(ActionEvent event) {
        FXMLLoader fxmlLoader = null;
        try {
            // remove user session
            SessionManager sessionManager = new SessionManager();
            sessionManager.logout();

            //load login menu
            fxmlLoader = new FXMLLoader(this.getClass().getResource("/org/techlms/demoitest/util/new-login.fxml"));
            Scene scene = new Scene(fxmlLoader.load());
            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            stage.setScene(scene);
            stage.show();

        }catch (Exception e) {
            e.printStackTrace();
        }



    }

    @FXML
    void switchHomePage(MouseEvent event) {
        Stage stage = (Stage)  HomePage.getScene().getWindow(); // Get current stage
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/tech-officer-Home-Page.fxml")); // Load Home Page FXML
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.show();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    void switchMedicalPage(MouseEvent event) {
        System.out.println("user medical page");
        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/technical-officer-new-new-medical.fxml"));
            Parent medicalPage = fxmlLoader.load();
            VBox.setVgrow(medicalPage, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(medicalPage);

            System.out.println("Medical Page Loaded");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @FXML
    void switchNotesPage(MouseEvent event) {
        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/util/user-notices.fxml"));
            Parent notes = fxmlLoader.load();
            VBox.setVgrow(notes, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(notes);

            System.out.println("Notes Page Loaded");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @FXML
    void switchTimeTable(MouseEvent event) {
        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/tech-officer-department-new-time-table.fxml"));
            Parent timeTable = fxmlLoader.load();
            VBox.setVgrow(timeTable, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(timeTable);

            System.out.println("Time Table Loaded");

        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    @FXML
    void switchUserProfilePage(MouseEvent event) {
        try{
            FXMLLoader fxmlLoader = null;
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/tech-officer-user-profile.fxml"));
            Parent medicalPage = fxmlLoader.load();
            VBox.setVgrow(medicalPage, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(medicalPage);
        }catch(IOException e){
            e.printStackTrace();
        }
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        loadUserProfile();
        FXMLLoader fxmlLoader = null;
        try {
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/technical-officer-new-attendance.fxml"));
            Parent medicalPage = fxmlLoader.load();
            VBox.setVgrow(medicalPage, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(medicalPage);

            System.out.println("profile Page Loaded");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
        private void loadUserProfile(){
            SessionManager sessionManager = SessionManager.getInstance();
            System.out.println(sessionManager);

            userprofile.setCenterX(150);
            userprofile.setCenterY(150);
//        userprofile.profile().

            System.out.println(sessionManager.getUsername());
            byte[] userProfileImage = User.getUserProfileByUserName(sessionManager.getUsername());
            System.out.println(userProfileImage);
            System.out.println("userProfileImage: " + sessionManager.getUsername());
            if (userProfileImage != null) {
                InputStream inputStream = new ByteArrayInputStream(userProfileImage);
                Image image = new Image(inputStream , 100, 100, false, true);
                userprofile.setFill(new ImagePattern(image));
            }else {

                Image image = new Image(
                        this.getClass().getResourceAsStream("/org/techlms/demoitest/application-images/util/10337609.png"),
                        100, // Desired width of the image
                        100, // Desired height of the image
                        false, // Preserve aspect ratio
                        true   // Smooth scaling
                );

// Set the image as a pattern for the circle
                userprofile.setFill(new ImagePattern(image));
            }

        }

    }
