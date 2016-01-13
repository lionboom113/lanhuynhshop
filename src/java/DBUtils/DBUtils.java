/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Spit
 */
public  class DBUtils {
  public static Connection makeConnection(){
    InitialContext ic;
    Context xmlContext;
    DataSource ds = null;
    Connection con = null;
    try {
      ic = new InitialContext();
      xmlContext = (Context) ic.lookup("java:comp/env");
      ds = (DataSource) xmlContext.lookup("mydatabase");
      con = ds.getConnection();
      PreparedStatement pst = con.prepareStatement("SET NAMES 'utf8'");
      pst.execute();
      pst.close();
    } catch (NamingException ex) {
      ex.printStackTrace();
    } catch (SQLException ex) {
      ex.printStackTrace();
    }
    return con;
  }
}
