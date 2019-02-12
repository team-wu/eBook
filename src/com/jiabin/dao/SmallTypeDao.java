package com.jiabin.dao;

import java.util.List;
import java.util.Map;

import com.jiabin.entity.SmallType;

public interface SmallTypeDao {

	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<SmallType> find(Map<String,Object> map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 
	 * @param smallType
	 * @return
	 */
	public int update(SmallType smallType);
	
	/**
	 * 
	 * @param smallType
	 * @return
	 */
	public int add(SmallType smallType);
	
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
	public SmallType findById(Integer id);
}
