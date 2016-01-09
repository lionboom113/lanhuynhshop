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
    <title>Lan Huynh Shop - Trang chủ - Chuyên hàng xách tay</title>
	</head>
	<body>
            <jsp:include page="WEB-INF/header.jsp"/>
            <jsp:include page="WEB-INF/hero-slider.jsp"/>	    
            <jsp:include page="WEB-INF/product-slider.jsp">
                <jsp:param name="id" value="1thuoc"/>
            </jsp:include>
            <jsp:include page="WEB-INF/product-slider.jsp">
                <jsp:param name="id" value="2mypham"/>
            </jsp:include>
            <jsp:include page="WEB-INF/product-slider.jsp">
                <jsp:param name="id" value="3quanao"/>
            </jsp:include>
            <jsp:include page="WEB-INF/product-slider.jsp">
                <jsp:param name="id" value="4giaydep"/>
            </jsp:include>
            <jsp:include page="WEB-INF/product-slider.jsp">
                <jsp:param name="id" value="5phukien"/>
            </jsp:include>
            <jsp:include page="WEB-INF/product-slider.jsp">
                <jsp:param name="id" value="6mevabe"/>
            </jsp:include>
            <jsp:include page="WEB-INF/product-slider.jsp">
                <jsp:param name="id" value="7thucpham"/>
            </jsp:include>
            <jsp:include page="WEB-INF/product-slider.jsp">
                <jsp:param name="id" value="8saleoff"/>
            </jsp:include>
            <jsp:include page="WEB-INF/footer.jsp"/>
	</body>
</html>