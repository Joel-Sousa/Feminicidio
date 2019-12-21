package dao;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author f4959819
 */
public class FactoryConnection_DB2{
    public static Connection getConnection()throws SQLException {
        Connection Con = null;
        try{
        String url = "jdbc:db2://bdb2p04.plexbsb.bb.com.br:50446/BDB2P04";
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            Con  = DriverManager.getConnection(url,"root","root");
            //DriverManager.getConnection(url, "", "");
            return Con ;         
            }
        catch(ClassNotFoundException e){
              throw new SQLException(e.getMessage());
                    
        }
     }
}
