package com.jiabin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiabin.dao.OrderBookDao;
import com.jiabin.entity.OrderBook;
import com.jiabin.service.OrderBookService;

@Service("orderBookService")
public class OrderBookServiceImpl implements OrderBookService{
	
	@Resource
	private OrderBookDao orderBookDao;

	public List<OrderBook> find(Map<String, Object> map) {
		return orderBookDao.find(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return orderBookDao.getTotal(map);
	}

	public int update(OrderBook orderBook) {
		return orderBookDao.update(orderBook);
	}

	public int add(OrderBook orderBook) {
		return orderBookDao.add(orderBook);
	}

	public int addByBatch(List<OrderBook> orderBookList) {
		return orderBookDao.addByBatch(orderBookList);
	}

	public int delete(Integer id) {
		return orderBookDao.delete(id);
	}

	public OrderBook findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
