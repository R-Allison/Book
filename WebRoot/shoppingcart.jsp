<%@page import="com.yhc.bean.ShoppingCart"%>
<%@ page language="java" import="java.util.*,java.sql.SQLException,com.yhc.DAO.ShoppingDao,com.yhc.bean.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>购物车页面</title>
		<link href="assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/optstyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/assets/js/jquery.js"></script>
	</head>
	<body>
	<div>
<%                                                  
ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
//如果没有购物车，就创建新的购物车
if(session.getAttribute("cart")==null){
	cart=new ShoppingCart();
	session.setAttribute("cart", cart);
}
String bookId = request.getParameter("Remove"); 
ShoppingDao cartDao=null;
Products bd = null;
if(bookId !=null){
	try{
	cartDao = new ShoppingDao();
	bd=cartDao.getBookDetails(bookId);
	cart.remove(bookId);
	System.out.println("成功删除"+bd.getName());
	}catch(SQLException e){
	e.printStackTrace();
	}
}else if (request.getParameter("Clear")!=null){
	cart.clear();
	System.out.println("已经清空"+bd.getName());
} 

int num = cart.getNumberOfItems();
if(num>0){
%>
<div class="clear"></div>
			<div class="clear"></div>		
			购物车
			<div class="concent" style="">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">
								</div>
							</div>
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
<% 
Iterator i=cart.getItems().iterator();
while(i.hasNext()){
ShoppingCartItem item = (ShoppingCartItem)i.next();   
bd=(Products)item.getItem(); 
 %>
					<tr class="item-list">
							<div class="clear"></div>
							<div class="bundle-main">
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check" id="" name="pid" value="<%=bd.getId()%>" type="checkbox">
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="#" target="_blank"  class="J_MakePoint" data-point="tbcart.8.12">
												<img src="<%=bd.getImgurl()%>" class="itempic J_ItemImg"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="#" target="_blank"  class="item-title J_MakePoint" data-point="tbcart.8.11"><%=bd.getName()%></a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">
											<span class="sku-line"><%=bd.getAuthor()%></span>
											<span><%=bd.getDescription()%></span>
											
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0"><%=bd.getPrice()%></em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<input class="min am-btn" name="" type="button" value="-" />
													<input class="text_box" name="" type="text" value="<%=item.getQuantity()%>" style="width:30px;" />
													<input class="add am-btn" name="" type="button" value="+" />
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">117.00</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
											<a href="javascript:;" data-point-url="#" class="delete">
                  删除</a>
										</div>
									</li>
								</ul>				
							</div>
						</div>
					</tr>
					<%
}                            
}else{
%>
					
									<p>购物车内没有商品</p>
               <a href="../index.jsp">返回首页选购</a>
<% 
}
 %>
				<div class="clear"></div>

				<div class="float-bar-wrapper">
					<div id="J_SelectAll2" class="select-all J_SelectAll">
						<div class="cart-checkbox">
							<input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
							<label for="J_SelectAllCbx2"></label>
						</div>
					</div>
					<div class="float-bar-right">
						<div class="amount-sum">
							<span class="txt">已选商品</span>
							<em id="J_SelectedItemsCount"><%=num%></em><span class="txt">件</span>
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">合计:</span>
							<strong class="price">¥<em id="J_Total">0.00</em></strong>
						</div>
						
						
						<div class="btn-area">
							<a href="pay.html" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
								<span>结&nbsp;算</span></a>
						</div>
					</div>
				</div>
				
				
<a href="index.jsp">继续购物</a>	
				<div class="footer">
							<em>©2017 yhc.</em>
				</div>
			</div>
					</form>
				</div>
			</div> 
</div>
	</body>

</html>