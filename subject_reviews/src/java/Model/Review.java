/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Connection.DBConnection;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Benny
 */
public class Review {

    private String review_id;
    private String content;
    private String date;
    private int score;
    private String user;
    private String display_user;
    private String subject_id;
    private String sj_name;

    public Review(String review_id, String content, String date, int score, String user, String display_user, String subject_id, String sj_name) {
        this.review_id = review_id;
        this.content = content;
        this.date = date;
        this.score = score;
        this.user = user;
        this.display_user = display_user;
        this.subject_id = subject_id;
        this.sj_name = sj_name;
    }

    public Review(String review_id, String content, String date, int score, String user, String display_user) {
        this.review_id = review_id;
        this.content = content;
        this.date = date;
        this.score = score;
        this.user = user;
        this.display_user = display_user;
    }

    public Review() {
    }

    public Review(String content, int score, String user) {
        this.content = content;
        this.score = score;
        this.user = user;
    }

    public Float getTotalScore(String id) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        float total = 0;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT AVG(score) 'total_score' from review where subject_id = ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            if (rs.next()) {
                total = rs.getFloat("total_score");
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
        return total;

    }

    public ArrayList<Review> showReview(String id) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Review> reviewList = new ArrayList<>();
        try {

            conn = DBConnection.getConnection();
            String sql = "SELECT review_id, content, date, score, username 'user', display_user FROM review JOIN user USING (user_id) where subject_id = ? order by date DESC";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();

            while (rs.next()) {

                Review review = new Review(rs.getString("review_id"), rs.getString("content"),
                        rs.getString("date"), rs.getInt("score"), rs.getString("user"), rs.getString("display_user"));

                reviewList.add(review);
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
        return reviewList;

    }

    public ArrayList<Review> showAllReview() {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Review> reviewList = new ArrayList<>();
        try {

            conn = DBConnection.getConnection();
            String sql = "SELECT review_id, content, date, score, username 'user', display_user, subject_id, sj_name_eng 'sj_name' FROM review JOIN user USING (user_id) JOIN subject USING (subject_id) order by date DESC";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {

                Review review = new Review(rs.getString("review_id"), rs.getString("content"),
                        rs.getString("date"), rs.getInt("score"), rs.getString("user"), rs.getString("display_user"),
                rs.getString("subject_id"), rs.getString("sj_name"));

                reviewList.add(review);
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
        return reviewList;

    }

    public String getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(String subject_id) {
        this.subject_id = subject_id;
    }

    public String getSj_name() {
        return sj_name;
    }

    public void setSj_name(String sj_name) {
        this.sj_name = sj_name;
    }

    public String getDisplay_user() {
        return display_user;
    }

    public void setDisplay_user(String display_user) {
        this.display_user = display_user;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getReview_id() {
        return review_id;
    }

    public void setReview_id(String review_id) {
        this.review_id = review_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

}
