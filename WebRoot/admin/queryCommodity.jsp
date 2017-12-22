<%@page import="javax.persistence.Parameter"%>
<%@page import="com.yhc.DAO.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page pageEncoding="UTF-8" contentType="text/html;charset=utf8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>查询商品页面</title>
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
	String query=null;
	query=request.getParameter("query");
 %>
<%
  //删除操作
  //out.print(request.getParameter("delete"));
  if(request.getParameter("delete")!=null){
  	//连接数据库
  	//out.println("删除成功！");
	 Connection conn = DBHelper.getConnection();
	PreparedStatement psmt=conn.prepareStatement("delete from products where id=?");
	psmt.setString(1,request.getParameter("delete"));
	int a = psmt.executeUpdate();
	if (a > 0)
		out.println("删除成功！");
	else
		out.println("删除失败！");
		
	conn.close(); 
  }
   %>
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">

  <tr>
    <td width="99%" align="left" valign="top">您的位置：商品管理/查询商品</</td>
  </tr>
  
  <tr>
    <td align="left" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
  		<tr>
   			<td width="90%" align="left" valign="middle">
	    	<form method="post" action="queryCommodity.jsp">
	    	<span>  查询：</span>
	    	<input type="text" name="query" class="text-word" value=<%=query %>>          
	    	<input name="queryBtn" type="submit" value="查询" class="text-but">
	    	<a href="CommodityMan.jsp" target="mainFrame"><input type="button" class="text-but" value="返回"/></a>
	    	</form>
			</td>
		</tr>
	</table>
    </td>
  </tr>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
  	<tr>
    	<th align="center" valign="middle" class="borderright">商品编号</td>
        <th align="center" valign="middle" class="borderright">商品名称</th>
        <th align="center" valign="middle" class="borderright">商品价格</th>
        <th align="center" valign="middle" class="borderright">商品分类</th>
        <th align="center" valign="middle" class="borderright">商品库存量</th>
        <th align="center" valign="middle" class="borderright">商品描述</th>
        <th align="center" valign="middle" class="borderright">编辑</th>
        <th align="center" valign="middle" class="borderright">删除</th>
 	</tr>
 	<%
	//连接数据库
	Connection conn = DBHelper.getConnection();
	PreparedStatement psmt=null;
	String sql=null;
	

	//out.print(request.getParameter("delete"));
	
if(!request.getParameter("query").equals("")){

sql="select * from products where id like ? or name like ? or price like ? or category like ?;";
psmt= conn.prepareStatement(sql);
psmt.setString(1, "%"+request.getParameter("query")+"%");
psmt.setString(2, "%"+request.getParameter("query")+"%");
psmt.setString(3, "%"+request.getParameter("query")+"%");
psmt.setString(4, "%"+request.getParameter("query")+"%");
}else{
sql="select * from products;";
psmt= conn.prepareStatement(sql);
}
	ResultSet rs=psmt.executeQuery();
	while(rs.next()){
		%>
	<tr>
    			<td align="center" valign="middle" class="borderright borderbottom"><%=rs.getString("id") %></td>
    			<td align="center" valign="middle" class="borderright borderbottom"><%=rs.getString("name") %></td>
    			<td align="center" valign="middle" class="borderright borderbottom"><%=rs.getString("price") %></td>
    			<td align="center" valign="middle" class="borderright borderbottom"><%=rs.getString("category") %></td>
    			<td align="center" valign="middle" class="borderright borderbottom"><%=rs.getString("pnum") %></td>
    			<td align="center" valign="middle" class="borderright borderbottom">
    			<%=rs.getString("description") %>
    			</td>
    			<td align="center" valign="middle" class="borderright borderbottom"><a href="editCommodity.jsp?id=<%=rs.getString("id") %>" target="mainFrame"><input type="button" value="点击编辑"/></a></td>
    			<%-- <td><a href="queryCommodity.jsp?delete=<%=rs.getString("id") %>"><input type="button" value="点击删除"/></a></td> --%>
    			<td align="center" valign="middle" class="borderright borderbottom"><a href="queryCommodity.jsp?delete=<%=rs.getString("id") %>&query=<%=request.getParameter("query") %>"><input type="button" value="点击删除"/></a></td>
    		</tr>
	<% 

}
conn.close();

 %>

	</table>
        
  <tr>
    <td align="left" valign="top" class="fenye">11 条数据 1/1 页&nbsp;&nbsp;<a href="#" target="mainFrame" onFocus="this.blur()">首页</a>&nbsp;&nbsp;<a href="#" target="mainFrame" onFocus="this.blur()">上一页</a>&nbsp;&nbsp;<a href="#" target="mainFrame" onFocus="this.blur()">下一页</a>&nbsp;&nbsp;<a href="#" target="mainFrame" onFocus="this.blur()">尾页</a></td>
  </tr>
</body>
</html>