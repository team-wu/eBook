package com.jiabin.controller.admin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jiabin.entity.PageBean;
import com.jiabin.entity.Book;
import com.jiabin.service.BookService;
import com.jiabin.util.ResponseUtil;
import com.jiabin.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/admin/book")
public class BookAdminController {

	@Resource
	private BookService bookService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:���������ֵ��false:����Ϊ��ֵ
	}
	
	@RequestMapping("/list")
	public String list(Book s_book,
					   @RequestParam(value="page",required=false)String page,
					   @RequestParam(value="rows",required=false)String rows,
					   HttpServletResponse response)throws Exception{
		
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("name", StringUtil.formatLike(s_book.getName()));
		map.put("author", StringUtil.formatLike(s_book.getAuthor()));
		map.put("isbn", StringUtil.formatLike(s_book.getIsbn()));
		map.put("press", StringUtil.formatLike(s_book.getPress()));
		map.put("slide", s_book.getSlide());
		if (s_book.getSmallType()!=null) {
			map.put("bigTypeId", s_book.getSmallType().getId());
			if (s_book.getSmallType().getBigType()!=null) {
				map.put("bigTypeId", s_book.getSmallType().getBigType().getId());
			}
		}
		List<Book> bookList=bookService.find(map);
		JSONObject result=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray=JSONArray.fromObject(bookList,jsonConfig);
		Long total=bookService.getTotal(map);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/save")
	public String save(Book book,
					   @RequestParam(value = "file", required = false) MultipartFile file,
					   HttpServletResponse response,
					   HttpServletRequest request)throws Exception{
		
		String fileNameExt=file.getOriginalFilename();
		if (StringUtil.isNotEmpty(fileNameExt)) {
			String ext=fileNameExt.substring(fileNameExt.lastIndexOf(".")+1);
			String path = request.getSession().getServletContext().getRealPath("static/images/book/");  
			String fileName = new Date().getTime()+"."+ext; 
			File targetFile = new File(path, fileName);
			book.setPic("static/images/book/"+fileName);
			if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }
			//保存  
	        try {  
	            file.transferTo(targetFile);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
		}
		
		int resultTotal=0; // 操作的记录条数
		if(book.getId()==null){
			resultTotal=bookService.add(book);
		}else{
			book.setUpdateTime(new Date());
			resultTotal=bookService.update(book);
		}
		JSONObject result=new JSONObject();
		if(resultTotal>0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++){
			bookService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 通过Id查找实体
	 * @param id
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
		Book book=bookService.findById(Integer.parseInt(id));
		JSONObject result=JSONObject.fromObject(book);
		ResponseUtil.write(response, result);
		return null;
	}
}
