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

    public Review(String review_id, String content, String date, int score, String user) {
        this.review_id = review_id;
        this.content = content;
        this.date = date;
        this.score = score;
        this.user = user;
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
            if(rs.next()){
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
        ArrayList<Review> subjectList= new ArrayList<>();
        try {
                      
            conn = DBConnection.getConnection();
            String sql = "SELECT * from review where subject_id = ? order by date DESC";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();

            while (rs.next()) {

                Review review = new Review(rs.getString("review_id"), rs.getString("content"),
                        rs.getString("date"), rs.getInt("score"), rs.getString("user_id"));

                subjectList.add(review);
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
        return subjectList;

    }

//    public boolean updateReview(String text, int score, String userId, String subjectId) throws SQLException {
//        Connection conn = null;
//        PreparedStatement pstm = null;
//        ResultSet rs = null;
//        boolean status = true;
//        String id = UUID.randomUUID().toString();
//
//        Date now = new Date();
//        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        String date = df.format(now);
//
//        try {
//            conn = DBConnection.getConnection();
//            String sql = "Insert into review values (?,?,?,?,?,?)";
//            pstm = conn.prepareStatement(sql);
//            pstm.setString(1, id);
//            pstm.setString(2, text);
//            pstm.setString(3, date);
//            pstm.setInt(4, score);
//            pstm.setString(5, userId);
//            pstm.setString(6, subjectId);
//            pstm.executeUpdate();
//
//            rs.getString("review_id");
//            this.content = rs.getString("content");
//            this.date = rs.getString("date");
//            this.score = rs.getInt("score");
//            this.user = rs.getString("user");
//
//        } catch (Exception ex) {
//            System.out.println(ex.getMessage());
//            status = false;
//        } finally {
//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (SQLException ignore) {
//                }
//            }
//        }
//
//        return status;
//    }
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
