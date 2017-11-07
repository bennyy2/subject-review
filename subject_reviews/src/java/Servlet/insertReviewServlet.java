package Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Connection.DBConnection;
import Model.Review;
import Model.Subject;
import Model.UserProfile;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Benny
 */
@WebServlet(urlPatterns = {"/insertReviewServlet"})
public class insertReviewServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String text = request.getParameter("text");
            byte[] bytes = text.getBytes(StandardCharsets.ISO_8859_1);
            text = new String(bytes, StandardCharsets.UTF_8);
            String checkBox = request.getParameter("disable");
            int score = Integer.parseInt(request.getParameter("score"));
            float total = 0;
            Subject subject = new Subject();
            Review review = new Review();
            ArrayList<Review> showReview = new ArrayList<>();

            HttpSession session = request.getSession();
            String userId = (String) session.getAttribute("user_id");
            String subjectId = (String) session.getAttribute("subject_id");
            String display_user = "yes";
            if (checkBox != null) {
                display_user = "no";
            }

            if (review.insertReview(text, userId, subjectId, score, display_user)) {
                showReview = review.showReview(subjectId);

                total = review.getTotalScore(subjectId);
                subject.getSubject(subjectId, total);
                subject = new Subject(subject.getSubject_id(), subject.getSj_name_eng(), subject.getSj_name_thai(),
                        subject.getSj_description_eng(), subject.getSj_description_thai(), subject.getTotal_score());

                session.setAttribute("subject", subject);
                session.setAttribute("showReview", showReview);
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/showSubject.jsp");
                dispatcher.forward(request, response);
            } else {
                
                out.println("fail");
            }

        }
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
        processRequest(request, response);
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
