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
                        <th>Số lượng</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query dataSource="mydatabase" var="result">
                        SELECT * from tbl_orderline where orderid=${param.orderid};
                    </sql:query>
                    <c:forEach items="${result.rows}" var="row">
                        <tr>
                            <td>${row.productid}</td>
                            <td>${row.qty}</td>
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