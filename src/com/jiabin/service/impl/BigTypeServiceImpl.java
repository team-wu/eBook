package com.jiabin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiabin.dao.BigTypeDao;
import com.jiabin.dao.SmallTypeDao;
import com.jiabin.entity.BigType;
import com.jiabin.entity.Book;
import com.jiabin.entity.SmallType;
import com.jiabin.service.BigTypeService;

@Service("bigTypeService")
public class BigTypeServiceImpl implements BigTypeService{
	
	@Resource
	private BigTypeDao bigTypeDao;
	
	@Resource
	private SmallTypeDao smallTypeDao;

	public List<BigType> find(Map<String, Object> map) {
		return bigTypeDao.find(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return bigTypeDao.getTotal(map);
	}

	public int update(BigType bigType) {
		return bigTypeDao.update(bigType);
	}

	public int add(BigType bigType) {
		return bigTypeDao.add(bigType);
	}

	public int delete(Integer id) {
		return bigTypeDao.delete(id);
	}

	public BigType findById(Integer id) {
		return bigTypeDao.findById(id);
	}

	/*public List<Book> findBooks(BigType bigType) {
		List<Book> bookList=new ArrayList<Book>();
		Map<String,Object> map=new HashMap<String,Object>(); 
		map.put("bigTypeId", bigType.getId());
		List<SmallType> smallTypeList = smallTypeDao.find(map);
		for (SmallType smallType : smallTypeList) {
			bookList.addAll(smallType.getBookList());
		}
		return bookList;
	}*/

}
