/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Connection.DBConnection;
import Model.UserProfile;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javafx.scene.control.Alert;
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
@WebServlet(name = "editServlet", urlPatterns = {"/editServlet"})
public class editServlet extends HttpServlet {

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
            String username = request.getParameter("username");
            String o_password = request.getParameter("o-password");
            String n_password = request.getParameter("n-password");
            String c_password = request.getParameter("c-password");
            String message = null;
            
            UserProfile u = new UserProfile();
            HttpSession session = request.getSession();
            u = (UserProfile) session.getAttribute("user");

            Connection conn = null;
            PreparedStatement pstm = null;
            ResultSet rs = null;

            boolean errorRegis = false;
            String welcome = null;
            try {
                conn = DBConnection.getConnection();
                String sql = "UPDATE user SET username ='" + username + "' WHERE user.email='" + u.getEmail() + "'";
                pstm = conn.prepareStatement(sql);

                pstm.execute();
                u.setUsername(username);
                if (o_password != "" && n_password != "" && c_password != "") {
                    if (u.getPassword().equals(o_password)) {
                        out.println(u.getPassword());
                        if (n_password.equals(c_password)) {
                            sql = "UPDATE user SET password ='" + c_password + "' WHERE user.email='" + u.getEmail() + "'";
                            pstm = conn.prepareStatement(sql);
                            pstm.execute();
                            u.setPassword(c_password);
                        } else {
                            message = "Password does not match the confirm password";
                            request.setAttribute("message", message);
                            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/edituser.jsp");
                            dispatcher.forward(request, response);
                        }

                    } else {
                        message = "incorrect password, password is not change";
                        request.setAttribute("message", message);
                        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/edituser.jsp");
                        dispatcher.forward(request, response);
                    }

                }else {
                        welcome = "Username has changed already.";
                        request.setAttribute("welcome", welcome);
                        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/edituser.jsp");
                        dispatcher.forward(request, response);
                    }

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
            welcome = "Password has changed already.";
                        request.setAttribute("welcome", welcome);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/edituser.jsp");
            dispatcher.forward(request, response);
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
