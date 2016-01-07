/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBUtils;

import Entity.Cart;
import Entity.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map.Entry;

/**
 *
 * @author Spit
 */
public class DAO {
  public Product getProductById(String id){
    Connection con = DBUtils.makeConnection();
    String sql = "Select * From tbl_product Where productId = ?";
    Product product = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    try {
      pst = (PreparedStatement) con.prepareStatement(sql);
      pst.setString(1, id);
      rs = pst.executeQuery();     
      if (rs.next()){
        product = new Product();
        product.setId(id);
        product.setName(rs.getString("productName"));
        product.setDescription(rs.getString("productDescription"));
        product.setPrice(rs.getDouble("productPrice"));
        product.setOldprice(rs.getDouble("productOldPrice"));
        product.setImage(rs.getString("productImage"));
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    }
    finally{
      try {
        if (rs!=null) {
          rs.close();
        }
        if (pst!=null) {
          pst.close();
        }
        if (con!=null) {
          con.close();
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    return product;
  }
  public int addOrder(Cart cart,String name, String phone, String address, String comment, int payment){
    Connection con = DBUtils.makeConnection();
    String sql = "Insert into tbl_order(orderdate,user,status,name,phone,address,comment,payment) VALUES(?,?,?,?,?,?,?,?)";
    Product product = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    int orderid = 0;
    try {
      pst = (PreparedStatement) con.prepareStatement(sql);      
      pst.setDate(1, new Date(new java.util.Date().getTime()));
      pst.setString(2,null);
      pst.setInt(3, 1);
      pst.setString(4,name);
      pst.setString(5,phone);
      pst.setString(6,address);
      pst.setString(7,comment);
      pst.setInt(8, payment);
      pst.executeUpdate();
      sql = "SELECT LAST_INSERT_ID()";
      pst = (PreparedStatement) con.prepareStatement(sql);
      rs = pst.executeQuery();
      if (rs.next()) {
        orderid = rs.getInt(1);
      }
      Iterator iter = cart.getHashmap().entrySet().iterator();
      while (iter.hasNext()){
        Entry entry = (Entry) iter.next();
        Product productdetail = (Product) entry.getKey();
        int qtydetail = (Integer)entry.getValue();
        sql = "Insert into tbl_orderline(productid,qty,orderid) VALUES (?,?,?)";
        pst = (PreparedStatement) con.prepareStatement(sql);      
        pst.setString(1,productdetail.getId());
        pst.setInt(2,qtydetail);
        pst.setInt(3, orderid);
        pst.executeUpdate();
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    }
    finally{
      try {
        if (rs!=null) {
          rs.close();
        }
        if (pst!=null) {
          pst.close();
        }
        if (con!=null) {
          con.close();
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    return orderid;
  }
}
