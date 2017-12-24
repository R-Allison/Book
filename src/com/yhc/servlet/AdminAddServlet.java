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
 * ��Ŀ����: BookStore
 * ������: AdminAddServlet
 * ������: ��ӹ���Ա
 * ������: ��ï��
 * �޸���: snail
 * �޸�ʱ��: 2017��12��23�� ����6:41:52
 * �޸ı�ע: 
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
		//���session**********
	request.getSession().removeAttribute("��Ʒ����");
	request.getSession().removeAttribute("��������");
	request.getSession().removeAttribute("����Ա����");
	request.getSession().removeAttribute("���Թ���һ");
	request.getSession().removeAttribute("���Թ��ܶ�");
	request.getSession().removeAttribute("���Թ�����");
	request.getSession().removeAttribute("���Թ�����");
	
	String[] b = request.getParameterValues("hobby");
	for(int i = 0; i < b.length; i++) {
		//System.out.println(b[i]);
		if(b[i].equals("��Ʒ����")) {
			request.getSession().setAttribute("��Ʒ����", b[i]);
		}
		if(b[i].equals("��������")) {
			request.getSession().setAttribute("��������", b[i]);
		}
		if(b[i].equals("����Ա����")) {
			request.getSession().setAttribute("����Ա����", b[i]);
		}
		if(b[i].equals("���Թ���һ")) {
			request.getSession().setAttribute("���Թ���һ", b[i]);
		}
		if(b[i].equals("���Թ��ܶ�")) {
			request.getSession().setAttribute("���Թ��ܶ�", b[i]);
		}
		if(b[i].equals("���Թ�����")) {
			request.getSession().setAttribute("���Թ�����", b[i]);
		}
		if(b[i].equals("���Թ�����")) {
			request.getSession().setAttribute("���Թ�����", b[i]);
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
	
	//System.out.println(PublicClass.isInArray(result2, "��Ʒ����"));
	
	
//	System.out.println(PublicClass.isInArray(b, "��Ʒ����"));
//	System.out.println(PublicClass.isInArray(b, "��������"));
//	System.out.println(PublicClass.isInArray(b, "����Ա����"));
//	System.out.print(infoString);
//	System.out.print(request.getSession().getAttribute("��Ʒ����"));
		//*************
		
		
		
		try {
			
			ResultSet resultSet = AdminDAO.addAdmin(adminName, adminPwd, infoString);
			if(resultSet.next()) {
				//request.getSession().setAttribute("adminName", adminName);
				response.sendRedirect("/BookStore/admin/admin_query.jsp");
				System.out.println("��ӳɹ���");
			} else {
				//System.out.println("�û��������������");
				///BookStore/admin/login.jsp
				
				JOptionPane.showMessageDialog(null,"���ʧ�ܣ�","��Ϣ��",JOptionPane.INFORMATION_MESSAGE);
				response.sendRedirect("/BookStore/admin/admin_add.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("���ʧ�ܣ�");
			JOptionPane.showMessageDialog(null,"���ʧ�ܣ�","��Ϣ��",JOptionPane.INFORMATION_MESSAGE);

			
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
