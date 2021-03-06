<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <script src="resources/jquery.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="resources/bootstrap.min.css">
        <link rel="stylesheet" href="resources/swiper.min.css">
        <script src="resources/bootstrap.min.js"></script>						 
        <!--<script src="resources/swiper.jquery.min.js"></script>-->				
        <!--    <script src="app.js"></script>-->
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="categoryLanding.css">
        <link rel="stylesheet" href="productLanding.css">
        <link rel="stylesheet" href="cart.css">
        <link rel="stylesheet" href="addProductStyle.css">
        <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
        <script>tinymce.init({selector: '#description',
                plugins: "image",
                image_caption: true});
        </script>
        <title>Thêm sản phẩm</title>
    </head>
    <body>
    <c:if test="${!sessionScope.ROLE}">
        <c:redirect url="/index"/>
    </c:if>
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
            <button class="btn btn-warning addProduct-btn left">Thêm sản phẩm</button>
            <br/>
            <br/>

        </form>		      	
    </div>
    <div class="footer">
        <div class="info left">
            <h4>Hướng dẫn thêm sản phẩm</h4><hr/> 
            <p>1. [Loại sản phẩm] phải là 1 loại có sẵn. Không được để trống</p>
            <p>2. [Mã sản phẩm] không được trùng với sản phẩm đã có. Không được để trống</p>
            <p>3. Bấm [Thêm sản phẩm] để hoàn thành</p>
            <p>4. Nếu có lỗi lạ phát sinh thì liên hệ theo thông tin bên phải</p>
        </div>
        <div class="info left">

        </div>
        <div class="contact right">
            <h4>Thông tin liên hệ</h4>
            <hr/>
            <p><img src="images/email.png" alt="email">: giathienpham@gmail.com</p>
            <p><img src="images/facebook.png" alt="facebook">: <a href="https://www.facebook.com/thien.pham.0611">Thiện Phạm on Facebook</a></p>
            <p><img src="images/phone.png" alt="mobile">: 0949 879 939</p>
        </div>
    </div>
    <div class="footer-end">
        <p class="middle"><strong>Lan Huynh Shop</strong> chuyên các loại hàng xách tay</p>
    </div>
</body>
</html>

<script>
    $(".addProduct-form").submit(function(e) {
        e.preventDefault();
    });



    function getCategoryClass() {
        return  $("#category").attr("class");
    }

    $(".addProduct-btn").click(function() {
        tinyMCE.triggerSave();
        $.ajax({
            method: "GET",
            url: "AddProductServlet",
            data: {category: $("#category").val(),
                id: $("#id").val(),
                name: $("#name").val(),
                price: $("#price").val(),
                oldPrice: $("#oldPrice").val(),
                description: $("#description").val(),
                image: $("#image").val()
            }
        })
                .done(function(msg) {
                    $(window).scrollTop($("#scrollTo").position().top);
                    if (msg.trim("").length !== 5) {
                        alert(msg);
                    }
                });

    });
</script>

<script>
    $(document).ready(function() {
        $("#id").blur(validate2);
    });
    $(document).ready(function() {

        $("#category").blur(validate1);
    });

    function validate1() {
        var category = $("#category").val();
        if (category.trim("").length === 0) {
            $("#category").closest(".form-group").addClass("has-error");
        } else {
            $.ajax({
                method: "GET",
                url: "AddProductServlet",
                data: {
                    category: $("#category").val(),
                    id: $("#id").val(),
                    name: $("#name").val(),
                    price: $("#price").val(),
                    oldPrice: $("#oldPrice").val(),
                    description: $("#description").val(),
                    image: $("#image").val(),
                    action: "checkCategoryID"}
            }).done(function(msg) {
                if (msg === "c") {
                    $("#category").closest(".form-group").addClass("has-error");
                } else {
                    $("#category").closest(".form-group").removeClass("has-error");
                    $("#category").closest(".form-group").addClass("has-success");
                }
            });
//      $("#category").closest(".form-group").removeClass("has-error");
//      $("#category").closest(".form-group").addClass("has-success");
        }

    }
    function validate2() {
        var id = $("#id").val();
        if (id.trim("").length === 0) {
            $("#id").closest(".form-group").addClass("has-error");
        } else {
            $.ajax({
                method: "GET",
                url: "AddProductServlet",
                data: {
                    category: $("#category").val(),
                    id: $("#id").val(),
                    name: $("#name").val(),
                    price: $("#price").val(),
                    oldPrice: $("#oldPrice").val(),
                    description: $("#description").val(),
                    image: $("#image").val(),
                    action: "checkProductID"}
            }).done(function(msg) {
                if (msg === "a") {
                    $("#id").closest(".form-group").addClass("has-error");
                } else {
                    $("#id").closest(".form-group").removeClass("has-error");
                    $("#id").closest(".form-group").addClass("has-success");
                }
            });
//      $("#id").closest(".form-group").removeClass("has-error");
//      $("#id").closest(".form-group").addClass("has-success");
        }


    }
</script>
