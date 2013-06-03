package com.ld.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ld.domain.User;
import com.ld.service.LoginService;
import com.ld.util.AjaxUtil;
import com.ld.util.InterUtil;
import com.ld.util.Interface;

/**
 * 
 * @author LD
 * 
 */
@Controller
@RequestMapping("/user")
public class UserController
{
	@Autowired
	private LoginService loginService;
	
	HttpServletRequest request;
	
	
//	@RequiresAuthentication  //表明當前用戶需是经过认证的用户
//	@RequiresGuest //gest用户
//	@RequiresPermissions("accout:create") //需拥有制定权限
//	@RequiresRoles//
//	@RequiresUser//已认证用户
	//Account userAccount
	@RequestMapping("/login")
	@ResponseBody
	public AjaxUtil userLogin(User user,String password)
	{
		AjaxUtil ajaxUtil = new AjaxUtil();
		int	result = -3;
		try {
			result=loginService.loginIn(user.getEmail(), user.getPassword());
		} catch (Exception e) {
			ajaxUtil.setFailMsg(Interface.serverException);
		}
		if(result == 0){
			ajaxUtil.setResult(true);
		}
		else
		{
			ajaxUtil.setFailMsg(InterUtil.returnLogMsg(result));
		}
		return ajaxUtil;
	}
	
	@RequestMapping("/qqLogin")
	public String qqLogin(String code)
	{
		String aa = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id=100444179&client_secret=a060225ee378f6e5fcee1dda43fa5c0f&code=84F589BDFDA29E86BB99328694FB5F0E&redirect_uri=www.ttgjie.com/user/qqLogin";
		return "";
	}
	
	/**
	 * 退出登录
	 * 
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout() {
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return "/login";
	}
	
	@Resource
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	
	/*
	
	
	// 从编程模型的角度来看，可能会出现看似简单的新功能。现在，控制层（Controller）的方法可以返回Callable类型来完成异步请求的处理。Spring
	// MVC 3.2会在TaskExecutor的帮助下在一个独立的线程中调用这个返回值，
	@RequestMapping(method = RequestMethod.POST)
	public Callable<String> processUpload(final MultipartFile file)
	{

		return new Callable<String>()
		{
			public String call() throws Exception
			{
				return "someView";
			}
		};
	}

	// 另一种方式，是在控制层（Controller）方法中返回DeferredResult类型（这是Spring MVC
	// 3.2中的新成员），在任意的线程中完成异步处理。例如对一个外部事件（例如JMS信息、AMQP信息、Redis信息等）作出反应
	@RequestMapping("/quotes")
	@ResponseBody
	public DeferredResult quotes()
	{
		DeferredResult deferredResult = new DeferredResult();
		// Add deferredResult to a Queue or a Map...
		return deferredResult;
	}*/
	

}
