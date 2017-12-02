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

    /**
     * @return the reviewid
     */
    public String getReviewid() {
        return reviewid;
    }

    /**
     * @param reviewid the reviewid to set
     */
    public void setReviewid(String reviewid) {
        this.reviewid = reviewid;
    }

    /**
     * @return the user_post
     */
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

    /**
     * @param user_post the user_post to set
     */
    public void setUser_post() {
        this.user_post = user_post;
    }

    /**
     * @return the user_report
     */
    public String getUser_report() {
        return user_report;
    }

    /**
     * @param user_report the user_report to set
     */
    public void setUser_report(String user_report) {
        this.user_report = user_report;
    }

    /**
     * @return the subject
     */
    public String getsubject() {
        return subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setsubject(String subject) {
        this.subject = subject;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }
}
