package org.techlms.demoitest.dbconnection;

import io.github.cdimascio.dotenv.Dotenv;
import java.sql.*;

public class DBConnection {


    public static Connection getConnection() {
        Dotenv dotenv = Dotenv.configure()
                .directory("./config") // Folder containing .env
                .filename(".env")      // Explicitly specify the file name
                .load();

        String userName = dotenv.get("DB_USER");
        String password = dotenv.get("DB_PASSWORD");
        String url = dotenv.get("DB_URL");

        // Validate environment variables
        if (userName == null || password == null || url == null ||
                userName.isEmpty() || password.isEmpty() || url.isEmpty()) {
            throw new IllegalArgumentException("Database configuration is missing or incomplete. Please check the .env file.");
        }

        Connection con = null;
        try {
            con = DriverManager.getConnection(url, userName, password);
        } catch (SQLException e) {
            System.err.println("Database Connection Error: " + e.getMessage());
            throw new RuntimeException(e);
        }
        return con;
    }
}