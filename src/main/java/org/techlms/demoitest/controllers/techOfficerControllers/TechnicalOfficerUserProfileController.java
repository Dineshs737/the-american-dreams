package org.techlms.demoitest.controllers.techOfficerControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import org.techlms.demoitest.model.users.TechnicalOfficer;
import org.techlms.demoitest.service.techOfficerService.TechnicalOfficerService;
import org.techlms.demoitest.util.FileUtils;
import org.techlms.demoitest.util.SessionManager;

import java.io.*;
import java.net.URL;
import java.util.ResourceBundle;

public class TechnicalOfficerUserProfileController implements Initializable {
    private  final SessionManager sessionManager = SessionManager.getInstance();
    private final TechnicalOfficerService service = new TechnicalOfficerService();
    String editCardButtonStyle;
    private File profileImageFile;
    @FXML
    private VBox departmentCard;

    @FXML
    private TextField email;

    @FXML
    private TextField gender;

    @FXML
    private Label nameLabel;

    @FXML
    private TextField phoneNumber;

    @FXML
    private VBox profileMainContainer;

    @FXML
    private HBox profilePageEditButtonContainer;

    @FXML
    private Circle profilePicture;

    @FXML
    private TextField techId;

    @FXML
    private TextField userName;

    @FXML
            private TextField address;
    @FXML
            private TextField department;



    {
        editCardButtonStyle =  "-fx-background-color: #3498db; -fx-background-radius: 15px;  -fx-text-fill: #ffffff; -fx-font-size: 16px; -fx-font-weight: bold;  -fx-padding: 10px 40px; -fx-transition: background-color 0.3s ease; ";
    }
    @Override
    public void initialize(URL location, ResourceBundle resources) {

        loadProfileData();
    }

    private void loadProfileData() {

        gender.setEditable(false);
        address.setEditable(false);
        email.setEditable(false);
        phoneNumber.setEditable(false);
        profilePicture.setDisable(true);

        for (Node icon : profileMainContainer.lookupAll(".edit-icon")) {
            icon.setVisible(false);
        }
        //load button containers
        profilePageEditButtonContainer.getChildren().clear();
        profilePageEditButtonContainer.getChildren().addAll(userProfileDefaultContainer());


        // test data must pass sessionManager user id and user role
        TechnicalOfficer technicalOfficer = service.getTechnicalOfficerProfile(sessionManager.getUserid(),sessionManager.getRole());
        System.out.println(technicalOfficer);
        //set student name
        nameLabel.setText(technicalOfficer.getName() == null?" " : technicalOfficer.getName());
        //set username of student
        userName.setText(technicalOfficer.getUserName() == null?" " : technicalOfficer.getUserName());
        //set gender
        gender.setText(technicalOfficer.getGender() == null?" " :
                technicalOfficer.getGender().equalsIgnoreCase("m") ?"Male":"Female");

        //set phone number
        phoneNumber.setText(technicalOfficer.getContactNumber() == null?" ":technicalOfficer.getContactNumber());
        //set address
        address.setText(technicalOfficer.getAddress()==null?" ":technicalOfficer.getAddress());
        //set email
        email.setText(technicalOfficer.getEmail() == null?" ":technicalOfficer.getEmail());

        // fetch student data

        //set student Id
        techId.setText(technicalOfficer.getTechnicalOfficerId() == null?" ":technicalOfficer.getTechnicalOfficerId());
        //set student department
        department.setText(technicalOfficer.getDepartment() == null?" ":technicalOfficer.getDepartment());
        //set student batch year

        // set user profile
        loadUserProfile(technicalOfficer.getUserProfile());





    }



