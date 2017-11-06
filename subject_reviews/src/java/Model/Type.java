/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class Type {

    private String type_id;
    private String type_name;

    public Type() {
    }
    
    

    public ArrayList<Type> showAllType() {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Type> allType = new ArrayList<>();
        try {
            conn = DBConnection.getConnection();
            String sql = "Select * from type";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Type type = new Type(rs.getString("type_id"), rs.getString("type_name"));
                allType.add(type);
            }

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
        return allType;

    }

    public Type(String type_id, String type_name) {
        this.type_id = type_id;
        this.type_name = type_name;
    }

    public String getType_id() {
        return type_id;
    }

    public void setType_id(String type_id) {
        this.type_id = type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

}
