package com.jiabin.service;

import java.util.List;
import java.util.Map;

import com.jiabin.entity.Book;

public interface BookService {

	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<Book> find(Map<String,Object> map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<Book> findByclick(Map<String,Object> map);
	
	/**
	 * 
	 * @param book
	 * @return
	 */
	public int update(Book book);
	
	/**
	 * 
	 * @param book
	 * @return
	 */
	public int add(Book book);
	
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
	public Book findById(Integer id);
}
