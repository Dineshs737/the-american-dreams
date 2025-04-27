package org.techlms.demoitest.controllers.adminControllers;

import javafx.animation.TranslateTransition;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Bounds;
import javafx.scene.chart.*;
import javafx.scene.control.Label;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.util.Duration;
import org.techlms.demoitest.dto.adminDTO.UserCountDTO;
import org.techlms.demoitest.dto.adminDTO.UserPercentageDTO;
import org.techlms.demoitest.service.adminService.AdminService;

import java.net.URL;
import java.util.ResourceBundle;

public class AdminDataInfoController implements Initializable {
    private final AdminService adminService = new AdminService();

    @FXML
    private Label homePage;

    @FXML
    private Label totalAdminCount;

    @FXML
    private Label totalLecturerCount;

    @FXML
    private Label totalStudentCount;

    @FXML
    private Label totalTechnicalOfficerCount;

    @FXML
    private VBox userDataCard;

    @FXML
    private PieChart userPIChart;


    @FXML
    private BarChart<String, Number> studentsDepartment;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
            loadData();

    }

    public void loadData(){
        /*********************************************************     ADD USER COUNT TO BOTTOM OF  ADMIN HOME PAGE                  ***************************************************************/

        userPIChart.getData().clear();
        studentsDepartment.getData().clear();
        UserCountDTO userCount = adminService.getUserCount();
        if (userCount != null) {

            totalStudentCount.setText( "Total Student  " + String.valueOf(userCount.getStudent()));
            totalAdminCount.setText("Total Admin  " + String.valueOf(userCount.getAdminCount()));
            totalLecturerCount.setText("Total Lecturer  " +String.valueOf(userCount.getLecturerCount()));
            totalTechnicalOfficerCount.setText("Total Technical Officer  " +String.valueOf(userCount.getTechnicalOfficerCount()));

        }



        /***********************************************************              ***************************************************************************************************/


        /********************************************************         ADMIN PAGE PI CHART MALE FEMALE PERCENTAGE OF USER ******************************************************/

        UserPercentageDTO percentage = adminService.getUserPercentageBYGender();
        if(percentage != null) {

            PieChart.Data male = new PieChart.Data("Male  " + String.valueOf(percentage.getTotalMaleUsersPercentage() + "%"), percentage.getTotalMaleUsersPercentage());
            PieChart.Data female = new PieChart.Data("Female  "+ String.valueOf(percentage.getTotalFemaleUsersPercentage()+"%"), percentage.getTotalFemaleUsersPercentage());
            userPIChart.getData().addAll(male,female);

            // animation
            userPIChart.effectProperty().addListener((observable, oldValue, newValue) -> {
                TranslateTransition translateTransition = new TranslateTransition(Duration.millis(1000) ,userPIChart);});
            userPIChart.setStyle("-fx-font-size: 16px; -fx-padding: 5px; -fx-text-fill: white; -fx-font-weight: bold;");

            for (final PieChart.Data data : userPIChart.getData()) {
                data.getNode().addEventHandler(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>() {
                    @Override
                    public void handle(MouseEvent mouseEvent) {
                        Bounds b1 = data.getNode().getBoundsInLocal();

                        double newX = (b1.getWidth()) / 2.0 + b1.getMinX();
                        double newY = (b1.getHeight()) / 2.0 + b1.getMinY();

                        data.getNode().setTranslateX(0);
                        data.getNode().setTranslateY(0);

                        TranslateTransition tt = new TranslateTransition(Duration.millis(1200), data.getNode());
                        tt.setByX(newX);
                        tt.setByY(newY);
                        tt.setAutoReverse(true);
                        tt.setCycleCount(2);
                        tt.play();
                    }
                });
            }

        }

        /******************************************************************                                  ******************************************************************************/


        // Apply external CSS file dynamically (this assumes you have already loaded your scene)
        studentsDepartment.getStylesheets().add(getClass().getResource("/org/techlms/demoitest/admin-ui-Components/barchar.css").toExternalForm());

        // Get the existing axes from FXML
        CategoryAxis xAxis = (CategoryAxis) studentsDepartment.getXAxis();
        NumberAxis yAxis = (NumberAxis) studentsDepartment.getYAxis();

        // Set labels if necessary (optional)
        xAxis.setLabel("Department");
        yAxis.setLabel("Students");

        // Create a series and populate with data
        XYChart.Series<String, Number> department = new XYChart.Series<>();
        department.setName("Departments");

        // Add data
        department.getData().add(new XYChart.Data<>("ICT", 20));
        department.getData().add(new XYChart.Data<>("ET", 10));
        department.getData().add(new XYChart.Data<>("BST", 15));

        // Add the series to the chart
        studentsDepartment.getData().add(department);

        // Style the entire bar chart (for font size, weight, and color)
        studentsDepartment.setStyle("-fx-font-weight: bold; -fx-font-size: 12px; -fx-text-fill: white; -fx-fill:white;");
    }
}