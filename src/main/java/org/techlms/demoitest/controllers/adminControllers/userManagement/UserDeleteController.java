package org.techlms.demoitest.controllers.adminControllers.userManagement;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import org.techlms.demoitest.controllers.adminControllers.AdminHomePageController;
import org.techlms.demoitest.service.adminService.AdminService;

public class UserDeleteController {
    AdminHomePageController adminDashboardController;
    private final AdminService service = new AdminService();
    @FXML
    private VBox container;

    @FXML
    private TextField username;

    @FXML
    void cancel(ActionEvent event) {
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        // Close the stage
        stage.close();


    }

    @FXML
    void delete(ActionEvent event) {
        if (username.getText().isEmpty()) {
            Alert alert = new Alert(Alert.AlertType.ERROR, "Please Provide Username");
            alert.showAndWait();
        } else {
            if (service.isUserExists(username.getText().toLowerCase().trim())) {
                Alert alert = new Alert(Alert.AlertType.CONFIRMATION, "Are you sure you want to delete this User?");
                alert.showAndWait();

                if (alert.getResult() == ButtonType.OK) {
                    if (service.deleteUserByName(username.getText().toLowerCase().trim())) {
                        System.out.println("User Deleted Successfully");

                        if (adminDashboardController != null) {
                            adminDashboardController.refreshAllComponents();
                        }

                        // Close the popup
                        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
                        stage.close();
                    }
                }
            } else {
                Alert alert = new Alert(Alert.AlertType.ERROR, "User not found");
                alert.showAndWait();
            }
        }
    }


    public void setAdminDashboardController(AdminHomePageController adminHomePageController) {
            this.adminDashboardController = adminHomePageController;
    }


}
