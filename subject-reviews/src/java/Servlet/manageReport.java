/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Connection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 56070031
 */
@WebServlet(name = "manageReport", urlPatterns = {"/manageReport"})
public class manageReport extends HttpServlet {

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

            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            String report = request.getParameter("report");
            String review = request.getParameter("review");

            Connection conn = null;
            PreparedStatement pstm = null;
            ResultSet rs1 = null;
            if (review == null) {
                try {
                    conn = DBConnection.getConnection();
                    String sql = "DELETE FROM report WHERE report_id = " + request.getParameter("report") + ";";

                    pstm = conn.prepareStatement(sql);
                    pstm.execute();
                    response.getWriter().write("Report Delete");
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
            } else {
                try {
                    conn = DBConnection.getConnection();
                    String sql = "DELETE FROM report WHERE report_id = " + request.getParameter("report") + ";";

                    pstm = conn.prepareStatement(sql);
                    pstm.execute();
                    sql = "DELETE FROM review WHERE review_id = \"" + request.getParameter("review") + "\";";

                    pstm = conn.prepareStatement(sql);
                    pstm.execute();
                    response.getWriter().write("Report & Review Delete");
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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs1 = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT COUNT(status) FROM report WHERE status='unread';";

            pstm = conn.prepareStatement(sql);
            rs1 = pstm.executeQuery();
            rs1.next();
            response.getWriter().write(rs1.getString(1));
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
