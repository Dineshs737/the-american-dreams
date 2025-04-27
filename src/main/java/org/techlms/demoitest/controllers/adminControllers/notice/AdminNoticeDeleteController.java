package org.techlms.demoitest.controllers.adminControllers.notice;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.ChoiceBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import org.techlms.demoitest.service.adminService.AdminService;

import java.net.URL;
import java.util.ResourceBundle;

public class AdminNoticeDeleteController implements Initializable {
    private  final AdminService service = new AdminService();
    @FXML
    private VBox container;

    @FXML
    private ChoiceBox<String> selectNotice;

    @FXML
    private VBox userCreationCard;

    @FXML
    private VBox usersCementumContainer;

    @FXML
    void cancelMenu(ActionEvent event) {
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        stage.close();
    }

    @FXML
    void delete(ActionEvent event) {


        if (selectNotice.getSelectionModel().getSelectedItem() == null) {
            showAlert(Alert.AlertType.ERROR , "Validation", "Please select a notice to delete");
            return;
        }
        boolean pass = service.deleteNotice(selectNotice.getSelectionModel().getSelectedItem());
        if (pass) {

            //reload that table of data
            showAlert(Alert.AlertType.INFORMATION ," notice deleted ", "Deleted Successfully");
            loadNoticeTitle();
        }
        else {
           showAlert(Alert.AlertType.ERROR , "Validation", "Failed to delete notice");
        }

    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        loadNoticeTitle();

    }

    private void loadNoticeTitle() {
        selectNotice.getItems().clear();
        selectNotice.getItems().setAll(service.getAllNoticeTitle());
        selectNotice.setOnAction(event -> {

        });
    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.showAndWait();
    }
}
