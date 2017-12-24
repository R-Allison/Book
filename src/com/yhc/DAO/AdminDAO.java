package com.yhc.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 项目名称: BookStore
 * 类名称: AdminDAO
 * 类描述: 管理员板块的数据库DAO
 * 创建人: 邵茂仁
 * 修改人: snail
 * 修改时间: 2017年12月23日 下午4:32:44
 * 修改备注: 
 * @version 1.0.0
 */
public class AdminDAO {

	/**
	* @Title: adminQuery
	* @Description: 管理员登录
	* @param @param adminName
	* @param @param adminPwd
	* @param @return ResultSet
	* @param @throws SQLException    
	* @return ResultSet   
	* @throws SQLException
	 */
	public static ResultSet adminLogin(String adminName, String adminPwd) throws SQLException {
		Connection conn = null;
		String orderId = null; 
		String addressee = null; 
		PreparedStatement pstmt = null;
		ResultSet res = null;
		conn = DBHelper.getConnection();
		
		String sqlString = "select * from admin where adminName=? and adminPwd=?";
		pstmt = conn.prepareStatement(sqlString);
		pstmt.setString(1, adminName);
		pstmt.setString(2, adminPwd);
		res = pstmt.executeQuery();
		return res;
	}
	
	/**
	* @Title: adminQuery
	* @Description: 查询管理员信息
	* @param @param adminName
	* @param @return
	* @param @throws SQLException    
	* @return ResultSet   
	* @throws SQLException
	 */
	public static ResultSet adminQuery(String adminName) throws SQLException {
		Connection conn = null;
		String orderId = null; 
		String addressee = null; 
		PreparedStatement pstmt = null;
		ResultSet res = null;
		conn = DBHelper.getConnection();
		
		String sqlString2 = "select * from admin where adminName like ?";
		pstmt = conn.prepareStatement(sqlString2);
		pstmt.setString(1, "%" + adminName + "%");
		res = pstmt.executeQuery();
		return res;
	}
	
	/**
	* @Title: deleteAdmin
	* @Description: 删除管理员信息
	* @param @param adminName
	* @param @return
	* @param @throws SQLException    
	* @return String   
	* @throws SQLException
	 */
	public static String deleteAdmin(String adminName) throws SQLException {
		PreparedStatement pstmt3 = null;
		ResultSet res = null;
		Connection conn = null;
		
		conn = DBHelper.getConnection();
		String sqlString2 = "delete from admin where adminName=?";
		pstmt3 = conn.prepareStatement(sqlString2);
		pstmt3.setString(1, adminName);
		pstmt3.execute();
		return "删除成功";
	}
	
	/**
	* @Title: alterJur
	* @Description: 修改用户权限
	* @param @param adminName
	* @param @throws SQLException    
	* @return void   
	* @throws SQLException
	 */
	public static void alterJur(String jurisdiction ,String adminName) throws SQLException {
		PreparedStatement pstmt4 = null;
		ResultSet res = null;
		Connection conn = null;
		
		conn = DBHelper.getConnection();
		String sqlString4 = "update admin set adminJurisdiction = ? where adminName=?";
		pstmt4 = conn.prepareStatement(sqlString4);
		pstmt4.setString(1, jurisdiction);
		pstmt4.setString(2, adminName);
		pstmt4.execute();
	}
	
	public static ResultSet addAdmin(String adminName, String adminPwd , String jur) throws SQLException {
		Connection conn = null;
		String orderId = null; 
		String addressee = null; 
		PreparedStatement pstmt5 = null, pst = null;
		ResultSet res = null;
		conn = DBHelper.getConnection();
		
		String sqlString5 = "insert into admin values(?, ?, ?)";
		pstmt5 = conn.prepareStatement(sqlString5);
		pstmt5.setString(1, adminName);
		pstmt5.setString(2, adminPwd);
		pstmt5.setString(3, jur);
		
		pstmt5.execute();
		
		String sql5 = "select * from admin where adminName=?";
		pst = conn.prepareStatement(sql5);
		pst.setString(1, adminName);
		res = pst.executeQuery();
		return res;
	}
	
	
	
	
}
