package com.yhc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yhc.DAO.DBHelper;

/** 
 * @ClassName:     SaveInfoServlet 
 * @Description:TODO(保存个人信息) 
 * @author:    zhou-jx
 * @date:        2017年12月24日 上午8:41:35 
 *  
 */
public class SaveInfoServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SaveInfoServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); 
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		if(name.length() != 0){
			DBHelper.update("update user set username = '"+name+"' where id = "+request.getParameter("id"));
			request.getSession().setAttribute("name", name);
		}
		if(email.length() != 0){
			DBHelper.update("update user set email = '"+email+"' where id = "+request.getParameter("id"));
		}
		if(tel.length() != 0){
			DBHelper.update("update user set teltphone = '"+tel+"' where id = "+request.getParameter("id"));
		}

		response.sendRedirect(request.getContextPath()+"/user.jsp");

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
