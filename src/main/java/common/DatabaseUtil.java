/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author nguye
 */
public class DatabaseUtil {
    public static Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=QLTS";
            connection = DriverManager.getConnection(connectionUrl, "sa", "sa");
        } catch (Exception e) {
            System.out.println("Loi: " +e.getMessage());
        }
        return connection;
    }
    public static void main(String[] args) {
        System.out.println(DatabaseUtil.getConnection());
    }
}
