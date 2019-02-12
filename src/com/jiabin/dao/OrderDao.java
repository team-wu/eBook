package com.jiabin.dao;

import java.util.List;
import java.util.Map;

import com.jiabin.entity.Order;

public interface OrderDao {

	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<Order> find(Map<String,Object> map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 
	 * @param order
	 * @return
	 */
	public int update(Order order);
	
	/**
	 * 
	 * @param order
	 * @return
	 */
	public int add(Order order);
	
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
	public Order findById(Integer id);
	
	/**
	 * 
	 * @param orderNo
	 * @return
	 */
	public Order findByOrderNo(String orderNo);
}
