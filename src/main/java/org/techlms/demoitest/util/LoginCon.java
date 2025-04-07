package org.techlms.demoitest.util;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import org.techlms.demoitest.dto.LoginDTO;
import org.techlms.demoitest.service.AuthService;
import org.techlms.demoitest.users.User;

public class LoginCon {

    @FXML
    private TextField username;
    @FXML
    private TextField password;

    private final AuthService authService;

    public LoginCon() {
        this.authService = new AuthService();  // Initialize authService here
    }

    public void login(ActionEvent event) {
        String username = this.username.getText().trim();
        String password = this.password.getText().trim();

        // Create LoginDTO
        LoginDTO loginDTO = new LoginDTO(username, password);
        User user = authService.authenticate(loginDTO);

        if (user != null) {
            // Set session
            SessionManager.getInstance().setUser(user.getUser_id(), user.getUser_name(), user.getRole());

            // switch user
            try{
                FXMLLoader fxmlLoader = null;
                if(SessionManager.getInstance().getRole().equals("student")){
                    fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/student-ui-components/student-ui.fxml"));


                }
                else if(SessionManager.getInstance().getRole().equals("admin")){
                    fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/admin-ui-Components/admin-userPage.fxml"));


                }
                else if(SessionManager.getInstance().getRole().equals("tech officer")){
                    fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/tech-officer-ui-Components/tech-officer-Home-Page.fxml"));


                }
                else if(SessionManager.getInstance().getRole().equals("lecturer")){
                    fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lechurer-home.fxml"));


                }

                Scene scene = new Scene(fxmlLoader.load());
                Stage stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
                stage.setScene(scene);
                stage.show();

            }catch (Exception e){
                e.printStackTrace();
            }
        } else {
            System.out.println("Login failed");
        }
    }
}
