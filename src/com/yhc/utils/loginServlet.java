package com.yhc.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yhc.bean.User;

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
		String name = request.getParameter("name");
		if(password.equals(request.getParameter("password"))){
			User user = new User();
			user.setName(name);
			user.setPassword(password);
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("name", name);
			String autoLogin = request.getParameter("autologin");
			if(autoLogin != null){
				Cookie cookie = new Cookie("autologin", name+"-"+password);
				cookie.setMaxAge(Integer.parseInt(autoLogin));
				cookie.setPath(request.getContextPath());
				response.addCookie(cookie);
			}
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
