	<%-- 
	    Document   : header
	    Created on : Dec 30, 2015, 4:26:52 PM
	    Author     : TuanHMA
	--%>

	<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!--Start of Tawk.to Script-->
<!--End of Tawk.to Script-->
	        <nav class="navbar navbar-default">
				  <div class="container-fluid">
				    <!-- Brand and toggle get grouped for better mobile display -->
				    <div class="navbar-header">	
              <div class="navbar-brand"><a href="index"><img id="navbar-logo" src="images/logo.png"/></a></div>
				    </div>

				    <!-- Collect the nav links, forms, and other content for toggling -->
					    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				      <form class="navbar-form navbar-right" id="searchForm" role="search" action="search">
				        <div class="form-group">
				          <div class="input-group">				      
                    <input type="text" class="form-control" placeholder="Tìm sản phẩm..." name="keyword"/>
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="submit" >Tìm kiếm</button>
							      </span>
                  </div>
				        </div>
				        </form>
				        <ul class="nav navbar-nav navbar-right">
				        	<li><a href="login"><div class="account-btn">Tài khoản</div></a></li>
                  <li><a href="cartPage"><div class="cart-btn">Giỏ hàng (${sessionScope.cartInfo.counter + 0})</div></a></li>
				        </ul>
				        </div>
				      
				    </div><!-- /.navbar-collapse -->
				  </div><!-- /.container-fluid -->
				</nav>
				<nav class="navbar2 navbar-default" id="nav2">
				  <div class="container-fluid">
				    <!-- Brand and toggle get grouped for better mobile display -->
				    <div class="navbar-header">
				      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
				      
				    </div>

				    <!-- Collect the nav links, forms, and other content for toggling -->
				    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				      <ul class="nav navbar-nav">
<!--				        <li class="dropdown">
				          <a href="category" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">Mỹ phẩm</a>
				          <ul class="dropdown-menu">
				            <li><a href="category">Category 2.2</a></li>
				            <li><a href="category">Category 2.3</a></li>
				            <li><a href="category">Category 2.4</a></li>
				            <li><a href="category">Category 2.5</a></li>
				          </ul>
				        </li>-->
<!--query1-->                
                <sql:query dataSource="mydatabase" var="result">
                  SELECT * from tbl_category where categoryParent is NULL order by stt ASC;
                </sql:query>
<!--showresult-->                  
                <c:forEach var="row" items="${result.rows}">
                  <li class="dropdown">
				          <a href="category?id=${row.categoryId}" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">${row.categoryName}</a>
				          <ul class="dropdown-menu">
                    <sql:query dataSource="mydatabase" var="subresult">
                      SELECT * from tbl_category where categoryParent = "${row.categoryId}" order by stt ASC;
                    </sql:query>
                    <c:forEach items="${subresult.rows}" var="subrow">
                      <sql:query dataSource="mydatabase" var="subresult2">
                        SELECT * from tbl_category where categoryParent = "${subrow.categoryId}" order by stt ASC;
                      </sql:query>
                        <li <c:if test="${subresult2.rowCount != 0}">class="dropdown-submenu"</c:if>><a href="category?id=${subrow.categoryId}">${subrow.categoryName}</a>
                          <c:if test="${subresult2.rowCount != 0}">
                            <ul class="dropdown-menu">
                              <c:forEach items="${subresult2.rows}" var="subrow2">
                                <li> <a href="category?id=${subrow2.categoryId}&rootparent=${row.categoryId}">${subrow2.categoryName}</a>
                                </li>
                              </c:forEach>
                            </ul>
                          </c:if>
                        </li>
                    </c:forEach>
				          </ul>
                  </li>
                </c:forEach>

				      </ul>
				    </div><!-- /.navbar-collapse -->
				  </div><!-- /.container-fluid -->
				</nav>

