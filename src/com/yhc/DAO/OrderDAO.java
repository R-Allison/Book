package com.yhc.DAO;

import java.security.interfaces.RSAKey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * ��Ŀ����: BookStore
 * ������: OrderDAO
 * ������: �����������ݿ������
 * ������: ��ï��
 * �޸���: snail
 * �޸�ʱ��: 2017��12��20�� ����5:37:58
 * �޸ı�ע: 
 * @version 1.0.0
 */

public class OrderDAO {

//	public static Connection conn = null;
	
	/**
	 * @throws SQLException 
	* @Title: orderQuery
	* @Description: TODO
	* @param  ��ѯ����   
	* @return ResultSet   
	* @throws
	 */
	public static ResultSet orderQuery(String queryByID, String queryByEr) throws SQLException {
		Connection conn = null;
		String orderId = null; 
		String addressee = null; 
		PreparedStatement pstmt = null;
		ResultSet res = null;
		conn = DBHelper.getConnection();
		
		if (queryByID != "") {
			String sqlString = "select * from orders where id like ?"; 
			pstmt = conn.prepareStatement(sqlString);
			pstmt.setString(1, "%"+queryByID+"%");
			res = pstmt.executeQuery();
		} else if(queryByEr != "") {
			String sqlString = "select * from orders where receiverName like ?"; 
			pstmt = conn.prepareStatement(sqlString);
			pstmt.setString(1, "%"+queryByEr+"%");
			res = pstmt.executeQuery();
		} else {
			String sqlString = "select * from orders where id like ? or receiverName like ?"; 
			pstmt = conn.prepareStatement(sqlString);
			pstmt.setString(1, "%"+queryByID+"%");
			pstmt.setString(2, "%"+queryByEr+"%");
			res = pstmt.executeQuery();
		}
		
//		String sqlString = "select * from orders where id like ? or receiverName like ?"; 
//		pstmt = conn.prepareStatement(sqlString);
//		pstmt.setString(1, queryInfo);
//		pstmt.setString(2, queryInfo);
//		res = pstmt.executeQuery();
//		System.out.println("er:"+queryByEr+"id:"+queryByID);
		if(res == null) {
			return null;
		} else {
			return res;
		}
		
	}
	
	/**
	* @Title: orderInfo
	* @Description: TODO
	* @param @param orderId
	* @param ��Ʒid 
	* @param @throws SQLException    
	* @return ResultSet   
	* @throws
	 */
	public static ResultSet orderInfo(String orderId) throws SQLException {
		PreparedStatement pstmt2 = null;
		ResultSet res = null;
		Connection conn = null;
		
		System.out.println("orderid:"+orderId);
		conn = DBHelper.getConnection();
		String sqlString2 = "select * from orders where id = ?";
		pstmt2 = conn.prepareStatement(sqlString2);
		pstmt2.setString(1, orderId);
		res = pstmt2.executeQuery();
		return res;
	}
	
	
	/**
	* @Title: deleteOrder
	* @Description: TODO
	* @param @param id
	* @param @return"ɾ���ɹ�"
	* @param @throws SQLException    
	* @return String   
	* @throws
	 */
	public static String deleteOrder(String id) throws SQLException {
		PreparedStatement pstmt3 = null;
		ResultSet res = null;
		Connection conn = null;
		
		conn = DBHelper.getConnection();
		String sqlString2 = "delete from orders where id=?";
		pstmt3 = conn.prepareStatement(sqlString2);
		pstmt3.setString(1, id);
		pstmt3.execute();
		return "ɾ�������ɹ�";
	}
	
	
	
	
	
}
