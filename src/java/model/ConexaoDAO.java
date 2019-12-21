/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author joe
 */
public class ConexaoDAO {
    
    public static Connection getConexao() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost/feminicidio", "root", "23r0");
        } catch (SQLException e) {
            throw new SQLException(e);
        } catch (ClassNotFoundException e1) {
            throw new SQLException(e1);
        }

    }
    
}
