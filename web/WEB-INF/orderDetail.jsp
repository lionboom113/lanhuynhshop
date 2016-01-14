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
                        <th>Mã sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Tổng giá</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query dataSource="mydatabase" var="result">
                        SELECT tbl_product.productId AS productid, tbl_product.productName AS productname, tbl_orderline.qty,  tbl_product.productImage , tbl_orderline.qty* tbl_product.productPrice AS total
                        FROM tbl_orderline
                        INNER JOIN tbl_product
                        ON tbl_product.productId=tbl_orderline.productid
                        AND tbl_orderline.orderid = ${param.orderid};
                    </sql:query>
                    <c:forEach items="${result.rows}" var="row">
                        <tr>
                            <td>${row.productid}</td>
                            <td><img src="https://googledrive.com/host/<%=getServletContext().getInitParameter("gdFolderId")%>/${row.productImage}"></td>
                            <td>${row.productname}</td>
                            <td>${row.qty}</td>
                            <td><fmt:formatNumber value="${row.total}" type="number" 
                                              groupingUsed="true" maxFractionDigits="0" /> đ</td>
                        </tr>

                    </c:forEach>

                </tbody>
            </table>
        </div>
        <jsp:include page="WEB-INF/footer.jsp"/>
    </body>
</html>
<script>
    $(document).ready(function() {
        $("#ddlStatus").change(reload);

    });
    function reload() {
        $("#filter").submit();
    }
</script>