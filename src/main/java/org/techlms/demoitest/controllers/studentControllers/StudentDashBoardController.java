package org.techlms.demoitest.controllers.studentControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import org.techlms.demoitest.dto.studentDTO.StudentCourseDTO;
import org.techlms.demoitest.model.users.User;
import org.techlms.demoitest.service.studentService.StudentCourseService;
import org.techlms.demoitest.util.SessionManager;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;


public class StudentDashBoardController {
    @FXML
    private Circle userprofile;
    @FXML
    private FlowPane coursesContainer;

    @FXML
    private Label homeLabel;

    @FXML
    private VBox contentContainer;

    private final StudentCourseService studentCourseService = new StudentCourseService();

    public void initialize() {

        loadUserProfile();
        loadCourses();
    }


    private void loadCourses() {
        List<StudentCourseDTO> courses = studentCourseService.getAllStudentCourses();
        for (StudentCourseDTO course : courses) {
            coursesContainer.getChildren().add(createCourseCard(course));
        }
    }

    // open Course Details
    private void openCourseDetails(StudentCourseDTO course) {
        System.out.println("Opening details for: " + course.getCourseName());
        // TODO: Implement the logic to show course details
    }

    private VBox createCourseCard(StudentCourseDTO course) {
        VBox courseCard = new VBox(10); // Added spacing between elements
        courseCard.getStyleClass().add("course-card");

        // add onMouseClicked
        courseCard.setOnMouseClicked(event -> {
            System.out.println("Course Clicked: " + course.getCourseName());
            openCourseDetails(course); // Call a method to open details
        });

        ImageView imageView = new ImageView();
        if (course.getCourseImage() != null) {
            try {
                ByteArrayInputStream bais = new ByteArrayInputStream(course.getCourseImage());
                Image image = new Image(bais);
                imageView.setImage(image);
            } catch (Exception e) {
                System.out.println("Error loading image: " + e.getMessage());
            }
        } else {
            System.out.println("No image found for course: " + course.getCourseName());
        }

        imageView.setFitHeight(200);
        imageView.setFitWidth(300);
        imageView.setPreserveRatio(true);

        Label courseLabel = new Label(course.getCourseName());
        courseLabel.getStyleClass().add("course-card-name");

        HBox imageBox = new HBox(imageView);
        HBox labelBox = new HBox(courseLabel);
        labelBox.setAlignment(javafx.geometry.Pos.CENTER);

        courseCard.getChildren().addAll(imageBox, labelBox);
        return courseCard;
    }

    @FXML
    public void switchHome() {
        Stage stage = (Stage) homeLabel.getScene().getWindow(); // Get current stage
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/org/techlms/demoitest/student-ui-components/student-ui.fxml")); // Load Home Page FXML
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.show();
        }catch (Exception e) {
            e.printStackTrace();
        }

    }

    @FXML
    public void switchTimeTable() {
        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/student-ui-components/student-new-time-table.fxml"));
            Parent timeTable = fxmlLoader.load();
            VBox.setVgrow(timeTable, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(timeTable);

            System.out.println("Time Table Loaded");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void switchGrades() {

        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/student-ui-components/new-new-student-grads-page.fxml"));
            Parent timeTable = fxmlLoader.load();
            VBox.setVgrow(timeTable, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(timeTable);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @FXML
    public void switchNotes() {
        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/util/user-notices.fxml"));
            Parent attendancePage = fxmlLoader.load();
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(attendancePage);

            System.out.println("Switch Notes Button clicked");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void switchMedical() {
        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/student-ui-components/student-view-medical-page.fxml"));
            Parent timeTable = fxmlLoader.load();
            VBox.setVgrow(timeTable, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(timeTable);

            System.out.println("Switch Medical Button clicked");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // switch attendance page//
    @FXML
    public void switchAttendance() {

        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/student-ui-components/student-attendance-page.fxml"));
            Parent timeTable = fxmlLoader.load();
            VBox.setVgrow(timeTable, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(timeTable);

            System.out.println("Attendance Page Loaded");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @FXML
    public void switchProfileEditPage() {

        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/student-ui-components/student-user-profile.fxml"));
            Parent timeTable = fxmlLoader.load();
            VBox.setVgrow(timeTable, Priority.ALWAYS);
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(timeTable);
            System.out.println("profile Page Loaded");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @FXML
    public void logout(ActionEvent event) {
        FXMLLoader fxmlLoader = null;
        try {
            // remove user session
            SessionManager sessionManager = new SessionManager();
            sessionManager.logout();

            //load login menu
            fxmlLoader = new FXMLLoader(this.getClass().getResource("/org/techlms/demoitest/util/new-login.fxml"));
            Scene scene = new Scene(fxmlLoader.load());
            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            stage.setScene(scene);
            stage.show();

        }catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void loadUserProfile(){
        SessionManager sessionManager = SessionManager.getInstance();
        System.out.println(sessionManager);

        userprofile.setCenterX(150);
        userprofile.setCenterY(150);
//        userprofile.profile().

        System.out.println(sessionManager.getUsername());
        byte[] userProfileImage = User.getUserProfileByUserName(sessionManager.getUsername());
        System.out.println("userProfileImage: " + sessionManager.getUsername());
        if (userProfileImage != null) {
            InputStream inputStream = new ByteArrayInputStream(userProfileImage);
            Image image = new Image(inputStream , 100, 100, false, true);
            userprofile.setFill(new ImagePattern(image));
        }else {

            Image image = new Image(
                    this.getClass().getResourceAsStream("/org/techlms/demoitest/application-images/util/10337609.png"),
                    100, // Desired width of the image
                    100, // Desired height of the image
                    false, // Preserve aspect ratio
                    true   // Smooth scaling
            );

// Set the image as a pattern for the circle
            userprofile.setFill(new ImagePattern(image));
        }

    }
}
