package org.techlms.demoitest.controllers.adminControllers.userManagement;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import org.techlms.demoitest.model.users.*;
import org.techlms.demoitest.model.util.Util;
import org.techlms.demoitest.service.adminService.AdminService;

import java.net.URL;
import java.util.ResourceBundle;

import static org.techlms.demoitest.model.users.Student.isValidStudentId;

public class UserCreateController implements Initializable {

    private final AdminService service = new AdminService();

    private User newUser;


    @FXML
    private TextField address;


    @FXML
    private TextField email;

    @FXML
    private ChoiceBox<String> gender;
    private final String[] genderChoice = {"Male", "Female"};

    @FXML
    private TextField password;

    @FXML
    private VBox departmentContainer;

    @FXML
    private TextField phoneNumber;

    @FXML
    private  ChoiceBox<String> department;

    @FXML
    private ChoiceBox<String> selectRole;
    private final String[] userRole = {"Admin","Student","Lecturer","Technical Officer"};

    @FXML
    private VBox userCreationCard;

    @FXML
    private VBox batchContainer;

    @FXML
    private ChoiceBox <String>selectBatch;

    @FXML
    private Button userProfile;

    @FXML
    private VBox usercCeatemenuContainer;

    @FXML
    private TextField username;

    @FXML
    void cancelMenu(ActionEvent event) {

    }



    @FXML
    void selectUserProfile(ActionEvent event) {

    }


    @Override
    public void initialize(URL location, ResourceBundle resources) {
           gender.getItems().addAll(genderChoice);
           selectRole.getItems().addAll(userRole);
           department.getItems().setAll(service.getDepartments());



           selectRole.setOnAction(event -> {
               if(selectRole.getSelectionModel().getSelectedItem().equals("Admin")){
                   departmentContainer.setVisible(false);
                   batchContainer.setVisible(false);
               }
               else{
                   departmentContainer.setVisible(true);
                   if(selectRole.getSelectionModel().getSelectedItem().equals("Student")){
                       batchContainer.setVisible(true);
                   }
                   else{
                       batchContainer.setVisible(false);
                   }
               }
           });



    }

    @FXML
    void createUser(ActionEvent event) {

        if(selectRole.getSelectionModel().isEmpty()){
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a User Role.");

        }
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
        if(department.getSelectionModel().isEmpty() &&(
           selectRole.getSelectionModel().getSelectedItem().equals("Lecturer")
        || selectRole.getSelectionModel().getSelectedItem().equals("Student")
        || selectRole.getSelectionModel().getSelectedItem().equals("Technical Officer")
        )
        ){
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a department.");
        }
        if(selectBatch.getSelectionModel().isEmpty() && selectRole.getSelectionModel().getSelectedItem().equals("Student")){
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please student batch select a batch.");
        }
        if(gender.getSelectionModel().isEmpty()){
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Please select a gender.");
        }
        else {

            if(!Util.isValidEmail(email.getText().trim().toLowerCase())){
                showAlert(Alert.AlertType.ERROR, "Validation Error", "Please enter a valid email.");
            }
            if(Util.isValidPhoneNumber(phoneNumber.getText().trim())){
                showAlert(Alert.AlertType.ERROR , "Validation Error" , "Please enter a valid phone number");
            }
            if(!service.isUserExists("tg/2022/1416")){
                if(isValidStudentId("tg/2022/1416","2022")){


                    /************
                     *
                     * valid student id and student not exits
                     */
                    boolean success = passDataToUserCreation(selectRole.getSelectionModel().getSelectedItem());
                    if(success){
                        showAlert(Alert.AlertType.INFORMATION, "Validation Success", "Student created successfully.");
                    }
                    else{
                        showAlert(Alert.AlertType.ERROR, "Validation Error", "Student creation failed.");
                    }

                }
                else{
                    showAlert(Alert.AlertType.ERROR , "Validation Error" , "Please enter a valid student ID");

                }

            }
            else{
                showAlert(Alert.AlertType.ERROR, "Validation Error", "Student already exists.");
            }




        }


    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.showAndWait();
//        alert.show();
    }








    private boolean passDataToUserCreation(String role){

        boolean pass = false;
        switch (selectRole.getSelectionModel().getSelectedItem().toLowerCase()) {
            case "student":

                //        newUser = new Lecturer(
//                "donkeycsvdcqsqsfeqfdwwff",
//                "dineshVip",
//                "donkey",
//                "donkeydwdcqsewwdqwasdvs@Gmail.com",
//                "0703728309",
//                "m",
//                null,
//                "lecturer",
//                "2022ssq",
//                "ict");

          pass =     service.createStudent(
                        new Student(
                                username.getText().toLowerCase().trim(),
                                password.getText().trim(),
                                "name",
                                email.getText().toLowerCase().trim(),
                                phoneNumber.getText().trim(),
                                gender.getSelectionModel().getSelectedItem().equals("Male")?"m":"f",
                                null,
                                "student",
                                "2022",
                                "tg/2022/1416",
                                "ict"

                        )
                );


                break;
            case "lecturer":
                 pass =     service.createLecturer(
                        new Lecturer(
                                username.getText().toLowerCase().trim(),
                                password.getText().trim(),
                                "name",
                                email.getText().toLowerCase().trim(),
                                phoneNumber.getText().trim(),
                                gender.getSelectionModel().getSelectedItem().equals("Male")?"m":"f",
                                null,
                                "lecturer",
                                "tg/2022/1416",
                                "ict"

                        )
                );
                break;
            case "technical officer":
                pass =     service.createTechnicalOfficer(
                        new TechnicalOfficer(
                                username.getText().toLowerCase().trim(),
                                password.getText().trim(),
                                "name",
                                email.getText().toLowerCase().trim(),
                                phoneNumber.getText().trim(),
                                gender.getSelectionModel().getSelectedItem().equals("Male")?"m":"f",
                                null,
                                "technical officer",
                                "tg/2022/1416",
                                "ict"
                        )
                );
                break;
            case "admin":

                pass =     service.createAdmin(
                        new Admin(
                                username.getText().toLowerCase().trim(),
                                password.getText().trim(),
                                "name",
                                email.getText().toLowerCase().trim(),
                                phoneNumber.getText().trim(),
                                gender.getSelectionModel().getSelectedItem().equals("Male")?"m":"f",
                                null,
                                "admin",
                                "tg/2022/1416"
                        )
                );
                break;

                default: pass = false;

        }
        return pass;

    }


}
