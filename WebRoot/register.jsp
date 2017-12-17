<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>Register</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <script type="text/javascript" src="assets/js/jquery.min.js" ></script>
  <script type="text/javascript" src="assets/js/jquery.validate.min.js" ></script>
  <script type="text/javascript" src="assets/js/messages_zh.js" ></script>
  <script type="text/javascript" src="assets/js/jquery.metadata.js" ></script>
  <script type="text/javascript">
	jQuery.validator.addMethod("isMobile", function(value, element) { 
	  var length = value.length; 
	  var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/; 
	  return this.optional(element) || (length == 11 && mobile.test(value)); 
	}, "请正确填写您的手机号码"); 
	jQuery.validator.addMethod("stringCheck", function(value, element) { 
	     return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value); 
	  }, "只能包括中文字、英文字母、数字和下划线");  
	$(function(){
	    $("#myform").validate();
	});
  </script>
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>BookStore</h1>
    <p>Good books are not search, but by chance.<br/>好书不是搜索得来的，而是不期而遇。</p>
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <h3>注册</h3>
    <hr>

    <form id="myform" method="post" action="${pageContext.request.contextPath}/servlet/registerServlet" class="am-form" >
    	<label>用户名*:</label>
      <input type="text" name="name" id="name" value="" class="required" class="stringCheck">
      <br>
      <label for="password">密码*:</label>
      <input type="password" name="password" id="password" value="" class="required">
      <br>
      <label for="password">确认密码*:</label>
      <input type="password" name="rpassword" id="rpassword" value="" class="required">
      <br>
      <label for="email">邮箱:</label>
      <input type="email" name="email" id="email" value="" placeholder="接收网站信息和密保之用" class="email">
      <br>
      <label for="email">电话:</label>
      <input type="tel" name="tel" id="tel"  placeholder="留个电话好联系" class="isMobile">
      <br>
      <label for="password">性别:</label>
      <label class='am-radio-inline'>
			<input type='radio' name='radio10' value='1' data-am-ucheck> 男
			</label>
			<label class='am-radio-inline'>
				<input type='radio' name='radio10' value='2' data-am-ucheck> 女
			</label>
			<label class='am-radio-inline'>
				<input type='radio' name='radio10' value='0' data-am-ucheck checked> 保密
			</label>
			<br>
			<br>
			<label for="password">个人简介:</label>
      <input type="text" name="introduce" id="introduce" value="" placeholder="简洁地展示你的风采">
      <br>
      <div class="am-cf">
        <input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
        <a href="login.jsp" class="am-btn am-btn-default am-btn-sm am-fr">前往登录 (╭￣3￣)╭♡</a>
      </div>
    </form>
    <hr>
    <p>© 2017 yhc.</p>
  </div>
</div>
</body>
</html>
