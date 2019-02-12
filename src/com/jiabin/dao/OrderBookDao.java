package com.jiabin.dao;

import java.util.List;
import java.util.Map;

import com.jiabin.entity.OrderBook;

public interface OrderBookDao {

	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<OrderBook> find(Map<String,Object> map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 
	 * @param orderBook
	 * @return
	 */
	public int update(OrderBook orderBook);
	
	/**
	 * 
	 * @param orderBook
	 * @return
	 */
	public int add(OrderBook orderBook);
	
	/**
	 * 
	 * @param orderBookList
	 * @return
	 */
	public int addByBatch(List<OrderBook> orderBookList);
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public OrderBook findById(Integer id);
}
