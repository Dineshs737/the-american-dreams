package org.techlms.demoitest.controllers.adminControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;

public class FindUserController {

    @FXML
    private ChoiceBox<?> selectRole;

    @FXML
    private VBox userFindOperationCard;

    @FXML
    private VBox userfindCard;

    @FXML
    private TextField username;


    @FXML
    void findUser(ActionEvent event) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/adminUIComponets/userUpdate.fxml"));
            Parent updateUserPage = fxmlLoader.load();

            // Make sure it resizes properly
            VBox.setVgrow(updateUserPage, javafx.scene.layout.Priority.ALWAYS);

            updateUserPage.setStyle("-fx-pref-height: USE_COMPUTED_SIZE; -fx-min-height: USE_PREF_SIZE;");

            userFindOperationCard.getChildren().add(updateUserPage);

            System.out.println("user update card added");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
