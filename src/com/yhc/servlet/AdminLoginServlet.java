package com.yhc.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.commons.dbutils.handlers.ArrayHandler;

import com.yhc.DAO.AdminDAO;
import com.yhc.DAO.BaseDao;

/**
 * 项目名称: BookStore
 * 类名称: AdminLoginServlet
 * 类描述: 管理员登录
 * 创建人: 邵茂仁
 * 修改人: snail
 * 修改时间: 2017年12月23日 下午3:48:39
 * 修改备注: 
 * @version 1.0.0
 */
public class AdminLoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminLoginServlet() {
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
		
		String adminName = request.getParameter("adminName");
		String adminPwd =request.getParameter("adminPwd");
		System.out.println(adminName+adminPwd);
		try {
			
			ResultSet resultSet = AdminDAO.adminLogin(adminName, adminPwd);
			if(resultSet.next()) {
				request.getSession().setAttribute("adminName", adminName);
				response.sendRedirect("/BookStore/admin/index.jsp");
				System.out.println("登录成功！");
			} else {
				System.out.println("用户名或者密码错误！");
				///BookStore/admin/login.jsp
				
				JOptionPane.showMessageDialog(null,"用户名或者密码错误！","消息框",JOptionPane.INFORMATION_MESSAGE);
				response.sendRedirect("/BookStore/admin/login.jsp");
			}
			
			
//			BaseDao basedao=new BaseDao();
//			String sql="select * from admin where adminName=? and adminPwd=?";
//			Object[] arr=(Object[]) basedao.query(sql,new ArrayHandler(),new Object[]{adminName,adminPwd});
//			for(int i = 0; i < arr.length; i++){ 
//				System.out.print(arr[i] + ", ");  
//	         } 
//			
//			if (arr.length>0) {
//				request.getSession().setAttribute("adminName", adminName);
//				response.sendRedirect("/BookStore/admin/index.html");
//				System.out.println("登录成功！");
//				
//		
//				
//			} else {
//				System.out.println("用户名或者密码错误！");
//				JOptionPane.showMessageDialog(null,"用户名或者密码错误！","消息框",JOptionPane.INFORMATION_MESSAGE);
			//}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("查询异常");
			JOptionPane.showMessageDialog(null,"查询异常","消息框",JOptionPane.INFORMATION_MESSAGE);

			
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
