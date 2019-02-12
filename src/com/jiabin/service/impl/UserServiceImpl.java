package com.jiabin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiabin.dao.UserDao;
import com.jiabin.entity.User;
import com.jiabin.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;

	public User login(User user) {
		return userDao.login(user);
	}
	
	public User login1(User user) {
		return userDao.login1(user);
	}

	public List<User> find(Map<String, Object> map) {
		return userDao.list(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return userDao.getTotal2(map);
	}

	public int update(User user) {
		return userDao.update(user);
	}

	public int add(User user) {
		return userDao.add(user);
	}

	public int delete(Integer id) {
		return userDao.delete(id);
	}

	public User findById(Integer id) {
		return userDao.findById(id);
	}
}
