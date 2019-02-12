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

import com.jiabin.entity.SmallType;
import com.jiabin.entity.Book;
import com.jiabin.service.SmallTypeService;
import com.jiabin.service.BookService;

@Controller
@RequestMapping("/smallType")
public class SmallTypeController {

	@Resource
	private SmallTypeService smallTypeService;
	
	@Resource
	private BookService bookService;
	
	/**
	 * 图书小类主页
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/{id}")
	public ModelAndView details(@PathVariable("id") Integer id,HttpServletRequest request)throws Exception{
		
		ModelAndView mav=new ModelAndView();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("smallTypeId", id);
		SmallType smallType = smallTypeService.findById(id);
		List<Book> bookList = bookService.find(map);
		mav.addObject("title", "ebook网络书城-"+smallType.getName());
		mav.addObject("smallType", smallType);
		mav.addObject("mainPage", "smallType.jsp");
		mav.addObject("bookList", bookList);
		mav.setViewName("mainTemp");
		return mav;
	}
}
