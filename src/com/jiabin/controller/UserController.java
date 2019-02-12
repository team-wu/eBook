package com.jiabin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiabin.entity.User;
import com.jiabin.service.UserService;
import com.jiabin.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:���������ֵ��false:����Ϊ��ֵ
	}
	
	@RequestMapping("/login1")
	public String login1(User user,HttpServletRequest request)throws Exception{
		User resultUser=userService.login1(user);
		if(resultUser==null){
			request.setAttribute("user", user);
			request.setAttribute("errorMsg", "用户名或密码错误");
			return "login";
		}else{
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", resultUser);
			return "redirect:/";
		}
	}
	
	@RequestMapping("/exist")
	public String exist(String userName,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("userName", userName);
		List<User> userList = userService.find(map);
		JSONObject result=new JSONObject();
		if (userList.size()>0) {
			result.put("exist", true);
		} else {
			result.put("exist", false);
		}
		
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/registerPage")
	public ModelAndView registerPage(User user,HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mav=new ModelAndView();
		String url = request.getRequestURL().toString();
		String oldUrl=(String) session.getAttribute("oldUrl");
		if (!request.getHeader("Referer").equals(url)) {
			oldUrl=request.getHeader("Referer");
			session.setAttribute("oldUrl", oldUrl);
		}
		mav.addObject("title", "ebook网络书城-用户注册");
		//mav.addObject("oldUrl", oldUrl);
		mav.addObject("mainPage", "register.jsp");
		mav.setViewName("mainTemp");
		return mav;
	}
	
	@RequestMapping("/register")
	public String register(User user,String oldUrl,HttpServletRequest request)throws Exception{
		Integer result=userService.add(user);
		if(result<=0){
			request.setAttribute("user", user);
			request.setAttribute("errorMsg", "注册失败");
			return "redirect:/user/registerPage.do";
		}else{
			request.setAttribute("oldUrl", oldUrl);
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", user);
			return "regSuccess";
		}
	}
	
	@RequestMapping("/loginPage")
	public ModelAndView loginPage(User user,HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mav=new ModelAndView();
		String url = request.getRequestURL().toString();
		String oldUrl=(String) session.getAttribute("oldUrl");
		if (!request.getHeader("Referer").equals(url)) {
			oldUrl=request.getHeader("Referer");
			session.setAttribute("oldUrl", oldUrl);
		}
		mav.addObject("title", "ebook网络书城-用户登录");
		//mav.addObject("oldUrl", oldUrl);
		mav.addObject("mainPage", "login.jsp");
		mav.setViewName("mainTemp");
		return mav;
	}
	
	@RequestMapping("/login")
	public String login(User user,String oldUrl,HttpServletRequest request)throws Exception{
		User resultUser=userService.login1(user);
		HttpSession session=request.getSession();
		if(resultUser==null){
			request.setAttribute("user", user);
			session.setAttribute("errorInfo", "用户名或密码错误");
			return "redirect:/user/loginPage.do";
		}else{
			request.setAttribute("oldUrl", oldUrl);
			session.setAttribute("currentUser", resultUser);
			return "loginSuccess";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			session.invalidate();
			result.put("success", true);
			ResponseUtil.write(response, result);
			
		} catch (Exception e) {
			result.put("errorInfo", e.toString());
			try {
				ResponseUtil.write(response, result);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return null;
	}
	
	@RequestMapping("/userCenter")
	public ModelAndView userCenter()throws Exception{
		ModelAndView mav=new ModelAndView();
		mav.addObject("title", "ebook网络书城-个人中心");
		mav.addObject("mainPage", "userCenter/ucDefault.jsp");
		mav.setViewName("userCenter");
		return mav;
	}
	
	@RequestMapping("/getUserInfo")
	public ModelAndView getUserInfo()throws Exception{
		ModelAndView mav=new ModelAndView();
		mav.addObject("title", "ebook网络书城-个人信息");
		mav.addObject("mainPage", "userCenter/userInfo.jsp");
		mav.setViewName("userCenter");
		return mav;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(User user,HttpSession session,HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mav=new ModelAndView();
		userService.update(user);
		session.setAttribute("currentUser", user);
		mav.addObject("info", "修改成功");
		mav.addObject("mainPage", "userCenter/userInfo.jsp");
		mav.setViewName("userCenter");
		return mav;
	}
}
