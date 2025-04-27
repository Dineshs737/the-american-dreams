package org.techlms.demoitest.controllers.studentControllers;

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
import org.techlms.demoitest.model.users.Student;
import org.techlms.demoitest.service.studentService.StudentService;
import org.techlms.demoitest.util.FileUtils;
import org.techlms.demoitest.util.SessionManager;

import java.io.*;
import java.net.URL;
import java.util.ResourceBundle;

public class StudentUserProfile implements Initializable {

    private final SessionManager sessionManager = SessionManager.getInstance();
    private final StudentService service = new StudentService();
    private File profileImageFile;

    @FXML
    private   VBox profileMainContainer;
    @FXML
    private TextField address;

    private String   editCardButtonStyle;

    @FXML
    private HBox profilePageEditButtonContainer;

    @FXML
    private TextField batchYear;
    @FXML
    private Label currentUserIDLabel;

    @FXML
    private TextField department;

    @FXML
    private VBox departmentCard;

    @FXML
    private VBox departmentCard1;

    @FXML
    private TextField email;

    @FXML
    private TextField gender;

    @FXML
    private TextField phoneNumber;

    @FXML
    private Circle profilePicture;

    @FXML
    private TextField studentId;

    @FXML
    private TextField userName;

    @FXML
    private Label nameLabel;

    {
           editCardButtonStyle =  "-fx-background-color: #3498db; -fx-background-radius: 15px;  -fx-text-fill: #ffffff; -fx-font-size: 16px; -fx-font-weight: bold;  -fx-padding: 10px 40px; -fx-transition: background-color 0.3s ease; ";
    }
    @Override
    public void initialize(URL location, ResourceBundle resources) {

            loadProfileData();
    }

    private void loadProfileData() {

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
        Student student = service.getStudentProfile(sessionManager.getUserid(),sessionManager.getRole());
        System.out.println(student);
        //set student name
        nameLabel.setText(student.getName() == null?" " : student.getName());
        //set username of student
        userName.setText(student.getUserName() == null?" " : student.getUserName());
        //set gender
        gender.setText(student.getGender() == null?" " :
                student.getGender().equalsIgnoreCase("m") ?"Male":"Female");

        //set phone number
        phoneNumber.setText(student.getContactNumber() == null?" ":student.getContactNumber());
        //set address
        address.setText(student.getAddress()==null?" ":student.getAddress());
        //set email
        email.setText(student.getEmail() == null?" ":student.getEmail());

        // fetch student data

        //set student Id
        studentId.setText(student.getStudentId() == null?" ":student.getStudentId());
        //set student department
        department.setText(student.getDepartment() == null?" ":student.getDepartment());
        //set student batch year
        batchYear.setText(student.getBranch() == null?" ":student.getBranch());

        // set user profile
        loadUserProfile(student.getUserProfile());





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

           loadProfileData();

        });

        save.setOnAction((ActionEvent event) -> {

            {

                Student existingStudent = service.getStudentProfile(1, "student");
                /*******ge
                 *     public Student(byte[] userProfile, String userName, String email, String name, String gender, String contactNumber, String address, String studentId, String department, String branch) {
                 *         super(userProfile, userName, email, name, gender, contactNumber, address);
                 *         this.studentId = studentId;
                 *         this.department = department;
                 *         this.branch = branch;
                 *     }
                 */


                try {
                    // Convert the profile image file to a byte array
                    byte[] byteImage = null;

// Check if existingStudent's user profile is null
                    if (existingStudent.getUserProfile() == null) {
                        byteImage = FileUtils.convertFileToByteArray(profileImageFile);
                    } else {
                        byteImage = existingStudent.getUserProfile();
                    }


                    // Create a new Student object with updated details
                    Student newStudentProfile = new Student(
                            byteImage != null ? byteImage : existingStudent.getUserProfile(), // Use byteImage if not null
                            existingStudent.getUserName(),
                            email.getText().isEmpty() ? existingStudent.getEmail() : email.getText().trim().toLowerCase(),
                            existingStudent.getName(),
                            existingStudent.getGender(),
                            phoneNumber.getText().isEmpty() ? existingStudent.getContactNumber() : phoneNumber.getText().trim().toLowerCase(),
                            address.getText().isEmpty() ? existingStudent.getAddress() : address.getText().trim(),
                            existingStudent.getStudentId(),
                            existingStudent.getDepartment(),
                            existingStudent.getBranch()
                    );

                    // Update the student profile
                    boolean success = service.updateStudentProfile(newStudentProfile, sessionManager.getUserid());
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
