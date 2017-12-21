/**
 * ������: ShoppingCart
 * ������: �Թ��ﳵ��ҵ�����
 * ������: ������
 * �޸���: HUAHUA
 * �޸�ʱ��:2017��12��18�� ����3:45:32
 * �޸ı�ע:
 * @version 1.0.0
 */

package com.yhc.bean;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;


public class ShoppingCart {
	HashMap items = null;//��ʼ����Ź��ﳵ�鼮Ŀ¼
	int numberOfItems = 0;//���ﳵ����Ŀ��
	List results;

	public ShoppingCart() {
		items = new  HashMap();
	}

	//����鼮�����ﳵ
	public synchronized void add(String bookId,Products book){
		//���ԭ����������鼮
		if (items.containsKey(bookId)) {//����idΪ��������
			ShoppingCartItem scitem = (ShoppingCartItem) items.get(bookId);	
			scitem.incrementQuantity();//��������
			System.out.println("�鼮���ﳵ������Ϊ:"+scitem.getQuantity());
		}else {
			//�������������鼮
			ShoppingCartItem newItem = new ShoppingCartItem(book);
			items.put(bookId, newItem);
			System.out.println("�鼮���ﳵ������Ϊ:"+newItem.getQuantity());
		}
		numberOfItems++;
	}
	
	//ɾ�����ﳵ�е��鼮
	public synchronized void remove(String bookId) {
		if (items.containsKey(bookId)) {//ͨ������ȥ�������
			ShoppingCartItem scitem = (ShoppingCartItem) items.get(bookId);
			scitem.decrementQuantity();//�������������Ʒ����ķ�����������
			if (scitem.getQuantity()<=0) {//������С�ڵ���0��ʱ���ɾ���鼮
				items.remove(bookId);//��hashmap�ķ���				
			}
			numberOfItems--;	//ͬʱ����������
		}
		
	}
	
	//����ÿһ����Ʒ�����Ȼ��浽һ���������������ظ����õĶ���
	public synchronized List getItems() {
		results = new ArrayList();
		Iterator i = this.items.values().iterator();
		//ʹ�õ���������
		while ( i.hasNext()) {
			results.add(i.next());	
		}	
//		System.out.println("���ﳵ����Ʒ��Ϣ��"+results);
	return results;	
	}
	
	protected void finalize()throws Throwable {
		items.clear();
		
	}
	
	//�õ�������
	public synchronized int getNumberOfItems() {
		numberOfItems= 0;
		for (Iterator i = getItems().iterator(); i.hasNext();) {
			ShoppingCartItem item = (ShoppingCartItem) i.next();
			numberOfItems += item.getQuantity();
			System.out.println("���ﳵһ���ж��ٸ����"+numberOfItems);
			
		}
		return numberOfItems;
		
	}
	
	//�����ܼ�Ǯ
	public synchronized double getTotal() {
		double amount=0.0;//��ʼ��
		for (Iterator i = getItems().iterator(); i.hasNext();) {
			ShoppingCartItem item = (ShoppingCartItem) i.next();
			Products book=(Products) item.getItem();
			amount += (item.getQuantity()*book.getPrice());//�������
			System.out.println("�ܼۣ�"+amount);
			
		}
		return roundOff(amount);//�������������ʽ���۸�
		
	}
	
	//��ʽ���۸����
	private double roundOff(double x){
		long val=Math.round(x*100);
		return val/100.0;
	}
	
	//�����ﳵ
	public synchronized void clear() {
		System.out.println("��չ��ﳵ");
		items.clear();//ͬhashmap������
		numberOfItems=0;//��ʼ�����ﳵ
	}
}
