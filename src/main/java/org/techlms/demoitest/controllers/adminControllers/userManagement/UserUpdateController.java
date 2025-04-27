package org.techlms.demoitest.controllers.adminControllers.userManagement;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import org.techlms.demoitest.model.users.User;
import org.techlms.demoitest.service.adminService.AdminService;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class UserUpdateController implements Initializable {
    private final AdminService service = new AdminService();
    @FXML
    private TextField address;

    @FXML
    private TextField email;

    @FXML
    private ChoiceBox<String> gender;

    @FXML
    private TextField password;

    @FXML
    private TextField phoneNumber;

    @FXML
    private ChoiceBox<String> selectRole;


    @FXML
    private Button userProfile;

    @FXML
    private VBox container;

    @FXML
    private TextField username;

    private final String [] userGender = {"Male", "Female"};
//    private final String[] userTypes = {"Admin","Lecturer","Student","Technical Officer"};

    private User existingUser;

    @FXML
    void cancel(ActionEvent event) {
        loadUserFindMenu();


    }

    @FXML
    void update(ActionEvent event) {
//        if(selectRole.getSelectionModel().isEmpty()){
//            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a User Role.");
//
//        }
        if(username.getText().isEmpty()){
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please enter a username.");
        }
        if(password.getText().isEmpty()){
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please enter a password.");
        }
        if(email.getText().isEmpty()){
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please enter an email.");
        }
        if(phoneNumber.getText().isEmpty()){
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please enter a phone number.");
        }
        if(address.getText().isEmpty()){
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please enter an address.");
        }
        if(gender.getSelectionModel().isEmpty()){
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a gender.");
        }
        else {

//            if(! Util.isValidEmail(email.getText().trim().toLowerCase())){
//                showAlert(Alert.AlertType.ERROR, "Validation Error", "Please enter a valid email.");
//            }
//            if(!Util.isValidPhoneNumber(phoneNumber.getText().trim())){
//                showAlert(Alert.AlertType.ERROR , "Validation Error" , "Please enter a valid phone number");
//            }
            if(!service.isUserExists(username.getText().toLowerCase())){



                    /************
                     *
                     * valid student id and student not exits
                     */
                    /********
                     *     public User(String userName, String email, String name, String gender, String contactNumber, String role, byte[] userProfile) {
                     *         this.userName = userName;
                     *         this.email = email;
                     *         this.name = name;
                     *         this.gender = gender;
                     *         this.contactNumber = contactNumber;
                     *         this.role = role;
                     *         this.userProfile = userProfile;
                     *     }
                     */

//                    User newUser = new User(
//                            username.getText().trim().toLowerCase(),
//                            password.getText().trim(),
//                            email.getText().trim().toLowerCase(),
//                            "dinesh",
//                            gender.getSelectionModel().getSelectedItem().equals("Male")?"m":"f",
//                            phoneNumber.getText().trim(),
//                            existingUser.getRole(),
//                            existingUser.getUserProfile() //  important change user profile
//                    );
//
//                    boolean success =  service.updateUserByName(existingUser, newUser);
//                    if(success){
//                        showAlert(Alert.AlertType.INFORMATION, "Validation Success", "Student update successfully.");
//                    }
//                    else{
//                        showAlert(Alert.AlertType.ERROR, "Validation Error", "Student update failed.");
//                    }


            }
            else{

                showAlert(Alert.AlertType.ERROR, "Validation Error", "User Already Exists.");

            }




        }



    }




    @FXML
    void selectUserProfile(ActionEvent event) {
        System.out.println("selectUserProfile");

    }


    public void setUserInformation(User user) {

        this.existingUser = user;
        username.setText(user.getUserName());
        address.setText("Mannar ");
        email.setText(user.getEmail());
        phoneNumber.setText(user.getContactNumber());
        selectRole.getItems().clear();
        selectRole.setValue(user.getRole());
        gender.setValue(user.getGender().equals("m") ? "Male" : "Female");

    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        gender.getItems().setAll(userGender);
//        selectRole.getItems().setAll(userTypes);

    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.showAndWait();
//        alert.show();
    }


    private  void loadUserFindMenu(){
        FXMLLoader fxmlLoader = new FXMLLoader(this.getClass().getResource("/org/techlms/demoitest/admin-ui-Components/find-user.fxml"));
        try{
            container.getChildren().clear();
            Parent parent = fxmlLoader.load();
            container.getChildren().add(parent);


        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
