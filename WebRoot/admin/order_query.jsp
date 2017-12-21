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
<title>查询订单页面</title>
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
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：订单管理/查询订单</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
  		<tr>
   		 <td width="90%" align="left" valign="middle">
   		 
             <!--查询订单表单-->
	         <form method="post" action="order_query.jsp">
	            <span>订单编号：</span>
	         <input type="text" name="ordrId" value="" class="text-word">
	         
	      <!--  
                 <span>收件人：</span>
             <input type="text" name="addressee" value="" class="text-word">
          -->
             
	         <input name="queryBtn" type="submit" value="查询" class="text-but">
	         <input name="resetBtn" type="reset" value="重置" class="text-but">
	         </form>
             <!--//查询订单表单-->
         </td>
  		</tr>
	</table>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">


    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr>
        <th align="center" valign="middle" class="borderright">订单编号</th>
        <th align="center" valign="middle" class="borderright">收件人</th>
        <th align="center" valign="middle" class="borderright">地址</th>
        <th align="center" valign="middle" class="borderright">联系电话</th>
        <th align="center" valign="middle" class="borderright">总价</th>
        <th align="center" valign="middle" class="borderright">所属用户</th>
        <th align="center" valign="middle" class="borderright">订单状态</th>
        <th align="center" valign="middle">操作</th>
      </tr>

<%
	//String queryInfo = "001";
	request.setCharacterEncoding("UTF-8");
	String queryByID="00", queryByEr="";
	queryByID = request.getParameter("ordrId");
	queryByEr = request.getParameter("addressee");

 %>



<%
	ResultSet res = OrderDAO.orderQuery(queryByID, queryByEr);
	while(res.next()){
 %>

        <!--查看详情，删除订单表单-->
        <form method="post" action="order_info.jsp">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="center" valign="middle" class="borderright borderbottom"><%=res.getString("id") %></td>
        <td align="center" valign="middle" class="borderright borderbottom"><%=res.getString("receiverName") %></td>
        <td align="center" valign="middle" class="borderright borderbottom"><%=res.getString("receiverAddress") %></td>
        <td align="center" valign="middle" class="borderright borderbottom"><%=res.getString("receiverPhonr") %></td>
        <td align="center" valign="middle" class="borderright borderbottom"><%=res.getDouble("money") %></td>
        <td align="center" valign="middle" class="borderright borderbottom"><%=res.getString("user_id") %></td>
        <td align="center" valign="middle" class="borderright borderbottom"><%=res.getString("paystate") %></td>

          <td align="center" valign="middle" class="borderbottom">
                <input type="submit" name="queryInfo" value="查看订单详情">
            <span class="gray">&nbsp;|&nbsp;</span>
                <input type="submit" name="deleteOrder" value="删除" >
          </td>

      </tr>
            <input type="hidden" name="orderIdGet" value="<%=res.getString("id")%>">
        </form>
        <!--//查看详情，删除订单表单-->

  			<%
		      }
		     %>



    </table></td>
    </tr>
  <tr>
    <td align="left" valign="top" class="fenye">11 条数据 1/1 页&nbsp;&nbsp;<a href="#" target="mainFrame" onFocus="this.blur()">首页</a>&nbsp;&nbsp;<a href="#" target="mainFrame" onFocus="this.blur()">上一页</a>&nbsp;&nbsp;<a href="#" target="mainFrame" onFocus="this.blur()">下一页</a>&nbsp;&nbsp;<a href="#" target="mainFrame" onFocus="this.blur()">尾页</a></td>
  </tr>
</table>
</body>
</html>