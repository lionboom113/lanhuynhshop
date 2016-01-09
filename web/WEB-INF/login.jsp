<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script src="app.js"></script>
        <link rel="stylesheet" href="style.css">	
        <link rel="stylesheet" href="categoryLanding.css">	
        <title>Lan Huỳnh Shop - Danh mục - Chuyên hàng xách tay</title>
    </head>
    <body>
        <jsp:include page="WEB-INF/header.jsp"/>
        <div class="row">
            <div class = "dang-nhap">
                <form action="LoginServlet" id="loginForm">
                    <div class="navbar-brand"><a href="/index"><img id="navbar-logo" src="images/logo.png"/></a></div>

                    <input type="text" name="txtUsername" required class="form-control" placeholder="Username....">
                    <input type="password" name="txtPassword" required class="form-control" placeholder="Password....">
                    <c:if test="${not empty requestScope.ERROR}" >
                        <p style="color: red" >${requestScope.ERROR}</p>
                    </c:if>
                    <div class="checkbox">
                        <label><input type="checkbox" value="">Remember me?</label>
                    </div>
                    <div id="loginBtn"><button  class="btn btn-warning">Đăng Nhập</button></div>
                    <a href="register">Đăng ký</a>  <a href="">Quên mật khẩu?</a>  

                </form>

            </div>
        </div>
        <jsp:include page="WEB-INF/footer.jsp"/>
    </body>

</html>

<script>
    $("#loginBtn").click(function() {
        if ($("#loginForm").validate())
        {
            $("#loginForm").submit();
        }
    });
</script>