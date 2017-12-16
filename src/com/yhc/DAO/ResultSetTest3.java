package com.yhc.DAO;
import java.sql.SQLException;

import org.apache.commons.dbutils.handlers.BeanHandler;

import com.yhc.bean.User;
 
public class ResultSetTest3 {
	public static void testBeanHandler() throws SQLException {
		BaseDao basedao=new BaseDao();
		String sql="select * from user where id=?";
		User user = 
           (User) basedao.query(sql,new BeanHandler(User.class),1);
		System.out.print("id为1的User对象的name值为："+user.getName()); 
     }
     public static void main(String[] args) throws SQLException {
		testBeanHandler ();
	}
}
