<%-- 
    Document   : productDetail
    Created on : Dec 31, 2015, 9:43:52 PM
    Author     : Spit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<sql:query dataSource="mydatabase" var="result">
  SELECT * from tbl_product where productId = "${param.productid}";
</sql:query>
  
  
<div class="col-md-9 col-sm-9 col-xs-9 product-detail">
					<div class="product-img-box col-md-6 col-sm-6 col-xs-6">
            <img src="https://googledrive.com/host/<%=getServletContext().getInitParameter("gdFolderId")%>/${result.rows[0].productImage}"/>
					</div>
					<div class="product-info col-md-6 col-sm-6 col-xs-6">
						<div class="product-name">${result.rows[0].productName}</div>
						<div class="product-sku">Mã sản phẩm: <strong>${result.rows[0].productId}</strong></div>
						<hr/>
            <c:if test="${not empty result.rows[0].productOldPrice}">
						<div class="old-price">Giá gốc: <span><fmt:formatNumber value="${result.rows[0].productOldPrice}" type="number" 
                    groupingUsed="true" maxFractionDigits="0" />đ</span></div>
            </c:if>
						<div class="product-price">Giá bán: <span><fmt:formatNumber value="${result.rows[0].productPrice}" type="number" 
                    groupingUsed="true" maxFractionDigits="0" />đ</span></div>
            <c:if test="${not empty result.rows[0].productOldPrice}">
						<div class="product-save">Tiết kiệm: <span><fmt:formatNumber value="${result.rows[0].productOldPrice - result.rows[0].productPrice}" type="number" 
                    groupingUsed="true" maxFractionDigits="0" />đ</span></div>
            </c:if>
						<hr/>
						<div class="form-group qty">
						  <label for="usr">Số lượng:</label>
						  <input type="number" class="form-control" id="qtyinp" value="1" min="0" >
						  <button class="add-to-cart btn btn-warning" id="qty">Thêm vào giỏ hàng</button>
						</div>
					</div>
					<div class="panel panel-warning col-md-12 col-sm-12 col-xs-12">
					  <div class="panel-heading">Thông tin sản phẩm</div>
					  <div class="panel-body"> ${result.rows[0].productDescription}</div>
					</div>
</div>	
          <script>
            $("#qty").click(function(){
                $.ajax({
                method: "GET",
                url: "Cart",
                data: { qty: $("#qtyinp").val(), productid:"${param.productid}", action:"add" }
              })
                .done(function( msg ) {
                  location.reload();
                });
            });                        
          </script>
