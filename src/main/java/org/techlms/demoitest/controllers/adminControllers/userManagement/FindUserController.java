package org.techlms.demoitest.controllers.adminControllers.userManagement;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import org.techlms.demoitest.service.adminService.AdminService;

import java.io.IOException;

public class FindUserController {
    private final AdminService service = new AdminService();

    @FXML
    private TextField username;

    @FXML
    private VBox container;


    @FXML
    void findUser(ActionEvent event) {
        if(username.getText().isEmpty()){
            Alert alert = new Alert(Alert.AlertType.ERROR , "Please Provide Username");
            alert.showAndWait();
        }
        else{

            if(service.isUserExists(username.getText().toLowerCase().trim())){
                FXMLLoader fxmlLoader = new FXMLLoader(this.getClass().getResource("/org/techlms/demoitest/admin-ui-Components/admin-new-user-update.fxml"));
                try{
                    container.getChildren().clear();
                    Parent parent = fxmlLoader.load();
                    container.getChildren().add(parent);
                    UserUpdateController controller = fxmlLoader.getController();
//                    controller.setUserInformation(service.getUserByUserName(username.getText().toLowerCase()));



                }catch (IOException e){
                    e.printStackTrace();
                }
            }
            else{
                Alert alert = new Alert(Alert.AlertType.ERROR , "Username Not Found");
            }


        }



    }

}
