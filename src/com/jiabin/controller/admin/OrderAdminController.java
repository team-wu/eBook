package com.jiabin.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jiabin.entity.Book;
import com.jiabin.entity.Order;
import com.jiabin.entity.OrderBook;
import com.jiabin.service.OrderService;
import com.jiabin.util.ResponseUtil;
import com.jiabin.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/admin/order")
public class OrderAdminController {
	
	@Resource
	private OrderService orderService;

	@RequestMapping("/list")
	public String list(Order s_order,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("orderNo", StringUtil.formatLike(s_order.getOrderNo()));
		if (s_order.getUser()!=null) {
			map.put("userId", s_order.getUser().getId());
		}
		if (s_order.getStatus()>0) {
			map.put("status", s_order.getStatus());
		}
		
		List<Order> orderList = orderService.find(map);
		JSONObject result=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd hh:MM:ss"));
		jsonConfig.setExcludes(new String[]{"orderBookList"});
		JSONArray jsonArray=JSONArray.fromObject(orderList,jsonConfig);
		Long total=orderService.getTotal(map);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("findBookListByOrderId")
	public String findBookListByOrderId(@RequestParam(value="orderId",required=true)Integer orderId,HttpServletRequest request,HttpServletResponse response) throws Exception{
		Order order=orderService.findById(orderId);
		List<OrderBook> orderBookList=order.getOrderBookList();
		JSONObject result=new JSONObject();
		JSONArray rows=new JSONArray();
		for(OrderBook orderBook:orderBookList){
			Book book=orderBook.getBook();
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("name", book.getName());
			jsonObject.put("pic", book.getPic());
			jsonObject.put("price", book.getPrice());
			jsonObject.put("num", orderBook.getNum());
			jsonObject.put("subtotal", book.getPrice()*orderBook.getNum());
			rows.add(jsonObject);
		}
		result.put("rows", rows);
		result.put("total", rows.size());
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 修改订单状态
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("modifyOrderStatus")
	public String modifyOrderStatus(String orderNos,Integer status,HttpServletResponse response)throws Exception{
		String []orderNoStr=orderNos.split(",");
		for(int i=0;i<orderNoStr.length;i++){
			Order order = orderService.findByOrderNo(orderNoStr[i]);
			order.setStatus(status);
			orderService.update(order);
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
