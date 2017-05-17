<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<#include "header.ftl">


	<!-- 中间主体板块 -->
	<div class="main w clearfix">
		<div class="buttons clearfix">
			<a href="#" id="login-button" class="selected"><span class="glyphicon glyphicon-user"></span>&nbsp;Login</a>
			<a href="#" id="register-button" class="unselected"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Register</a>
		</div>
		<div class="contents">
			<div id="login-area">
				<form action="#"" method="post">
					<div class="error-message">${error!''}</div>
				<table>
					<tr>
					<div class="email">
						<td>Email</td>
                        <td><input id="login-email" type="text" name="email" value="${email!''}" required></td>
					</div>
                    </tr>
					<tr>
					<div class="password">
						<td>Password</td>
						<td><input type="password" name="password" required></td>
					</div>
                    </tr>
                </table>
				<br/>
					<button id="login-submit">Login</button>
					<button type="button" id="forget-password">Forget Password</button>
				</form>
			</div>
			<div id="register-area">
				<form action="register"" method="post">
					<div id="error-message" class="error-message">${error!''}</div>
					<table>
					<tr><div class="email">
						<td>Email</td>
						<td><input type="text" name="email" value="${email!''}" id="email" required></td>
					</div></tr>
					<tr><div class="password">
                        <td>Password</td>
						<td><input type="password" name="password" id="password" required></td>
					</div></tr>
					<tr><div class="password">
						<td>Password</td>
						<td><input type="password" name="repassword" id="repassword" required ></td>
					</div></tr>
                    </table>
					<div class="relative">
						<button id="register-submit">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div><!-- 主体结束 -->



<#include "footer.ftl">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript">
	$(function(){
		var loginButton = $("#login-button");
		var registerButton = $("#register-button");
		var lArea = $("#login-area");
		var rArea = $("#register-area");
		rArea.hide();

		loginButton.click(function(){
			loginButton.addClass("selected");
			loginButton.removeClass("unselected");
			registerButton.addClass("unselected");
			registerButton.removeClass("selected");
			lArea.show();
			rArea.hide();
		});

		registerButton.click(function(){
			registerButton.addClass("selected");
			registerButton.removeClass("unselected");
			loginButton.addClass("unselected");
			loginButton.removeClass("selected");
			lArea.hide();
			rArea.show();
		});

        if(location.href.indexOf("#register")>=0){
            registerButton.click();
        }else{
            loginButton.click();
        }

        //根据是否是注册跳回来，切换到注册页面
        var hideInfo = "${register!''}";
        if(hideInfo!=null && hideInfo!=""){
            registerButton.click();
        }


		//输入校验
        //校验邮箱
        $("#email").blur(function() {
            var value = $(this).val();
            if (!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)) {
                $("#error-message").text("邮箱格式错误啦~");
            }else{
                $("#error-message").text("");
            }
        });

		//忘记密码
        $("#forget-password").click(function(){
            //alert($("#login-email").val());
            $.ajax({
                type:"GET",
                url:"forgetPassword",
                data:{email:$("#login-email").val()},
                success:function(response,status,xhr){
                    location.href="afterForgetPassword";
                }
            });
        });
	});


</script>
</body>
</html>

