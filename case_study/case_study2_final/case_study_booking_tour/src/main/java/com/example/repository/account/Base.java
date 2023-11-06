package com.example.repository.account;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Base {

    private static final String JDBS_URL = "jdbc:mysql://localhost:3306/travel_tour_booking";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Tanloi2408...";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(JDBS_URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }

}