<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <title>user</title>
	  <meta name="description" content=" user 页面">
	  <meta name="keywords" content="user">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <meta name="renderer" content="webkit">
	  <meta http-equiv="Cache-Control" content="no-siteapp" />
	  <link rel="icon" type="image/png" href="assets/i/favicon.png">
	  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
	  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
	  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
	  <link rel="stylesheet" href="assets/css/admin.css">
  </head>
  
  <body style="overflow:auto;">
    <header class="am-topbar" style="font-size: 20px;">
  <h1 class="am-topbar-brand">
    <a href="#"><h1>BookStore</h1></a>
  </h1>
    <div class="am-topbar-right am-topbar-brand">
      <c:choose>
		<c:when test="${sessionScope.user == null}">
			<a href="${pageContext.request.contextPath}/login.jsp">
			<button class="am-btn am-btn-primary am-topbar-btn am-btn-sm">登陆</button>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class='am-icon-user am-icon-fw'></i>个人中心</a>
			<a href="#"><i class='am-icon-shopping-cart  am-icon-fw'></i><span>购物车</span><strong id='J_MiniCartNum' class='h'></strong></a>
		</c:otherwise>
	</c:choose>
      </div>
  </div>
</header>
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small></div>
      </div>

      <hr/>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
          <!--占位-->
        </div>

        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
          <form class="am-form am-form-horizontal">
            <div class="am-form-group">
              <label for="user-name" class="am-u-sm-3 am-form-label">姓名 / Name</label>
              <div class="am-u-sm-9">
                <input type="text" id="user-name" placeholder="姓名 / Name">
                <small>输入你的名字，让我们记住你。</small>
              </div>
            </div>

            <div class="am-form-group">
              <label for="user-email" class="am-u-sm-3 am-form-label">电子邮件 / Email</label>
              <div class="am-u-sm-9">
                <input type="email" id="user-email" placeholder="输入你的电子邮件 / Email">
                <small>邮箱你懂得...</small>
              </div>
            </div>

            <div class="am-form-group">
              <label for="user-phone" class="am-u-sm-3 am-form-label">电话 / Telephone</label>
              <div class="am-u-sm-9">
                <input type="tel" id="user-phone" placeholder="输入你的电话号码 / Telephone">
              </div>
            </div>

            <div class="am-form-group">
              <label for="user-QQ" class="am-u-sm-3 am-form-label">QQ</label>
              <div class="am-u-sm-9">
                <input type="number" pattern="[0-9]*" id="user-QQ" placeholder="输入你的QQ号码">
              </div>
            </div>

            <div class="am-form-group">
              <label for="user-weibo" class="am-u-sm-3 am-form-label">微博 / Twitter</label>
              <div class="am-u-sm-9">
                <input type="text" id="user-weibo" placeholder="输入你的微博 / Twitter">
              </div>
            </div>

            <div class="am-form-group">
              <label for="user-intro" class="am-u-sm-3 am-form-label">简介 / Intro</label>
              <div class="am-u-sm-9">
                <textarea class="" rows="5" id="user-intro" placeholder="输入个人简介"></textarea>
                <small>250字以内写出你的一生...</small>
              </div>
            </div>

            <div class="am-form-group">
              <div class="am-u-sm-9 am-u-sm-push-3">
                <button type="button" class="am-btn am-btn-primary">保存修改</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>


    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left">© 2017 Yhc.</p>
    </footer>

  </body>
</html>
