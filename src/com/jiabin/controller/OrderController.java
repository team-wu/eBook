package com.jiabin.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiabin.entity.Book;
import com.jiabin.entity.Order;
import com.jiabin.entity.OrderBook;
import com.jiabin.entity.ShoppingCart;
import com.jiabin.entity.ShoppingCartItem;
import com.jiabin.entity.User;
import com.jiabin.service.OrderBookService;
import com.jiabin.service.OrderService;
import com.jiabin.util.DateUtil;
import com.jiabin.util.ResponseUtil;
import com.jiabin.util.StringUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private OrderBookService orderBookService;

	/**
	 * 结算
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public ModelAndView save(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		Order order=new Order();
		User currentUser=(User)session.getAttribute("currentUser");
		order.setUser(currentUser);
		order.setCreateTime(new Date());
		order.setOrderNo(DateUtil.getCurrentDateStr());
		order.setStatus(1);
		
		ShoppingCart shoppingCart=(ShoppingCart) session.getAttribute("shoppingCart");
		List<ShoppingCartItem> shoppingCartItemList=shoppingCart.getShoppingCartItems();
		
		orderService.add(order);
		
		float cost=0;
		List<OrderBook> orderBookList=new LinkedList<OrderBook>();
		for(ShoppingCartItem shoppingCartItem:shoppingCartItemList){
			Book book=shoppingCartItem.getBook();
			OrderBook orderBook=new OrderBook();
			orderBook.setNum(shoppingCartItem.getCount());
			orderBook.setOrder(order);
			orderBook.setBook(book);
			cost+=book.getPrice()*shoppingCartItem.getCount();
			orderBookList.add(orderBook);
		}
		orderBookService.addByBatch(orderBookList);
		//order.setOrderBookList(orderBookList);
		order.setCost(cost);
		orderService.update(order);
		
		
		session.removeAttribute("shoppingCart");
		mav.addObject("mainPage", "shopping/shopping-result.jsp");
		mav.setViewName("mainTemp");
		return mav;
	}
	
	/**
	 * 查询并列出个人订单
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findOrder")
	public ModelAndView findOrder(Order s_order,HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		User currentUser=(User)session.getAttribute("currentUser");
		Map<String,Object> map=new HashMap<String, Object>();
		if (currentUser!=null) {
			map.put("userId", currentUser.getId());
		}
		map.put("orderNo", StringUtil.formatLike(s_order.getOrderNo()));
		List<Order> orderList = orderService.find(map);
		mav.addObject("title","ebook网络书城-个人订单");
		mav.addObject("s_order",s_order);
		mav.addObject("orderList",orderList);
		mav.addObject("mainPage","userCenter/orderList.jsp");
		mav.setViewName("userCenter");
		return mav;
	}
	
	/**
	 * 修改订单状态
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("confirmReceive")
	public String confirmReceive(String orderNo,Integer status,HttpServletResponse response)throws Exception{
		Order order = orderService.findByOrderNo(orderNo);
		order.setStatus(status);
		orderService.update(order);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
