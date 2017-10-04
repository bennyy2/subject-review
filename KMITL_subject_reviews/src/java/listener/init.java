/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

/**
 * Web application lifecycle listener.
 *
 * @author Benny
 */
public class init implements ServletContextListener {
    
    private Connection con;
    
    

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            con = (Connection) getSubject_review().getConnection();
            sce.getServletContext().setAttribute("connection", con);
        } catch (NamingException ex) {
            Logger.getLogger(init.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(init.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(init.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private DataSource getSubject_review() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/subject_review");
    }
}
