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

/**
 *
 * @author Benny
 */
public class Subject {

    private String subject_id;
    private String sj_name_eng;
    private String sj_name_thai;
    private String sj_description_eng;
    private String sj_description_thai;
    private float total_score;

    public Subject() {
    }

    public Subject(String subject_id, String sj_name_eng) {
        this.subject_id = subject_id;
        this.sj_name_eng = sj_name_eng;
    }

    public Subject(String subject_id, String sj_name_eng, String sj_name_thai, String sj_description_eng, String sj_description_thai, float total_score) {
        this.subject_id = subject_id;
        this.sj_name_eng = sj_name_eng;
        this.sj_name_thai = sj_name_thai;
        this.sj_description_eng = sj_description_eng;
        this.sj_description_thai = sj_description_thai;
        this.total_score = total_score;
    }

    public boolean getSubject(String id) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean status = true;
        try {
            conn = DBConnection.getConnection();
            String sql = "Select * from subject where subject_id = ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();

            if (rs.next()) {
                this.subject_id = rs.getString("subject_id");
                this.sj_name_eng = rs.getString("sj_name_eng");
                this.sj_name_thai = rs.getString("sj_name_thai");
                this.sj_description_eng = rs.getString("sj_description_eng");
                this.sj_description_thai = rs.getString("sj_description_thai");
                this.total_score = rs.getFloat("total_score");
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
    
    

    public String getSj_description_thai() {
        return sj_description_thai;
    }

    public void setSj_description_thai(String sj_description_thai) {
        this.sj_description_thai = sj_description_thai;
    }

    public String getSj_description_eng() {
        return sj_description_eng;
    }

    public void setSj_description_eng(String sj_description_eng) {
        this.sj_description_eng = sj_description_eng;
    }

    public float getTotal_score() {
        return total_score;
    }

    public void setTotal_score(float total_score) {
        this.total_score = total_score;
    }

    public String getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(String subject_id) {
        this.subject_id = subject_id;
    }

    public String getSj_name_thai() {
        return sj_name_thai;
    }

    public void setSj_name_thai(String sj_name_thai) {
        this.sj_name_thai = sj_name_thai;
    }

    public String getSj_name_eng() {
        return sj_name_eng;
    }

    public void setSj_name_eng(String sj_name_eng) {
        this.sj_name_eng = sj_name_eng;
    }

}
