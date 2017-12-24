/**
 * 类名称: AddCartServlet
 * 类描述:
 * 创建人: 茹韶燕
 * 修改人: HUAHUA
 * 修改时间:2017年12月22日 上午10:38:43
 * 修改备注:
 * @version 1.0.0
 */

package com.yhc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import com.yhc.DAO.ShoppingDao;
import com.yhc.bean.Products;
import com.yhc.bean.ShoppingCart;
import com.yhc.bean.User;

public class AddCartServlet extends HttpServlet {

	ShoppingDao shoppingDao;
	Products book;
	public AddCartServlet() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);//可以获取
		ShoppingCart cart;
		
		if (session.getAttribute("user")!=null) {
//			ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");

			//如果没有购物车，就创建新的购物车
			if(session.getAttribute("cart")==null){
				cart=new ShoppingCart();
				session.setAttribute("cart", cart);
			}
			
			//加入购物车的信息
			String bookId = request.getParameter("bookId");
			if(bookId!=null){
				try{
				cart = (ShoppingCart)session.getAttribute("cart");
				shoppingDao = new ShoppingDao();
				book = shoppingDao.getBookDetails(bookId);
				cart.add(bookId, book);//存进购物车
				}catch(SQLException e){
					e.printStackTrace();
				}
			}else {
				System.out.println("传送的书籍id为null");
			}
			response.sendRedirect("/BookStore/introduction.jsp?id="+bookId+"&msg=1");
			
			
		}else {
			
			response.sendRedirect("/BookStore/login.jsp");
		
		}
		
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         doGet(request, response);
	}

	
	public void init() throws ServletException {
		
	}

}
