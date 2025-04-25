package org.techlms.demoitest.model.util;

import org.techlms.demoitest.dbconnection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class Marks {
    /******
     * CREATE TABLE `marks` (
     *   `MarkID` int  AUTO_INCREMENT primary key,
     *   `studentID` char(15) NOT NULL,
     *   `courseID` varchar(10) NOT NULL,
     *   `Assignment1` decimal(5,2) DEFAULT NULL,
     *   `Assignment2` decimal(5,2) DEFAULT NULL,
     *   `Quiz1` decimal(5,2) DEFAULT NULL,
     *   `Quiz2` decimal(5,2) DEFAULT NULL,
     *   `Quiz3` decimal(5,2) DEFAULT NULL,
     *   `Quiz4` decimal(5,2) DEFAULT NULL,
     *   `Midterm` decimal(5,2) DEFAULT NULL,
     *   `FinalPrac` decimal(5,2) DEFAULT NULL,
     *   `FinalTheory` decimal(5,2) DEFAULT NULL
     * );
     */
    private int marksId;
    private String studentId;
    private String courseId;
    private double assignment1;
    private double assignment2;
    private double quiz1;
    private double quiz2;
    private double quiz3;
    private double quiz4;
    private double midterm;
    private double finalPrac;
    private double finalTheory;

    public Marks(int marksId, String studentId, String courseId, double quiz1, double quiz2, double quiz3, double quiz4, double assignment1, double assignment2, double midterm, double finalPrac, double finalTheory) {
        this.marksId = marksId;
        this.studentId = studentId;
        this.courseId = courseId;
        this.quiz1 = quiz1;
        this.quiz2 = quiz2;
        this.quiz3 = quiz3;
        this.quiz4 = quiz4;
        this.assignment1 = assignment1;
        this.assignment2 = assignment2;
        this.midterm = midterm;
        this.finalPrac = finalPrac;
        this.finalTheory = finalTheory;
    }

    public Marks(String studentId, String courseId, double quiz1, double quiz2, double quiz3, double quiz4, double assignment1, double assignment2, double midterm, double finalPrac, double finalTheory) {
        this.studentId = studentId;
        this.courseId = courseId;
        this.quiz1 = quiz1;
        this.quiz2 = quiz2;
        this.quiz3 = quiz3;
        this.quiz4 = quiz4;
        this.assignment1 = assignment1;
        this.assignment2 = assignment2;
        this.midterm = midterm;
        this.finalPrac = finalPrac;
        this.finalTheory = finalTheory;
    }


    public int getMarksId() {
        return marksId;
    }

    public void setMarksId(int marksId) {
        this.marksId = marksId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public double getAssignment1() {
        return assignment1;
    }

    public void setAssignment1(double assignment1) {
        this.assignment1 = assignment1;
    }

    public double getAssignment2() {
        return assignment2;
    }

    public void setAssignment2(double assignment2) {
        this.assignment2 = assignment2;
    }

    public double getQuiz1() {
        return quiz1;
    }

    public void setQuiz1(double quiz1) {
        this.quiz1 = quiz1;
    }

    public double getQuiz2() {
        return quiz2;
    }

    public void setQuiz2(double quiz2) {
        this.quiz2 = quiz2;
    }

    public double getQuiz3() {
        return quiz3;
    }

    public void setQuiz3(double quiz3) {
        this.quiz3 = quiz3;
    }

    public double getQuiz4() {
        return quiz4;
    }

    public void setQuiz4(double quiz4) {
        this.quiz4 = quiz4;
    }

    public double getMidterm() {
        return midterm;
    }

    public void setMidterm(double midterm) {
        this.midterm = midterm;
    }

    public double getFinalPrac() {
        return finalPrac;
    }

    public void setFinalPrac(double finalPrac) {
        this.finalPrac = finalPrac;
    }

    public double getFinalTheory() {
        return finalTheory;
    }

    public void setFinalTheory(double finalTheory) {
        this.finalTheory = finalTheory;
    }

    public static double calculateBestQuizMarksAverage(Marks marks) {
        Connection con = DBConnection.getConnection();
        int takenQuizCount = 0;

        String sql = "SELECT quizzes_taken_count FROM subject_marks WHERE course_code = ?;";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, marks.getCourseId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                takenQuizCount = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (takenQuizCount > 0) {
            double[] allQuizMarks = {marks.getQuiz1(), marks.getQuiz2(), marks.getQuiz3(), marks.getQuiz4()};

            Arrays.sort(allQuizMarks);

            double total = 0.0;
            for (int i = allQuizMarks.length - 1; i >= allQuizMarks.length - takenQuizCount; i--) {
                total += allQuizMarks[i];
            }
//            System.out.println("course code is      " + marks.getCourseId() + "  "  + "Total marks : " + total / takenQuizCount);
            return total / takenQuizCount;
        } else {
            return 0.0;
        }
    }

    public static double calculateBestAssessmentsMarksAverage(Marks marks) {
        Connection con = DBConnection.getConnection();
        int takenAssessmentCount  = 0;

        String sql = "SELECT assessments_taken_count FROM subject_marks WHERE course_code = ?;";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, marks.getCourseId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                takenAssessmentCount  = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (takenAssessmentCount  > 0) {
            double[] allAssessmentsMarks = {marks.getQuiz1(), marks.getQuiz2(), marks.getQuiz3(), marks.getQuiz4()};

            Arrays.sort( allAssessmentsMarks);

            double total = 0.0;
            for (int i =  allAssessmentsMarks.length - 1; i >=  allAssessmentsMarks.length - takenAssessmentCount ; i--) {
                total +=  allAssessmentsMarks[i];
            }
//            System.out.println("course code is      " + marks.getCourseId() + "  "  + "Total marks assessments : " + total / takenAssessmentCount);
            return total / takenAssessmentCount ;
        } else {
            return 0.0;
        }
    }

    public static int getTotalCaMarks(Marks marks) {
        double totalCaMarks = 0.0;
        Connection con = DBConnection.getConnection();
        int quizzesWeight = 0, assignmentWeight = 0, midtermWeight = 0;

        String sql = "SELECT quizzes_weight, assessments_weight, midterm_weight FROM subject_marks WHERE course_code = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, marks.getCourseId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                quizzesWeight = rs.getInt(1);
                assignmentWeight = rs.getInt(2);
                midtermWeight = rs.getInt(3);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (quizzesWeight > 0) {
//            System.out.println("Quizzes weight is " + quizzesWeight + " and assignments weight is " + assignmentWeight);
            totalCaMarks += calculateBestQuizMarksAverage(marks) * quizzesWeight / 100;
//            System.out.println("Quizzes avg with quiz weight  " + totalCaMarks);
        }
        if (assignmentWeight > 0) {
            double avgAssigment = calculateBestAssessmentsMarksAverage(marks);
            if (avgAssigment > 0) {
                totalCaMarks += avgAssigment * assignmentWeight / 100;
            }
        }
        if (midtermWeight > 0) {
            totalCaMarks += marks.getMidterm() * midtermWeight / 100;
        }

        return (int) Math.round(totalCaMarks);
    }

    public static int finalTotalMarks(Marks marks) {
        double totalMarks = 0.0;
        int finalTheoryWeight = 0, finalPracWeight = 0;

        String sql = "SELECT final_theory_weight, final_practical_weight FROM subject_marks WHERE course_code = ?";
        try (PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql)) {
            ps.setString(1, marks.getCourseId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                finalTheoryWeight = rs.getInt(1);
                finalPracWeight = rs.getInt(2);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (finalTheoryWeight > 0) {
            totalMarks += marks.getFinalTheory() * finalTheoryWeight / 100;
        }
        if (finalPracWeight > 0) {
            totalMarks += marks.getFinalPrac() * finalPracWeight / 100;
        }

        return (int) Math.round(totalMarks) + getTotalCaMarks(marks);
    }




    public static String studentGrads(int totalMarks) {
        if (totalMarks < 0 || totalMarks > 100) {
            throw new IllegalArgumentException("Total marks must be between 0 and 100.");
        }

        return switch (totalMarks / 5) {
            case 17, 18, 19, 20 -> "A+"; // For marks 85-100
            case 14, 15, 16 -> "A";      // For marks 70-84
            case 13 -> "A-";             // For marks 65-69
            case 12 -> "B+";             // For marks 60-64
            case 11 -> "B";              // For marks 55-59
            case 10 -> "B-";             // For marks 50-54
            case 9 -> "C+";              // For marks 45-49
            case 8 -> "C";               // For marks 40-44
            case 7 -> "C-";              // For marks 35-39
            case 6 -> "D+";              // For marks 30-34
            case 5 -> "D";               // For marks 25-29
            default -> "E";              // For marks 0-24
        };
    }

    public static double studentGradPoint(String grade) {

       double gerd =  switch (grade) {
            case "A+" , "A" -> 4.00;
            case "A-" -> 3.70;
            case "B+" ->3.30;
            case "B" -> 3.00;
            case "B-" -> 2.70;
            case "C+" ->2.30;
            case "C" -> 2.00;
            case "C-" -> 1.70;
            case "D+" ->1.30;
            case "D" -> 1.00;
            default ->  0.00;
        };

       return Double.parseDouble(String.format("%.2f", gerd));
    }

    public static double studentGradPointAverage(List<Marks> marks) {
        double totalWeightedGradePoints = 0.0;
        double totalCredit = 0.0;
        for (Marks mark : marks) {

            int credit =  getCourseCreditByCourseCode(mark.getCourseId());
            totalWeightedGradePoints +=
                    studentGradPoint(
                            studentGrads(
                                    finalTotalMarks(mark)))  * credit ;

            totalCredit += credit;

        }


        System.out.println("Total weighted gradient points: " +(String.format("%.2f", totalWeightedGradePoints / totalCredit)));
        return Double.parseDouble(String.format("%.2f", totalWeightedGradePoints / totalCredit));


    }

    public static int getCourseCreditByCourseCode(String courseCode){
        Connection con = DBConnection.getConnection();
        try(PreparedStatement ps = con.prepareStatement("select credit from course where course_code = ?")){
            ps.setString(1,courseCode);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
            else{
                throw new IllegalArgumentException("Total marks must be between 0 and 100.");
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }




    @Override
    public String toString() {
        return "Marks{" +
                "marksId=" + marksId +
                ", studentId='" + studentId + '\'' +
                ", courseId='" + courseId + '\'' +
                ", assignment1=" + assignment1 +
                ", assignment2=" + assignment2 +
                ", quiz1=" + quiz1 +
                ", quiz2=" + quiz2 +
                ", quiz3=" + quiz3 +
                ", quiz4=" + quiz4 +
                ", midterm=" + midterm +
                ", finalPrac=" + finalPrac +
                ", finalTheory=" + finalTheory +
                '}';
    }

    public static boolean isStudentCaPass(Marks marks){

        return  getTotalCaMarks(marks) >= 50.0;


    }


    public static String[] getTypeOfExams(){

        return new String[] {
                "Assignment1",
                "Assignment2",
                "Quiz1",
                "Quiz2",
                "Quiz3",
                "Quiz4",
                "Midterm",
                "FinalPractical",
                "FinalTheory",
        };
    }



}
