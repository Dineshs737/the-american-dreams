# Student Management System (Mini Project)

A **Student Management System** built using Java to manage student records efficiently. This project is designed as a mini project for learning purposes and demonstrates CRUD operations (Create, Read, Update, Delete) in a console-based or JavaFX-based user interface.

---

## Features

- **Add New Students**: Add student details including name, ID, age, and course.
- **View All Students**: Display a list of all students.
- **Update Student Details**: Edit the details of a student using their ID.
- **Delete Student Records**: Remove student data permanently.
- **Search Students**: Find specific students based on various criteria.
- **Data Persistence**: Save data using file handling or database integration.

---


## Requirements

1. **Java Development Kit (JDK)**: Version 17 or higher.
2. **Maven**: For dependency management and project building.
3. **IntelliJ IDEA** or any preferred IDE.
4. **MySQL** (optional): For database-backed data storage.

---

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/username/student-management-system.git
   cd student-management-system

## Configuration: `.env` File Setup

This project uses a `.env` file to store sensitive information like database credentials, API keys, and other configuration settings. The `.env` file ensures that sensitive data is not hard-coded into the project and remains secure.

### Setting Up the `.env` File

1. **Create a `.env` File**:
   - Navigate to the `config/` folder (or the root directory of the project, depending on the project setup).
   - Create a new file named `.env`.

2. **Add Configuration Variables**:
   - Add the required environment variables in the following format:
     ```
     KEY=VALUE
     ```
   - Example:
     ```
     DB_URL=jdbc:mysql://localhost:3306/my_database
     DB_USER=root
     DB_PASSWORD=pass123
     API_KEY=your_api_key_here
     ```

3. **Do Not Commit the `.env` File**:
   - Add the `.env` file to your `.gitignore` to prevent it from being pushed to version control (e.g., GitHub):
     ```
     /config/.env
     ```

### Accessing `.env` Variables in Code

The project uses the [dotenv-java](https://github.com/cdimascio/dotenv-java) library to load environment variables from the `.env` file. Here's how it works:

- The `.env` file is automatically loaded when the application runs.
- Use the `Dotenv` library to access the variables in your code. Example:

 ```java
 package org.techlms.demoitest;

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
```
### TestDB Class

The `TestDB` class demonstrates a simple query execution. It retrieves data from the `user` table and prints the results to the console.

#### Database Setup

Run the following SQL commands in your MySQL client to set up the demo database:

```sql
DROP DATABASE IF EXISTS demo_fx;
CREATE DATABASE demo_fx;
USE demo_fx;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(255)
);

INSERT INTO user VALUES (1, "yourname", "7712400c26a5026771b495a03d891aecf08b9a7a1e2ff64f54feaae4f7bc3a08");

SELECT * FROM user;

```
#### TestDB Class Code
#### call TestDB.printDemoUser() function from main function

```java
package org.techlms.demoitest;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestDB {

    public static void printDemoUser(){
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM user");
            while(rs.next()){
                System.out.println("User ID is: " + rs.getInt(1));
                System.out.println("User Name is: " + rs.getString(2));
                System.out.println("User Password Hashcode is: " + rs.getString(3));
            }
        } catch (SQLException e) {
            System.out.println("SQL Query Error!!");
            throw new RuntimeException(e);
        }
    }
}
```


  # Additional Features and Functionality



This project includes critical features for password security, such as **SHA-256 Password Hashing** and **Password Validation**. Below is a detailed explanation of how these features work and why they are essential.

---

## Password Hashing

To ensure the security of user passwords, the project implements **SHA-256 password hashing**. This cryptographic algorithm converts plaintext passwords into secure, irreversible hashes, which can then be stored safely in a database.

### How It Works:
1. **Input Conversion**: The password string is converted into a byte array using `pwd.getBytes()`.
2. **Digest Initialization**: A `MessageDigest` instance is initialized with the algorithm `SHA-256`.
3. **Hash Computation**: The byte array is processed to generate the password hash.
4. **Hexadecimal Conversion**: Each byte of the resulting hash is converted into a two-digit hexadecimal format and appended to a `StringBuilder`.
5. **Output**: The complete hashed password is returned as a string.

### Code Implementation:
```java
public static String passwordHashing(String pwd) throws NoSuchAlgorithmException {
    // Initialize MessageDigest with SHA-256
    MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
    messageDigest.update(pwd.getBytes());

    // Generate hash as byte array
    byte[] rbt = messageDigest.digest();

    // Convert byte array to hexadecimal string
    StringBuilder sb = new StringBuilder();
    for (byte b : rbt) {
        sb.append(String.format("%02x", b));
    }
    return sb.toString();
}
```
## Password Validation

Password validation is an integral feature of this project, ensuring that users create strong and secure passwords. This method enforces a robust set of criteria through regular expressions to safeguard user accounts against weak passwords.

---

### How It Works

The `passwordvalidation` method leverages a regex pattern to evaluate the strength of user-provided passwords. Here's a breakdown of the steps:

1. **Regular Expression Definition**:
   - A regex pattern is used to encapsulate all required criteria for a valid password.
2. **Password Matching**:
   - The method checks if the given password satisfies the regex criteria by using Java's `matches()` function.
3. **Result**:
   - Returns `true` if the password meets all requirements, and `false` otherwise.

---

### Validation Criteria

For a password to be considered valid, it must fulfill the following rules:
1. **Contain at least one digit**: Must include numbers from `0-9`.
2. **Contain at least one lowercase letter**: Must include one or more characters from `a-z`.
3. **Contain at least one uppercase letter**: Must include one or more characters from `A-Z`.
4. **Contain at least one special character**: Allowed characters include `@#$%^&+=`.
5. **No whitespace allowed**: Passwords must not contain any spaces or tabs.
6. **Be at least 8 characters long**: Ensures sufficient complexity.

---

### Code Implementation

Below is the Java implementation of the `passwordvalidation` method:

```java
public static boolean passwordvalidation(String password) {
    // Regular expression for password validation
    String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";
    
    // Check if the password matches the pattern
    return password.matches(pattern);
}
```
## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Final Note

Thank you for checking out this project! Feel free to explore, use, and contribute. Let's build something amazing together!







