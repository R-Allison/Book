/**
 * ������: ShoppingCartItem
 * ������: �Թ��ﳵ�ı����ÿһ��ͼ���������ͳ�ƺͼ���
 * ������: ������
 * �޸���: HUAHUA
 * �޸�ʱ��:2017��12��18�� ����3:57:23
 * �޸ı�ע:
 * @version 1.0.0
 */

package com.yhc.bean;

public class ShoppingCartItem {
	Object item;//�鼮����
	int quantity;// �鼮����
	public ShoppingCartItem(Object anItem) {
		item = anItem;
		quantity = 1;//��ʼ��
	}

	//��������
	public void incrementQuantity() {
		quantity++;
	}
	//��������
	public void decrementQuantity() {
		quantity--;
	}
	//��Ӧ��get set����
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
