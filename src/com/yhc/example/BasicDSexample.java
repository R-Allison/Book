package com.yhc.example;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
 
public class BasicDSexample {
	public static DataSource ds = null;
	static {
		// ��ȡDBCP����Դʵ�������
		BasicDataSource bds = new BasicDataSource();
		// �����������ݿ���Ҫ��������Ϣ
		bds.setDriverClassName("com.mysql.jdbc.Driver");
		bds.setUrl("jdbc:mysql://localhost:3306/test");
		bds.setUsername("root");
		bds.setPassword("root");
		// �������ӳصĲ���
		bds.setInitialSize(5);
		bds.setMaxActive(5);
		ds = bds;
	}
	public static void main(String[] args) throws SQLException {
		// ��ȡ���ݿ����Ӷ���
		Connection conn = ds.getConnection();
		//��ȡ���ݿ�������Ϣ
		DatabaseMetaData metaData = conn.getMetaData();
		//��ӡ���ݿ�������Ϣ
		System.out.println(metaData.getURL()
             +",UserName="+metaData.getUserName()
             +","+metaData.getDriverName());
	}
}
