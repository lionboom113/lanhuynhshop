<%-- 
    Document   : leftnav
    Created on : Dec 31, 2015, 9:42:59 PM
    Author     : Spit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<div class="col-md-3 col-sm-3 col-xs-3 leftnav">
				<ul class = "left-navigation col-md-12">
					<div class="danh-muc">Danh mục sản phẩm</div>
          <sql:query dataSource="mydatabase" var="result">
            SELECT * from tbl_category where categoryParent IS NULL;
          </sql:query>
          <sql:query dataSource="mydatabase" var="queryparam">
            SELECT * from tbl_category where categoryId = "${param.id}";
          </sql:query>
          <c:forEach items="${result.rows}" var="row">
            <li><a href="category?id=${row.categoryId}">${row.categoryName}</a>
            <c:if test="${row.categoryId == param.id or queryparam.rows[0].categoryParent == row.categoryId or param.rootparent == row.categoryId}">
              <sql:query dataSource="mydatabase" var="subresult">
                SELECT * from tbl_category where categoryParent = "${row.categoryId}";
              </sql:query>
                <ul>
              <c:forEach items="${subresult.rows}" var="subrow">
                <li><a href="category?id=${subrow.categoryId}">${subrow.categoryName}</a></li>
              </c:forEach>
                </ul>
            </c:if>
          </c:forEach>
            </li>
				</ul>
			</div>
