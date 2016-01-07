<%-- 
    Document   : cartPage
    Created on : Jan 3, 2016, 11:04:47 PM
    Author     : Spit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="resources/bootstrap.min.css">
		<link rel="stylesheet" href="resources/swiper.min.css">
		<script src="resources/jquery.min.js"></script>
		<script src="resources/bootstrap.min.js"></script>						 
		<script src="resources/swiper.jquery.min.js"></script>		
    <script src="resources/bootstrap-submenu.js"></script>
    <link rel="stylesheet" href="resources/bootstrap-submenu.min.css">
		<script src="app.js"></script>
    
		<link rel="stylesheet" href="style.css">	
    <link rel="stylesheet" href="categoryLanding.css">	
    <link rel="stylesheet" href="cart.css">
    <title>Lan Huỳnh Shop - Giỏ hàng - Chuyên hàng xách tay</title>
  </head>
  <body>
    <jsp:include page="WEB-INF/header.jsp"/>
    <div class="row container-fluid">
				<div class="progress">
				  <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" style="width:50%">
				    Bước 1: Kiểm tra giỏ hàng
				  </div>
				  <div class="progress-bar progress-bar-striped" role="progressbar" style="width:50%">
				    Bước 2: Thông tin cá nhân/ Địa chỉ giao hàng
				  </div>
				</div>
      <c:if test="${empty sessionScope.cartInfo}">
            <a href="index" class="btn btn-danger btn-buymore">Bạn chưa có hàng trong giỏ. Hãy thêm hàng vào giỏ trước khi thanh toán</a>
      </c:if>
      <c:if test="${not empty sessionScope.cartInfo}">
				<div class="cart-title">Giỏ hàng (${sessionScope.cartInfo.counter + 0}) - <fmt:formatNumber value="${sessionScope.cartInfo.sum + 0}" type="number" 
                          groupingUsed="true" maxFractionDigits="0" /> đ</div>
		      <table class="table">
		        <thead>
		          <tr>
		            <th>SKU</th>
		            <th>Hình ảnh</th>
		            <th>Tên sản phẩm</th>
		            <th>Số lượng</th>
		            <th>Tổng giá</th>
		            <th></th>
		          </tr>
		        </thead>
		        <tbody>
		          <c:forEach items="${sessionScope.cartInfo.hashmap}" var="entry">
                <tr>
                  <td>${entry.key.id}</td>
                  <td><img src="https://googledrive.com/host/<%=getServletContext().getInitParameter("gdFolderId")%>/${entry.key.image}"></td>
                  <td>${entry.key.name}</td>
                  <td><input type="number" class="form-control" value="${entry.value}" min=0></td>
                  <td><fmt:formatNumber value="${entry.value * entry.key.price}" type="number" 
                          groupingUsed="true" maxFractionDigits="0" /> đ</td>
                  <td><button class="btn btn-danger remove-item" data-id="${entry.key.id}">Bỏ khỏi giỏ hàng</button></td>
                </tr>
              </c:forEach>
		          <tr>
                <td colspan="4"><strong>Tổng tiền</strong>:</td>
                <td> <strong><fmt:formatNumber value="${sessionScope.cartInfo.sum + 0}" type="number" 
                          groupingUsed="true" maxFractionDigits="0" /> đ</strong></td>
                
                  <td><a href="orderPage" class="btn btn-warning order-btn">Hoàn thành bước 1 - Đặt hàng NGAY</a></td>
                
                
              </tr>
		        </tbody>
		      </table>	
          </c:if>
		    </div>
          <script>
            $(".remove-item").click(function(){
                $.ajax({
                method: "GET",
                url: "Cart",
                data: { productid: $(this).data("id"), action:"remove" }
              })
                .done(function( msg ) {
                  location.reload();
                });
            });
          </script>
    <jsp:include page="WEB-INF/footer.jsp"/>
  </body>
</html>
