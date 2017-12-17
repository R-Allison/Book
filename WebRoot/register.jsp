<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>  
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

    <form method="post" class="am-form" action="${pageContext.request.contextPath}/servlet/registerServlet">
    	<label>用户名*:</label>
      <input type="text" name="name" id="name" value="">
      <br>
      <label for="password">密码*:</label>
      <input type="password" name="password" id="password" value="">
      <br>
      <label for="password">确认密码*:</label>
      <input type="password" name="rpassword" id="rpassword" value="">
      <br>
      <label for="email">邮箱:</label>
      <input type="email" name="email" id="email" value="" placeholder="接收网站信息和密保之用">
      <br>
      <label for="email">电话:</label>
      <input type="tel" name="tel" id="tel"  placeholder="留个电话好联系">
      <br>
      <label for="password">性别:</label>
      <label class='am-radio-inline'>
			<input type='radio' name='radio10' value='male' data-am-ucheck> 男
			</label>
			<label class='am-radio-inline'>
				<input type='radio' name='radio10' value='female' data-am-ucheck> 女
			</label>
			<label class='am-radio-inline'>
				<input type='radio' name='radio10' value='secret' data-am-ucheck checked> 保密
			</label>
			<br>
			<br>
			<label for="password">个人简介:</label>
      <input type="text" name="text" id="text" value="" placeholder="简洁地展示你的风采">
      <br>
      <div class="am-cf">
        <input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
        <a href="#" ><input type="button" name="" value="浏览首页^_^?" class="am-btn am-btn-default am-btn-sm am-fr"></a>
      </div>
    </form>
    <hr>
    <p>© 2017 yhc.</p>
  </div>
</div>
</body>
</html>
