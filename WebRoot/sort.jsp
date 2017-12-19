<%@page import="java.sql.ResultSet"%>
<%@page import="com.yhc.DAO.DBHelper"%>
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
	  <title>book</title>
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
		
		<div class="am-cf am-padding am-padding-bottom-0">
        	<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">类别</strong> / <small>${param.l}</small></div>
      	</div>
      	<hr>
		<div class="am-u-sm-12">
			<ul class=" am-avg-lg-6 am-gallery-default"  >
		      <%	
		      		String sql = "select * from products where category = '"+request.getParameter("l")+"'";
		      		if(request.getParameter("l").equals("所有书籍")){
		      			sql = "select * from products ";
		      		}
					ResultSet rs = DBHelper.query(sql);
					while(rs.next()){
				 %>
		      <li>
		        <div class="am-gallery-item">
		            <a href="<%=rs.getString("imgurl") %>" class="">
		              <img src="<%=rs.getString("imgurl") %>" style="height: 213px; width: 159px; "/>
		                <h3 class="am-gallery-title"><%=rs.getString("name") %></h3>
		            </a>
		        </div>
		      </li>
		      <%} %>
		  </ul>
		</div>
  </body>
</html>
