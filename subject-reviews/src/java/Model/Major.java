package Model;

import Connection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Benny
 */
public class Major {
    
    private String major_id;
    private String major_name;

    public Major(String major_id, String major_name) {
        this.major_id = major_id;
        this.major_name = major_name;
    }
    
    public ArrayList<Major> getMajor() {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Major> allMajor = new ArrayList<>();
        try {
            conn = DBConnection.getConnection();
            String sql = "Select * from major";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Major major = new Major(rs.getString("major_id"), rs.getString("major_name"));
                allMajor.add(major);
            }
            
            rs.close();
            pstm.close();

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ignore) {
                }
            }
        }
        return allMajor;
        
    }
    

    public Major() {}


    public String getMajor_id() {
        return major_id;
    }

    public void setMajor_id(String major_id) {
        this.major_id = major_id;
    }

    public String getMajor_name() {
        return major_name;
    }

    public void setMajor_name(String major_name) {
        this.major_name = major_name;
    }
   
}
