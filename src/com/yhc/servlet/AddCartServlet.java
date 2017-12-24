/**
 * ������: AddCartServlet
 * ������:
 * ������: ������
 * �޸���: HUAHUA
 * �޸�ʱ��:2017��12��22�� ����10:38:43
 * �޸ı�ע:
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
		HttpSession session = request.getSession(true);//���Ի�ȡ
		ShoppingCart cart;
		
		if (session.getAttribute("user")!=null) {
//			ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");

			//���û�й��ﳵ���ʹ����µĹ��ﳵ
			if(session.getAttribute("cart")==null){
				cart=new ShoppingCart();
				session.setAttribute("cart", cart);
			}
			
			//���빺�ﳵ����Ϣ
			String bookId = request.getParameter("bookId");
			if(bookId!=null){
				try{
				cart = (ShoppingCart)session.getAttribute("cart");
				shoppingDao = new ShoppingDao();
				book = shoppingDao.getBookDetails(bookId);
				cart.add(bookId, book);//������ﳵ
				}catch(SQLException e){
					e.printStackTrace();
				}
			}else {
				System.out.println("���͵��鼮idΪnull");
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
