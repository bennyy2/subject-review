package Servlet;

import Connection.DBConnection;
import Model.Report;
import Model.Subject;
import Model.UserProfile;
import Model.Review;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 56070031
 */
@WebServlet(name = "ReportServlet", urlPatterns = {"/ReportServlet"})
public class ReportServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
<<<<<<< HEAD
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            Connection conn = null;
            PreparedStatement pstm = null;
            ResultSet rs1 = null;
            ResultSet rs2 = null;

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
                out.println(ex.getMessage());
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException ignore) {
                    }
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("showReport", showReport);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/manageReview.jsp");
            dispatcher.forward(request, response);
        }
=======
//        response.setContentType("text/html;charset=UTF-8");
//
//        try (PrintWriter out = response.getWriter()) {
//            Connection conn = null;
//            PreparedStatement pstm = null;
//            ResultSet rs1 = null;
//            ResultSet rs2 = null;
//
//            ArrayList<Report> showReport = new ArrayList<>();
//
//            try {
//
//                conn = DBConnection.getConnection();
//                String sql = "Select * from report left outer join user on report.user_report_id=user.user_id left join review on report.review_id=review.review_id ";//Ureport
//                String sql2 = "Select * from report left outer join user on report.user_post_id=user.user_id  "; //Upost
//                pstm = conn.prepareStatement(sql);
//                rs1 = pstm.executeQuery();
//                pstm = conn.prepareStatement(sql2);
//                rs2 = pstm.executeQuery();
//                while (rs1.next() && rs2.next()) {
//
//                    ArrayList<Subject> subject = new Subject().searchSubject(rs1.getString("subject_id"));
//
//                    String sub = subject.get(0).getSubject_id() + " " + subject.get(0).getSj_name_thai() + " " + subject.get(0).getSj_name_eng();
//
//                    Report report = new Report(rs1.getString("report_id"), rs1.getString("report"), rs1.getString("date_report"), rs1.getString("user_report_id"), rs1.getString("username"), rs2.getString("user_post_id"), rs2.getString("username"), rs1.getString("content"), sub, rs1.getString("review_id"));
//
//                    showReport.add(report);
//
//                }
//                sql = "UPDATE report SET status = 'read' WHERE status= 'unread'";
//                pstm = conn.prepareStatement(sql);
//                pstm.execute();
//            } catch (Exception ex) {
//                out.println(ex.getMessage());
//            } finally {
//                if (conn != null) {
//                    try {
//                        conn.close();
//                    } catch (SQLException ignore) {
//                    }
//                }
//            }
//
//            HttpSession session = request.getSession();
//            /*session.setAttribute("subject", subject);
//            session.setAttribute("subject_id", subject.getSubject_id());*/
//            session.setAttribute("showReport", showReport);
//            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/manageReview.jsp");
//            dispatcher.forward(request, response);
//        }
>>>>>>> 5074711778ee6f96d7a9d01da92541f4459d9673
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        String text = request.getParameter("text");

//        byte[] bytes = text.getBytes(StandardCharsets.ISO_8859_1);
//        text = new String(bytes, StandardCharsets.UTF_8);
        String review_id = request.getParameter("review_id");
        String user_report = request.getParameter("user_report");
        String user_post = request.getParameter("user_post");
        if (user_report == "") {
            response.getWriter().write("Please login agian");

        } else {

            //data insert
            Connection conn = null;
            PreparedStatement pstm = null;
            ResultSet rs1 = null;
            ResultSet rs2 = null;

            ArrayList<Report> showReport = new ArrayList<>();
            try {
                conn = DBConnection.getConnection();
                String sql = "SELECT user_id FROM `user` where username=\"" + user_post + "\";";
                pstm = conn.prepareStatement(sql);
                rs1 = pstm.executeQuery();
                rs1.next();
                user_post = rs1.getString(1);

                sql = "INSERT INTO it58070079.report (date_report, user_report_id, user_post_id, review_id, status, report) VALUES (CURRENT_DATE" + ",\"" + user_report + "\",\"" + user_post + "\",\"" + review_id + "\",\"" + "unread\"," + "\"" + text + "\");";

                pstm.execute(sql);
                response.getWriter().write("Report success");
            } catch (Exception ex) {
                response.getWriter().write(ex.getMessage());
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException ignore) {
                    }
                }
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
