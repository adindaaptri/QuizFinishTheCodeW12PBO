/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static final String URL = "jdbc:mariadb://localhost:3307/quizpbo"; // URL untuk MariaDB
    private static final String USER = "root"; // Username MariaDB
    private static final String PASSWORD = ""; // Password MariaDB

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Menggunakan driver MariaDB
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
