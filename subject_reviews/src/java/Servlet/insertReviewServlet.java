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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
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
            String checkBox = request.getParameter("disable");
            int score = Integer.parseInt(request.getParameter("score"));
            UserProfile user = new UserProfile();
            Subject subject = new Subject();
            HttpSession session = request.getSession();
            
            String userId = (String) session.getAttribute("user_id");
            String subjectId = (String) session.getAttribute("subject_id");
            
            
            
            
            
            Connection conn = null;
            PreparedStatement pstm = null;
//            ResultSet rs = null;

            String id = UUID.randomUUID().toString();
            
            Date now = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = df.format(now);
            
            String username = null;
            if (checkBox == null) {
                username = "xx";
            }
            

            try {
                conn = DBConnection.getConnection();
                String sql = "Insert into review values (?,?,?,?,?,?)";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, id);
                pstm.setString(2, text);
                pstm.setString(3, date);
                pstm.setInt(4, score);
                pstm.setString(5, userId);
                pstm.setString(6, subjectId);
                pstm.executeUpdate();


            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                out.print("1");
                

            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException ignore) {
                    }
                }
            }
            
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/showSubject.jsp");
            dispatcher.forward(request, response);

//            Review review = new Review();
//            if (review.insertReview(text, score, username)) {
//                response.sendRedirect("showSubject.jsp");
//            } else {
//                out.print("error");
//                
//            }
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
