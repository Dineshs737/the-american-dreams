package org.techlms.demoitest;

import io.github.cdimascio.dotenv.Dotenv;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class HelloApplication extends Application {
    @Override
    public void start(Stage stage) throws IOException {

    }

    public static void main(String[] args) {


        Dotenv dotenv = Dotenv.configure()
                .directory("./config") // Folder containing .env
                .filename(".env")    // Explicitly specify the file name
                .load();

        String dbUrl = dotenv.get("DB_URL");
        String dbUser = dotenv.get("DB_USER");
        String dbPassword = dotenv.get("DB_PASSWORD");

        System.out.println("Database URL: " + dbUrl);
    }
}