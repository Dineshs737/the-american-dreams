package org.techlms.demoitest.controllers.techOfficerControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import org.techlms.demoitest.util.SessionManager;

public class TechOfficerHomePageController {
    @FXML
    private Label HomePage;

    @FXML
    void logout(ActionEvent event) {
        FXMLLoader fxmlLoader = null;
        try {
            // remove user session
            SessionManager sessionManager = new SessionManager();
            sessionManager.logout();

            //load login menu
            fxmlLoader = new FXMLLoader(this.getClass().getResource("/org/techlms/demoitest/util/NewLogin.fxml"));
            Scene scene = new Scene(fxmlLoader.load());
            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            stage.setScene(scene);
            stage.show();

        }catch (Exception e) {
            e.printStackTrace();
        }



    }

    @FXML
    void switchAttendancePage(MouseEvent event) {
        System.out.println("user attendance page");

    }

    @FXML
    void switchHomePage(MouseEvent event) {
        System.out.println("user home page");

    }

    @FXML
    void switchMedicalPage(MouseEvent event) {
        System.out.println("user medical page");

    }

    @FXML
    void switchNotesPage(MouseEvent event) {
        System.out.println("user notes page");

    }

    @FXML
    void switchTimeTable(MouseEvent event) {
        System.out.println("user time table");


    }

    @FXML
    void switchUserProfilePage(MouseEvent event) {
        System.out.println("user profile page");

    }

}
