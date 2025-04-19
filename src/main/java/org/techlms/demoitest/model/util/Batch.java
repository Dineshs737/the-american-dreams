package org.techlms.demoitest.model.util;

public class Batch {

    /**********
     *
     * batch_id, batch_year, current_student_semester
     * 1,2020,l4s2
     * 2,2021,l3s2
     * 3,2022,l2s1
     * 4,2023,l1s1
     */
    private String batchYar;
    private String currentStudentSemester;
    private int batchId;

    public Batch(String batchYar, String currentStudentSemester) {
        this.batchYar = batchYar;
        this.currentStudentSemester = currentStudentSemester;
    }

    public String getBatchYar() {
        return batchYar;
    }

    public void setBatchYar(String batchYar) {
        this.batchYar = batchYar;
    }

    public String getCurrentStudentSemester() {
        return currentStudentSemester;
    }

    public void setCurrentStudentSemester(String currentStudentSemester) {
        this.currentStudentSemester = currentStudentSemester;
    }

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }

    @Override
    public String toString() {
        return "Batch{" +
                "batchYar='" + batchYar + '\'' +
                ", currentStudentSemester='" + currentStudentSemester + '\'' +
                '}';
    }
}
