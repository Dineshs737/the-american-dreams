package org.techlms.demoitest.controllers.adminControllers;

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
import javafx.stage.Modality;
import javafx.stage.Stage;
import org.techlms.demoitest.controllers.adminControllers.userManagement.UserDeleteController;
import org.techlms.demoitest.model.users.User;
import org.techlms.demoitest.util.SessionManager;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ResourceBundle;

public class AdminHomePageController implements Initializable {


    private AdminDataInfoController adminDataInfoController;

    @FXML
    private VBox adminUserInfo;
    @FXML VBox contentContainer;
    @FXML VBox container;
    @FXML
    private Label homePage;

    @FXML
    private Circle userprofile;



    @FXML
    void logout(ActionEvent event) {
        try {
            // remove user session
            SessionManager sessionManager = new SessionManager();
            sessionManager.logout();

            //load login menu
            FXMLLoader fxmlLoader = new FXMLLoader(this.getClass().getResource("/org/techlms/demoitest/util/new-login.fxml"));
            Scene scene = new Scene(fxmlLoader.load());
            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            stage.setScene(scene);
            stage.show();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    void switchCoursePage(MouseEvent event) {

     FXMLLoader fxmlLoader = new FXMLLoader();
       try {
           fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/admin-ui-Components/admin-course-page.fxml"));

           Parent timeTable = fxmlLoader.load();
           VBox.setVgrow(timeTable, Priority.ALWAYS);
           contentContainer.getChildren().clear();
           contentContainer.getChildren().add(timeTable);
       }catch (IOException e){
           e.printStackTrace();
       }

        System.out.println("switchCoursePage");
    }

    @FXML
    void switchDeletePage(MouseEvent event) {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/admin-ui-Components/admin-user-delete.fxml"));

        try {
            Parent root = loader.load();

            // Get the delete popup controller and set the parent controller
            UserDeleteController userDeleteController = loader.getController();
            userDeleteController.setAdminDashboardController(this); // Pass the current controller

            // Show the popup
            Stage stage = new Stage();
            stage.setScene(new Scene(root));
            stage.initModality(Modality.APPLICATION_MODAL);
            stage.showAndWait();

        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Failed to open delete popup: " + e.getMessage());
        }
    }


    @FXML
    void switchGetAllUsersPage(MouseEvent event) {
        System.out.println("switchGetAllUsersPage");
    }

    @FXML
    public void switchHomePage(MouseEvent event) {
        Stage stage = (Stage) homePage.getScene().getWindow(); // Get current stage
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/org/techlms/demoitest/admin-ui-Components/admin-userPage.fxml")); // Load Home Page FXML
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.show();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void switchUserUpdatePage(MouseEvent event) {


        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/admin-ui-Components/find-user.fxml"));
            Parent root = loader.load();
            container.getChildren().clear();
            container.getChildren().add(root);

//            Stage popupStage = new Stage();
//            popupStage.initModality(Modality.APPLICATION_MODAL); // Block input to other windows
//            popupStage.setTitle("Update User");
//            popupStage.setScene(new Scene(root));
//            popupStage.showAndWait(); // Waits until popup is closed

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @FXML
    void switchNotesPage(MouseEvent event) {
        FXMLLoader fxmlLoader = new FXMLLoader();
        try {
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/admin-ui-Components/admin-note-page/admin-notice-page.fxml"));

            Parent timeTable = fxmlLoader.load();
            VBox.setVgrow(timeTable, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(timeTable);
        }catch (IOException e){
            e.printStackTrace();
        }

        System.out.println("switchNotesPage");
    }


    @FXML
    void switchUserCreatePage(MouseEvent event) {
        System.out.println("switchUserCreatePage");
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/admin-ui-Components/user-creation-menu.fxml"));
            Parent root = loader.load();

            Stage popupStage = new Stage();
            popupStage.initModality(Modality.APPLICATION_MODAL); // Block input to other windows
            popupStage.setTitle("Create New User");
            popupStage.setScene(new Scene(root));
            popupStage.setResizable(false);
            popupStage.showAndWait(); // Waits until popup is closed

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    void switchUserPage(MouseEvent event) {
        System.out.println("switchUserPage");
    }

    @FXML
    void switchUserProfilePage(MouseEvent event) {
        FXMLLoader fxmlLoader = new FXMLLoader();
        try {
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/admin-ui-Components/admin-user-profile.fxml"));
            Parent timeTable = fxmlLoader.load();
            VBox.setVgrow(timeTable, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(timeTable);
        }catch (IOException e){
            e.printStackTrace();
        }

    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        adminUserInfo.getChildren().clear();
        adminUserInfo.setFillWidth(true);
        FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/admin-ui-Components/admin-data-info-menu.fxml"));

        try {
            Parent root = fxmlLoader.load(); // Load FXML first
            this.adminDataInfoController = fxmlLoader.getController(); // Get controller after loading
            adminUserInfo.getChildren().add(root);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        loadUserProfile();
    }


    public void refreshAllComponents() {
        if (adminDataInfoController != null) {
            adminDataInfoController.loadData();
        }
    }

    private void loadUserProfile(){
        SessionManager sessionManager = SessionManager.getInstance();
        System.out.println(sessionManager);

        userprofile.setCenterX(150);
        userprofile.setCenterY(150);
//        userprofile.profile().

        byte[] userProfileImage = User.getUserProfileByUserName(sessionManager.getUsername());
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
