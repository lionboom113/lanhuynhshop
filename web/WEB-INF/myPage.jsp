<%-- 
    Document   : cartPage
    Created on : Jan 3, 2016, 11:04:47 PM
    Author     : Spit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="resources/bootstrap.min.css">
        <link rel="stylesheet" href="resources/swiper.min.css">
        <script src="resources/jquery.min.js"></script>
        <script src="resources/bootstrap.min.js"></script>						 
        <script src="resources/swiper.jquery.min.js"></script>					
        <script src="app.js"></script>
        <script src="resources/bootstrap-submenu.js"></script>
        <link rel="stylesheet" href="resources/bootstrap-submenu.min.css">
        <link rel="stylesheet" href="style.css">	
        <link rel="stylesheet" href="categoryLanding.css">	
        <link rel="stylesheet" href="cart.css">
        <title>Lan Huynh Shop - Tài khoản</title>
    </head>
    <body>
        <jsp:include page="WEB-INF/header.jsp"/>
        <div class="row container-fluid center">
            <form class="customerinfo-form" action="RegisterServlet">
                <label style="font-size: 20px">Thông tin tài khoản   </label>
                <hr/>
                <div class="form-horizontal">

                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">Mật khẩu   </label>
                        <div class="col-sm-9">
                            <input type="password" name="txtPassword" class="form-control" id="password" placeholder="">
                        </div>
                    </div>

                    <div class="form-group ">
                        <label for="password-check" class="col-sm-3 control-label">Nhập lại mật khẩu   </label>
                        <div class="col-sm-9">
                            <input type="password" name="txtCheckPassword" class="form-control" id="password-check" placeholder="">
                        </div>
                    </div>

                    <div class="form-group ">
                        <label for="name" class="col-sm-3 control-label">Họ và tên   </label>
                        <div class="col-sm-9">
                            <input  type="text" name="txtName" class="form-control" id="name" placeholder="">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="phone" class="col-sm-3 control-label">Số điện thoại  </label>
                        <div class="col-sm-9">
                            <input  type="text" name="txtPhone" class="form-control" id="phone" placeholder="">
                        </div>
                    </div>
                    
                    <div class="form-group ">
                        <label for="address" class="col-sm-3 control-label">Địa chỉ  </label>
                        <div class="col-sm-9">
                            <input  type="text" name="txtAddress" class="form-control" id="address" placeholder="">
                        </div>
                    </div>
                </div>

            </form>	
            <div class="btn btn-warning order-btn submit-btn right">Lưu</div>
        </div>
        <script>
            $(document).ready(function() {
                $("#password-check").keyup(validate1);
                $("#username").blur(validate2);
                $("#password").blur(validate3);
                $("#name").blur(validate4);
                $("#phone").blur(validate5);
                $("#address").blur(validate6);

            });


            function validate1() {
                var password1 = $("#password").val();
                var password2 = $("#password-check").val();


                if (password1 !== password2) {
                    $("#password-check").closest(".form-group").addClass("has-error");
                    $("#password-check").closest(".form-group").addClass("has-feedback");
                    $("#password-check").closest(".form-group").find("span").show();

                } else {
                    $("#password-check").closest(".form-group").removeClass("has-error");
                    $("#password-check").closest(".form-group").removeClass("has-feedback");
                    $("#password-check").closest(".form-group").addClass("has-success");
                    $("#password-check").closest(".form-group").find("span").hide();

                }
            }
            function validate2() {
                var username = $("#username").val();
                $("#username").closest(".form-group").find("#2").hide();
                if (username.trim("").length === 0) {
                    $("#username").closest(".form-group").addClass("has-error");
                    $("#username").closest(".form-group").addClass("has-feedback");
                    $("#username").closest(".form-group").find("#1").show();
                } else {
                    $("#username").closest(".form-group").find("#1").hide();
                    $("#username").closest("span").remove();
                    $.ajax({
                        method: "POST",
                        url: "RegisterServlet",
                        data: {txtUsername: $("#username").val(), action: "check"}
                    }).done(function(msg) {
                        if (msg === "a") {
                            $("#username").closest(".form-group").addClass("has-error");
                            $("#username").closest(".form-group").addClass("has-feedback");
                            $("#username").closest(".form-group").find("#2").show();
                        } else {
                            $("#username").closest(".form-group").find("#2").hide();
                            $("#username").closest(".form-group").removeClass("has-error");
                            $("#username").closest(".form-group").removeClass("has-feedback");
                            $("#username").closest(".form-group").addClass("has-success");

                        }
                    });
                    $("#username").closest(".form-group").removeClass("has-feedback");
                    $("#username").closest(".form-group").removeClass("has-error");
                    $("#username").closest(".form-group").addClass("has-success");
                }


            }
            function validate3() {

                var password = $("#password").val();
                if (password.trim("").length === 0) {
                    $("#password").closest(".form-group").addClass("has-error");
                    $("#password").closest(".form-group").addClass("has-feedback");
                    $("#password").closest(".form-group").find("span").show();

                } else {
                    $("#password").closest(".form-group").removeClass("has-error");
                    $("#password").closest(".form-group").removeClass("has-feedback");
                    $("#password").closest(".form-group").addClass("has-success");
                    $("#password").closest(".form-group").find("span").hide();
                }

            }
            function validate4() {
                var name = $("#name").val();
                if (name.trim("").length === 0) {
                    $("#name").closest(".form-group").addClass("has-error");
                    $("#name").closest(".form-group").addClass("has-feedback");
                    $("#name").closest(".form-group").find("span").show();
                } else {
                    $("#name").closest(".form-group").removeClass("has-error");
                    $("#name").closest(".form-group").removeClass("has-feedback");
                    $("#name").closest(".form-group").addClass("has-success");
                    $("#name").closest(".form-group").find("span").hide();
                }

            }
            function validate5() {
                var phone = $("#phone").val();
                if (phone.trim("").length === 0) {
                    $("#phone").closest(".form-group").addClass("has-error");
                    $("#phone").closest(".form-group").addClass("has-feedback");
                    $("#phone").closest(".form-group").find("span").show();
                } else {
                    $("#phone").closest(".form-group").removeClass("has-error");
                    $("#phone").closest(".form-group").removeClass("has-feedback");
                    $("#phone").closest(".form-group").addClass("has-success");
                    $("#phone").closest(".form-group").find("span").hide();
                }

            }
            function validate6() {
                var address = $("#address").val();
                if (address.trim("").length === 0) {
                    $("#address").closest(".form-group").addClass("has-error");
                    $("#address").closest(".form-group").addClass("has-feedback");
                    $("#address").closest(".form-group").find("span").show();
                } else {
                    $("#address").closest(".form-group").removeClass("has-error");
                    $("#address").closest(".form-group").removeClass("has-feedback");
                    $("#address").closest(".form-group").addClass("has-success");
                    $("#address").closest(".form-group").find("span").hide();
                }


            }
            var noob = function() {
                validate2();
                validate3();
                validate4();
                validate5();
                validate6();
            }
            $(".submit-btn").click(function() {

                if ($(".customerinfo-form").find(".has-error").length === 0) {
                    if ($(".customerinfo-form").find(".has-success").length === 6) {
                        $(".customerinfo-form").submit();
                    } else {
                        noob();
                    }
                } else {
                    noob();
                }
            });

        </script>
        <jsp:include page="WEB-INF/footer.jsp"/>
    </body>
</html>
