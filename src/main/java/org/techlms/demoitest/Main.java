package org.techlms.demoitest;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Main extends Application {
    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage stage) throws Exception {
//        LoginCon
        FXMLLoader fxmlLoader = new FXMLLoader(this.getClass().getResource("/org/techlms/demoitest/login.fxml")) ;
        Scene scene = new Scene(fxmlLoader.load());
        stage.setScene(scene);
        stage.setMaxHeight(600);
        stage.setMaxWidth(1000);
        stage.setMinWidth(400);
        stage.setMinHeight(800);
        stage.show();
    }
}
