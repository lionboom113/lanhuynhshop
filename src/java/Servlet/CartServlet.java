/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DBUtils.DAO;
import Entity.Cart;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Spit
 */
public class CartServlet extends HttpServlet {

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
      String action = request.getParameter("action");
      HttpSession session = request.getSession();
      Cart cart = (Cart)session.getAttribute("cartInfo");
      if (cart == null) {
        cart = new Cart();
      }
      if (action!=null) {
        if (action.equals("add")) {
          String productid = request.getParameter("productid");
          String qtyStr = request.getParameter("qty");
          int qty = 0;
          try {
            qty = Integer.parseInt(qtyStr);
          } catch (Exception e) {
            log(e.getMessage());
          }
          
          DAO dao = new DAO();
          Product product = dao.getProductById(productid);
          if (product!=null) {
            out.println(product.getId()+product.getName()+product.getPrice());
            cart.add(product, qty);
            session.setAttribute("cartInfo", cart);
          }          
        }
        if (action.equals("count")){
          out.print("{counter:"+cart.getCounter()+",sum:"+cart.getSum()+"}");
        }
        if (action.equals("remove")){
          String productid = request.getParameter("productid");
          DAO dao = new DAO();
          Product product = dao.getProductById(productid);
          if (product!=null) {
            cart.remove(product);
            session.setAttribute("cartInfo", cart);
            out.println("nana");
          }          
          out.print("{counter:"+cart.getCounter()+",sum:"+cart.getSum()+"}");
        }
        if (action.equals("addOrder")){
          DAO dao = new DAO();
          String name = request.getParameter("name");
          name = new String(name.getBytes("ISO-8859-1"),"UTF-8");
          String phone = request.getParameter("phone");
          
          String address = request.getParameter("address");
          address = new String(address.getBytes("ISO-8859-1"),"UTF-8");
          String comment = request.getParameter("comment");
          comment = new String(comment.getBytes("ISO-8859-1"),"UTF-8");
          String paymenttxt = request.getParameter("payment");
          if (paymenttxt == null) {
            paymenttxt = "0";
          }
          int payment = Integer.parseInt(paymenttxt);
          if (comment == null) comment = "";
          int orderid = dao.addOrder(cart,name,phone,address,comment,payment);
          session.removeAttribute("cartInfo");
          response.sendRedirect("thank-you?orderid="+orderid);
        }
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
