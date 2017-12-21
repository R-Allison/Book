/**
 * 类名称: Products
 * 类描述: 数据库model类-商品信息
 * 创建人: 茹韶燕
 * 修改人: HUAHUA
 * 修改时间:2017年12月17日 下午6:23:49
 * 修改备注:
 * @version 1.0.0
 */

package com.yhc.bean;

public class Products {
	
	private String id;           //商品ID
	private String name;         //商品名
	private String author;       //作者
	private Double price;        //价格
	private String category;     //分类
	private int pnum;            //库存
	private String imgurl;       //图片地址
	private String description;  //描述
	
	//自定义的构造方法
	public Products(){
		
	}
	//自定义的构造方法
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
