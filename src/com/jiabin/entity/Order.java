package com.jiabin.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order {

	private int id; // 编号
	private String orderNo; // 订单号
	private User user; // 用户
	private Date createTime; // 创建时间
	private float cost; // 总金额
	private int status; // 状态 1 待审核 2 审核通过 3 卖家已发货 4 已收获
	List<OrderBook> orderBookList=new ArrayList<OrderBook>();
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<OrderBook> getOrderBookList() {
		return orderBookList;
	}
	public void setOrderBookList(List<OrderBook> orderBookList) {
		this.orderBookList = orderBookList;
	}
}
