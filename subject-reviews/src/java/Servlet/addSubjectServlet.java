/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Model.Subject;
import Model.Type;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "addSubjectServlet", urlPatterns = {"/addSubjectServlet"})
public class addSubjectServlet extends HttpServlet {

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
            String id = request.getParameter("id");
            String subject_thai = request.getParameter("subject_thai");
            String subject_eng = request.getParameter("subject_eng");
            String des_thai = request.getParameter("des_thai");
            String des_eng = request.getParameter("des_eng");
            String type_id = request.getParameter("type");
            Subject subject = new Subject();
            Type type = new Type();
            ArrayList<Type> allType = new ArrayList<>();
            String message = null;

            if (id != "" || subject_thai != "" || subject_eng != "" || des_thai != "" || des_eng != "") {
                if (subject.insertNewSubject(id, subject_thai, subject_eng, des_thai, des_eng, type_id)) {
                    HttpSession session = request.getSession();
                    allType = type.showAllType();
                    message = "Add Subject Completed";
                    request.setAttribute("message", message);
                    session.setAttribute("allType", allType);
                    RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/subject_type.jsp");
                    dispatcher.forward(request, response);
                }else{
                    RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/error.html");
                    dispatcher.forward(request, response);
                }

            } else {
                message = "Fill the form";
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/addSubject.jsp");
                dispatcher.forward(request, response);
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
