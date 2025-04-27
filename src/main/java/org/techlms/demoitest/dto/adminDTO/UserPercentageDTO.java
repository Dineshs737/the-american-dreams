package org.techlms.demoitest.dto.adminDTO;

public class UserPercentageDTO {
    int totalUsersCount;
    double totalMaleUsersPercentage;
    double totalFemaleUsersPercentage;

    public UserPercentageDTO(int totalUsersCount, double totalMaleUsersPercentage, double totalFemaleUsersPercentage) {
        this.totalUsersCount = totalUsersCount;
        this.totalMaleUsersPercentage = totalMaleUsersPercentage;
        this.totalFemaleUsersPercentage = totalFemaleUsersPercentage;
    }

    public int getTotalUsersCount() {
        return totalUsersCount;
    }

    public double getTotalMaleUsersPercentage() {
        return totalMaleUsersPercentage;
    }

    public double getTotalFemaleUsersPercentage() {
        return totalFemaleUsersPercentage;
    }
}
