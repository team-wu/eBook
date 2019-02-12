package com.jiabin.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jiabin.entity.BigType;
import com.jiabin.entity.PageBean;
import com.jiabin.service.BigTypeService;
import com.jiabin.util.ResponseUtil;
import com.jiabin.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/bigType")
public class BigTypeAdminController {

	@Resource
	private BigTypeService bigTypeService;
	
	@RequestMapping("/list")
	public String list(BigType s_bigType,
			@RequestParam(value="page",required=false)String page,
			   @RequestParam(value="rows",required=false)String rows,
			HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("name", StringUtil.formatLike(s_bigType.getName()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<BigType> bigTypeList=bigTypeService.find(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(bigTypeList);
		Long total=bigTypeService.getTotal(map);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/save")
	public String save(BigType bigType,HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
		if(bigType.getId()==null){
			resultTotal=bigTypeService.add(bigType);
		}else{
			resultTotal=bigTypeService.update(bigType);
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
			bigTypeService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/comboList")
	public String comboList(HttpServletResponse response)throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		List<BigType> bigTypeList=bigTypeService.find(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(bigTypeList);
		result.put("rows", jsonArray);
		ResponseUtil.write(response, jsonArray);
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
		BigType bigType=bigTypeService.findById(Integer.parseInt(id));
		JSONObject result=JSONObject.fromObject(bigType);
		ResponseUtil.write(response, result);
		return null;
	}
}
