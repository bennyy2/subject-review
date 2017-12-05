/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Benny
 */
public class DBConnection {

    public static Connection getConnection() throws URISyntaxException, SQLException {
        String url = "";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
//            url ="jdbc:mysql://tcmysql.it.kmitl.ac.th:8000/it58070079?useUnicode=true&characterEncoding=UTF8";
            url = "jdbc:mysql:///localhost:3306/kmitl_subject_database?useUnicode=true&characterEncoding=UTF8";

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

//        return DriverManager.getConnection(url, "it58070079", "jqdAg6xB");
        return DriverManager.getConnection(url, "root", "");
    }
}
