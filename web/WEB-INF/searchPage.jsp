<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>
<html lang="vi">
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="resources/bootstrap.min.css">
		<link rel="stylesheet" href="resources/swiper.min.css">
		<script src="resources/jquery.min.js"></script>
		<script src="resources/bootstrap.min.js"></script>						 
		<script src="resources/swiper.jquery.min.js"></script>		
    <script src="resources/bootstrap-submenu.js"></script>
    <link rel="stylesheet" href="resources/bootstrap-submenu.min.css">
		<script src="app.js"></script>
		<link rel="stylesheet" href="style.css">	
    <link rel="stylesheet" href="categoryLanding.css">	
    <title>Lan Huỳnh Shop - Danh mục - Chuyên hàng xách tay</title>
	</head>
	<body>
            <jsp:include page="WEB-INF/header.jsp"/>
            <div class="row">
              <jsp:include page="WEB-INF/leftnav.jsp"/>
              <jsp:include page="WEB-INF/searchResult.jsp">
                <jsp:param name="id" value="${param.keyword}"/>
              </jsp:include>
            </div>
            <jsp:include page="WEB-INF/footer.jsp"/>
	</body>
</html>