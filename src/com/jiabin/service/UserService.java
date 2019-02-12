package com.jiabin.service;

import java.util.List;
import java.util.Map;

import com.jiabin.entity.User;

public interface UserService {

	/**
	 * 
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/**
	 * 
	 * @param user
	 * @return
	 */
	public User login1(User user);

	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<User> find(Map<String,Object> map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 
	 * @param user
	 * @return
	 */
	public int update(User user);
	
	/**
	 * 
	 * @param user
	 * @return
	 */
	public int add(User user);
	
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
	public User findById(Integer id);
}
