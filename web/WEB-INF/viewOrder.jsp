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
        <link href="css/jasny-bootstrap.css" rel="stylesheet" media="screen">
        <script src="resources/jquery.min.js"></script>
        <script src="resources/bootstrap.min.js"></script>						 
        <script src="resources/swiper.jquery.min.js"></script>					
        <script src="app.js"></script>
        <script src="resources/bootstrap-submenu.js"></script>
        <script src="jasny-bootstrap.js"></script>
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
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Mã đơn hàng</th>
                        <th>Ngày đặt hàng</th>
                        <th>Họ và tên</th>
                        <th>Địa chỉ</th>
                        <th>Điện thoại</th>
                        <th> <form id="filter" action="viewOrder">
                    <select name="orderid" class="" id="ddlStatus">
                        <option value="" <c:if test="${empty param.orderid}">
                                selected="" 
                            </c:if> >Trạng thái</option>
                        <option value="1" <c:if test="${param.orderid == 1}" >
                                selected="" 
                            </c:if> >Chưa xác nhận</option>
                        <option value="2" <c:if test="${param.orderid == 2}" >
                                selected="" 
                            </c:if> >Đã xác nhận</option>
                        <option value="3" <c:if test="${param.orderid == 3}" >
                                selected="" 
                            </c:if> >Đã thanh toán</option>
                        <option value="4" <c:if test="${param.orderid == 4}" >
                                selected="" 
                            </c:if> >Đã giao hàng</option>
                        <option value="5" <c:if test="${param.orderid == 5}" >
                                selected="" 
                            </c:if> >Đóng</option>
                    </select>
                </form>
                </th>
                </tr>
                </thead>
                <tbody data-link="row" class="rowlink">
                    <c:if test="${empty param.orderid}">
                        <sql:query dataSource="mydatabase" var="result">
                            SELECT * from tbl_order;
                        </sql:query>
                    </c:if>
                    <c:if test="${not empty param.orderid}">
                        <sql:query dataSource="mydatabase" var="result">
                            SELECT * from tbl_order where status=${param.orderid};
                        </sql:query>
                    </c:if>
                    <c:forEach items="${result.rows}" var="row">
                        <tr>
                            <td><a href="orderDetail?orderid=${row.orderid}" > ${row.orderid}</a></td>
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
<script>
     $('tbody.rowlink').rowlink();
    $(document).ready(function() {
        $("#ddlStatus").change(reload);
       

    });
    function reload() {
        $("#filter").submit();
    }
</script>