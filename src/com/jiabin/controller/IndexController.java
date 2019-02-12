package com.jiabin.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jiabin.service.BigTypeService;
import com.jiabin.service.BookService;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Resource
	private BookService bookService;
	
	@Resource
	private BigTypeService bigTypeService;
	

	/**
	 * 请求主页
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(@RequestParam(value="page",required=false)String page,
			@RequestParam(value="bigTypeId",required=false)Integer bigTypeId,
			HttpServletRequest request)throws Exception{
		
		/*Map<String,Object> map=new HashMap<String,Object>(); 
		
		map.put("slide", 1);
		map.put("start", 0);
		map.put("size", 5);
		List<Book> slideBookList = bookService.find(map);
		
		map.clear();
		map.put("start", 0);
		map.put("size", 7);
		List<Book> hotBookList = bookService.findByclick(map);
		
		map.clear();
		List<BigType> bigTypeList = bigTypeService.find(map);
		for (BigType bigType : bigTypeList) {
			map.put("bigTypeId", bigType.getId());
			map.put("start", 0);
			map.put("size", 12);
			bigType.setBookList(bookService.find(map));
		}
		
		map.clear();
		List<Tag> tagList = tagService.find(map);*/
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("title", "ebook网络书城");
		mav.addObject("mainPage", "index.jsp");
		/*mav.addObject("slideBookList", slideBookList);
		mav.addObject("hotBookList", hotBookList);
		mav.addObject("bigTypeList", bigTypeList);
		mav.addObject("tagList", tagList);*/
		mav.setViewName("mainTemp");
		return mav;
	}
}
