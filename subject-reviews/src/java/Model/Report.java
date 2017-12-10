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
}
