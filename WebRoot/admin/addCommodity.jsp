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
<title>添加商品页面</title>
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
 request.setCharacterEncoding("gbk");
   //out.print(request.getParameter("delete"));
if(request.getParameter("name")!=null){
	//初始化
	String name = null, imgurl = null, description = null, category = null;
	double price = 0.0;
	int pnum = 0;
	
	name = request.getParameter("name");
	imgurl = request.getParameter("imgurl");
	description = request.getParameter("description");
	category = request.getParameter("category");
	price = Double.parseDouble(request.getParameter("price"));
	pnum = Integer.parseInt(request.getParameter("pnum"));

	Connection conn = DBHelper.getConnection();

	//利用现在时间戳生成ID
	java.util.Date now = new java.util.Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");//修改日期格式
	String Id = dateFormat.format(now);

	//添加进数据库        
	       //*                                                       
	String addsql = "insert into products(id,name,price,category,pnum,imgurl,description) values(?,?,?,?,?,?,?)";
	PreparedStatement psmt = conn.prepareStatement(addsql);
	psmt.setString(1, Id);
	psmt.setString(2, name);
	psmt.setDouble(3, price);
	psmt.setString(4, category);
	psmt.setInt(5, pnum);
	psmt.setString(6, imgurl);
	psmt.setString(7, description);
	int a = psmt.executeUpdate();
	if (a > 0)
		out.println("<a href='addCommodity.jsp'>添加成功！继续添加</a>");
	else
		out.println("<a href='addCommodity.jsp'>添加失败！</a>");
		
	conn.close();
	//*/
}
else{
%>
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">

  <tr>
    <td width="99%" align="left" valign="top">您的位置：商品管理/添加商品</</td>
  </tr>
  </table>
<form action="addCommodity.jsp" method="post">
<table>
	<tr>
		<td>商品名称：<input type="text" name="name" /></td>
		<td> 商品数量：<input type="text" name="pnum" /> </td>
	</tr>
	<tr>
		<td>商品价格：<input type="text" name="price" /> </td>
		<td>商品类别： <input type="text" name="category"></td>
	</tr>
	<tr>
		<td>商品图片：<input type="file" name="imgurl" /> </td>
	</tr>
	<tr>
		<td> 商品描述：<input type="text" name="description" /> </td>
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
<%} %>
</body>
</html>