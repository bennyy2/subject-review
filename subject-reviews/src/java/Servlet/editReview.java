/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Connection.DBConnection;
import Model.Report;
import Model.Review;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Benny
 */
@WebServlet(name = "editReview", urlPatterns = {"/editReview"})
public class editReview extends HttpServlet {

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
            String review_id = request.getParameter("id");
            String edit_content = request.getParameter("content");
            Review review = new Review();
            if (review.updateReview(review_id, edit_content)) {
                HttpSession session = request.getSession();
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/viewHistory");
                dispatcher.forward(request, response);
            } else {
                out.print("Connection fail");
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
//        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String text = request.getParameter("text");
        String disable = request.getParameter("disable");
        String score = request.getParameter("score");
        String review_id = request.getParameter("review_id");
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs1 = null;

        ArrayList<Report> showReport = new ArrayList<>();
        try {
            conn = DBConnection.getConnection();
            String sql = "UPDATE review SET content=\"" + text + "\" ,score=" + score + " ,display_user=\"" + disable + "\" where review_id=\"" + review_id + "\";";

            pstm = conn.prepareStatement(sql);
            pstm.execute();
            sql = "SELECT review_id, content, date, score, display_user, subject_id, sj_name_eng 'sj_name' FROM review JOIN subject USING (subject_id) where review_id ='" + review_id + "';";
            pstm = conn.prepareStatement(sql);
            rs1 = pstm.executeQuery();
            rs1.next();
            text = "";
            //response.getWriter().write(sql);
            out.println("<div id=\"icon\">");
            out.println("<i style=\"position: absolute;right: 15px;width: 120px;\" class=\"fa fa-trash\" aria-hidden=\"true\" href=\"deleteReviewServlet?id=" + rs1.getString("review_id") + "\" style=\"position: absolute;right: 15px;width: 120px;\"></i> ");
            out.println("<i style=\"position: absolute;right: 35px;width: 120px;\" class=\"fa fa-pencil\" aria-hidden=\"true\" href=\"javascript:void(0)\" onclick=\"editReview('" + rs1.getString("review_id") + "','" + rs1.getString("display_user") + "','" + rs1.getString("score") + "');return false;\"></i></div>");
            out.println("<p >Content : <span id='C" + rs1.getString("review_id") + "'>" + rs1.getString("content") + "</span></p>");
            out.println("<p id=\"S" + rs1.getString("review_id") + "\">Score : " + rs1.getString("score") + "</p>");
            if ("no".equals(rs1.getString("display_user"))) {
                out.println("Status : Hiding post");
            } else {
                out.println("Status : Showing");
            }
            out.println("<p>Date : " + rs1.getString("date") + "</p>");
            out.println("<p>Subject : " + rs1.getString("subject_id") + " " + rs1.getString("sj_name") + "</p><hr>");
            

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
