package com.jiabin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiabin.entity.Book;
import com.jiabin.entity.ShoppingCart;
import com.jiabin.entity.ShoppingCartItem;
import com.jiabin.entity.User;
import com.jiabin.service.BookService;
import com.jiabin.util.ResponseUtil;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Resource
	private BookService bookService;

	/**
	 * 跳转到购物车页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/buyPage")
	public ModelAndView buyPage(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mav=new ModelAndView();

		HttpSession session=request.getSession();
		
		ShoppingCart shoppingCart=(ShoppingCart) session.getAttribute("shoppingCart");
		if(shoppingCart==null){
			shoppingCart=new ShoppingCart();
			User currentUser=(User) session.getAttribute("currentUser");
			if (currentUser!=null) {
				shoppingCart.setUserId(currentUser.getId());
			}
		}
		
		session.setAttribute("shoppingCart", shoppingCart);
		
		mav.addObject("title", "ebook网络书城-购物车");
		mav.addObject("mainPage", "shopping/shopping.jsp");
		mav.setViewName("mainTemp");
		return mav;
	}
	
	/**
	 * 将一本书添加到购物车，然后跳转到购物车页面
	 * @param bookId
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/bookToCartAndGoBuy")
	public String bookToCartAndGoBuy(Integer bookId,HttpServletRequest request,HttpServletResponse response)throws Exception{

		HttpSession session=request.getSession();
		addBookToCart(bookId, session);
		return "redirect:/shopping/buyPage.do";
	}
	
	/**
	 * 将一本书放入购物车
	 * @param bookId
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/bookToCart")
	public String bookToCart(Integer bookId,HttpServletRequest request,HttpServletResponse response){

		HttpSession session=request.getSession();
		JSONObject result=new JSONObject();
		try {
			addBookToCart(bookId, session);
			
			result.put("success", true);
			ResponseUtil.write(response, result);
		} catch (Exception e) {
			result.put("errorInfo", true);
			try {
				ResponseUtil.write(response, e.toString());
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		
		return "redirect:/shopping/buyPage.do";
	}

	private void addBookToCart(Integer bookId, HttpSession session) {
		Book book=bookService.findById(bookId);
		ShoppingCart shoppingCart=(ShoppingCart) session.getAttribute("shoppingCart");
		if(shoppingCart==null){
			shoppingCart=new ShoppingCart();
			User currentUser=(User) session.getAttribute("currentUser");
			shoppingCart.setUserId(currentUser.getId());
		}
		List<ShoppingCartItem> shoppingCartItemList=shoppingCart.getShoppingCartItems();
		
		boolean flag=true;
		for(ShoppingCartItem scI:shoppingCartItemList){
			if(scI.getBook().getId()==book.getId()){
				scI.setCount(scI.getCount()+1);
				flag=false;
				break;
			}
		}
		
		ShoppingCartItem shoppingCartItem=new ShoppingCartItem();
		
		if(flag){
			shoppingCartItem.setBook(book);
			shoppingCartItem.setCount(1);
			shoppingCartItemList.add(shoppingCartItem);
		}
		session.setAttribute("shoppingCart", shoppingCart);
	}
	
	/**
	 * 修改购物车商品类
	 * @throws Exception
	 */
	@RequestMapping("/updateShoppingCartItem")
	public String updateShoppingCartItem(Integer bookId,Integer count,HttpServletRequest request,HttpServletResponse response)throws Exception{
		HttpSession session=request.getSession();
		Book book=bookService.findById(bookId);
		ShoppingCart shoppingCart=(ShoppingCart) session.getAttribute("shoppingCart");
		List<ShoppingCartItem> shoppingCartItemList=shoppingCart.getShoppingCartItems();
		for(ShoppingCartItem scI:shoppingCartItemList){
			if(scI.getBook().getId()==book.getId()){
				scI.setCount(count);
				break;
			}
		}
		
		session.setAttribute("shoppingCart", shoppingCart);
		
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		
		return null;
	}
	
	/**
	 * 删除一条商品记录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/removeShoppingCartItem")
	public String removeShoppingCartItem(Integer bookId,HttpServletRequest request)throws Exception{
		HttpSession session=request.getSession();
		ShoppingCart shoppingCart=(ShoppingCart) session.getAttribute("shoppingCart");
		List<ShoppingCartItem> shoppingCartItemList=shoppingCart.getShoppingCartItems();
		for(int i=0;i<shoppingCartItemList.size();i++){
			if(bookId==shoppingCartItemList.get(i).getBook().getId()){
				shoppingCartItemList.remove(i);
				break;
			}
		}
		shoppingCart.setShoppingCartItems(shoppingCartItemList);
		session.setAttribute("shoppingCart", shoppingCart);
		return "redirect:/shopping/buyPage.do";
	}
}
