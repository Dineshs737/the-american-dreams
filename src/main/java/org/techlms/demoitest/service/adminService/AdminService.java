package org.techlms.demoitest.service.adminService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.dto.adminDTO.UserCountDTO;
import org.techlms.demoitest.dto.adminDTO.UserPercentageDTO;
import org.techlms.demoitest.model.course.Course;
import org.techlms.demoitest.model.users.*;
import org.techlms.demoitest.model.util.Notice;
import org.techlms.demoitest.model.util.TimeTable;
import org.techlms.demoitest.util.SessionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AdminService {

    private SessionManager sessionManager = SessionManager.getInstance();




    public UserCountDTO getUserCount() {

        UserCountDTO userCount = null;
        String sql =  "SELECT * FROM UserRoleCounts";
        Connection con = DBConnection.getConnection();
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            // ------------------------------------ student , lecturer , admin , tech officer
            userCount = new UserCountDTO(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4));

        }catch (SQLException e){
            e.printStackTrace();
        }
        return  userCount;
    }



    public UserPercentageDTO getUserPercentageBYGender(){
        UserPercentageDTO userPercentage = null;
        String sql =  "SELECT COUNT(user_id) FROM user";
        Connection con = DBConnection.getConnection();
        try{

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int totalUsers = rs.getInt(1);
            ps = con.prepareStatement("SELECT COUNT(user_id) FROM user WHERE `gender` = 'm';");
            rs = ps.executeQuery();
            rs.next();
            int totalMaleUsers = rs.getInt(1);

            double totalMaleUserPercentage = totalMaleUsers * 100 / totalUsers;
            double totalFemaleUserPercentage = 100 - totalMaleUserPercentage;

            userPercentage = new UserPercentageDTO(totalUsers ,totalMaleUserPercentage,totalFemaleUserPercentage);

        }catch (SQLException e){
            e.printStackTrace();
        }
        return userPercentage;
    }


    public boolean isUserExists(String username){
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(`user_id`) FROM `user` where `username` = ?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            rs.next();
            if(rs.getInt(1) > 0){
                return true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean isStudentIdExits(String studentId){
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(`user_id`) FROM `student` where `student_id` = ?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            if(rs.getInt(1) > 0){
                return true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean isLecturerIdExits(String lecturerId){
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(`user_id`) FROM `lecturer` where `lecturer_id` = ?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, lecturerId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            if(rs.getInt(1) > 0){
                return true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean isTechnicalOfficerIdExits(String technicalOfficerId){
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(`user_id`) FROM `technical_Officer` where `technical_Officer_id` = ?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, technicalOfficerId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            if(rs.getInt(1) > 0){
                return true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }



    public boolean isAdminIdExits(String adminId){
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(`user_id`) FROM `admin` where admin_id = ?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, adminId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            if(rs.getInt(1) > 0){
                return true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }


    public boolean isEmailIdExits(String emailId){
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(`user_id`) FROM `user` where email = ?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, emailId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            if(rs.getInt(1) > 0){
                return true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;

    }


    public List<String> getDepartment(){
        List<String> departments = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        try {
            String sql = "SELECT `dep_code` FROM `department` ;";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                departments.add(rs.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departments;
    }

    public List<String> getBatchYears(){

        Connection con = DBConnection.getConnection();
        List<String> courseYear = new ArrayList <String>();
        try{
            String sql = "select `batch_year` from `batch`;";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                courseYear.add(rs.getString(1));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return courseYear;


    }

    public List<String> getDepartments(){
        List<String> departments = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        try {
            String sql = "select `dep_code` from `department`";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                departments.add(rs.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departments;
    }


    public int createUser(User user , Connection con){
        String insertTOUserTable = "INSERT INTO `user` (`username`, `name`, `email`, `role`, `contact_no` ,`password`, `gender` ,  `user_profile` ,`address`) VALUES (?,?,?,?,?,?,?,?,?);";
        try{

            //insert user table data
            PreparedStatement ps = con.prepareStatement(insertTOUserTable,PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1,user.getUserName());
            ps.setString(2,user.getName());
            ps.setString(3,user.getEmail());
            ps.setString(4,user.getRole());
            ps.setString(5,user.getContactNumber());
            ps.setString(6,user.getPassword());
            ps.setString(7,user.getGender());
            ps.setBytes(8,user.getUserProfile());
            ps.setString(9,user.getAddress());
            if(ps.executeUpdate() > 0){
                //allow to send data to database
                //print query
                System.out.println(ps);
                try(ResultSet rs = ps.getGeneratedKeys()) {
                    if(rs.next()) {
                        // return created  user id
                        return rs.getInt(1);
                    }
                }
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }

// error code
        return - 100;
    }




    public boolean createStudent(Student student) {
        Connection con = DBConnection.getConnection();

        String studentInsertSQL = "INSERT INTO `student` (`user_id`, `student_id`, `batch_year`, `department`) VALUES (?,?,?,?);";
        String courseEnrollmentSQL = "INSERT INTO course_enrollment (student_id, course_code, department ,enrolled) VALUES (?,?,?,?)";

        try {
            // Begin transaction
            con.setAutoCommit(false);
// public User(String userName, String password, String email, String name, String gender, String contactNumber,String address, String role, byte[] userProfile)
            // Create user and get user ID


            System.out.println(student.getGender());
//                public User(String userName, String password, String name, String email, String contactNumber, String role, String gender, String address, byte[] userProfile) {
//                this.userName = userName;
//                this.password = password;
//                this.name = name;
//                this.email = email;
//                this.contactNumber = contactNumber;
//                this.role = role;
//                this.gender = gender;
//                this.address = address;
//                this.userProfile = userProfile;
//            }
            User user = new User(
                    student.getUserName(),
                    student.getPassword(),
                    student.getName(),
                    student.getEmail(),
                    student.getContactNumber(),
                    student.getRole(),
                    student.getGender(),
                    student.getAddress(),
                    student.getUserProfile()
            );


            System.out.println(user);
            int userId = createUser(user, con);

            if (userId != -100) {
                // Insert student data
                try (PreparedStatement studentStmt = con.prepareStatement(studentInsertSQL)) {
                    studentStmt.setInt(1, userId);
                    studentStmt.setString(2, student.getStudentId());
                    studentStmt.setString(3, student.getBranch());
                    studentStmt.setString(4, student.getDepartment());

                    if (studentStmt.executeUpdate() > 0) {
                        System.out.println(studentStmt);

                        // Fetch courses and enroll student
                        List<String> courseCodes = getCourseCodeByBatch(student.getBranch(),student.getDepartment());
                        if(courseCodes == null){
                            throw new SQLException("Course Code Not Found");
                        }

                        try (PreparedStatement enrollmentStmt = con.prepareStatement(courseEnrollmentSQL)) {
                            for (String courseCode : courseCodes) {
                                enrollmentStmt.setString(1, student.getStudentId());
                                enrollmentStmt.setString(2, courseCode);
                                enrollmentStmt.setString(3, student.getDepartment());
                                enrollmentStmt.setBoolean(4, false);
                                enrollmentStmt.addBatch();
                            }


                            int[] results = enrollmentStmt.executeBatch();
                            System.out.println("Batch update results: " + Arrays.toString(results));
                        }

                        // Commit transaction
                        con.commit();
                        return true;
                    }
                }
            }

            con.rollback();
        } catch (SQLException e) {
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }

        return false;
    }




    public boolean createLecturer(Lecturer lecturer) {
        Connection con = DBConnection.getConnection();
        String sql  = "INSERT INTO lecturer (user_id, lecturer_id, department) VALUES (?,?,?);";
        try {
            //stop data pass
            con.setAutoCommit(false);
            //pass user table data as User model object
            User user = new User(
                    lecturer.getUserName(),
                    lecturer.getPassword(),
                    lecturer.getName(),
                    lecturer.getEmail(),
                    lecturer.getContactNumber(),
                    lecturer.getRole(),
                    lecturer.getGender(),
                    lecturer.getAddress(),
                    lecturer.getUserProfile()
            );

            System.out.println(user);

            int userId = createUser(user, con);

            if (userId != -100) {
                try (PreparedStatement ps = con.prepareStatement(sql)){
                    ;

                    //add user id to lecturer
                    ps.setInt(1, userId);
                    ps.setString(2, lecturer.getLecturerID());
                    ps.setString(3, lecturer.getDepartment());

                    if (ps.executeUpdate() > 0) { // check query execute or not
                        System.out.println(ps);
                        con.commit();
                        return true;
                    }


                }
                // reverse data from database
                con.rollback();
            }
        }catch (SQLException e){
            e.printStackTrace();


        }


        return false;


    }




    public boolean createTechnicalOfficer(TechnicalOfficer technicalOfficer) {
        Connection con = DBConnection.getConnection();
        String sql  = "INSERT INTO `technical_Officer` (user_id, technical_Officer_id, department) VALUES (?,?,?);";
        try {
            //stop data pass
            con.setAutoCommit(false);
            //pass user table data as User model object
            User user = new User(
                    technicalOfficer.getUserName(),
                    technicalOfficer.getPassword(),
                    technicalOfficer.getName(),
                    technicalOfficer.getEmail(),
                    technicalOfficer.getContactNumber(),
                    technicalOfficer.getRole(),
                    technicalOfficer.getGender(),
                    technicalOfficer.getAddress(),
                    technicalOfficer.getUserProfile()
            );

            System.out.println(user);

            int userId = createUser(user, con);

            if (userId != -100) {
                try (PreparedStatement ps = con.prepareStatement(sql)){
                    ;

                    //add user id to technicalOfficer
                    ps.setInt(1, userId);
                    ps.setString(2, technicalOfficer.getTechnicalOfficerId());
                    ps.setString(3, technicalOfficer.getDepartment());

                    if (ps.executeUpdate() > 0) { // check query execute or not
                        System.out.println(ps);
                        con.commit();
                        return true;
                    }


                }
                // reverse data from database
                con.rollback();
            }
        }catch (SQLException e){
            e.printStackTrace();


        }


        return false;


    }




    public boolean createAdmin(Admin admin) {
        Connection con = DBConnection.getConnection();
        String sql  = "INSERT INTO `admin` (user_id, admin_id) VALUES (? , ?);";
        try {
            //stop data pass
            con.setAutoCommit(false);
            //pass user table data as User model object
            User user = new User(
                    admin.getUserName(),
                    admin.getPassword(),
                    admin.getName(),
                    admin.getEmail(),
                    admin.getContactNumber(),
                    admin.getRole(),
                    admin.getGender(),
                    admin.getAddress(),
                    admin.getUserProfile()
            );

            System.out.println(user);

            int userId = createUser(user, con);

            if (userId != -100) {
                try (PreparedStatement ps = con.prepareStatement(sql)){
                    ;

                    //add user id to admin
                    ps.setInt(1, userId);
                    ps.setString(2, admin.getAdminID());

                    if (ps.executeUpdate() > 0) { // check query execute or not
                        System.out.println(ps);
                        con.commit();
                        return true;
                    }


                }
                // reverse data from database
                con.rollback();
            }
        }catch (SQLException e){
            e.printStackTrace();


        }


        return false;


    }




    public List<String> getCourseCodeByBatch(String batchYar , String department) {
        Connection con = DBConnection.getConnection();
        List<String> courseCodes = new ArrayList<>();
        try{
            String sql = "select course_code from course where course_semester = (select current_student_semester from batch where batch_year = ?  and `dep_code` = ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,batchYar);
            ps.setString(2,department);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                courseCodes.add(rs.getString(1));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return courseCodes;
    }






    public List<User> getAllUser(){
        Connection con = DBConnection.getConnection();
        List<User> users = new ArrayList<>();
        try{
            String sql = "select  username ,  email,  name  , gender , contact_no , role  , user_profile ,  created_at , updated_at  from user ;";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                /*******
                 *     public User(String userName, String email, String name, String gender, String contactNumber, String role, byte[] userProfile) {
                 *         this.userName = userName;
                 *         this.email = email;
                 *         this.name = name;
                 *         this.gender = gender;
                 *         this.contactNumber = contactNumber;
                 *         this.role = role;
                 *         this.userProfile = userProfile;
                 *     }
                 */

                users.add(new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBytes(7),
                        rs.getDate(8).toString(),
                        rs.getDate(9).toString()

                ));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return users;
    }

    public Student getStudentByUsername(String username) {

        Connection con = DBConnection.getConnection();
        Student student = null;
        String sql = """
               
                SELECT                   user.user_id,
                                         user.username,
                                         user.password,
                                         user.name,
                                         user.email,
                                         user.contact_no,
                                         user.role,
                                         user.gender,
                                         user.address,
                                         user.user_profile,
                                         student.student_id,
                                         student.batch_year,
                                         student.department
                                     FROM
                                         user
                                     LEFT JOIN
                                         student ON user.user_id = student.user_id
                                     WHERE
                                         user.username = ?;
                """;
        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){

                student = new Student(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7), // Corrected placement of role
                        rs.getString(8),
                        rs.getString(9),
                        rs.getBytes(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13)
                );

            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return student;
    }



    public boolean deleteEmailByUsername(String username) {
        Connection con = DBConnection.getConnection();
        String sql = """
                UPDATE user
                SET email = NULL
                WHERE username = ?;
                
                """;

        try(PreparedStatement ps = con.prepareStatement(sql)){
            con.setAutoCommit(false);
            ps.setString(1,username);
            if (ps.executeUpdate() > 0) {
                System.out.println(ps);
                con.commit();
                return true;
            }
            con.rollback();

        }catch (SQLException e){
            e.printStackTrace();
        }
        return true;
    }




    public boolean deleteUsernameById(String username) {
        Connection con = DBConnection.getConnection();
        String sql = """
                UPDATE user
                SET email = NULL
                WHERE username = ?;
                
                """;

        try(PreparedStatement ps = con.prepareStatement(sql)){
            con.setAutoCommit(false);
            ps.setString(1,username);
            if (ps.executeUpdate() > 0) {
                System.out.println(ps);
                con.commit();
                return true;
            }
            con.rollback();

        }catch (SQLException e){
            e.printStackTrace();
        }
        return true;
    }

//
//    public User getUserByUserName(String userName){
//        Connection con = DBConnection.getConnection();
//        User user = null;
//        try{
//            String sql = "select  username , password , email,  name  , gender , contact_no , role  , user_profile  from user where username = ? ;";
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1,userName);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()){
//
//                /*******
//                 *     public User(String userName, String email, String name, String gender, String contactNumber, String role, byte[] userProfile) {
//                 *         this.userName = userName;
//                 *         this.email = email;
//                 *         this.name = name;
//                 *         this.gender = gender;
//                 *         this.contactNumber = contactNumber;
//                 *         this.role = role;
//                 *         this.userProfile = userProfile;
//                 *     }
//                 */
//
//                user = new User(
//                        rs.getString(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getBytes(8)
//                );
//            }
//
//
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//
//
//
//        return user;
//    }


    /*****************
     * DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';
     * @param userName
     * @return
     */

    public boolean deleteUserByName(String userName){


        Connection con = DBConnection.getConnection();
        String sql = "DELETE FROM user WHERE username= ?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            if(ps.executeUpdate() > 0){
                return true;

            }
            con.close();

        }catch (SQLException e){
            e.printStackTrace();
        }

        return false;

    }


//    public boolean updateUserByName(User oldUser, User newUser){
//        Connection con = DBConnection.getConnection();
//        try{
//            con.setAutoCommit(false);
//            /*******
//             *     public User(String userName, String email, String name, String gender, String contactNumber, String role, byte[] userProfile) {
//             *         this.userName = userName;
//             *         this.email = email;
//             *         this.name = name;
//             *         this.gender = gender;
//             *         this.contactNumber = contactNumber;
//             *         this.role = role;
//             *         this.userProfile = userProfile;
//             *     }*/
//
//            String sql = """
//                                        UPDATE user
//                                        SET
//                                            username = ?,
//                                            password = ? ,
//                    						name  = ?,
//                                            email  = ?,
//                                            contact_no = ?,
//                    						role   = ?,
//                    						gender  = ?,
//                    						user_profile = ?
//                                        WHERE
//                                            username = ?;
//                    """;
//            try(PreparedStatement ps = con.prepareStatement(sql)) {
//                ps.setString(1, newUser.getUserName());
//                ps.setString(2, newUser.getPassword());
//                ps.setString(3, newUser.getName());
//                ps.setString(4, newUser.getEmail());
//                ps.setString(5, newUser.getContactNumber());
//                ps.setString(6, newUser.getRole());
//                ps.setString(7, newUser.getGender());
//                ps.setBytes(8, newUser.getUserProfile());
//                ps.setString(9, oldUser.getUserName());
    ////            ps.executeUpdate();
//                if (ps.executeUpdate() > 0) {
//                    con.commit();
//                    return true;
//                }
//
//            }
//            con.rollback();
//        }catch (SQLException e){
//
//            e.printStackTrace();
//        }
//        finally {
//            try {
//                con.setAutoCommit(true);
//                con.close();
//            }catch (SQLException e){
//                e.printStackTrace();
//            }
//        }
//        return false;
//    }

//    public boolean isUserExistByName(String username){
//        Connection con = DBConnection.getConnection();
//        try{
//
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//
//        return false;
//
//    }


    public List<Course> getAllCourse(){
        Connection con = DBConnection.getConnection();
        List<Course> courses = new ArrayList<>();
        String sql = "select `course_code` ,  `name` , `credit` ,`course_semester` , `dep_code` , `course_type` , `created_date` , `created_date` from course";
        try(PreparedStatement ps = con.prepareStatement(sql)){
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                /*******
                 * public Course(String courseCode, String courseName, int courseCredit, String courseSemester, String department, String courseType, String createdDate, String updatedDate) {
                 *         this.courseCode = courseCode;
                 *         this.courseName = courseName;
                 *         this.courseCredit = courseCredit;
                 *         this.courseSemester = courseSemester;
                 *         this.department = department;
                 *         this.courseType = courseType;
                 *         this.createdDate = createdDate;
                 *         this.updatedDate = updatedDate;
                 *     }
                 *
                 */
                courses.add(new Course(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7).toString(),
                        rs.getDate(8).toString()


                ));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return courses;
    }


//
//    public boolean updateUser(User user , Connection con) {
//        String sql = """
//
//  UPDATE user
//SET
//    username = ?,
//    password = ?,
//    name = ?,
//    email = ?,
//    contact_no = ?,
//    role = ?,
//    gender = ?
//    address = ?,
//    user_profile = ?
//WHERE
//     user_id = ?;
//
//""";
//        try {
//
//            //insert user table data
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, user.getUserName());
//            ps.setString(2, user.getName());
//            ps.setString(3, user.getEmail());
//            ps.setString(4, user.getRole());
//            ps.setString(5, user.getContactNumber());
//            ps.setString(6, user.getPassword());
//            ps.setString(7, user.getGender());
//            ps.setBytes(8, user.getUserProfile());
//            ps.setString(9, user.getAddress());
//            if (ps.executeUpdate() > 0) {
//                //allow to send data to database
//                //print query
//                System.out.println(ps);
//                return true;
//            }
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//
//    return false;
//    }

//    public boolean updateStudentById(Student student,int id) {
//        Connection con = DBConnection.getConnection();
//
//        String updateStudentQuery = """
//
// UPDATE student
//SET
//    student_id = ?,
//    department = ?,
//    batch_year = ?
//WHERE
//    user_id = ?;
//
//""";
//        String courseEnrollmentSQL = "INSERT INTO course_enrollment (student_id, course_code, department ,enrolled) VALUES (?,?,?,?)";
//
//        try {
//            con.setAutoCommit(false);
//            User user = new User(
//                    student.getUserName(),
//                    student.getPassword(),
//                    student.getName(),
//                    student.getEmail(),
//                    student.getContactNumber(),
//                    student.getRole(),
//                    student.getGender(),
//                    student.getAddress(),
//                    student.getUserProfile()
//            );
//
//
//            System.out.println(user);
//            boolean success = updateUser(user, con);
//
//            if (success) {
//                // Insert student data
//                try (PreparedStatement studentStmt = con.prepareStatement(updateStudentQuery)) {
//                    studentStmt.setString(1, student.getStudentId());
//                    studentStmt.setString(2, student.getBranch());
//                    studentStmt.setString(3, student.getDepartment());
//
//                    if (studentStmt.executeUpdate() > 0) {
//                        System.out.println(studentStmt);
//
//                        // Fetch courses and enroll student
//                        List<String> courseCodes = getCourseCodeByBatch(student.getBranch(),student.getDepartment());
//                        if(courseCodes == null){
//                            throw new SQLException("Course Code Not Found");
//                        }
//
//                        try (PreparedStatement enrollmentStmt = con.prepareStatement(courseEnrollmentSQL)) {
//                            for (String courseCode : courseCodes) {
//                                enrollmentStmt.setString(1, student.getStudentId());
//                                enrollmentStmt.setString(2, courseCode);
//                                enrollmentStmt.setString(3, student.getDepartment());
//                                enrollmentStmt.setBoolean(4, false);
//                                enrollmentStmt.addBatch();
//                            }
//
//
//                            int[] results = enrollmentStmt.executeBatch();
//                            System.out.println("Batch update results: " + Arrays.toString(results));
//                        }
//
//                        // Commit transaction
//                        con.commit();
//                        return true;
//                    }
//                }
//            }
//
//            con.rollback();
//        } catch (SQLException e) {
//            try {
//                if (con != null) {
//                    con.rollback();
//                }
//            } catch (SQLException rollbackEx) {
//                rollbackEx.printStackTrace();
//            }
//            e.printStackTrace();
//        } finally {
//            try {
//                if (con != null) {
//                    con.setAutoCommit(true);
//                    con.close();
//                }
//            } catch (SQLException closeEx) {
//                closeEx.printStackTrace();
//            }
//        }
//
//        return false;
//    }


    public boolean updateUser(User user , User oldUser) {
        Connection con = DBConnection.getConnection();
        String sql = null;

        if (oldUser.getEmail().equals(user.getEmail())) {
            sql = """

  UPDATE user
                    SET
    username = ?,
    password = ?,
    name = ?,
    contact_no = ?,
    role = ?,
    gender = ?,
    address = ?,
    user_profile = ?
                    WHERE
     user_id = ?;

""";


            try {

                con.setAutoCommit(false);
                //insert user table data
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, user.getUserName());
                ps.setString(2, user.getPassword());
                ps.setString(3, user.getName());
                ps.setString(4, user.getContactNumber());
                ps.setString(5, user.getRole());
                ps.setString(6, user.getGender());
                ps.setString(7, user.getAddress());
                ps.setBytes(8, user.getUserProfile());

                ps.setInt(9, oldUser.getUserID());


                if (ps.executeUpdate() > 0) {
                    con.commit();
                    //allow to send data to database
                    //print query
                    System.out.println(ps);
                    return true;
                }
                con.rollback(); // if any error stop data passing
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

            return false;
        } else if (user.getUserName().equals(oldUser.getUserName())) {

            sql = """

  UPDATE user
    SET
    password = ?,
    name = ?,
    email = ?,
    contact_no = ?,
    role = ?,
    gender = ?,
    address = ?,
    user_profile = ?
                    WHERE
     user_id = ?;

""";

            try {

                con.setAutoCommit(false);
                //insert user table data
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, user.getPassword());
                ps.setString(2, user.getName());
                ps.setString(3, user.getEmail());
                ps.setString(4, user.getContactNumber());
                ps.setString(5, user.getRole());
                ps.setString(6, user.getGender());
                ps.setString(7, user.getAddress());
                ps.setBytes(8, user.getUserProfile());

                ps.setInt(9, oldUser.getUserID());


                if (ps.executeUpdate() > 0) {
                    con.commit();
                    //allow to send data to database
                    //print query
                    System.out.println(ps);
                    return true;
                }
                con.rollback(); // if any error stop data passing
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

            return false;

        }
        else{

            sql = """

  UPDATE user
                    SET
    username = ?,
    password = ?,
    name = ?,
    email = ?,
    contact_no = ?,
    role = ?,
    gender = ?,
    address = ?,
    user_profile = ?
                    WHERE
     user_id = ?;

""";

            try {

                con.setAutoCommit(false);
                //insert user table data
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, user.getUserName());
                ps.setString(2, user.getPassword());
                ps.setString(3, user.getName());
                ps.setString(4, user.getEmail());
                ps.setString(5, user.getContactNumber());
                ps.setString(6, user.getRole());
                ps.setString(7, user.getGender());
                ps.setString(8, user.getAddress());
                ps.setBytes(9, user.getUserProfile());

                ps.setInt(10, oldUser.getUserID());


                if (ps.executeUpdate() > 0) {
                    con.commit();
                    //allow to send data to database
                    //print query
                    System.out.println(ps);
                    return true;
                }
                con.rollback(); // if any error stop data passing
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

            return false;


        }



    }






    public List<String> getAllStudentIdByBatchYarAndDepartment(String batchYar, String department){
        Connection con = DBConnection.getConnection();
        List<String> studentIds = new ArrayList<>();
        String sql = "select student_id from student where department = ? AND batch_year =  ? ;";
        try(PreparedStatement ps = con.prepareStatement(sql)){

            ps.setString(1, department);
            ps.setString(2, batchYar);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                studentIds.add(rs.getString(1));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return studentIds;
    }

    public List<TimeTable> fetchTimeTable() {
        List<TimeTable> timeTableList = new ArrayList<>();
        String query = "SELECT lecturer_id, course_code, batch, department, time_slot, day_of_week, lecture_hall " +
                "FROM timetable " +
                "ORDER BY day_of_week, time_slot, batch";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String lecturerId = rs.getString("lecturer_id");
                String courseCode = rs.getString("course_code");
                String batch = rs.getString("batch");
                String department = rs.getString("department");
                String timeSlot = rs.getString("time_slot");
                String dayOfWeek = rs.getString("day_of_week");
                String lectureHall = rs.getString("lecture_hall");

                System.out.println(rs.getString("day_of_week"));
                // Create a TimeTable object and add it to the list
                TimeTable timeTable = new TimeTable(lecturerId, courseCode, batch, department, timeSlot, dayOfWeek, lectureHall);
                timeTableList.add(timeTable);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return timeTableList;
    }


    // Method to fetch all notices from the database
    public List<Notice> fetchNotices() {
        List<Notice> noticeList = new ArrayList<>();
        String query = "SELECT notice_id, admin_username, notice_name, notice_title, notice_data, create_date, `updated_date` FROM notices ORDER BY create_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int noticeId = rs.getInt("notice_id");
                String adminUsername = rs.getString("admin_username");
                String noticeName = rs.getString("notice_name");
                String noticeTitle = rs.getString("notice_title");
                byte[] noticeData = rs.getBytes("notice_data");
                String medicalCreateDate = rs.getDate("create_date").toString();
                String updatedData = rs.getDate("updated_date").toString();

                // Create a new Notice object and add it to the list
                Notice notice = new Notice(noticeId, adminUsername, noticeName, noticeTitle, noticeData, medicalCreateDate, updatedData);
                noticeList.add(notice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return noticeList;
    }


    public List<String> getAllNoticeTitle(){
        List<String> noticeTitleList = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        String sql = "select notice_title from `notices`;";
        try(PreparedStatement ps = con.prepareStatement(sql)){
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                noticeTitleList.add(rs.getString(1));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return noticeTitleList;
    }

    public boolean deleteNotice(String noticeTitle) {
        Connection con = DBConnection.getConnection();
        String sql = "DELETE FROM notices " +
                "WHERE notice_title = ?;";

        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setString(1, noticeTitle);
            if(ps.executeUpdate() > 0) {
                return true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return false;

    }


    public Notice getNoticeByTitle(String noticeTitle) {
        Connection con = DBConnection.getConnection();
        Notice notice = null;
        String sql = "SELECT notice_title, notice_data  FROM notices " +
                "WHERE notice_title = ?;";

        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setString(1, noticeTitle);
            ResultSet rs = ps.executeQuery();
            System.out.println(ps.toString());
            if(rs.next()){
                notice = new Notice();
                notice.setNoticeTitle(rs.getString(1));
                notice.setNoticeData(rs.getBytes(2));


            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return notice;



    }

    public boolean updateNotice(Notice notice , Notice oldNotice) {
        Connection con = DBConnection.getConnection();
        String sql = """
                UPDATE notices
                SET notice_title = ?, notice_data = ?
                WHERE notice_title = ?;
                
                """;

        try {
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, notice.getNoticeTitle());
            ps.setBytes(2, notice.getNoticeData());
            ps.setString(3, oldNotice.getNoticeTitle());
            if(ps.executeUpdate() > 0) {
                System.out.println(ps);
                con.commit();
                return true;
            }
            con.rollback();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    public boolean saveNotice(Notice notice) {
        Connection con = DBConnection.getConnection();
        try(PreparedStatement ps = con.prepareStatement("INSERT INTO `notices` (admin_username, notice_title, notice_data)VALUES(?,?,?)")){

            con.setAutoCommit(false);
            ps.setString(1, notice.getAdminUsername());
            ps.setString(2, notice.getNoticeTitle());
            ps.setBytes(3, notice.getNoticeData());
            if(ps.executeUpdate() > 0) {
                System.out.println(ps);
                con.commit();
                return true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }


        return false;
    }


    public Student getAdminProfile(int userId , String userRole){

       Admin admin = null;
        Connection con = DBConnection.getConnection();

        String sql = """
                SELECT
                    u.user_profile,
                    u.username,
                    u.email,
                    u.name,
                    u.gender,
                    u.contact_no,
                    u.address,
                    a.admin
                
                FROM
                    user u
                INNER JOIN
                    admin a ON u.user_id = a.user_id where u.user_id = ? and u.role = ?;
                """;

        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setInt(1,userId);
            ps.setString(2,userRole);
            ResultSet rs =  ps.executeQuery();
            System.out.println(ps);
            if(rs.next()){
                /************
                 *     public User(byte[] userProfile , String userName , String email, String name , String gender , String contactNumber , String address) {
                 *         this.userName = userName;
                 *         this.name = name;
                 *         this.email = email;
                 *         this.contactNumber = contactNumber;
                 *         this.gender = gender;
                 *         this.userProfile = userProfile;
                 *         this.address = address;
                 *     }
                 */
//                admin = new Admin(
//                        rs.getBytes(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8)
//                );

            }


        }catch (SQLException e){
            e.printStackTrace();
        }




//        return student;

        return  null;

    }

}

