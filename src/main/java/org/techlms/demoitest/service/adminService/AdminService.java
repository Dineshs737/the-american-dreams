package org.techlms.demoitest.service.adminService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.model.users.Lecturer;
import org.techlms.demoitest.model.users.Student;
import org.techlms.demoitest.model.users.User;
import org.techlms.demoitest.util.SessionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminService {

    private SessionManager sessionManager = SessionManager.getInstance();




//    public UserCountDTO getUserCount() {
//
//        UserCountDTO userCount = null;
//        String sql =  "SELECT * FROM UserRoleCounts";
//        Connection con = DBConnection.getConnection();
//        try{
//        PreparedStatement ps = con.prepareStatement(sql);
//        ResultSet rs = ps.executeQuery();
//        rs.next();
//        // ------------------------------------ student , lecturer , admin , tech officer
//        userCount = new UserCountDTO(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4));
//
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//        return  userCount;
//    }
//
//
//
//    public UserPercentageDTO getUserPercentageBYGender(){
//        UserPercentageDTO userPercentage = null;
//        String sql =  "SELECT COUNT(user_id) FROM user";
//        Connection con = DBConnection.getConnection();
//        try{
//
//            PreparedStatement ps = con.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            rs.next();
//            int totalUsers = rs.getInt(1);
//            ps = con.prepareStatement("SELECT COUNT(user_id) FROM user WHERE `gender` = 'm';");
//            rs = ps.executeQuery();
//            rs.next();
//            int totalMaleUsers = rs.getInt(1);
//
//            double totalMaleUserPercentage = totalMaleUsers * 100 / totalUsers;
//            double totalFemaleUserPercentage = 100 - totalMaleUserPercentage;
//
//            userPercentage = new UserPercentageDTO(totalUsers ,totalMaleUserPercentage,totalFemaleUserPercentage);
//
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//        return userPercentage;
//    }


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


    public int createUser(User user){
        Connection con = DBConnection.getConnection();
        String insertTOUserTable = "INSERT INTO `user` (`username`, `name`, `email`, `role`, `contact_no`, `password`, `gender` ,  `user_profile`) VALUES (?,?,?,?,?,?,?,?);";
        try{
            con.setAutoCommit(false);

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
            if(ps.executeUpdate() > 0){
                //allow to send data to database
                //print query

                System.out.println(ps);
                con.commit();
                try(ResultSet rs = ps.getGeneratedKeys()) {
                    if(rs.next()) {
                        // return created  user id
                        return rs.getInt(1);
                    }
                }
            }
        }catch (SQLException e){
            try {
                con.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            System.out.println(e.getMessage());
        }

// error code
        return - 100;
    }


    public boolean createStudent(Student student) {
        Connection con = DBConnection.getConnection();
        String sql  = "INSERT INTO `student` (`user_id`, `student_id`, `batch_year`, `department`) VALUES (?,?,?,?);";

//        newUser = new Student(
//                "blaxdwxx01",
//                "dineshVip",
//                "dinesh",
//                "dinesh77saefewarck@gmail.com",
//                "0703728309",
//                "m",
//                null,
//                "student",
//                "tg/2022/1204",
//                "2022",
//                "ict");
        //pass user table data as User model object
        User user = new User(
                student.getUserName(),
                student.getPassword(),
                student.getName(),
                student.getEmail(),
                student.getContactNumber(),
                student.getGender(),
                student.getUserProfile(),
                student.getRole()
        );

        System.out.println(user);

            int userId= createUser(user);

            if( userId!= -100) {
                try {
                    con.setAutoCommit(false);
                    PreparedStatement ps = con.prepareStatement(sql);

                    //add user id to student id
                    ps.setInt(1, userId);
                    ps.setString(2, student.getStudentId());
                    ps.setString(3, student.getBranch());
                    ps.setString(4, student.getDepartment());

                    if (ps.executeUpdate() > 0) { // check query execute or not
                        System.out.println(ps);
                        con.commit();
                        return true;
                    }
                }catch (SQLException e){
                    e.printStackTrace();
                    try {
                        con.rollback();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }finally {
                        try{
                            con.setAutoCommit(true);
                        }catch (SQLException ex){
                            ex.printStackTrace();
                        }
                    }
                }


            }


        return false;
    }


    public boolean createLecturer(Lecturer lecturer) {
        Connection con = DBConnection.getConnection();
        String sql  = "INSERT INTO lecturer (user_id, lecturer_id, department) VALUES (?,?,?);";
        //pass user table data as User model object
        User user = new User(
                lecturer.getUserName(),
                lecturer.getPassword(),
                lecturer.getName(),
                lecturer.getEmail(),
                lecturer.getContactNumber(),
                lecturer.getGender(),
                lecturer.getUserProfile(),
                lecturer.getRole()
        );

        int userId= createUser(user);
        if( userId!= -100) {
            try {
                con.setAutoCommit(false);
                PreparedStatement ps = con.prepareStatement(sql);

                //add user id to lecturer id
                ps.setInt(1, userId);
                ps.setString(2,lecturer.getLecturerID());
                ps.setString(3,lecturer.getDepartment());

                if (ps.executeUpdate() > 0) { // check query execute or not
                    System.out.println(ps);
                    con.commit();
                    return true;
                }
            }catch (SQLException e){
                e.printStackTrace();
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }finally {
                    try{
                        con.setAutoCommit(true);
                    }catch (SQLException ex){
                        ex.printStackTrace();
                    }
                }
            }


        }


        return false;


    }
}
