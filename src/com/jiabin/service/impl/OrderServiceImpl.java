package com.jiabin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiabin.dao.OrderDao;
import com.jiabin.entity.Order;
import com.jiabin.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Resource
	private OrderDao orderDao;

	public List<Order> find(Map<String, Object> map) {
		return orderDao.find(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return orderDao.getTotal(map);
	}

	public int update(Order order) {
		return orderDao.update(order);
	}

	public int add(Order order) {
		return orderDao.add(order);
	}

	public int delete(Integer id) {
		return orderDao.delete(id);
	}

	public Order findById(Integer id) {
		return orderDao.findById(id);
	}

	public Order findByOrderNo(String orderNo) {
		return orderDao.findByOrderNo(orderNo);
	}

}
