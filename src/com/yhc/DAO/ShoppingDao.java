/**
 * ������: ShoppingDao
 * ������: ���ﳵ�����ݿ�Ĵ���
 * ������: ������
 * �޸���: HUAHUA
 * �޸�ʱ��:2017��12��17�� ����9:28:15
 * �޸ı�ע:
 * @version 1.0.0
 */

package com.yhc.DAO;

import java.sql.SQLException;
import java.util.Collection;

import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;

import org.apache.commons.dbutils.handlers.BeanHandler;

import com.yhc.bean.Products;
import com.yhc.bean.ShoppingCart;
import com.yhc.bean.User;

public class ShoppingDao {
	
	//��ȡid�������ϸ��Ϣ
	public Products getBookDetails(String bookId)throws SQLException{
		
		BaseDao basedao = new BaseDao();
		String sql="select * from products where id=?";
		Products products =(Products) basedao.query(sql,new BeanHandler(Products.class),bookId);
		return products;		
	}
	//������ڹ��ﳵ������飬���������
	public void buyBooks(ShoppingCart cart)throws SQLException {
		Collection items = cart.getItems();
		
	}


}
