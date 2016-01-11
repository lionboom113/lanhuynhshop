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
		<link rel="stylesheet" href="style.css">	
    <link rel="stylesheet" href="categoryLanding.css">	
    <link rel="stylesheet" href="cart.css">
    <title>Lan Huynh Shop - Đăng ký thành công</title>
  </head>
  <body>
    <jsp:include page="WEB-INF/header.jsp"/>
      <div class="row container-fluid">
				<div class="container-fluid thank-you" >
                                    <h2>Chúc mừng bạn!</h2>
					<p>Bạn đã đăng ký tài khoản thành công</p>
                                        <p>Nhấn <a href="login" class="btn btn-warning">Đăng Nhập</a> để đăng nhập </p> 
				</div>
		    </div>
    <jsp:include page="WEB-INF/footer.jsp"/>
  </body>
</html>
