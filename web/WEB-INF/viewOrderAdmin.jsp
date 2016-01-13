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
    <c:if test="${!sessionScope.ROLE}">
        <jsp:forward page="/index"/>
    </c:if>
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
                        <th> <form id="filter" action="viewOrderAdmin">
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
                <tbody>
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
                    <form action="UpdateOrderServlet">
                        <td>${row.orderid}  </td>
                        <td><fmt:formatDate type="date" value="${row.orderdate}" /></td>
                        <td>${row.name}</td>
                        <td>${row.address}</td>
                        <td>${row.phone}</td>
                        <td> <select name="ddlStatus"  >
                                <option value="1" <c:if test="${row.status == 1}" >
                                        selected="" 
                                    </c:if> >Chưa xác nhận</option>
                                <option value="2" <c:if test="${row.status == 2}" >
                                        selected="" 
                                    </c:if> >Đã xác nhận</option>
                                <option value="3" <c:if test="${row.status == 3}" >
                                        selected="" 
                                    </c:if> >Đã thanh toán</option>
                                <option value="4" <c:if test="${row.status == 4}" >
                                        selected="" 
                                    </c:if> >Đã giao hàng</option>
                                <option value="5" <c:if test="${row.status == 5}" >
                                        selected="" 
                                    </c:if> >Đóng</option>
                            </select>  </td>
                        <td>

                            <input type="hidden" name="txtOrderId" value="${row.orderid}" />
                            <button class="btn btn-warning order-btn submit-btn right">Lưu thay đổi</button>

                        </td>

                        </tr>
                    </form>
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
