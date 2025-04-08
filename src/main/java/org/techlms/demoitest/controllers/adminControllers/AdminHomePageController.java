package org.techlms.demoitest.controllers.adminControllers;

import javafx.animation.TranslateTransition;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Bounds;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.chart.PieChart;
import javafx.scene.control.Label;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Duration;
import org.techlms.demoitest.util.SessionManager;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class AdminHomePageController implements Initializable {

    @FXML
    private Label homePage;

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
        System.out.println("switchCoursePage");
    }

    @FXML
    void switchDeletePage(MouseEvent event) {
        System.out.println("switchDeletePage");
    }

    @FXML
    void switchGetAllUsersPage(MouseEvent event) {
        System.out.println("switchGetAllUsersPage");
    }

    @FXML
    void switchHomePage(MouseEvent event) {
        System.out.println("switchHomePage");
    }

    @FXML
    public void switchUserUpdatePage(MouseEvent event) {
        System.out.println("switchUserUpdatePage");

        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/admin-ui-components/find-user.fxml"));
            Parent root = loader.load();

            Stage popupStage = new Stage();
            popupStage.initModality(Modality.APPLICATION_MODAL); // Block input to other windows
            popupStage.setTitle("Update User");
            popupStage.setScene(new Scene(root));
//            popupStage.setResizable(false);
            popupStage.showAndWait(); // Waits until popup is closed

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @FXML
    void switchNotesPage(MouseEvent event) {
        System.out.println("switchNotesPage");
    }

    @FXML
    void switchUserCreatePage(MouseEvent event) {
        System.out.println("switchUserCreatePage");
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/admin-ui-components/user-creation-menu.fxml"));
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
        System.out.println("switchUserProfilePage");
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        PieChart.Data admin = new PieChart.Data("Male", 20);
        PieChart.Data student = new PieChart.Data("Female", 15);
        userPIChart.getData().addAll(admin, student);

        for (final PieChart.Data data : userPIChart.getData()) {
            data.getNode().addEventHandler(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>() {
                @Override
                public void handle(MouseEvent mouseEvent) {
                    Bounds b1 = data.getNode().getBoundsInLocal();

                    double newX = (b1.getWidth()) / 2.0 + b1.getMinX();
                    double newY = (b1.getHeight()) / 2.0 + b1.getMinY();

                    data.getNode().setTranslateX(0);
                    data.getNode().setTranslateY(0);

                    TranslateTransition tt = new TranslateTransition(Duration.millis(1200), data.getNode());
                    tt.setByX(newX);
                    tt.setByY(newY);
                    tt.setAutoReverse(true);
                    tt.setCycleCount(2);
                    tt.play();
                }
            });
        }
    }
}
