package com.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/elearndb";
    private static final String USER = "root";
    private static final String PASSWORD = "Shivraj@1192";
    
    static {
        try {
            Class.forName(DRIVER);
            System.out.println("MySQL JDBC Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            System.err.println("Error loading MySQL JDBC Driver: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    public static Connection Connect() throws SQLException {
        Connection connection = null;
        try {
            System.out.println("Attempting to connect to database...");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            if (connection != null) {
                System.out.println("Database connection successful!");
                return connection;
            }
        } catch (SQLException e) {
            System.err.println("Database connection failed!");
            System.err.println("Connection URL: " + URL);
            System.err.println("Username: " + USER);
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
        return connection;
    }
}
