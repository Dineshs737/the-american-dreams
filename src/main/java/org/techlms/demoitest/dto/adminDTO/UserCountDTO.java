package org.techlms.demoitest.dto.adminDTO;

public class UserCountDTO {
    private int student;
    private int lecturerCount;
    private int adminCount;
    private int technicalOfficerCount;

    private double malePercent;
    private double femalePercent;

    public UserCountDTO(int student, int lecturerCount, int adminCount, int technicalOfficerCount) {
        this.student = student;
        this.lecturerCount = lecturerCount;
        this.adminCount = adminCount;
        this.technicalOfficerCount = technicalOfficerCount;
    }

    public UserCountDTO(double malePercent, double femalePercent) {
        this.malePercent = malePercent;
        this.femalePercent = femalePercent;
    }

    public int getStudent() {
        return student;
    }

    public int getLecturerCount() {
        return lecturerCount;
    }

    public int getAdminCount() {
        return adminCount;
    }

    public int getTechnicalOfficerCount() {
        return technicalOfficerCount;
    }

    public double getMalePercent() {
        return malePercent;
    }

    public double getFemalePercent() {
        return femalePercent;
    }
}
