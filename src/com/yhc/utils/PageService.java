package com.yhc.utils;

import java.sql.SQLException;
import java.util.List;

import com.yhc.DAO.PageDao;
import com.yhc.bean.PageBean;
import com.yhc.bean.Products;

public class PageService {
	PageDao pageDao = new PageDao();
	public PageBean findAllProductWithPage(int pageNum, int pageSize) throws SQLException{
		List<Products> list = pageDao.findAllProducts();
		int totalRecord = list.size();
		
		PageBean pb = new PageBean(pageNum, pageSize, totalRecord);
		int startIndex = pb.getStartIndex();
		pb.setList(pageDao.findAll(startIndex, pageSize));
		
		return pb;
	}
}
