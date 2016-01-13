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
    <title>Thêm bài viết - Lan Huynh Shop - Chuyên hàng xách tay</title>
	</head>
	<body>
            <jsp:include page="WEB-INF/header.jsp"/>
  <div class="row container-fluid">
    <form width="50" action="addProduct" class="addProduct-form">
      <div class="form-group" >
        <h1 class="middle" for="name">THÊM SẢN PHẨM</h1>
      </div>
      <div class="form-group" >
        <label id="scrollTo" for="name">Loại sản phẩm:</label>
        <label for="name" class="requiredField">*</label>
        <input type="text" maxlength="10" class="form-control" id="category" name="category" required>
      </div>
      <div class="form-group">
        <label for="name">Mã sản phẩm:</label>
        <label for="name" class="requiredField">*</label>
        <input type="text" maxlength="10" class="form-control" id="id" name="id" required>
      </div>
      <div class="form-group">
        <label for="phone">Tên sản phẩm:</label>
        <input type="text" class="form-control" id="name" name="name" >
      </div>
      <div class="form-group">
        <label for="number">Giá khuyến mãi:</label>
        <input type="number" max="99999999" class="form-control" id="price" name="price">
      </div>
      <div class="form-group">
        <label for="number">Giá gốc:</label>
        <input type="number" max="99999999" class="form-control" id="oldPrice" name="oldPrice">
      </div>
      <div class="form-group">
        <label for="comment" id="lbDes">Mô tả sản phẩm:</label>
        <textarea class="form-control" rows="5" id="description" name="description"></textarea>
      </div>
      <div class="form-group">
        <label for="comment">Hình ảnh sản phẩm</label>
        <textarea class="form-control" id="image" name="image"></textarea>
      </div>
       <br/>
      <br/>
    </form>		      	
  </div>     <button class="btn btn-warning addProduct-btn left">Thêm sản phẩm</button>

            <jsp:include page="WEB-INF/footer.jsp"/>
	</body>
</html>