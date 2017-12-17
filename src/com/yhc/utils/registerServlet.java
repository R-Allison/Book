package com.yhc.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.handlers.ArrayHandler;

import com.yhc.DAO.BaseDao;

public class registerServlet extends HttpServlet {


	public registerServlet() {
		super();
	}


	public void destroy() {
		super.destroy();
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		BaseDao baseDao = new BaseDao();
		String sql="insert into user values(null,?,?,null,null,null,null,null,null,null,null)";
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("password"));
		try {
			baseDao.update(sql,request.getParameter("name"),request.getParameter("password"));
			response.sendRedirect("/BookStore/index.jsp");
		} catch (SQLException e) {
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
