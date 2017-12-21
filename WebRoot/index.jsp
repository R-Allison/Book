<%@page import="com.yhc.DAO.DBHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page  language="java" import="java.sql.SQLException,com.yhc.DAO.ShoppingDao,com.yhc.bean.*"%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1">
  <title>BookStore</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">

  <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
  <!--
  <link rel="canonical" href="http://www.example.com/">
  -->

  <link rel="stylesheet" href="assets/css/amazeui.min.css">
  <link rel="stylesheet" href="assets/css/app.css">
</head>
<body style="overflow:auto;">
<%

ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
ShoppingDao shoppingDao;
Products book;
//如果没有购物车，就创建新的购物车
if(cart==null){
	cart=new ShoppingCart();
	session.setAttribute("cart", cart);
}
//加入购物车的信息
String bookId = request.getParameter("bookId");
if(bookId!=null){
	try{
	shoppingDao = new ShoppingDao();
	book = shoppingDao.getBookDetails(bookId);
	cart.add(bookId, book);//存进购物车
	}catch(SQLException e){
		e.printStackTrace();
	}
}
 %>
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
			<a href="${pageContext.request.contextPath}/user.jsp"><i class='am-icon-user am-icon-fw'></i>个人中心</a>
			<a href="${pageContext.request.contextPath}/login.jsp"><i class='am-icon-shopping-cart  am-icon-fw'></i><span>购物车</span><strong id='J_MiniCartNum' class='h'></strong></a>
		</c:otherwise>
	</c:choose>
      </div>
  </div>
</header>
<div style="padding-left: 50px;">
	<ul class="am-nav am-nav-pills">
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=文学">文学</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=生活">生活</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=计算机">计算机</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=外语">外语</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=经营">经营</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=励志">励志</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=学术">学术</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=少儿">少儿</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=艺术">艺术</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=原版">原版</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=科技">科技</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=考试">考试</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=生活百科">生活百科</a></li>
  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=所有书籍">所有书籍</a></li>
</ul>
</div>
	<div class="am-u-sm-12">
		<hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
		  <div data-am-widget="slider" class="am-slider am-slider-default" data-am-slider='{&quot;animation&quot;:&quot;slide&quot;,&quot;slideshow&quot;:false}' >
		  <ul class="am-slides">
		      <li>
		        	<img src="images/201601151533595350_1000_220.jpg">
		          <div class="am-slider-desc">新华文化创意产业园</div>
		      </li>
		      <li>
		        	<img src="images/201601151535480823_1000_220.jpg">
		          <div class="am-slider-desc">XINlHUA</div>
		      </li>
		  </ul>
		</div>
		<div class="am-u-sm-5">
			  <div data-am-widget="intro"
			       class="am-intro am-cf am-intro-default"
			       >
			      <div class="am-intro-hd">
			        <h2 class="am-intro-title">公告栏</h2>
			      </div>
			
			    <div class="am-g am-intro-bd">
			        <div am-u-sm-7"><article>
			            	新华书店总店面向中国出版集团公司所属成员单位和社会公开招聘中层以下管理人员，具体岗位如下：
<br>
【新华书店总店】
<br>
招聘办公室、财务部、人力资源部、事业发展部、资产经营部、党群工作部(老龄工作部)中层以下管理岗位共13人，具体请详见附件一。
<br>
联系人：马凌：88362118；邓春妹：88367008
<br>
请下载附件，按规定填写后，发送《报名表》至公开招聘邮箱xhsdzdrs@163.com。
<br>
【新华国采教育网络科技有限责任公司】
<br>
招聘技术研发部、产品事业部、市场营销部、在线教育事业部、综合事务部(人力资源部)、财务部岗位共57人，具体请详见附件二。
<br>
联系人：康丹：88362203；孙蕊：88362203
<br>
请下载附件，按规定填写后，发送《报名表》至公开招聘邮箱hr@jiaocaichina.com。
<br>
【新华互联电子商务有限责任公司】
<br>
招聘综合事务部(人力资源部)、财务部、运营部、市场部、自营商品部、产品部、研发部岗位共27人，具体请详见附件三。
<br>
联系人：王钊、陈婧雯：88361526
<br>
请下载附件，按规定填写后，发送《报名表》至公开招聘邮箱xhhl@xhsdzd.com。
			            	</article></div>
			            	</div>
			  </div>
		</div>
		<div class="am-u-sm-7">
		<h2>热门书籍</h2>
		  <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
		  am-avg-md-3 am-avg-lg-4 am-gallery-default" data-am-gallery="{ pureview: true }" >
		      <%
	      		String sql = "select * from products limit 4";
				ResultSet rs = DBHelper.query(sql);
				while(rs.next()){
			%>
		      <li>
		        <div class="am-gallery-item">
		            <a href="${pageContext.request.contextPath}/introduction.jsp?id=<%=rs.getString("id") %>&name=<%=rs.getString("name") %>&url=<%=rs.getString("imgurl")%>&author=<%=rs.getString("author") %>&pnum=<%=rs.getString("pnum")%>&price=<%=rs.getString("price")%>" class="">
		              <img src="<%=rs.getString("imgurl") %>" title="<%=rs.getString("description") %>" style="height: 213px; width: 159px; " />
		                <h3 class="am-gallery-title"><%=rs.getString("name") %></h3>
		                <div class="am-gallery-desc"><%=rs.getString("author") %></div>
		            </a>
		        </div>
		      </li>
		      <%
		      }
		       %>
		  </ul>
	 </div>
	 <a href="${pageContext.request.contextPath}/home/shoppingcart.jsp">查看购物车</a>
	</div>
	
<footer class="am-margin-top">
  <hr/>
  <p class="am-text-center">
    <small>by The Ych Team.</small>
  </p>
</footer>
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
</body>
</html>
