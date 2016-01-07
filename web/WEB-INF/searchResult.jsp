<%-- 
    Document   : category-list
    Created on : Dec 31, 2015, 10:46:12 PM
    Author     : Spit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<sql:query dataSource="mydatabase" var="productdetail">
  SELECT * from tbl_product where productName LIKE "%${param.id}%";
</sql:query>
<div class="col-md-9 col-sm-9 col-xs-9 product-show">
				<div class="category-name"><h4>Kết quả tìm kiếm cho: ${param.id}</h4></div>
        <c:forEach items="${productdetail.rows}" var="row">
              <div class = "result-item col-md-4 col-sm-6 col-xs-6">
                <div class = "product-border">
                        <a href="productInfo?productid=${row.productId}">
                          <img src="https://googledrive.com/host/<%=getServletContext().getInitParameter("gdFolderId")%>/${row.productImage}" alt="urbeat"/><span class="info">${row.productName}</span>
                        <span class="price"><fmt:formatNumber value="${row.productPrice}" type="number" 
                          groupingUsed="true" maxFractionDigits="0" />đ 
                          <c:if test="${not empty row.productOldPrice}">
                          <span class="oldprice"><fmt:formatNumber value="${row.productOldPrice}" type="number" 
                          groupingUsed="true" maxFractionDigits="0" />đ</span></c:if></span>
                        </a>
                      </div>
              </div>
        </c:forEach>
        <c:if test="${productdetail.rowCount == 0}">
          <p> Không tìm thấy kết quả phù hợp</p>
        </c:if>
				
				<div class = "row">
					<ul class="pagination custom-pagination right">
					  <li class="active"><a href="#">1</a></li>
					</ul>
				</div>
			</div>
