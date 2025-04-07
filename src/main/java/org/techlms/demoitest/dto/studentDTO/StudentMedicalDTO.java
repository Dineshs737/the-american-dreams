package org.techlms.demoitest.dto.studentDTO;

public class StudentMedicalDTO {
    private byte[] medicalData;  // Corrected field name
    private String medicalEndDate;  // Corrected field name
    private String medicalStartDate;  // Corrected field name

    // Constructor
    public StudentMedicalDTO(byte[] medicalData, String medicalEndDate, String medicalStartDate) {
        this.medicalData = medicalData;
        this.medicalEndDate = medicalEndDate;
        this.medicalStartDate = medicalStartDate;
    }

    // Getter methods
    public byte[] getMedicalData() {
        return medicalData;
    }

    public String getMedicalEndDate() {
        return medicalEndDate;
    }

    public String getMedicalStartDate() {
        return medicalStartDate;
    }
}
