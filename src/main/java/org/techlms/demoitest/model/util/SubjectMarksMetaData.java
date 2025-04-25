package org.techlms.demoitest.model.util;

public class SubjectMarksMetaData {
    /*******
     * CREATE TABLE subject_marks (
     *     id INT AUTO_INCREMENT PRIMARY KEY,
     *     course_code VARCHAR(10) UNIQUE,
     *     quizzes_weight DECIMAL(5, 2),
     *     quizzes_taken_count INT,
     *     quizzes_total_count INT,
     *     assessments_weight DECIMAL(5, 2),
     *     assessments_taken_count INT,
     *     assessments_total_count INT,
     *     midterm_weight DECIMAL(5, 2),
     *     final_theory_weight DECIMAL(5, 2),
     *     final_practical_weight DECIMAL(5, 2),
     *     mini_project_weight DECIMAL(5, 2)
     * );
     */
    private int id;
    private String courseCode;
    private double quizzesWeight;
    private int quizzesTakenCount;
    private int quizzesTotalCount;
    private double assessmentsWeight;
    private int assessmentsTakenCount;
    private int assessmentsTotalCount;
    private double midtermWeight;
    private double finalTheoryWeight;

    public SubjectMarksMetaData(String courseCode, double quizzesWeight, int quizzesTakenCount, int quizzesTotalCount, double assessmentsWeight, int assessmentsTakenCount, int assessmentsTotalCount, double midtermWeight) {
        this.courseCode = courseCode;
        this.quizzesWeight = quizzesWeight;
        this.quizzesTakenCount = quizzesTakenCount;
        this.quizzesTotalCount = quizzesTotalCount;
        this.assessmentsWeight = assessmentsWeight;
        this.assessmentsTakenCount = assessmentsTakenCount;
        this.assessmentsTotalCount = assessmentsTotalCount;
        this.midtermWeight = midtermWeight;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getFinalTheoryWeight() {
        return finalTheoryWeight;
    }

    public void setFinalTheoryWeight(double finalTheoryWeight) {
        this.finalTheoryWeight = finalTheoryWeight;
    }

    public double getMidtermWeight() {
        return midtermWeight;
    }

    public void setMidtermWeight(double midtermWeight) {
        this.midtermWeight = midtermWeight;
    }

    public int getAssessmentsTotalCount() {
        return assessmentsTotalCount;
    }

    public void setAssessmentsTotalCount(int assessmentsTotalCount) {
        this.assessmentsTotalCount = assessmentsTotalCount;
    }

    public int getAssessmentsTakenCount() {
        return assessmentsTakenCount;
    }

    public void setAssessmentsTakenCount(int assessmentsTakenCount) {
        this.assessmentsTakenCount = assessmentsTakenCount;
    }

    public double getAssessmentsWeight() {
        return assessmentsWeight;
    }

    public void setAssessmentsWeight(double assessmentsWeight) {
        this.assessmentsWeight = assessmentsWeight;
    }

    public int getQuizzesTotalCount() {
        return quizzesTotalCount;
    }

    public void setQuizzesTotalCount(int quizzesTotalCount) {
        this.quizzesTotalCount = quizzesTotalCount;
    }

    public int getQuizzesTakenCount() {
        return quizzesTakenCount;
    }

    public void setQuizzesTakenCount(int quizzesTakenCount) {
        this.quizzesTakenCount = quizzesTakenCount;
    }

    public double getQuizzesWeight() {
        return quizzesWeight;
    }

    public void setQuizzesWeight(double quizzesWeight) {
        this.quizzesWeight = quizzesWeight;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    @Override
    public String toString() {
        return "SubjectMarksMetaData{" +
                "id=" + id +
                ", courseCode='" + courseCode + '\'' +
                ", quizzesWeight=" + quizzesWeight +
                ", quizzesTakenCount=" + quizzesTakenCount +
                ", quizzesTotalCount=" + quizzesTotalCount +
                ", assessmentsWeight=" + assessmentsWeight +
                ", assessmentsTakenCount=" + assessmentsTakenCount +
                ", assessmentsTotalCount=" + assessmentsTotalCount +
                ", midtermWeight=" + midtermWeight +
                ", finalTheoryWeight=" + finalTheoryWeight +
                '}';
    }
}
