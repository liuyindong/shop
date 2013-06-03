package com.ld.shiro;


import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.ld.cache.UserCache;
import com.ld.cache.util.OsCacheTimes;
import com.ld.domain.User;
import com.ld.service.UserService;

public class GradRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String userName = (String) getAvailablePrincipal(principals);
		//TODO 通过用户名获得用户的所有资源，并把资源存入info中
		
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		/*info.setStringPermissions(set集合);
		info.setRoles(set集合);
		info.setObjectPermissions(set集合);*/
		return info;

	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//token中储存着输入的用户名和密码
		UsernamePasswordToken upToken = (UsernamePasswordToken)token;
		//获得用户名与密码
		String email = upToken.getUsername();
		String password = String.valueOf(upToken.getPassword());
		//TODO 与数据库中用户名和密码进行比对。比对成功则返回info，比对失败则抛出对应信息的异常AuthenticationException
		User user=userService.login(email, password);
		//用户不存在
		if(user==null)
		{
			throw new UnknownAccountException();
		}
		/*//加密
		try{
			Md5Hash Md5Hash=new Md5Hash(password);
		System.out.println(Md5Hash.toBase64());
		}
		catch(Exception e){
			e.printStackTrace();
		}*/
		//用户名、密码正确
		if(user.getPassword().equals(password))
		{
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user,password.toCharArray(),getName());
			return info;
		}
		return null;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}


}
