package com.yhc.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yhc.bean.Products;

/** 
 * @ClassName:     PageDao 
 * @Description:TODO(查询分页数据) 
 * @author:    zhou-jx
 * @date:        2017年12月24日 上午9:04:48 
 *  
 */
public class PageDao {
	
	
//	不返回数目和价格
	public List findAllProducts() throws SQLException{
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();  
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		conn = DBHelper.getConnection();
		String sqlString2 = "select * from products";
		pstmt = conn.prepareStatement(sqlString2);
		rs = pstmt.executeQuery();
		ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据  
        int columnCount = md.getColumnCount();   //获得列数   
		while(rs.next())
        { 
			Map<String,Object> rowData = new HashMap<String,Object>();  
            for (int i = 1; i <= columnCount; i++) {  
                rowData.put(md.getColumnName(i), rs.getObject(i));  
            }  
            list.add(rowData);  
         }
		return list;
	}
	
	public List findAll(int Index,int Size) throws SQLException{
		List<Map<String, Object>> list2 = new ArrayList<Map<String,Object>>();  
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		Connection conn2 = null;
		conn2 = DBHelper.getConnection();
		String sqlString2 = "select * from products LIMIT "+Index+","+Size+"";
		pstmt2 = conn2.prepareStatement(sqlString2);
		rs = pstmt2.executeQuery();
		ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据  
        int columnCount = md.getColumnCount();   //获得列数   
		while(rs.next())
        { 
			Map<String,Object> rowData = new HashMap<String,Object>();  
            for (int i = 1; i <= columnCount; i++) {  
                rowData.put(md.getColumnName(i), rs.getObject(i));  
            }  
            list2.add(rowData);  
         }
		return list2;
	}
}
