package com.jiabin.service;

import java.util.List;
import java.util.Map;

import com.jiabin.entity.SmallType;

public interface SmallTypeService {

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
	 * @param bigType
	 * @return
	 */
	public int update(SmallType bigType);
	
	/**
	 * 
	 * @param bigType
	 * @return
	 */
	public int add(SmallType bigType);
	
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
