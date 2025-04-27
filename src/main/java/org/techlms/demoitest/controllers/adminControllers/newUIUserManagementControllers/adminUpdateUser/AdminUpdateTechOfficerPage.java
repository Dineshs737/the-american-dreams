package org.techlms.demoitest.controllers.adminControllers.newUIUserManagementControllers.adminUpdateUser;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import org.techlms.demoitest.model.users.Student;
import org.techlms.demoitest.model.util.Util;
import org.techlms.demoitest.service.adminService.AdminService;
import org.techlms.demoitest.util.FileUtils;

import java.io.*;
import java.net.URL;
import java.util.ResourceBundle;

import static org.techlms.demoitest.model.users.Student.isValidStudentId;

public class AdminUpdateTechOfficerPage implements Initializable {
    private File profileImageFile;
    private final AdminService service = new AdminService();
    private Student existingStudent;

    @FXML
    private TextField address;


    @FXML
    private Label currentUserIDLabel;

    @FXML
    private ChoiceBox<String> department;

    @FXML
    private VBox departmentCard;

    @FXML
    private VBox departmentCard1;

    @FXML
    private TextField email;

    @FXML
    private ChoiceBox<String> gender;

    @FXML
    private TextField name;

    @FXML
    private PasswordField password;

    @FXML
    private TextField phoneNumber;

    @FXML
    private VBox profileMainContainer;

    @FXML
    private HBox profilePageEditButtonContainer;

    @FXML
    private Circle profilePicture;

    @FXML
    private ChoiceBox<String> selectBatch;

    @FXML
    private TextField studentId;

    @FXML
    private TextField userName;

    @FXML
    void createStudent(ActionEvent event) {

        String validationError = validateInputs();
        if (validationError != null) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", validationError);
            return;
        }

        // Check if the username already exists
        if (service.isUserExists(userName.getText().toLowerCase()) &&  !userName.getText().trim().equalsIgnoreCase(existingStudent.getUserName())) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Username already exists.");
            return;
        }

        // Validate Student ID
        if (!isValidStudentId(studentId.getText().trim(), selectBatch.getValue())) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Invalid Student ID.");
            return;
        }

        if (service.isStudentIdExits(studentId.getText().toLowerCase() )&& !studentId.getText().toLowerCase().equals(existingStudent.getStudentId())) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Student ID already exists.");
            return;
        }
        if(service.isEmailIdExits(email.getText().toLowerCase()) && !email.getText().equalsIgnoreCase(existingStudent.getEmail())) {
            showAlert(Alert.AlertType.ERROR, "Validation Error", "Email ID already exists.");
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
            byte[] byteImage = null;

// Check if existingStudent's user profile is null
            if (existingStudent.getUserProfile() == null) {
                byteImage = FileUtils.convertFileToByteArray(profileImageFile);
            } else {
                byteImage = existingStudent.getUserProfile();
            }
            Student newStudent = new Student(
                    userName.getText().toLowerCase().equals(existingStudent.getUserName() != null
                            ? existingStudent.getUserName().toLowerCase()
                            : "")
                            ? existingStudent.getUserName()
                            : userName.getText().toLowerCase(),

                    password.getText().trim(),
                    name.getText().trim(),

                    email.getText().toLowerCase().equals(existingStudent.getEmail() != null
                            ? existingStudent.getEmail().toLowerCase()
                            : "")
                            ? existingStudent.getEmail()
                            : email.getText().toLowerCase(),

                    phoneNumber.getText().trim(),
                    "student",
                    gender.getValue().equals("Male") ? "m" : "f",
                    address.getText().trim(),

                    byteImage != null ? byteImage : existingStudent.getUserProfile(),
                    studentId.getText().trim().toLowerCase(),
                    selectBatch.getValue(),
                    department.getValue().toLowerCase()
            );



            int userId = existingStudent.getUserID();
            // Save the student
            boolean success = service.updateUser(newStudent, existingStudent);
            if (success) {
                reloadScene();
                showAlert(Alert.AlertType.INFORMATION, "Student Created", "Student created successfully.");
            } else {
                showAlert(Alert.AlertType.ERROR, "Student Creation Failed", "Could not create the student.");
            }
        }catch (IOException e){
            e.printStackTrace();
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

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        System.out.println(service.getStudentByUsername("tg1062"));
//        System.out.println(service.getStudentByUsername("tg1413").getUserProfile());
        loadStudentData(service.getStudentByUsername("dinesh"));

    }

    void loadStudentData(Student student) {
        this.existingStudent = student; // save exising student data

        userName.setText(student.getUserName());
        email.setText(student.getEmail());
        gender.setValue(student.getGender().equals("m")?"Male":"Female");
        name.setText(student.getName());
        password.setText("12345");
        address.setText(student.getAddress());
        department.setValue(student.getDepartment());
        selectBatch.setValue(student.getBranch());
        studentId.setText(student.getStudentId());
        phoneNumber.setText(student.getContactNumber());

        loadUserProfile(student.getUserProfile());


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

    private String validateInputs() {
        if (userName.getText().isEmpty()) return "Please enter a username.";
        if (password.getText().isEmpty()) return "Please enter a password.";
        if (name.getText().isEmpty()) return "Please enter a name.";
        if (email.getText().isEmpty()) return "Please enter an email.";
        if (!Util.isValidEmail(email.getText().trim().toLowerCase())) return "Please enter a valid email.";
        if (phoneNumber.getText().isEmpty()) return "Please enter a phone number.";
        if (!Util.isValidPhoneNumber(phoneNumber.getText().trim())) return "Please enter a valid phone number.";
        if (address.getText().isEmpty()) return "Please enter an address.";
        if (department.getValue() == null) return "Please select a department.";
        if (selectBatch.getValue() == null) return "Please select a batch.";
        if (gender.getValue() == null) return "Please select a gender.";
        if(profileImageFile == null && existingStudent.getUserProfile() == null) return "Please select a profile image.";
        return null;
    }


    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.showAndWait();
    }


    @FXML
    void reloadScene() {
        try {
            Stage stage = (Stage) profileMainContainer.getScene().getWindow();
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/admin-ui-Components/admin-user-create-ui-components/admin-update-user/admin-update-student.fxml"));
            Parent root = loader.load();
            stage.getScene().setRoot(root);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
