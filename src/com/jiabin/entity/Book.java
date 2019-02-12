package com.jiabin.entity;

import java.util.Date;

public class Book {

	private Integer id;
	private String name;
	private String author;
	private String isbn;
	private float price;
	private String press;
	private Date publishTime;
	private String kaiben;
	private String mulu;
	private String description;
	private SmallType smallType;
	private Integer slide;
	private Integer yeshu;
	private Integer zishu;
	private String pic;
	private Date updateTime;
	private Long click;
	private Integer stock;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	public String getKaiben() {
		return kaiben;
	}
	public void setKaiben(String kaiben) {
		this.kaiben = kaiben;
	}
	public String getMulu() {
		return mulu;
	}
	public void setMulu(String mulu) {
		this.mulu = mulu;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public SmallType getSmallType() {
		return smallType;
	}
	public void setSmallType(SmallType smallType) {
		this.smallType = smallType;
	}
	public Integer getSlide() {
		return slide;
	}
	public void setSlide(Integer slide) {
		this.slide = slide;
	}
	public Integer getYeshu() {
		return yeshu;
	}
	public void setYeshu(Integer yeshu) {
		this.yeshu = yeshu;
	}
	public Integer getZishu() {
		return zishu;
	}
	public void setZishu(Integer zishu) {
		this.zishu = zishu;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Long getClick() {
		return click;
	}
	public void setClick(Long click) {
		this.click = click;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
}
