package org.techlms.demoitest.service.studentService;

import org.techlms.demoitest.dbconnection.DBConnection;
import org.techlms.demoitest.dto.utilDTO.NoticeBoardDTO;
import org.techlms.demoitest.util.SeeNoticeBorad;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class NoticeBoardService implements SeeNoticeBorad {

    @Override
    public List<NoticeBoardDTO> getNoticeBoard() {
        List<NoticeBoardDTO> allNotice = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        String sql = "SELECT `notice_id`, `notice_name`, `notice_data`, `notice_title` , `medical_create_date` FROM `notices`";

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                allNotice.add(new NoticeBoardDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getBytes(3),
                        rs.getString(4),
                        rs.getDate(5).toString()
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return allNotice;
    }
}
