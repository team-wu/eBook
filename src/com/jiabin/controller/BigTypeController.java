package com.jiabin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiabin.entity.BigType;
import com.jiabin.entity.Book;
import com.jiabin.service.BigTypeService;
import com.jiabin.service.BookService;

@Controller
@RequestMapping("/bigType")
public class BigTypeController {

	@Resource
	private BigTypeService bigTypeService;
	
	@Resource
	private BookService bookService;
	
	/**
	 * 图书大类主页
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/{id}")
	public ModelAndView details(@PathVariable("id") Integer id,HttpServletRequest request)throws Exception{
		
		ModelAndView mav=new ModelAndView();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("bigTypeId", id);
		BigType bigType = bigTypeService.findById(id);
		List<Book> bookList = bookService.find(map);
		mav.addObject("title", "ebook网络书城-"+bigType.getName());
		mav.addObject("bigType", bigType);
		mav.addObject("mainPage", "bigType.jsp");
		mav.addObject("bookList", bookList);
		mav.setViewName("mainTemp");
		return mav;
	}
}
