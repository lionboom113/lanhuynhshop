/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBUtils;

import Entity.Cart;
import Entity.OrderDTO;
import Entity.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

/**
 *
 * @author Spit
 */
public class DAO {

    public Product getProductById(String id) {
        Connection con = DBUtils.makeConnection();
        String sql = "Select * From tbl_product Where productId = ?";
        Product product = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
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
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return product;
    }

    public int addOrder(Cart cart, String name, String phone, String address, String comment, int payment) {
        Connection con = DBUtils.makeConnection();
        String sql = "Insert into tbl_order(orderdate,user,status,name,phone,address,comment,payment) VALUES(?,?,?,?,?,?,?,?)";
        Product product = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        int orderid = 0;
        try {
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setDate(1, new Date(new java.util.Date().getTime()));
            pst.setString(2, null);
            pst.setInt(3, 1);
            pst.setString(4, name);
            pst.setString(5, phone);
            pst.setString(6, address);
            pst.setString(7, comment);
            pst.setInt(8, payment);
            pst.executeUpdate();
            sql = "SELECT LAST_INSERT_ID()";
            pst = (PreparedStatement) con.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                orderid = rs.getInt(1);
            }
            Iterator iter = cart.getHashmap().entrySet().iterator();
            while (iter.hasNext()) {
                Entry entry = (Entry) iter.next();
                Product productdetail = (Product) entry.getKey();
                int qtydetail = (Integer) entry.getValue();
                sql = "Insert into tbl_orderline(productid,qty,orderid) VALUES (?,?,?)";
                pst = (PreparedStatement) con.prepareStatement(sql);
                pst.setString(1, productdetail.getId());
                pst.setInt(2, qtydetail);
                pst.setInt(3, orderid);
                pst.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return orderid;
    }

    public int addProduct(String categoryId, String id, String name, double price, double oldPrice, String description, String image) {
        Connection con = DBUtils.makeConnection();
        String sql = "Insert into tbl_product(productId, productName, productPrice, productOldPrice, productDescription, productImage) VALUES(?,?,?,?,?,?)";
        PreparedStatement pst = null;
        ResultSet rs = null;
        int isProductAdded = 0; //0 is false, 1 is true
        System.out.println("Thêm sản phẩm thành công");
        try {
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setString(1, id);
            pst.setString(2, name);
            pst.setDouble(3, price);
            pst.setDouble(4, oldPrice);
            pst.setString(5, description);
            pst.setString(6, image);
            pst.executeUpdate();
            sql = "SELECT LAST_INSERT_ID()";
            pst = (PreparedStatement) con.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                isProductAdded = 1;
                do {
                    sql = "Insert into tbl_tag(productId,categoryId) VALUES (?,?)";
                    pst = (PreparedStatement) con.prepareStatement(sql);
                    pst.setString(1, id);
                    pst.setString(2, categoryId);
                    pst.executeUpdate();
                    categoryId = getCategoryParent(categoryId);
                } while (!(categoryId == null));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isProductAdded;
    }

    public boolean isProductIDDuplicated(String ID) {

        Connection con = DBUtils.makeConnection();
        String sql = "SELECT * FROM tbl_product WHERE productId = ?";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setString(1, ID);
            rs = pst.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean isCategoryExisted(String category) {
        Connection con = DBUtils.makeConnection();
        String sql = "SELECT * FROM tbl_category WHERE categoryId = ?";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setString(1, category);
            rs = pst.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public List<String> categoryID;

    public List<String> getCategoryID() {
        return categoryID;
    }

    public List<String> getAllCategory() {
        Connection con = DBUtils.makeConnection();
        String sql = "SELECT categoryId FROM tbl_category";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = (PreparedStatement) con.prepareStatement(sql);
            rs = pst.executeQuery();
            categoryID = new ArrayList<String>();
            while (rs.next()) {
                categoryID.add(rs.getString(1));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return categoryID;
    }

    public String getCategoryParent(String categoryId) {
        Connection con = DBUtils.makeConnection();
        String sql = "SELECT categoryParent FROM tbl_category WHERE categoryId = ?";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setString(1, categoryId);
            rs = pst.executeQuery();

            if (rs.next()) {
                System.out.println("Dao 291");
                System.out.println(rs.getString(1));
                return rs.getString(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public void register(String username, String password) {
        Connection con = DBUtils.makeConnection();
        String sql = "Insert into tbl_account (username,password,isAdmin) VALUES (?,?,?)";
        PreparedStatement pst = null;
        try {
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setBoolean(3, false);
            pst.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public boolean checkDuplicateUsername(String username) {
        Connection con = DBUtils.makeConnection();
        String sql = "SELECT * FROM tbl_account WHERE username=?";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setString(1, username);
            rs = pst.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean checkLogin(String username, String password) {
        Connection con = DBUtils.makeConnection();
        String sql = "Select * From tbl_account where username =? and password=?";
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public void updateOrder(int orderid, int status) {
        Connection con = DBUtils.makeConnection();
        String sql = "Update tbl_order set status=? where orderid=?";
        Product product = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setInt(2, orderid);
            pst.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
