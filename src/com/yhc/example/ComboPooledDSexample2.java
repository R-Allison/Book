package com.yhc.example;

import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class ComboPooledDSexample2 {
	public static DataSource ds = null;
	// ��ʼ��C3P0����Դ
	static {
		// ʹ��c3p0-config.xml�����ļ��е�named-config�ڵ���name���Ե�ֵ
		ComboPooledDataSource cpds = new ComboPooledDataSource("AA");
		ds = cpds;
	}
	public static void main(String[] args) throws SQLException {
		System.out.println(ds.getConnection());
	}
}
