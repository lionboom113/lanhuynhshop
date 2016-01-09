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
		<script src="app.js"></script>
    <script src="resources/bootstrap-submenu.js"></script>
    <link rel="stylesheet" href="resources/bootstrap-submenu.min.css">
		<link rel="stylesheet" href="style.css">	
    <link rel="stylesheet" href="categoryLanding.css">	
    <link rel="stylesheet" href="cart.css">
    <title>Lan Huynh Shop - Giỏ hàng - Chuyên hàng xách tay</title>
  </head>
  <body>
    <jsp:include page="WEB-INF/header.jsp"/>
      <div class="row container-fluid">
				<div class="progress">
				  <div class="progress-bar progress-bar-striped" role="progressbar" style="width:50%">
				    Bước 1: Kiểm tra giỏ hàng (Hoàn tất)
				  </div>
				  <div class="progress-bar progress-bar-striped" role="progressbar" style="width:50%">
				    Bước 2: Thông tin cá nhân/ Địa chỉ giao hàng (Hoàn tất)
				  </div>
				</div>
				<div class="container-fluid thank-you" >
					<p>Cảm ơn bạn đã mua hàng tại Lan Huynh Shop. Đơn đặt hàng của bạn đang được xử lý</p>
					<p>Mã đơn đặt hàng : <span class="orderid">${param.orderid}</span></p>
					<p class="tip">( Bạn có thể ghi chú lại mã đơn đặt hàng để thuận tiện hơn trong việc liên lạc )</p>
					<img src="images/thank-you.jpg">
				</div>
		    </div>
    <jsp:include page="WEB-INF/footer.jsp"/>
  </body>
</html>
