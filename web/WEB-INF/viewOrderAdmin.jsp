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
        <title>Lan Huynh Shop - Đơn hàng</title>
    </head>
    <body>
        <jsp:include page="WEB-INF/header.jsp"/>
        <label style="font-size: 20px; margin-left: 20px">Thông tin đơn hàng   </label>
        <hr/>
        <div class="container">       
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Mã đơn hàng</th>
                        <th>Ngày đặt hàng</th>
                        <th>Họ và tên</th>
                        <th>Địa chỉ</th>
                        <th>Điện thoại</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query dataSource="mydatabase" var="result">
                        SELECT * from tbl_order where user = "${sessionScope.USER}";
                    </sql:query>
                    <c:forEach items="${result.rows}" var="row">
                        <tr>
                            <td>${row.orderid}</td>
                            <td><fmt:formatDate type="date" value="${row.orderdate}" /></td>
                            <td>${row.name}</td>
                            <td>${row.address}</td>
                            <td>${row.phone}</td>
                            <td> <c:choose>
                                    <c:when test="${row.status == 1}" >
                                        Chưa xác nhận
                                    </c:when> 
                                    <c:when test="${row.status == 2}" >
                                        Đã xác nhận
                                    </c:when> 
                                    <c:when test="${row.status == 3}" >
                                        Đã thanh toán
                                    </c:when> 
                                    <c:when test="${row.status == 4}" >
                                        Đã giao hàng
                                    </c:when> 
                                    <c:when test="${row.status == 5}" >
                                        Đóng
                                    </c:when> 
                                </c:choose> </td>
                        </tr>

                    </c:forEach>

                </tbody>
            </table>
        </div>
        <jsp:include page="WEB-INF/footer.jsp"/>
    </body>
</html>
