package org.techlms.demoitest.model.users;

import org.techlms.demoitest.dbconnection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

public class User{
    protected int userID;
    protected String userName;
    protected  String password;
    protected String name;
    protected String email;
    protected String contactNumber;
    protected String role;
    protected String gender;
    protected String dateOfBirth;
    protected byte[] userProfile;

    public User(String userName, String password, String name, String email, String contactNumber, String role, String gender, String dateOfBirth, byte[] userProfile) {
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.email = email;
        this.contactNumber = contactNumber;
        this.role = role;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.userProfile = userProfile;
    }

    public User(String userName, String password, String name, String email, String contactNumber, String gender, byte[] userProfile ,String role) {
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.email = email;
        this.contactNumber = contactNumber;
        this.gender = gender;
        this.userProfile = userProfile;
        this.role = role;
    }

    public User(byte[] userProfile, String name, String email, String gender) {
        this.userProfile = userProfile;
        this.name = name;
        this.email = email;
        this.gender = gender;
    }

    public User(int userID, String userName, String role) {
        this.userID = userID;
        this.userName = userName;
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public byte[] getUserProfile() {
        return userProfile;
    }

    public void setUserProfile(byte[] userProfile) {
        this.userProfile = userProfile;
    }

    @Override
    public String toString() {
        return "User{" +
                "userID=" + userID +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", contactNumber='" + contactNumber + '\'' +
                ", role='" + role + '\'' +
                ", gender='" + gender + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                ", userProfile=" + Arrays.toString(userProfile) +
                '}';
    }

    public static byte[] getUserProfileByUserName(String username) {
        Connection con = DBConnection.getConnection();
        String sql = "select user_profile from user where username = ?";
        byte[] profile = null;
        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                profile = rs.getBytes(1);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return profile;
    }
}