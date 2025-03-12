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
  import io.github.cdimascio.dotenv.Dotenv;

  public class Main {
      public static void main(String[] args) {
          Dotenv dotenv = Dotenv.configure()
                                .directory("config") // Specify the directory if not in the root
                                .filename(".env")    // Specify the .env filename
                                .load();

          String dbUrl = dotenv.get("DB_URL");
          String dbUser = dotenv.get("DB_USER");
          String dbPassword = dotenv.get("DB_PASSWORD");

          System.out.println("Database URL: " + dbUrl);
      }
  }