    private HBox getUserEditCard() {
        HBox editCard = new HBox();

        Button save = new Button("Save");
        Button cancel = new Button("Cancel");
        save.setStyle(editCardButtonStyle);
        cancel.setStyle(editCardButtonStyle);
        editCard.getChildren().addAll(save, cancel);
        editCard.setSpacing(20);


        // CANCEL EDIT PROFILE
        cancel.setOnAction((ActionEvent event) -> {
//            for (Node icon : profileMainContainer.lookupAll(".edit-icon")) {
//                icon.setVisible(false);
//            }
            loadProfileData();

        });

        save.setOnAction((ActionEvent event) -> {

//            if(address.getText().isEmpty()){
//                showAlert(Alert.AlertType.ERROR, "Error", "Please Your address address");
//            }
//            if(profileImageFile == null){
//                showAlert(Alert.AlertType.ERROR, "Error", "Please Select Profile Image");
//            }
//            if(phoneNumber.getText().isEmpty()){
//                showAlert(Alert.AlertType.ERROR, "Error", "Please Select Phone Number");
//            }
//            if(email.getText().isEmpty()){
//                showAlert(Alert.AlertType.ERROR, "Error", "Please Select Email");
//            }
            {

                TechnicalOfficer existingTechnicalOfficer = service.getTechnicalOfficerProfile(sessionManager.getUserid(), sessionManager.getRole());
                existingTechnicalOfficer.setUserID(sessionManager.getUserid());
//                existingTechnicalOfficer.setUserID(32);
                /*******ge
                 *     public Student(byte[] userProfile, String userName, String email, String name, String gender, String contactNumber, String address, String lecturerId, String department, String branch) {
                 *         super(userProfile, userName, email, name, gender, contactNumber, address);
                 *         this.lecturerId = lecturerId;
                 *         this.department = department;
                 *         this.branch = branch;
                 *     }
                 */


                try {
                    // Convert the profile image file to a byte array
                    byte[] byteImage = FileUtils.convertFileToByteArray(profileImageFile);

                    // Create a new Student object with updated details
                    TechnicalOfficer newTechnical = new TechnicalOfficer(
                            byteImage != null ? byteImage : existingTechnicalOfficer.getUserProfile(), // Use byteImage if not null
                            existingTechnicalOfficer.getUserName(),
                            email.getText().isEmpty() ? existingTechnicalOfficer.getEmail() : email.getText().trim().toLowerCase(),
                            existingTechnicalOfficer.getName(),
                            gender.getText().isEmpty() ? existingTechnicalOfficer.getGender() :gender.getText().trim().toLowerCase().equals("male") ? "m":"f",
                            phoneNumber.getText().isEmpty() ? existingTechnicalOfficer.getContactNumber() : phoneNumber.getText().trim().toLowerCase(),
                            address.getText().isEmpty() ? existingTechnicalOfficer.getAddress() : address.getText().trim(),
                            existingTechnicalOfficer.getTechnicalOfficerId(),
                            existingTechnicalOfficer.getDepartment()
                    );

                    // Update the student profile
                    boolean success = service.updateTechnicalOfficerProfile(newTechnical, existingTechnicalOfficer);
                    if (success) {
                        // Reload the profile data and show a success alert
                        loadProfileData();
                        showAlert(Alert.AlertType.INFORMATION, "Success", "Student Profile Updated");
                    } else {
                        // Show an error alert if the update fails
                        showAlert(Alert.AlertType.ERROR, "Error", "Failed to Update Student Profile");
                    }
                } catch (Exception e) {
                    // Handle exceptions
                    e.printStackTrace();
                }


            }

        });




        return editCard;
    }

    //user profile defaultContainer
    private HBox userProfileDefaultContainer() {

        HBox buttonCard = new HBox();
        Button edit = new Button("Edit");
        edit.setStyle(editCardButtonStyle);

        buttonCard.getChildren().addAll(edit);

        edit.setOnAction((ActionEvent event) -> {

            address.setEditable(true);
            email.setEditable(true);
            phoneNumber.setEditable(true);
            gender.setEditable(true);
            profilePicture.setDisable(false);

            for (Node icon : profileMainContainer.lookupAll(".edit-icon")) {
                icon.setVisible(true); // Show icons before editing
            }

            profilePageEditButtonContainer.getChildren().clear();
            profilePageEditButtonContainer.getChildren().add(getUserEditCard());

        });

        return buttonCard;
    }



    private void loadUserProfile(byte[] profileImage) {

        profilePicture.setCenterX(150);
        profilePicture.setCenterY(150);
//        userprofile.profile().


        if (profileImage != null) {
            InputStream inputStream = new ByteArrayInputStream(profileImage);
            Image image = new Image(inputStream , 100, 100, false, true);
            profilePicture.setFill(new ImagePattern(image));
        }else {

            Image image = new Image(
                    this.getClass().getResourceAsStream("/org/techlms/demoitest/application-images/util/10337609.png"),
                    100, // Desired width of the image
                    100, // Desired height of the image
                    false, // Preserve aspect ratio
                    true   // Smooth scaling
            );

// Set the image as a pattern for the circle
            profilePicture.setFill(new ImagePattern(image));
        }

    }


    @FXML
    void selectProfileImage(MouseEvent event) {
        // Step 1: Create a file chooser
        FileChooser fileChooser = new FileChooser();
        fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("images", "*.jpg"));

        // Step 2: Show the file chooser dialog
        Stage stage = new Stage();  // Use the existing stage if necessary
        profileImageFile = fileChooser.showOpenDialog(stage);

        profilePicture.setCenterX(150);
        profilePicture.setCenterY(150);
        try {
            Image image = new Image(new FileInputStream(profileImageFile),
                    100, // Desired width of the image
                    100, // Desired height of the image
                    false, // Preserve aspect ratio
                    true   // Smooth scaling
            );

// Set the image as a pattern for the circle
            profilePicture.setFill(new ImagePattern(image));

        }catch (FileNotFoundException e) {
            e.printStackTrace();
        }




        if (profileImageFile != null) {
            // Step 3: If a file is selected, process it
            System.out.println("Selected file: " + profileImageFile.getAbsolutePath());
        }

    }


    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.showAndWait();
    }

}
