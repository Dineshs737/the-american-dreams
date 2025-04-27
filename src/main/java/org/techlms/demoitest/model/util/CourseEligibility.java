package org.techlms.demoitest.model.util;

import org.techlms.demoitest.dbconnection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseEligibility {
    private int eligibilityID;
    private String studentID;
    private String courseCode;
    private String caEligibility;
    private String attendanceEligibility;
    private String status;
    private String batch;

    // Constructor
    public CourseEligibility(int eligibilityID, String studentID, String courseCode,
                             String caEligibility, String attendanceEligibility, String status) {
        this.eligibilityID = eligibilityID;
        this.studentID = studentID;
        this.courseCode = courseCode;
        this.caEligibility = caEligibility;
        this.attendanceEligibility = attendanceEligibility;
        this.status = status;
    }

    public CourseEligibility(String studentID, String courseCode, String caEligibility, String attendanceEligibility, String batch , String status) {
        this.studentID = studentID;
        this.courseCode = courseCode;
        this.caEligibility = caEligibility;
        this.batch = batch;
        this.attendanceEligibility = attendanceEligibility;
        this.status = status;
    }

    // Default constructor
    public CourseEligibility() {}

    // Getters and Setters
    public int getEligibilityID() {
        return eligibilityID;
    }

    public void setEligibilityID(int eligibilityID) {
        this.eligibilityID = eligibilityID;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCaEligibility() {
        return caEligibility;
    }

    public void setCaEligibility(String caEligibility) {
        this.caEligibility = caEligibility;
    }

    public String getAttendanceEligibility() {
        return attendanceEligibility;
    }

    public void setAttendanceEligibility(String attendanceEligibility) {
        this.attendanceEligibility = attendanceEligibility;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public static boolean  studentEligibility(String batch , String department){

        List<String> studentList = Marks.getAllStudentIdByBatchYarAndDepartment(batch, department);
        if(!studentList.isEmpty()){

         List<CourseEligibility> courseEligibilityList =  processAndUpdateStudentCaEligibility(studentList);
         if(courseEligibilityList.isEmpty()){
             return false;
         }
         boolean  pass = saveCaEligibility(courseEligibilityList);
         if(pass){
             return true;
         }
         return false;


        }


return false;

    }


    public static boolean saveCaEligibility(List <CourseEligibility> courseEligibilityList) {
        Connection con = null;
        PreparedStatement ps = null;
        System.out.println("saveCaEligibility " + 1);

        try {
            con = DBConnection.getConnection();
            String sql = """
          INSERT INTO course_eligibility (studentID, courseCode, caEligibility, attendanceEligibility,batch, status)
          VALUES (?, ?, ?, ?, ?,?)
        """;
            ps = con.prepareStatement(sql);

            // Add all student grade data to the batch
            for (CourseEligibility studentGrade : courseEligibilityList) {
                ps.setString(1, studentGrade.getStudentID());
                ps.setString(2, studentGrade.getCourseCode());
                ps.setString(3, studentGrade.getCaEligibility());
                ps.setString(4, studentGrade.getAttendanceEligibility());
                ps.setString(5, studentGrade.getBatch());
                ps.setString(6, studentGrade.getStatus());

                ps.addBatch();
            }

            // Execute the batch update
            int[] result = ps.executeBatch();
            con.close();
            return result.length > 0; // Return true if any records were inserted
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;


    }
    public static List<CourseEligibility>   processAndUpdateStudentCaEligibility(List<String> studentIdList) {
        List<CourseEligibility> studentEligibility = new ArrayList<>();
        String attendanceEligibility ;
        String caEligibility ;
        String status ;

        for (String studentId : studentIdList) {
            List<Marks> marksList = Marks.getStudentMarksByStudentId(studentId);
            for (Marks marks : marksList) {

                boolean isCaEligible = Marks.caEligibility(marks);
                if (isCaEligible) {
                    caEligibility = "Eligible";

                }
                else {
                    caEligibility = "Not Eligible";
                }
                boolean isAttendanceEligible = Attendance.AttendanceEligible(marks.getStudentId(), marks.getCourseId());
                System.out.println("\n\nstudent id       " + marks.getStudentId() + " CourseId       " + marks.getCourseId() + " isCaEligible      " + isCaEligible + " isAttendanceEligible         " + isAttendanceEligible +"\n\n\n");

                if (isAttendanceEligible == true) {
                    attendanceEligibility = "Eligible";
                }
                else {
                    attendanceEligibility = "Not Eligible";
                }


                // will chnage
                if (isCaEligible && isAttendanceEligible) {
                    status = "Eligible";
                }
                else {
                    status = "Not Eligible";
                }


//                    public CourseEligibility(String studentID, String courseCode, String caEligibility, String attendanceEligibility, String status) {
//                    this.studentID = studentID;
//                    this.courseCode = courseCode;
//                    this.caEligibility = caEligibility;
//                    this.attendanceEligibility = attendanceEligibility;
//                    this.status = status;

                studentEligibility.add(new CourseEligibility(marks.getStudentId(), marks.getCourseId(), attendanceEligibility, caEligibility, "2022", status));


            }
        }

        return studentEligibility;
//            for (Marks mark : marksList) {
//                int credit = getCourseCreditByCourseCode(mark.getCourseId());
//                double gradePoint = studentGradPoint(studentGrads(finalTotalMarks(mark)));
//                totalWeightedGradePoints += gradePoint * credit;
//                totalCredit += credit;
//            }
//
//            // Avoid division by zero
//            if (totalCredit > 0) {
//                BigDecimal sgpa = new BigDecimal(totalWeightedGradePoints / totalCredit)
//                        .setScale(2, RoundingMode.HALF_UP);  // Round SGPA to two decimal places
//
//                System.out.println("Total weighted grade points: " + sgpa);
//                System.out.println("Total credits: " + totalCredit);
//
//                System.out.println("lol");
//
//                // Add student grade info to list for batch update
//                studentGradeList.add(new StudentGrade(studentId, getStudentSemesterCode(studentId), sgpa.doubleValue(), totalCredit, getStudentDepartment(studentId)));
//                System.out.println("lol2");
//            } else {
//                System.out.println("No courses found for student: " + studentId);
//            }
//        }

        // Update all student grades in a single batch update
//        boolean result = saveStudentGradients(studentGradeList);
//        if (result) {
//            System.out.println("All student grades updated successfully!");
//        } else {
//            System.out.println("Failed to update student grades.");
//        }
    }














    @Override
    public String toString() {
        return "CourseEligibility{" +
                "eligibilityID=" + eligibilityID +
                ", studentID='" + studentID + '\'' +
                ", courseCode='" + courseCode + '\'' +
                ", caEligibility='" + caEligibility + '\'' +
                ", attendanceEligibility='" + attendanceEligibility + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
