<%-- 
    Document   : category-list
    Created on : Dec 31, 2015, 10:46:12 PM
    Author     : Spit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<sql:query dataSource="mydatabase" var="cateresult">
  SELECT * from tbl_category where categoryId = "${param.id}";
</sql:query>
<sql:query dataSource="mydatabase" var="productresult">
  SELECT * from tbl_tag where categoryId = "${param.id}";
</sql:query>
<div class="col-md-9 col-sm-9 col-xs-9 product-show">
				<div class="category-name"><h4>Danh mục: ${cateresult.rows[0].categoryName}</h4></div>
        <c:forEach items="${productresult.rows}" var="row">
          <sql:query dataSource="mydatabase" var="productdetail">
            SELECT * from tbl_product where productId = "${row.productId}";
          </sql:query>
              <div class = "result-item col-md-4 col-sm-6 col-xs-6">
                <div class = "product-border">
                        <a href="productInfo?id=${param.id}&productid=${productdetail.rows[0].productId}">
                          <img src="https://googledrive.com/host/<%=getServletContext().getInitParameter("gdFolderId")%>/${productdetail.rows[0].productImage}" alt="urbeat"/><span class="info">${productdetail.rows[0].productName}</span>
                        <span class="price"><fmt:formatNumber value="${productdetail.rows[0].productPrice}" type="number" 
                          groupingUsed="true" maxFractionDigits="0" />đ 
                          <c:if test="${not empty productdetail.rows[0].productOldPrice}">
                          <span class="oldprice"><fmt:formatNumber value="${productdetail.rows[0].productOldPrice}" type="number" 
                          groupingUsed="true" maxFractionDigits="0" />đ</span></c:if></span>
                        </a>
                      </div>
              </div>
        </c:forEach>
				
				<div class = "row">
					<ul class="pagination custom-pagination right">
					  <li class="active"><a href="#">1</a></li>
					</ul>
				</div>
			</div>
