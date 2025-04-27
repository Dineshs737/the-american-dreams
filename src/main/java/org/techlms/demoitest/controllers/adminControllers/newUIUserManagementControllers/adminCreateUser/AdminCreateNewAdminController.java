package org.techlms.demoitest.controllers.adminControllers.newUIUserManagementControllers.adminCreateUser;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import org.techlms.demoitest.model.users.Admin;
import org.techlms.demoitest.model.util.Util;
import org.techlms.demoitest.service.adminService.AdminService;
import org.techlms.demoitest.util.FileUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class AdminCreateNewAdminController implements Initializable {
    private File profileImageFile;
    AdminService service = new AdminService();
    private final String[] genderChoice = {"Male", "Female"};

    @FXML
    TextField name;


    @FXML
    private TextField address;


    @FXML
    private Label currentUserIDLabel;


    @FXML
    private VBox departmentCard;

    @FXML
    private VBox departmentCard1;

    @FXML
    private TextField email;

    @FXML
    private PasswordField password;

    @FXML
    private TextField phoneNumber;

    @FXML
    private ChoiceBox<String> gender;

    @FXML
    private VBox profileMainContainer;

    @FXML
    private HBox profilePageEditButtonContainer;

    @FXML
    private Circle profilePicture;

    @FXML
    private TextField adminId;

    @FXML
    private TextField userName;

    @FXML
    void createAdmin(ActionEvent event) {
        // Validate inputs
        String validationError = validateInputs();
        if (validationError != null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", validationError);
            return;
        }

        // Check if the username already exists
        if (service.isUserExists(userName.getText().toLowerCase())) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Username already exists.");
            return;
        }
        // Validate Student ID
        if (!Admin.isValidAdminId(adminId.getText().trim().toLowerCase())) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Invalid Admin ID.");
            return;
        }

        if (service.isAdminIdExits(adminId.getText().toLowerCase())) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Admin ID exists.");
            return;
        }

        // Create a new student object
        try {
//            public Student(String userName, String password, String name, String email, String contactNumber, String role, String gender, String address, byte[] userProfile , String studentId, String branch, String department) {
//                super(userName, password, name, email, contactNumber, role, gender, address, userProfile);
//                this.studentId = studentId;
//                this.branch = branch;
//                this.department = department;
//            }

            byte[] byteImage = FileUtils.convertFileToByteArray(profileImageFile);


            // Save the student
//                public Lecturer(String userName, String password, String name, String email, String contactNumber, String role, String gender, String address, byte[] userProfile, String lecturerID, String department) {
//                super(userName, password, name, email, contactNumber, role, gender, address, userProfile);
//                this.lecturerID = lecturerID;
//                this.department = department;

            boolean success = service.createAdmin(new Admin(
                    userName.getText().trim().toLowerCase(),
                    password.getText().trim(),
                    name.getText().trim(),
                    email.getText().toLowerCase().trim(),
                    phoneNumber.getText().trim(),
                    "admin",
                    gender.getValue().equals("Male") ? "m" : "f",
                    address.getText().trim(),
                    byteImage,
                    adminId.getText().trim().toLowerCase()

            ));
            if (success) {
                showAlert(Alert.AlertType.INFORMATION, "Admin created", "Admin created successfully.");
            } else {
                showAlert(Alert.AlertType.ERROR, "Admin Creation Failed", "Could not create the Admin.");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String validateInputs() {
        if (userName.getText().isEmpty()) return "Please enter a username.";
        if (password.getText().isEmpty()) return "Please enter a password.";
        if (name.getText().isEmpty()) return "Please enter a name.";
        if (email.getText().isEmpty()) return "Please enter an email.";
        if (!Util.isValidEmail(email.getText().trim().toLowerCase())) return "Please enter a valid email.";
        if (phoneNumber.getText().isEmpty()) return "Please enter a phone number.";
        if (!Util.isValidPhoneNumber(phoneNumber.getText().trim())) return "Please enter a valid phone number.";
        if (address.getText().isEmpty()) return "Please enter an address.";
        if (gender.getValue() == null) return "Please select a gender.";
        if(profileImageFile == null) return "Please select a profile image.";
        return null;
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

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        gender.getItems().setAll(genderChoice);
    }
}
