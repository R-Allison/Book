package com.yhc.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yhc.DAO.UserDao;

public class loginServlet extends HttpServlet {


	public loginServlet() {
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
		String password =new UserDao().findUsername(request.getParameter("name"));
		System.out.println(password);
		System.out.println(request.getParameter("password"));
		if(password.equals(request.getParameter("password"))){
			response.sendRedirect("/BookStore/index.jsp");
		}else {
			response.sendRedirect("/BookStore/login.jsp?error=1");
		}
		out.println("");
		out.flush();
		out.close();
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
