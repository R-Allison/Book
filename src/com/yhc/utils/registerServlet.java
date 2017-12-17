package com.yhc.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.handlers.ArrayHandler;

import com.yhc.DAO.BaseDao;
import com.yhc.DAO.DBHelper;

public class registerServlet extends HttpServlet {


	public registerServlet() {
		super();
	}


	public void destroy() {
		super.destroy();
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String sex = "保密";
		if(request.getParameter("radio10").equals("1")){
			sex = "男";
		}else if (request.getParameter("radio10").equals("2")) {
			sex = "男";
		}else {
			sex = "保密";
		}
		System.out.println(request.getParameter("introduce"));
		String sql="insert into user values(null,'"+request.getParameter("name")+"','"+request.getParameter("password")+"','"+sex+"','"+request.getParameter("email")+"','"+request.getParameter("tel")+"','"+request.getParameter("introduce")+"',null,1,'普通用户','"+df.format(new Date())+"')";
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("password"));
		System.out.println(sql);
		try {
			DBHelper.update(sql);
			response.sendRedirect("/BookStore/login.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/BookStore/register.jsp?error=1");
		}
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}


	public void init() throws ServletException {
	
	}

}
