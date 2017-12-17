package com.yhc.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.handlers.ArrayHandler;

import com.yhc.DAO.BaseDao;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
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

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		
		String userName = request.getParameter("name");
		String userPwd =request.getParameter("password");
		System.out.println(userName+userPwd);
		try {
			BaseDao basedao=new BaseDao();
			String sql="select * from user where username=? and password=?";
			Object[] arr=(Object[]) basedao.query(sql,new ArrayHandler(),new Object[]{userName,userPwd});
			for(int i = 0; i < arr.length; i++){ 
				System.out.print(arr[i] + ", ");  
	         } 
			
			if (arr.length>0) {
				response.sendRedirect("/BookStore/admin/index.html");
				System.out.println("登录成功！");
			} else {
				System.out.println("用户名或者密码错误！");
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("查询异常");
		}
			
	
		
		
		
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
