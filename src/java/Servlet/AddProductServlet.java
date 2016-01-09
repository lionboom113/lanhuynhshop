/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DBUtils.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gdttuan
 */
public class AddProductServlet extends HttpServlet {

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try {
      DAO dao = new DAO();
      String test = request.getParameter("test");
      String action = request.getParameter("action");
      String category = request.getParameter("category");
      String id = request.getParameter("id");
      // String name = request.getParameter("name");
      String name = URLDecoder.decode(request.getParameter("name"), "UTF-8");
      System.out.println(name);
      String price = request.getParameter("price");
      String oldPrice = request.getParameter("oldPrice");
//      String description = request.getParameter("description");
      String description = URLDecoder.decode(request.getParameter("description"), "UTF-8");
      System.out.println(description);
      if (description.equals("")) {
        description = "Hiện tại chưa có mô tả cho sản phẩm, liên hệ trực tiếp để biết thêm chi tiếtf";
      }
      String image = request.getParameter("image");
      if (image.equals("")) {
        image = "null.png";
      }
      double dPrice = 0;
      if (!price.equals("")) {
        dPrice = Double.parseDouble(price);
      }
      double dOldPrice = 0;
      if (!oldPrice.trim().equals("")) {
        dOldPrice = Double.parseDouble(oldPrice);
      }

      if (action != null) {
        if (action.equals("checkProductID")) {
          boolean isProductIDDuplicated = dao.isProductIDDuplicated(id);
          if (isProductIDDuplicated) {
            out.print("a");
          }
          return;
        } else if (action.equals("checkCategoryID")) {
          boolean isCategoryExisted = dao.isCategoryExisted(category);
          if (isCategoryExisted == false) {
            out.print("c");
          }
          return;
        }
      }

      if ((false == dao.isProductIDDuplicated(id)) && dao.isCategoryExisted(category)) {
        int orderid;

        orderid = dao.addProduct(category, id, name, dPrice, dOldPrice, description, image);

        if (orderid == 1) {
          out.print("Thêm sản phẩm thành công");
          System.out.println("Thêm sản phẩm thành công");
        } else {
          out.print("Thêm sản phẩm thất bại, vui lòng liên hệ với Admin");
        }
      } else {
        out.print("55555");
      }

    } finally {
      out.close();
    }
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
