package com.pzy.controller.front;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pzy.entity.Category;
import com.pzy.entity.Order;
import com.pzy.entity.Project;
import com.pzy.entity.User;
import com.pzy.service.CategoryService;
import com.pzy.service.OrderService;
import com.pzy.service.ProjectService;
import com.pzy.service.UserService;
/***
 * 前台，首页各种连接登陆等
 * @author qq:263608237
 *
 */
@Controller
@RequestMapping("/phone")
public class PhoneController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private OrderService orderService;
	@InitBinder  
	protected void initBinder(HttpServletRequest request,   ServletRequestDataBinder binder) throws Exception {   
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true)); 
	}  
	/***
	 * 跳转到首页
	 * @param model
	 * @return
	 */
	@RequestMapping("index")
	public String index(Model model) {
		model.addAttribute("likes",projectService.findLikes(null));
		return "phone/index";
	}
	
	@RequestMapping("category")
	public String category(Model model) {
		model.addAttribute("category",categoryService.findAll());
		return "phone/category";
	}
	@RequestMapping("category/{id}")
	public String category(Model model,@PathVariable Long id) {
		model.addAttribute("projects",projectService.findBycategory(id, null));
		return "phone/project";
	}
	@RequestMapping("order/{pid}")
	public String order(Model model,@PathVariable Long pid) {
		model.addAttribute("project",projectService.find(pid));
		return "phone/order";
	}
	@RequestMapping("doorder/{pid}")
	public String doorder(HttpSession httpSession,Model model,@PathVariable Long pid,String year,String month,String day,String remark,String addr,String tel) throws ParseException {
		String daystr=year+"-"+month+"-"+day;
		Date date=DateUtils.parseDate(daystr, "yyyy-MM-dd");
		User user=(User) httpSession.getAttribute("user");
		
		Order order=new Order();
		order.setAddr(addr);
		order.setCreateDate(new Date());
		order.setOrderDate(date);
		
		
		Project bean=projectService.find(pid);
		order.setCreateDate(new Date());
		order.setState("待审核");
		order.setProject(bean);
		order.setUser(user);
		
		order.setPrice(bean.getPrice());
		order.setToalprice(bean.getPrice());
		orderService.save(order);
		model.addAttribute("project",projectService.find(pid));
		model.addAttribute("tip","预订成功!");
		return "phone/order";
	}
	@RequestMapping("center")
	public String center(Model model,HttpSession httpSession) {
		User user=(User) httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登陆!");
    		return "phone/login";
		}else{
			return "phone/center";
		}
			 
		
	}
	@RequestMapping("loginout")
	public String loginout(HttpSession httpSession,Model model) {
		httpSession.removeAttribute("user");
		model.addAttribute("tip","已注销！");
		return "phone/login";
	}
	
	/***
	 * 点击注册
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("doregister")
	public String register(User user,Model model) {
		user.setCreateDate(new Date());
		model.addAttribute("tip","注册成功请登录！");
		userService.save(user);
		return "phone/login";
	}
	@RequestMapping("login")
	public String login(Model model) {
		return "phone/login";
	}
	@RequestMapping("register")
	public String register(Model model) {
		return "phone/register";
	}
	@RequestMapping("dologin")
	public String dologin(User user,HttpSession httpSession,Model model) {
		User loginuser=userService.login(user.getUsername(), user.getPassword());
    	if(loginuser!=null){
    		httpSession.setAttribute("user", loginuser);
            return "phone/center"; 
    	}
    	else{
    		httpSession.removeAttribute("user");
    		model.addAttribute("tip","登陆失败 不存在此用户名或密码!");
    		return "phone/login";
    	}
	}
	
	@RequestMapping("myorder")
	public String myorder(HttpSession httpSession,Model model) {
		User user=(User)httpSession.getAttribute("user");
		model.addAttribute("orders",orderService.findByUser(user));
		return "phone/myorder";
	}
}

