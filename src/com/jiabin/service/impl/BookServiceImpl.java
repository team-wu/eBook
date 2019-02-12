package com.jiabin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiabin.dao.BookDao;
import com.jiabin.entity.Book;
import com.jiabin.service.BookService;

@Service("bookService")
public class BookServiceImpl implements BookService{
	
	@Resource
	private BookDao bookDao;

	public List<Book> find(Map<String, Object> map) {
		return bookDao.find(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return bookDao.getTotal(map);
	}

	public int update(Book book) {
		return bookDao.update(book);
	}

	public int add(Book book) {
		return bookDao.add(book);
	}

	public int delete(Integer id) {
		return bookDao.delete(id);
	}

	public Book findById(Integer id) {
		return bookDao.findById(id);
	}

	public List<Book> findByclick(Map<String, Object> map) {
		return bookDao.findByclick(map);
	}

}
