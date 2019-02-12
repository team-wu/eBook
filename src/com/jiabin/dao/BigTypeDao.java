package com.jiabin.dao;

import java.util.List;
import java.util.Map;

import com.jiabin.entity.BigType;

public interface BigTypeDao {

	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<BigType> find(Map<String,Object> map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 
	 * @param bigType
	 * @return
	 */
	public int update(BigType bigType);
	
	/**
	 * 
	 * @param bigType
	 * @return
	 */
	public int add(BigType bigType);
	
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
	public BigType findById(Integer id);
}
