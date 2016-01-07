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
				  <div class="progress-bar  progress-bar-striped" role="progressbar" style="width:50%">
				    Bước 1: Kiểm tra giỏ hàng ( Hoàn thành )
				  </div>
				  <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" style="width:50%">
				    Bước 2: Thông tin cá nhân/ Địa chỉ giao hàng
				  </div>
				</div>
        <form class="customerinfo-form" action="Cart">
          <input type="hidden" name="action" value="addOrder"/>
					<div class="form-group">
					  <label for="name">Họ và tên:</label>
					  <input type="text" class="form-control" id="name" name="name" required>
					</div>
					<div class="form-group">
					  <label for="phone">Số điện thoại:</label>
					  <input type="text" class="form-control" id="phone" name="phone" required>
					</div>
					<div class="form-group">
					  <label for="addr">Địa chỉ:</label>
					  <input type="text" class="form-control" id="addr" name="address" required>
					</div>
					<div class="form-group">
					  <label for="comment">Ghi chú:</label>
					  <textarea class="form-control" rows="5" id="comment" name="comment"></textarea>
					</div>
					<div class="form-group">
						<label for="comment">Phương thức thanh toán:</label>
						<div class="radio">
              <label><input type="radio" name="payment" value="1">Thanh toán khi nhận hàng</label>
						</div>
						<div class="radio">
              <label><input type="radio" name="payment" value="2">Chuyển khoản</label>
						</div>
						<a href="#">Xem thông tin tài khoản ngân hàng | Thông tin liên hệ</a>
					</div>
					<button class="btn btn-warning order-btn submit-btn right">Hoàn thành. Xin cảm ơn bạn</button>
				</form>		      	
		    </div>
      <script>
            $(".submit-btn").click(function(){
                if ($(".customerinfo-form").validate())
                {
                  $(".customerinfo-form").submit();
                }
            });
          </script>
    <jsp:include page="WEB-INF/footer.jsp"/>
  </body>
</html>
