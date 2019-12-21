/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author joe
 */
public class UsuarioDAO {
    
    private Connection con;
    
    public UsuarioDAO(Connection con){
        this.con = con;
    }
    
     public void cadastrarUsuario(UsuarioDTO usr) throws SQLException{
        
        try {
            String sql = "INSERT INTO usuarios(cpf,endereco,nome,senha) VALUES(?,?,?,?) ";
            
            PreparedStatement stmt = con.prepareStatement(sql);
            
            //stmt.setString(1, usr.getId());
            stmt.setString(1, usr.getCpf());
            stmt.setString(2, usr.getEndereco());
            stmt.setString(3, usr.getNome());
            stmt.setString(4, usr.getSenha());
            
            stmt.execute();
            stmt.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            con.close();
        }
    } 
    
    
}
