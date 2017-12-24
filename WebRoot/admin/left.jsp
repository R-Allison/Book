<%@page import="javax.persistence.Parameter"%>
<%@page import="com.yhc.DAO.*"%>
<%@page import="com.yhc.utils.*"%>
<%@page import="com.yhc.servlet.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧导航menu</title>
<link href="css/css.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/sdmenu.js"></script>
<script type="text/javascript">
	// <![CDATA[
	var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
	};
	// ]]>
</script>
<style type=text/css>
html{ SCROLLBAR-FACE-COLOR: #538ec6; SCROLLBAR-HIGHLIGHT-COLOR: #dce5f0; SCROLLBAR-SHADOW-COLOR: #2c6daa; SCROLLBAR-3DLIGHT-COLOR: #dce5f0; SCROLLBAR-ARROW-COLOR: #2c6daa;  SCROLLBAR-TRACK-COLOR: #dce5f0;  SCROLLBAR-DARKSHADOW-COLOR: #dce5f0; overflow-x:hidden;}
body{overflow-x:hidden; background:url(images/main/leftbg.jpg) left top repeat-y #f2f0f5; width:194px;}
</style>
</head>
<body onselectstart="return false;" ondragstart="return false;" oncontextmenu="return false;">
<div id="left-top">
	<div><img src="images/main/member.gif" width="44" height="44" /></div>
    <span>管理员：<%=request.getSession().getAttribute("adminName") %><br></span>
</div>
    <div style="float: left" id="my_menu" class="sdmenu">
    
    <%
    	String name = "";
    	Object loginName = request.getSession().getAttribute("adminName");
    	if(loginName == null){
    		//System.out.print(loginName.toString());
    		name = "111";
    	} else {
    		name = loginName.toString();
    		//System.out.print(name);
    	}
    	
    	
    
     %>
    
    
    
    <%
    ResultSet result2 = AdminDAO.adminQuery(name);
    String resArr[];
    while(result2.next()){
    	resArr = result2.getString("adminJurisdiction").split("-");
    if(PublicClass.isInArray(resArr, "商品管理")){
     %>
      <div >
        <span>商品管理</span>
        <a href="CommodityMan.jsp" target="mainFrame" onFocus="this.blur()">编辑管理商品</a>
      <!--   <a href="main_list.html" target="mainFrame" onFocus="this.blur()">ç¼è¾åå</a>
        <a href="main_info.html" target="mainFrame" onFocus="this.blur()">å é¤åå</a>
        <a href="main_message.html" target="mainFrame" onFocus="this.blur()">æ¥è¯¢åå</a> -->
      </div>
      <% } %>
      
      <%
      if(PublicClass.isInArray(resArr, "订单管理")){
       %>
      <div>
        <span>订单管理</span>
        <a href="order_query.jsp" target="mainFrame" onFocus="this.blur()">编辑管理订单</a>
        <!--  
        <a href="main_list.html" target="mainFrame" onFocus="this.blur()">æ¥çè®¢åè¯¦æ</a>
        <a href="main_info.html" target="mainFrame" onFocus="this.blur()">å é¤è®¢å</a>
        -->
      </div>
      <% } %>
      
       <%
      if(PublicClass.isInArray(resArr, "管理员管理")){
       %>
      <div>
        <span>管理员管理</span>
        <a href="admin_query.jsp" target="mainFrame" onFocus="this.blur()">查看管理员</a>
        <a href="admin_add.jsp" target="mainFrame" onFocus="this.blur()">添加管理员</a>
        <a href="admin_edit.jsp" target="mainFrame" onFocus="this.blur()">编辑管理员</a>
      </div>
      <% } %>
      
       <%
      if(PublicClass.isInArray(resArr, "测试功能一")){
       %>
      <div>
        <span>测试功能一</span>
      </div>
      <% } %>
      
       <%
      if(PublicClass.isInArray(resArr, "测试功能二")){
       %>
      <div>
        <span>测试功能二</span>
      </div>
      <% } %>
      
      
       <%
      if(PublicClass.isInArray(resArr, "测试功能三")){
       %>
      <div>
        <span>测试功能三</span>
      </div>
      <% } %>
      
       <%
      if(PublicClass.isInArray(resArr, "测试功能四")){
       %>
      <div>
        <span>测试功能四</span>
      </div>
      <% } %>
      
<%} %>
    </div>
</body>
</html>