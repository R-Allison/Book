
package com.yhc.DAO;

/**
 * 项目名称: librarymanagesystem
 * 类名称: DBConfig
 * 类描述: MySql数据库配置接口
 * 创建人: 
 * 修改人: 
 * 修改时间: 2017年6月18日 上午10:28:07
 * 修改备注: 
 * @version 1.0.0
 */
public interface DBConfig {
	//MySql数据库配置
	String driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/bookstore?useUnicode=true&characterEncoding=UTF-8";
	String user="root";
	String password="123456";

}
