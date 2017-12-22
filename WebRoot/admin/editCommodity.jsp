<%@page import="javax.persistence.Parameter"%>
<%@page import="com.yhc.DAO.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page pageEncoding="UTF-8" contentType="text/html;charset=utf8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>编辑商品页面</title>
<link href="css/css.css" type="text/css" rel="stylesheet" />
<link href="css/main.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="images/main/favicon.ico" />
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF; float:left}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(images/main/list_input.jpg) no-repeat left top; border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(images/main/add.jpg) no-repeat -3px 7px #548fc9; padding:0 10px 0 26px; height:40px; line-height:40px; font-size:14px; font-weight:bold; color:#FFF; float:right}
#search a:hover.add{ text-decoration:underline; color:#d2e9ff;}
#main-tab{ border:1px solid #eaeaea; background:#FFF; font-size:12px;}
#main-tab th{ font-size:12px; background:url(images/main/list_bg.jpg) repeat-x; height:32px; line-height:32px;}
#main-tab td{ font-size:12px; line-height:40px;}
#main-tab td a{ font-size:12px; color:#548fc9;}
#main-tab td a:hover{color:#565656; text-decoration:underline;}
.bordertop{ border-top:1px solid #ebebeb}
.borderright{ border-right:1px solid #ebebeb}
.borderbottom{ border-bottom:1px solid #ebebeb}
.borderleft{ border-left:1px solid #ebebeb}
.gray{ color:#dbdbdb;}
td.fenye{ padding:10px 0 0 0; text-align:right;}
.bggray{ background:#f9f9f9}
</style>
</head>
<body>
<%
  request.setCharacterEncoding("utf8");
  if(request.getParameter("id")!=null){
  //连接数据库
	Connection conn = DBHelper.getConnection();
	PreparedStatement psmt=conn.prepareStatement("select * from products where id=?;");
	psmt.setString(1, request.getParameter("id"));
	ResultSet rs=psmt.executeQuery();
	while(rs.next()){
  %>
  <table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">

  <tr>
    <td width="99%" align="left" valign="top">您的位置：商品管理/编辑商品</td>
  </tr>
  </table>
  <form action="editCommodity.jsp" method="post">
<table>
	<tr>
		<td>商品名称：<input type="text" name="name" value="<%=rs.getString("name")%>"/></td>
		<td> 商品数量：<input type="text" name="pnum" value="<%=rs.getString("pnum")%>"/> </td>
	</tr>
	<tr>
		<td>商品价格：<input type="text" name="price" value="<%=rs.getString("price")%>"/> </td>
		<td>商品类别： <input type="text" name="category" value="<%=rs.getString("category")%>"></td>
	</tr>
	<tr>
		<td>商品图片：<input type="file" name="imgurl" value="<%=rs.getString("imgurl")%>"/> </td>
	</tr>
	<tr>
		<td> 商品描述：<input type="text" name="description" value="<%=rs.getString("description")%>"/> </td>
		<input type="hidden" name="update" value="<%=request.getParameter("id") %>"/>
	</tr>
	<tr>
	<td>
	 	<input type="submit" value="确定" /> 
	 	<input type="reset" value="重置" /> 
		<a href="CommodityMan.jsp" target="mainFrame">
		<input type="button" value="返回" onclick="" /></a>
		</td>
	</tr>
	</table>
</form>
  <%
  }
  }else if(request.getParameter("update")!=null){
  //连接数据库
//out.println(request.getParameter("category"));
//out.println(request.getParameter("description"));
//*
	Connection conn = DBHelper.getConnection();
	PreparedStatement psmt=conn.prepareStatement("update products set name=?,price=?,category=?,pnum=?,imgurl=?,description=? where id=?;");
	psmt.setString(1, request.getParameter("name"));
	psmt.setDouble(2, Double.parseDouble(request.getParameter("price")));
	psmt.setString(3, request.getParameter("category"));
	psmt.setInt(4, Integer.parseInt(request.getParameter("pnum")));
	psmt.setString(5, request.getParameter("imgurl"));
	psmt.setString(6, request.getParameter("description"));
	psmt.setString(7, request.getParameter("update"));
	int a=psmt.executeUpdate();
		if (a > 0)
		out.println("<a href='CommodityMan.jsp'>编辑成功！</a>");
	else
		out.println("<a href='editCommodity.jsp？id="+request.getParameter("update")+"'>编辑失败！</a>");
		
	conn.close();
	//*/
  }else{
  out.print("访问出错！");
  }
   %>
</body>
</html>