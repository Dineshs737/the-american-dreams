package org.techlms.demoitest.controllers.lecturerControllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import org.techlms.demoitest.dto.lecturerDTO.LecturerCourseDTO;
import org.techlms.demoitest.service.lecturerService.LecturerCourseService;
import org.techlms.demoitest.util.SessionManager;

import java.io.ByteArrayInputStream;
import java.util.List;

// set
public class LecturerHomePageController {
    @FXML
    private FlowPane coursesContainer;

    @FXML
    private Label homeLabel;

    @FXML
    private VBox contentContainer;

    private final LecturerCourseService lecturerCourseService = new LecturerCourseService();

    public void initialize() {
        loadCourses();
    }

    private void loadCourses() {
        List<LecturerCourseDTO> courses = lecturerCourseService.getAllLecturerCourses();
        for (LecturerCourseDTO course : courses) {
            coursesContainer.getChildren().add(createCourseCard(course));
        }
    }

    // open Course Details
    private void openCourseDetails(LecturerCourseDTO course) {
        System.out.println("Opening details for: " + course.getCourseName());
        // TODO: Implement the logic to show course details
    }

    private VBox createCourseCard(LecturerCourseDTO course) {
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
        Label courseSemesterLabel = new Label(course.getCourseYearAndSemester());
        courseSemesterLabel.getStyleClass().add("course-card-name");
        courseLabel.getStyleClass().add("course-card-name");

        HBox imageBox = new HBox(imageView);
        HBox labelBox = new HBox(courseLabel);
        HBox semesterBox = new HBox(courseSemesterLabel);
        labelBox.setAlignment(javafx.geometry.Pos.CENTER);
        semesterBox.setAlignment(javafx.geometry.Pos.CENTER);

        courseCard.getChildren().addAll(imageBox, labelBox, semesterBox);
        return courseCard;
    }

    @FXML
    public void switchHome() {
        Stage stage = (Stage) homeLabel.getScene().getWindow(); // Get current stage
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lechurer-home.fxml")); // Load Home Page FXML
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.show();
        }catch (Exception e) {
            e.printStackTrace();
        }

    }

    @FXML
    public void switchTimeTable() {
        System.out.println("Switch TimeTable Button clicked");
    }

    @FXML
    public void switchGrades() {

        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/student-ui-components/student-marks.fxml"));
            Parent gradesPage = fxmlLoader.load();
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(gradesPage);
            System.out.println("Grades Page");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @FXML
    public void switchNotes() {
        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/util/user-notices.fxml"));
            Parent notice = fxmlLoader.load();
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(notice);
            System.out.println("Notes Page");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void switchMedical() {
        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/student-ui-components/student-medical.fxml"));
            Parent attendancePage = fxmlLoader.load();
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(attendancePage);

           System.out.println("Medical Page");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // switch attendance page//
    @FXML
    public void switchAttendance() {

        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/student-ui-components/student-attance.fxml"));
            Parent attendancePage = fxmlLoader.load();
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(attendancePage);

            System.out.println("Attendance Page Loaded");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @FXML
    public void switchProfile() {

        FXMLLoader fxmlLoader = null;
        try{
            fxmlLoader = new FXMLLoader(getClass().getResource("/org/techlms/demoitest/student-ui-components/student-profile.fxml"));
            Parent attendancePage = fxmlLoader.load();
            contentContainer.getChildren().clear();
            contentContainer.getChildren().add(attendancePage);

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

    public void switchStudent(MouseEvent mouseEvent) {
        System.out.println("Switch Student Button clicked");
    }
}
