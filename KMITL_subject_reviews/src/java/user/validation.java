package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Benny
 */
public class validation {

//    public static boolean email_validation(String email) {
//        boolean status = false;
//        String email_pattern = "^[0-9]{0,9}@kmitl.ac.th$";
//
//        Pattern pattern = Pattern.compile(email_pattern);
//        Matcher matcher = pattern.matcher(email);
//
//        if (matcher.matches()) {
//            status = true;
//        } else {
//            status = false;
//        }
//        return status;
//
//    }

    public static boolean findEmail(Connection con, String email) throws SQLException {
        boolean find = false;
        String sql = "Select * from user where email = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, email);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (email.equals(rs.getString("email"))) {
                find = true;
            }
        }
        return find;
    }

    public static boolean findUser(Connection con, String username) throws SQLException {
        boolean user = false;
        String sql = "Select * from user where username = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, username);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (username.equals(rs.getString("username"))) {
                user = true;
            }
        }
        return user;
    }

    public static boolean login(Connection con, String username, String password) throws SQLException {
        boolean user = false;
        String sql = "Select * from user where username = ? and password = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, username);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (username.equals(rs.getString("username")) && password.equals(rs.getString("password"))) {
                user = true;
            }
        }
        return user;
    }
    

}
