package com.jiabin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiabin.dao.SmallTypeDao;
import com.jiabin.entity.SmallType;
import com.jiabin.service.SmallTypeService;

@Service("smallTypeService")
public class SmallTypeServiceImpl implements SmallTypeService{
	
	@Resource
	private SmallTypeDao smallTypeDao;

	public List<SmallType> find(Map<String, Object> map) {
		return smallTypeDao.find(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return smallTypeDao.getTotal(map);
	}

	public int update(SmallType smallType) {
		return smallTypeDao.update(smallType);
	}

	public int add(SmallType smallType) {
		return smallTypeDao.add(smallType);
	}

	public int delete(Integer id) {
		return smallTypeDao.delete(id);
	}

	public SmallType findById(Integer id) {
		return smallTypeDao.findById(id);
	}

}
