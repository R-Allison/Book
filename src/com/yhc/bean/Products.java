/**
 * ������: Products
 * ������: ���ݿ�model��-��Ʒ��Ϣ
 * ������: ������
 * �޸���: HUAHUA
 * �޸�ʱ��:2017��12��17�� ����6:23:49
 * �޸ı�ע:
 * @version 1.0.0
 */

package com.yhc.bean;

public class Products {
	
	private String id;           //��ƷID
	private String name;         //��Ʒ��
	private String author;       //����
	private Double price;        //�۸�
	private String category;     //����
	private int pnum;            //���
	private String imgurl;       //ͼƬ��ַ
	private String description;  //����
	
	//�Զ���Ĺ��췽��
	public Products(){
		
	}
	//�Զ���Ĺ��췽��
	public Products(String id,String name,String author,Double price,String category,int pnum,String imgurl,String description){
		this.id=id;
		this.name=name;
		this.author=author;
		this.price=price;
		this.category=category;
		this.pnum=pnum;
		this.imgurl=imgurl;
		this.description=description;
		
		
	}
	
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
