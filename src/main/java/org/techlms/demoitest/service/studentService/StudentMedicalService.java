package org.techlms.demoitest.service.studentService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.dto.studentDTO.StudentMedicalDTO;
import org.techlms.demoitest.util.SessionManager;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentMedicalService {
    private SessionManager sessionManager = SessionManager.getInstance();

    public void submitMedical(StudentMedicalDTO studentMedicalDTO) {
        Connection con = DBConnection.getConnection();
        try {
            // Corrected SQL query (removed extra backticks)
            String q = "INSERT INTO `medical` (`student_username`, `medical_data`, `medical_end_date`, `medical_start_date`) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(q);

            // Assuming SessionManager correctly gets the logged-in username
            ps.setString(1, sessionManager.getUsername());
            ps.setBytes(2, studentMedicalDTO.getMedicalData());  // Set the medical file as byte array
            ps.setDate(3, Date.valueOf(studentMedicalDTO.getMedicalEndDate()));  // Set the end date
            ps.setDate(4, Date.valueOf(studentMedicalDTO.getMedicalStartDate()));  // Set the start date

            // Execute the insert query
            ps.executeUpdate();
            System.out.println("Medical data inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error saving medical data: " + e.getMessage());
        }
    }
}
