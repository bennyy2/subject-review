/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import Connection.DBConnection;

/**
 *
 * @author Benny
 */
public class UserProfile {

    private String id;
    private String username;
    private String password;
    private String email;
    private String role;

    public UserProfile() {
    }

    public UserProfile(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public UserProfile(String id, String username, String password, String email, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    public UserProfile(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public boolean login() {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean status = true;
        try {
            conn = DBConnection.getConnection();
            String sql = "Select * from user where username = ? and password = ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, username);
            pstm.setString(2, password);
            rs = pstm.executeQuery();

            if (rs.next()) {
                this.username = rs.getString("username");
                this.password = rs.getString("password");
                this.role = rs.getString("role");
                this.email = rs.getString("email");
                this.id = rs.getString("user_id");
            } else {
                status = false;
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            status = false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ignore) {
                }
            }
        }

        return status;
    }

    public boolean findEmail() {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean status = false;
        try {
            conn = DBConnection.getConnection();
            String sql = "Select * from user where email = ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, email);
            rs = pstm.executeQuery();
            Pattern p = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@kmitl\\.ac\\.th$");
            Matcher m = p.matcher(email);

            if (rs.next()) {
                status = true;
            } else if (!m.matches()) {
                status = true;
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            status = false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ignore) {
                }
            }
        }

        return status;
    }
    
    public boolean insertUser() {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String role = null;
        boolean status = false;
        String id = UUID.randomUUID().toString();
        String[] address = new String[2];
        address = email.split("@");
        for (char i : address[0].toCharArray()) {
            if (!Character.toString(i).matches("[0-9]")) {
                role = "teacher";
                break;
            } else {
                role = "student";
            }
        }
        try {
            conn = DBConnection.getConnection();
            String sql = "Insert into user values (?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.setString(2, this.username);
            pstm.setString(3, this.email);
            pstm.setString(4, this.password);
            pstm.setString(5, role);
            pstm.executeUpdate();
            rs.close();
            pstm.close();
            status = true;

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            status = false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ignore) {
                }
            }
        }
        return status;
    }
    
    

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the role
     */
    public String getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(String role) {
        this.role = role;
    }

}
