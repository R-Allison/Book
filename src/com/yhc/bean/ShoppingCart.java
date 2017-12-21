/**
 * 类名称: ShoppingCart
 * 类描述: 对购物车的业务操作
 * 创建人: 茹韶燕
 * 修改人: HUAHUA
 * 修改时间:2017年12月18日 上午3:45:32
 * 修改备注:
 * @version 1.0.0
 */

package com.yhc.bean;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;


public class ShoppingCart {
	HashMap items = null;//初始化存放购物车书籍目录
	int numberOfItems = 0;//购物车的条目数
	List results;

	public ShoppingCart() {
		items = new  HashMap();
	}

	//添加书籍到购物车
	public synchronized void add(String bookId,Products book){
		//如果原来存在这个书籍
		if (items.containsKey(bookId)) {//构造id为主键索引
			ShoppingCartItem scitem = (ShoppingCartItem) items.get(bookId);	
			scitem.incrementQuantity();//增加数量
			System.out.println("书籍购物车，数量为:"+scitem.getQuantity());
		}else {
			//如果不存在这个书籍
			ShoppingCartItem newItem = new ShoppingCartItem(book);
			items.put(bookId, newItem);
			System.out.println("书籍购物车，数量为:"+newItem.getQuantity());
		}
		numberOfItems++;
	}
	
	//删除购物车中的书籍
	public synchronized void remove(String bookId) {
		if (items.containsKey(bookId)) {//通过索引去找这个书
			ShoppingCartItem scitem = (ShoppingCartItem) items.get(bookId);
			scitem.decrementQuantity();//调用这个单个商品子项的方法减少数量
			if (scitem.getQuantity()<=0) {//当数量小于等于0的时候就删除书籍
				items.remove(bookId);//用hashmap的方法				
			}
			numberOfItems--;	//同时总数量减少
		}
		
	}
	
	//遍历每一个商品的子项，然后存到一个数组里，把这个返回给调用的对象
	public synchronized List getItems() {
		results = new ArrayList();
		Iterator i = this.items.values().iterator();
		//使用迭代器遍历
		while ( i.hasNext()) {
			results.add(i.next());	
		}	
//		System.out.println("购物车的商品信息："+results);
	return results;	
	}
	
	protected void finalize()throws Throwable {
		items.clear();
		
	}
	
	//得到总数量
	public synchronized int getNumberOfItems() {
		numberOfItems= 0;
		for (Iterator i = getItems().iterator(); i.hasNext();) {
			ShoppingCartItem item = (ShoppingCartItem) i.next();
			numberOfItems += item.getQuantity();
			System.out.println("购物车一共有多少个子项："+numberOfItems);
			
		}
		return numberOfItems;
		
	}
	
	//计算总价钱
	public synchronized double getTotal() {
		double amount=0.0;//初始化
		for (Iterator i = getItems().iterator(); i.hasNext();) {
			ShoppingCartItem item = (ShoppingCartItem) i.next();
			Products book=(Products) item.getItem();
			amount += (item.getQuantity()*book.getPrice());//计算叠加
			System.out.println("总价："+amount);
			
		}
		return roundOff(amount);//调用这个方法格式化价格
		
	}
	
	//格式化价格输出
	private double roundOff(double x){
		long val=Math.round(x*100);
		return val/100.0;
	}
	
	//清理购物车
	public synchronized void clear() {
		System.out.println("清空购物车");
		items.clear();//同hashmap里的清空
		numberOfItems=0;//初始化购物车
	}
}
