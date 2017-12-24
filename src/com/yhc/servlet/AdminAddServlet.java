package com.yhc.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.taglibs.standard.lang.jstl.test.StaticFunctionTests;

import com.yhc.DAO.AdminDAO;
import com.yhc.utils.PublicClass;

/**
 * 项目名称: BookStore
 * 类名称: AdminAddServlet
 * 类描述: 添加管理员
 * 创建人: 邵茂仁
 * 修改人: snail
 * 修改时间: 2017年12月23日 下午6:41:52
 * 修改备注: 
 * @version 1.0.0
 */
public class AdminAddServlet extends HttpServlet {

	
	public static String[] result2;
	/**
	 * Constructor of the object.
	 */
	public AdminAddServlet() {
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
		
		//System.out.println(adminName+adminPwd);
		
		//************
		String infoString = "";
		//清空session**********
	request.getSession().removeAttribute("商品管理");
	request.getSession().removeAttribute("订单管理");
	request.getSession().removeAttribute("管理员管理");
	request.getSession().removeAttribute("测试功能一");
	request.getSession().removeAttribute("测试功能二");
	request.getSession().removeAttribute("测试功能三");
	request.getSession().removeAttribute("测试功能四");
	
	String[] b = request.getParameterValues("hobby");
	for(int i = 0; i < b.length; i++) {
		//System.out.println(b[i]);
		if(b[i].equals("商品管理")) {
			request.getSession().setAttribute("商品管理", b[i]);
		}
		if(b[i].equals("订单管理")) {
			request.getSession().setAttribute("订单管理", b[i]);
		}
		if(b[i].equals("管理员管理")) {
			request.getSession().setAttribute("管理员管理", b[i]);
		}
		if(b[i].equals("测试功能一")) {
			request.getSession().setAttribute("测试功能一", b[i]);
		}
		if(b[i].equals("测试功能二")) {
			request.getSession().setAttribute("测试功能二", b[i]);
		}
		if(b[i].equals("测试功能三")) {
			request.getSession().setAttribute("测试功能三", b[i]);
		}
		if(b[i].equals("测试功能四")) {
			request.getSession().setAttribute("测试功能四", b[i]);
		}
		
		infoString += b[i] + "-";
		
		
	} 
	
//	StringTokenizer st = new StringTokenizer(infoString, "-");
//	String result[] = new String[st.countTokens()];
//	int j = 0;
//	
//	while(st.hasMoreTokens()){
//		String sttr = st.nextToken();
//		//System.out.println("****"+sttr);
////		for(int j = 0; j < st.countTokens(); j++) {
//			result[j] = st.nextToken();
//			j++;
////		}
//	}
	
//	for(int k = 0; k < result.length; k++) {
//		
//		System.out.println("/***/***////"+result[k]);
//	}
	
	
	result2 = infoString.split("-");
	for (int x=0; x<result2.length; x++)
        System.out.println("--"+result2[x]);
	
	//System.out.println(PublicClass.isInArray(result2, "商品管理"));
	
	
//	System.out.println(PublicClass.isInArray(b, "商品管理"));
//	System.out.println(PublicClass.isInArray(b, "订单管理"));
//	System.out.println(PublicClass.isInArray(b, "管理员管理"));
//	System.out.print(infoString);
//	System.out.print(request.getSession().getAttribute("商品管理"));
		//*************
		
		
		
		try {
			
			ResultSet resultSet = AdminDAO.addAdmin(adminName, adminPwd, infoString);
			if(resultSet.next()) {
				//request.getSession().setAttribute("adminName", adminName);
				response.sendRedirect("/BookStore/admin/admin_query.jsp");
				System.out.println("添加成功！");
			} else {
				//System.out.println("用户名或者密码错误！");
				///BookStore/admin/login.jsp
				
				JOptionPane.showMessageDialog(null,"添加失败！","消息框",JOptionPane.INFORMATION_MESSAGE);
				response.sendRedirect("/BookStore/admin/admin_add.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("添加失败！");
			JOptionPane.showMessageDialog(null,"添加失败！","消息框",JOptionPane.INFORMATION_MESSAGE);

			
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
