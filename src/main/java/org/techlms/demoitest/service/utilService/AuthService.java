package org.techlms.demoitest.service.utilService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.dto.utilDTO.LoginDTO;
import org.techlms.demoitest.model.users.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AuthService {
    public User authenticate(LoginDTO loginDTO) {
        User user = null;
        try{
            Connection con = DBConnection.getConnection();
            String sql = "select `user_id` , `username` , `role` from `user` where `username` = ? and `password` = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, loginDTO.getUsername());
            ps.setString(2, loginDTO.getPassword());
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                String role = rs.getString("role");
                user = new User(id, username, role);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
