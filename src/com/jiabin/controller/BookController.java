package com.jiabin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiabin.entity.Book;
import com.jiabin.service.BookService;
import com.jiabin.util.StringUtil;

@Controller
@RequestMapping("/book")
public class BookController {

	@Resource
	private BookService bookService;
	
	/**
	 * 显示书籍详细信息
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/{id}")
	public ModelAndView details(@PathVariable("id") Integer id,HttpServletRequest request)throws Exception{
		ModelAndView mav=new ModelAndView();
		Book book = bookService.findById(id);
		book.setClick(book.getClick()+1);
		bookService.update(book);
		mav.addObject("title", "ebook网络书城-"+book.getName());
		mav.addObject("mainPage", "book.jsp");
		mav.addObject("book", book);
		mav.setViewName("mainTemp");
		return mav;
	}
	
	@RequestMapping("/list")
	public ModelAndView list(Book s_book,HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mav=new ModelAndView();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("name", StringUtil.formatLike(s_book.getName()));
		List<Book> bookList = bookService.find(map);
		mav.addObject("bookList", bookList);
		mav.addObject("mainPage","searchResult.jsp");
		mav.addObject("s_book", s_book);
		mav.setViewName("mainTemp");
		return mav;
	}
}
