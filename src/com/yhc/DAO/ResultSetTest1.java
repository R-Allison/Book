package com.yhc.DAO;

import java.sql.SQLException;


import org.apache.commons.dbutils.handlers.ArrayHandler;
public class ResultSetTest1 {
	public static void testArrayHandler() throws SQLException {
		BaseDao basedao=new BaseDao();
		String sql="select * from user where username=?";
		Object[] arr=(Object[]) basedao.query(sql,new ArrayHandler(),new Object[]{"����"});
		for(int i = 0; i < arr.length; i++){ 
			System.out.print(arr[i] + ", ");  
         } 
	}
	public static void main(String[] args) throws SQLException {
		testArrayHandler();
	}
}