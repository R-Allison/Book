<%@page import="javax.persistence.Parameter"%>
<%@page import="com.yhc.DAO.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="/CustomTags" prefix="simple"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主要内容区main</title>
<link href="css/css.css" type="text/css" rel="stylesheet" />
<link href="css/main.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="images/main/favicon.ico" />
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#main{ font-size:12px;}
#main span.time{ font-size:14px; color:#528dc5; width:100%; padding-bottom:10px; float:left}
#main div.top{ width:100%; background:url(images/main/main_r2_c2.jpg) no-repeat 0 10px; padding:0 0 0 15px; line-height:35px; float:left}
#main div.sec{ width:100%; background:url(images/main/main_r2_c2.jpg) no-repeat 0 15px; padding:0 0 0 15px; line-height:35px; float:left}
.left{ float:left}
#main div a{ float:left}
#main span.num{  font-size:30px; color:#538ec6; font-family:"Georgia","Tahoma","Arial";}
.left{ float:left}
div.main-tit{ font-size:14px; font-weight:bold; color:#4e4e4e; background:url(images/main/main_r4_c2.jpg) no-repeat 0 33px; width:100%; padding:30px 0 0 20px; float:left}
div.main-con{ width:100%; float:left; padding:10px 0 0 20px; line-height:36px;}
div.main-corpy{ font-size:14px; font-weight:bold; color:#4e4e4e; background:url(images/main/main_r6_c2.jpg) no-repeat 0 33px; width:100%; padding:30px 0 0 20px; float:left}
div.main-order{ line-height:30px; padding:10px 0 0 0;}
</style>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="main">
  <tr>
    <td colspan="2" align="left" valign="top">
    <h1>
    <%request.setCharacterEncoding("utf-8");
			String username=request.getSession().getAttribute("adminName").toString();%>
		<font size="4" color="blue"> 
		<simple:greetingAtt name="<%=username%>" />
		<div id="clock" ></div>
    </h1>
    </td>
  </tr>
  
</table>

<script type="text/javascript">
function display(clock){
    var now=new Date();   //创建Date对象
    var year=now.getFullYear(); //获取年份
    var month=now.getMonth(); //获取月份
    var date=now.getDate();  //获取日期
    var day=now.getDay();  //获取星期
    var hour=now.getHours(); //获取小时
    var minu=now.getMinutes(); //获取分钟
    var sec=now.getSeconds(); //获取秒钟
    month=month+1;
    var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
    var week=arr_week[day];  //获取中文的星期
    var time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec; //组合系统时间
    clock.innerHTML="当前时间："+time; //显示系统时间
}
window.onload=function(){
    window.setInterval("display(clock)", 1000);
}
</script>



</body>
</html>