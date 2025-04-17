package org.techlms.demoitest.controllers.studentControllers;

import javafx.fxml.FXML;
import javafx.scene.control.DatePicker;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import org.techlms.demoitest.dto.studentDTO.StudentMedicalDTO;
import org.techlms.demoitest.service.studentService.StudentMedicalService;
import org.techlms.demoitest.util.FileUtils;

import java.io.File;
import java.io.IOException;
import java.time.format.DateTimeFormatter;

public class StudentMedicalController {
    private File selectedFile;

    @FXML
    private DatePicker medicalStartDate;

    @FXML
    private DatePicker medicalEndDate;

    @FXML
    public void selectMedical() {
        // Step 1: Create a file chooser
        FileChooser fileChooser = new FileChooser();
        fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("PDF Files", "*.pdf"));

        // Step 2: Show the file chooser dialog
        Stage stage = new Stage();  // Use the existing stage if necessary
        selectedFile = fileChooser.showOpenDialog(stage);

        if (selectedFile != null) {
            // Step 3: If a file is selected, process it
            System.out.println("Selected file: " + selectedFile.getAbsolutePath());
        }
    }

    @FXML
    public void submitMedical() {
        if (medicalStartDate.getValue() != null && medicalEndDate.getValue() != null && selectedFile != null) {
            try {
                // Step 1: Convert file to byte array
                byte[] fileBytes = FileUtils.convertFileToByteArray(selectedFile);

                // Step 2: Format dates
                String datePattern = "yyyy-MM-dd";
                String startDate = medicalStartDate.getValue().format(DateTimeFormatter.ofPattern(datePattern));
                String endDate = medicalEndDate.getValue().format(DateTimeFormatter.ofPattern(datePattern));

                // Step 3: Create DTO and pass the byte array and formatted dates
                StudentMedicalDTO studentMedicalDTO = new StudentMedicalDTO(fileBytes, endDate, startDate);
                StudentMedicalService studentMedicalService = new StudentMedicalService();

                // Corrected this line: pass studentMedicalDTO instance
                studentMedicalService.submitMedical(studentMedicalDTO);

                // You can now use studentMedicalDTO, for example, to save data to the database
                System.out.println("Medical data submitted: " + studentMedicalDTO.getMedicalStartDate() + " to " + studentMedicalDTO.getMedicalEndDate());

            } catch (IOException e) {
                System.out.println("Error reading the file: " + e.getMessage());
            }
        } else {
            System.out.println("Please select a file and fill in the dates.");
        }
    }
}
