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
    <link rel="stylesheet" href="cart.css">
    <title>Lan Huỳnh Shop - Trang chủ - Chuyên hàng xách tay</title>
	</head>
	<body>
            <jsp:include page="WEB-INF/header.jsp"/>
            <div class="container-fluid guide" >
              <p class="title">Hướng dẫn mua hàng tại Lan Huỳnh Shop</p>
              <p><span class="orange">Bước 1:</span> Chọn sản phẩm mà bạn muốn mua bằng cách click vào hình ảnh của chúng</p>
              <hr/>
              <p><span class="orange">Bước 2:</span> Chọn số lượng muốn mua và click vào nút "Thêm vào giỏ hàng"</p>
              <img src="images/guide1.png"/>
              <hr/>
              <p><span class="orange">Bước 3:</span> Nhấn vào nút giỏ hàng trên thanh Menu và làm theo hướng dẫn</p>
              <img src="images/guide2.png"/>
              <p> Mọi thắc mắc xin liên hệ email : <span class="orange">lanhuynhshop@gmail.com </span> hoặc sđt : <span class="orange">0934.090785</span></p>
            </div>
            <jsp:include page="WEB-INF/footer.jsp"/>
	</body>
</html>