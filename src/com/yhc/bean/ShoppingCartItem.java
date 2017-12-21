/**
 * 类名称: ShoppingCartItem
 * 类描述: 对购物车的保存的每一项图书进行数量统计和计算
 * 创建人: 茹韶燕
 * 修改人: HUAHUA
 * 修改时间:2017年12月18日 上午3:57:23
 * 修改备注:
 * @version 1.0.0
 */

package com.yhc.bean;

public class ShoppingCartItem {
	Object item;//书籍对象
	int quantity;// 书籍数量
	public ShoppingCartItem(Object anItem) {
		item = anItem;
		quantity = 1;//初始化
	}

	//增加数量
	public void incrementQuantity() {
		quantity++;
	}
	//减少数量
	public void decrementQuantity() {
		quantity--;
	}
	//对应的get set方法
	public Object getItem() {
		return item;
	}

	public void setItem(Object item) {
		this.item = item;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
