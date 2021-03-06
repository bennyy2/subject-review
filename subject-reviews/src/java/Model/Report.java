package Model;

import Connection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
public class Report {

    private String report_id;
    private String report;
    private String date;
    private String user_report_id;
    private String user_post_id;
    private String user_post;
    private String user_report;
    private String subject;
    private String content;
    private String reviewid;

    public Report(String report_id, String report, String date, String user_report_id, String user_post_id, String subject) {
        this.report_id = report_id;
        this.report = report;
        this.date = date;
        this.user_report_id = user_report_id;
        this.user_post_id = user_post_id;
        this.subject = subject;
    }

    public Report(String report_id, String report, String date, String user_report_id, String user_report, String user_post_id, String user_post, String content, String subject, String reviewid) {
        this.report_id = report_id;
        this.report = report;
        this.date = date;
        this.user_report = user_report;
        this.user_post = user_post;
        this.user_report_id = user_report_id;
        this.user_post_id = user_post_id;
        this.content = content;
        this.subject = subject;
        this.reviewid = reviewid;
    }

    public Report() {
    }
    
    public String getReviewid() {
        return reviewid;
    }

    public void setReviewid(String reviewid) {
        this.reviewid = reviewid;
    }

    public String getUser_post_id() {
        return user_post_id;
    }

    public void setUser_post_id(String user) {
        this.user_post_id = user_post_id;
    }

    public String getReport_id() {
        return report_id;
    }

    public void setReport_id(String report_id) {
        this.report_id = report_id;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUser_report_id() {
        return user_report_id;
    }

    public void setUser_report_id() {
        this.user_report_id = user_report_id;
    }

    public String getUser_post() {
        return user_post;
    }

    public void setUser_post() {
        this.user_post = user_post;
    }

    public String getUser_report() {
        return user_report;
    }

    public void setUser_report(String user_report) {
        this.user_report = user_report;
    }

    public String getsubject() {
        return subject;
    }

    public void setsubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public ArrayList<Report> showReport() {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs1,rs2 = null;
        ArrayList<Report> showReport = new ArrayList<>();
        try {

            conn = DBConnection.getConnection();
            String sql = "Select * from report left outer join user on report.user_report_id=user.user_id left join review on report.review_id=review.review_id ";//Ureport
            String sql2 = "Select * from report left outer join user on report.user_post_id=user.user_id  "; //Upost
            pstm = conn.prepareStatement(sql);
            rs1 = pstm.executeQuery();
            pstm = conn.prepareStatement(sql2);
            rs2 = pstm.executeQuery();
            while (rs1.next() && rs2.next()) {

                ArrayList<Subject> subject = new Subject().searchSubject(rs1.getString("subject_id"));

                String sub = subject.get(0).getSubject_id() + " " + subject.get(0).getSj_name_thai() + " " + subject.get(0).getSj_name_eng();

                Report report = new Report(rs1.getString("report_id"), rs1.getString("report"), rs1.getString("date_report"), rs1.getString("user_report_id"), rs1.getString("username"), rs2.getString("user_post_id"), rs2.getString("username"), rs1.getString("content"), sub, rs1.getString("review_id"));

                showReport.add(report);

            }
            sql = "UPDATE report SET status = 'read' WHERE status= 'unread'";
            pstm = conn.prepareStatement(sql);
            pstm.execute();
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
        return showReport;

    }
}
