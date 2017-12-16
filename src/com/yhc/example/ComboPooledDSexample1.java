package com.yhc.example;

import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class ComboPooledDSexample1 {

	public static DataSource ds = null;
	// ��ʼ��C3P0����Դ
	static {
		ComboPooledDataSource cpds = new ComboPooledDataSource();
		// �����������ݿ���Ҫ��������Ϣ
		try {
			cpds.setDriverClass("com.mysql.jdbc.Driver");
			cpds.setJdbcUrl("jdbc:mysql://localhost:3306/test");
			cpds.setUser("root");
			cpds.setPassword("root");
			// �������ӳصĲ���
			cpds.setInitialPoolSize(5);
			cpds.setMaxPoolSize(15);
			ds = cpds;
		} catch (Exception e) {
			throw new ExceptionInInitializerError(e);
		}
	}
	public static void main(String[] args) throws SQLException {
		// ��ȡ���ݿ����Ӷ���
		System.out.println(ds.getConnection());
	}

}
