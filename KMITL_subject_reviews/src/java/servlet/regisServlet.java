/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import user.validation;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
@WebServlet(name = "regisServlet", urlPatterns = {"/regisServlet"})
public class regisServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String role = null;
            String name = "";
            String[] address = new String[2];
            String id = UUID.randomUUID().toString();

            Connection con = (Connection) getServletContext().getAttribute("connection");

            String message = null;
            boolean find = validation.findEmail(con, email);
            boolean user = validation.findUser(con, username);

            if (user) {
                message = "This username is already in use!.";
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/register.jsp");
                dispatcher.forward(request, response);
                return;
            }

            if (find) {
                message = "This e-mail is already in use!.";
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/register.jsp");
                dispatcher.forward(request, response);
                return;
            }

            for (char i : email.toCharArray()) {
                if (Character.toString(i).matches("@")) {
                    name += " ";
                } else {
                    name += i;
                }
            }
            address = name.split(" ");
            if (!address[1].equals("kmitl.ac.th")) {
                message = "This email is not KMITL account.";
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/register.jsp");
                dispatcher.forward(request, response);
                return;
            } else {
                for (char i : address[0].toCharArray()) {
                    if (!Character.toString(i).matches("[0-9]")) {
                        role = "teacher";
                        break;
                    } else {
                        role = "student";
                    }
                }
            }
            

            String sql = "Insert into user values (?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(sql);

            pstm.setString(1, id);
            pstm.setString(2, username);
            pstm.setString(3, email);
            pstm.setString(4, password);
            pstm.setString(5, role);
            pstm.executeUpdate();
            message = "Welcome to KMITL Subject reviews.";
            request.setAttribute("success", message);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(regisServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(regisServlet.class.getName()).log(Level.SEVERE, null, ex);
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
