/**
 * 类名称: ShoppingDao
 * 类描述: 购物车对数据库的处理
 * 创建人: 茹韶燕
 * 修改人: HUAHUA
 * 修改时间:2017年12月17日 下午9:28:15
 * 修改备注:
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
	
	//获取id的书的详细信息
	public Products getBookDetails(String bookId)throws SQLException{
		
		BaseDao basedao = new BaseDao();
		String sql="select * from products where id=?";
		Products products =(Products) basedao.query(sql,new BeanHandler(Products.class),bookId);
		return products;		
	}
	//购买放在购物车里面的书，将订单入库
	public void buyBooks(ShoppingCart cart)throws SQLException {
		Collection items = cart.getItems();
		
	}


}
