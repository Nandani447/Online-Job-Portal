package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnect {

    private static Connection conn;

    public static Connection getConn() {
        if (conn == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","nandani");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return conn;
    }
}
