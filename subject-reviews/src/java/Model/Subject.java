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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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

    public Subject(String subject_id, String sj_name_eng, String sj_name_thai, float total_score) {
        this.subject_id = subject_id;
        this.sj_name_eng = sj_name_eng;
        this.sj_name_thai = sj_name_thai;
        this.total_score = total_score;
    }

    public Subject(String subject_id, String sj_name_eng, String sj_name_thai) {
        this.subject_id = subject_id;
        this.sj_name_eng = sj_name_eng;
        this.sj_name_thai = sj_name_thai;
    }

    public Subject(String subject_id, String sj_name_eng, String sj_name_thai, String sj_description_eng, String sj_description_thai, float total_score) {
        this.subject_id = subject_id;
        this.sj_name_eng = sj_name_eng;
        this.sj_name_thai = sj_name_thai;
        this.sj_description_eng = sj_description_eng;
        this.sj_description_thai = sj_description_thai;
        this.total_score = total_score;
    }

    public ArrayList<Subject> searchSubject(String search) {

        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Subject> subjectList = new ArrayList<>();
        try {

            conn = DBConnection.getConnection();
            String sql;

            if (search.matches("[a-zA-Z]+\\.?")) {
                search = search.toUpperCase();
                sql = "SELECT * FROM subject where sj_name_eng like '%" + search + "%'";
            } else if (search.matches("[0-9]+\\.?")) {
                sql = "SELECT * FROM subject where subject_id like '" + search + "%'";
            } else {
                sql = "SELECT * FROM subject where sj_name_thai like '%" + search + "%'";
            }
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {

                Subject subject = new Subject(rs.getString("subject_id"), rs.getString("sj_name_eng"), rs.getString("sj_name_thai"));

                subjectList.add(subject);
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
        return subjectList;

    }

    public void updateTotalScore(float total, String id) {
        Connection conn = null;
        PreparedStatement pstm = null;

        try {

            conn = DBConnection.getConnection();
            String sql = "UPDATE subject SET total_score = ? WHERE subject_id = ?";
            pstm = conn.prepareStatement(sql);
            pstm.setFloat(1, total);
            pstm.setString(2, id);
            pstm.executeUpdate();
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
            rs.close();
            pstm.close();

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
    
    public boolean insertNewSubject(String id, String subject_thai, String subject_eng, String des_thai, String des_eng, String type) {
        boolean status = true;
        Connection conn = null;
        PreparedStatement pstm = null;
        float score = 0;

        try {

            conn = DBConnection.getConnection();
            String sql = "INSERT INTO subject VALUES(?,?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.setString(2, subject_eng);
            pstm.setString(3, subject_thai);
            pstm.setString(4, des_eng);
            pstm.setString(5, des_thai);
            pstm.setFloat(6, score);
            pstm.setString(7, type);
            pstm.executeUpdate();
            pstm.close();

        } catch (Exception ex) {
            status = false;
            System.out.println(ex.getMessage());
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

    public ArrayList<Subject> getTopReview() {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Subject> topList = new ArrayList<>();
        try {

            conn = DBConnection.getConnection();
            String sql = "SELECT subject_id, sj_name_eng, sj_name_thai, total_score FROM subject order by total_score DESC limit 5";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {

                Subject subject = new Subject(rs.getString("subject_id"), rs.getString("sj_name_eng"),
                        rs.getString("sj_name_thai"), rs.getFloat("total_score"));
                topList.add(subject);
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

        return topList;

    }

    public ArrayList<Subject> getSubjectByType(String id) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Subject> allSub = new ArrayList<>();

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM subject WHERE type_id = ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Subject subject = new Subject(rs.getString("subject_id"), rs.getString("sj_name_eng"), rs.getString("sj_name_thai"));
                allSub.add(subject);
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
        return allSub;
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
