package org.techlms.demoitest.controllers.lecturerControllers;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import org.techlms.demoitest.model.course.Course;
import org.techlms.demoitest.model.users.Student;
import org.techlms.demoitest.service.lecturerService.CoursePageService;

import java.net.URL;
import java.util.List;
import java.util.Objects;
import java.util.ResourceBundle;

public class CourseRegisterStudentsDataController implements Initializable {

    private final CoursePageService coursePageService = new CoursePageService();
    private final Course course = Course.courseSessionManager();

    @FXML
    private FlowPane studentContainer;
    @FXML
    ScrollPane scrollPane;

    @Override
    public void initialize(URL location, ResourceBundle resources) {

        studentContainer.prefWrapLengthProperty().bind(scrollPane.widthProperty().subtract(40));


        // Fetch student data using coursePageService
//        System.out.println(course.getCourseCode());
        List<Student> students = coursePageService.getStudentsInformation("ict2113");


        for (Student student : students) {
            studentContainer.getChildren().add(createStudentInfoCard(student));
        }
    }

    public VBox createStudentInfoCard(Student student) {
        // Root VBox
        VBox studentInfoCard = new VBox(30);
        studentInfoCard.getStyleClass().add("student-info-card");
        studentInfoCard.getStylesheets().add(getClass().getResource("/org/techlms/demoitest/lecturer-ui-components/lectuererCourseComponents/style-sheets/all-student-info-page.css").toExternalForm());

        // Profile HBox
        HBox profileContainer = new HBox();
        profileContainer.setAlignment(Pos.CENTER);
        Circle profile = new Circle(30);
        profile.setFill(Color.valueOf("#575c60"));
        profile.setStroke(Color.BLACK);
        profile.setStrokeWidth(0.0);
        profileContainer.getChildren().add(profile);

        // Info Container VBox
        VBox infoContainer = new VBox(10);
        infoContainer.setAlignment(Pos.CENTER);
        infoContainer.getStyleClass().add("student-info-card-container");


        // Add student data to info sections
        if(student.getUserProfile() == null) {
            profile.setCenterX(150);
            profile.setCenterY(150);
//        userprofile.profile().

            Image image = new Image(
                    Objects.requireNonNull(this.getClass().getResourceAsStream("/org/techlms/demoitest/application-images/util/10337609.png")),
                    100, // Desired width of the image
                    100, // Desired height of the image
                    false, // Preserve aspect ratio
                    true   // Smooth scaling
            );

            profile.setFill(new ImagePattern(image));

        }
        infoContainer.getChildren().addAll(
                createInfoSection("Student id", student.getStudentId()),
                createInfoSection("Name", student.getName()),
                createInfoSection("Address", " "),
                createInfoSection("Batch", student.getBranch()),
                createInfoSection("Email", student.getEmail())
        );

        // Add children to root
        studentInfoCard.getChildren().addAll(profileContainer, infoContainer);

        return studentInfoCard;
    }

    private VBox createInfoSection(String labelText, String value) {
        VBox section = new VBox();
        HBox labelContainer = new HBox();
        Label label = new Label(labelText);
        label.getStyleClass().add("student-info-card-label");
        labelContainer.getChildren().add(label);

        TextField textField = new TextField(value);
        textField.setEditable(false);
        textField.getStyleClass().add("student-info-text-input");

        section.getChildren().addAll(labelContainer, textField);

        return section;
    }
}
