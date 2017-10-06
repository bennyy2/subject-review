package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import model.UserProfile;

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

    public static boolean email_validation(String email) {
        Pattern p = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@kmitl\\.ac\\.th$");
        Matcher m = p.matcher(email);
        return m.matches();
    }

    public static boolean findEmail(Connection con, String email) throws SQLException {
        String sql = "Select * from user where email = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, email);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (email.equals(rs.getString("email"))) {
                return true;
            }
        }
        return false;
    }

    public static boolean findUser(Connection con, String username) throws SQLException {
        String sql = "Select * from user where username = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, username);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (username.equals(rs.getString("username"))) {
                return true;
            }
        }
        return false;
    }

    public static boolean login(Connection con, String username, String password) throws SQLException {
        String sql = "Select * from user where username = ? and password = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, username);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (username.equals(rs.getString("username")) && password.equals(rs.getString("password"))) {
                return true;
            }
        }
        return false;
    }

    public static void insertUser(Connection con, UserProfile user, String role) throws SQLException {
        String id = UUID.randomUUID().toString();
        String sql = "Insert into user values (?,?,?,?,?)";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, id);
        pstm.setString(2, user.getUsername());
        pstm.setString(3, user.getEmail());
        pstm.setString(4, user.getPassword());
        pstm.setString(5, role);
        pstm.executeUpdate();
    }
}
