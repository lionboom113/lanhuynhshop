<%-- 
    Document   : product-slider
    Created on : Dec 30, 2015, 4:32:58 PM
    Author     : TuanHMA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<sql:query dataSource="mydatabase" var="result">
  SELECT * from tbl_category where categoryId = "${param.id}";
</sql:query>
<sql:query dataSource="mydatabase" var="productresult">
  SELECT * from tbl_tag where categoryId = "${param.id}" order by productId limit 50;
</sql:query>
<div class="category container-fluid" id="cate${param.id}">			
    <div class="category-head">
        <div class="head-name"><h4>${result.rows[0].categoryName}<h4></div>
                    <ul class="subcate">
                        <sql:query dataSource="mydatabase" var="subresult">
                          SELECT * from tbl_category where categoryParent = "${result.rows[0].categoryId}";
                        </sql:query>
                        <c:forEach items="${subresult.rows}" var="subrow">
                          <li><a href="category?id=${subrow.categoryId}">${subrow.categoryName}</a></li>
                        </c:forEach>
                    </ul>
                    </div>
                    <div class="row">
                        <div class="swiper-container col-md-12 col-sm-12 col-xs-12" >
                            <!-- Additional required wrapper -->
<!--                            <div class="swiper-wrapper">                               
                                <div class="swiper-slide">
                                    <a href="productInfo" data-toggle="tooltip" title="Some tooltip text!"><img src="images/product1.png" alt="urbeat"/><span class="info">Beat Detox</span>
                                        <span class="price">490.000đ <span class="oldprice">1.500.000đ</span></span>
                                    </a>
                                </div>            
                            </div>-->
                            <div class="swiper-wrapper">
                            <c:forEach items="${productresult.rows}" var="row">
                              <sql:query dataSource="mydatabase" var="productdetail">
                                SELECT * from tbl_product where productId = "${row.productId}";
                              </sql:query>
                                                                 
                                      <div class="swiper-slide">
                                          <a href="productInfo?productid=${row.productid}&id=${param.id}" data-toggle="tooltip" title="${productdetail.rows[0].productName}"><img src="https://googledrive.com/host/<%=getServletContext().getInitParameter("gdFolderId")%>/${productdetail.rows[0].productImage}" alt="${productdetail.rows[0].productName}"/><span class="info">${productdetail.rows[0].productName}</span>
                                              <span class="price"><fmt:formatNumber value="${productdetail.rows[0].productPrice}" type="number" 
                          groupingUsed="true" maxFractionDigits="0" />đ
                                                <c:if test="${not empty productdetail.rows[0].productOldPrice}">
                                                <span class="oldprice"><fmt:formatNumber value="${productdetail.rows[0].productOldPrice}" type="number" 
                          groupingUsed="true" maxFractionDigits="0" />đ</span>
                                                </c:if>  
                                              </span>
                                          </a>
                                      </div>            
                                  
                            </c:forEach>
                            </div>
                            <!-- If we need pagination -->
                            <!-- <div class="swiper-pagination"></div> -->
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>

                        </div>
<!--                        <div class="slider-logo col-md-2 col-sm-2 hidden-xs"><img src="logo-beat.jpg"/></div>-->
                    </div>
                    </div>
<script>
  $(document).ready(function () {
  //initialize swiper when document ready  
  var swiper${param.id} = new Swiper ('#cate${param.id} .swiper-container', {
    // Optional parameters
    pagination: '#cate${param.id} .swiper-pagination',
      slidesPerView: 4,
      centeredSlides: true,
      paginationClickable: true,
      spaceBetween: 30,
      nextButton: '#cate${param.id} .swiper-button-next',
      prevButton: '#cate${param.id} .swiper-button-prev',
      initialSlide : 1,
      autoplay: 5000,
      loop: false,
      preventClicks : false,
      autoplayDisableOnInteraction: true
  }) 
  });
</script>
