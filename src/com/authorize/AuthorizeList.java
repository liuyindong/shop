package com.authorize;

public interface AuthorizeList
{
	//授权返回的页面
	String qqRedirectUri = "www.ttgjie.com/user/qqLogin";
	
	//授权登陆
	String qqAcctssUrl = "https://graph.qq.com/oauth2.0/token";
	String qqOpenIdUrl = "https://graph.qq.com/oauth2.0/me";
	
	//获取用户高级资料
	String qqUserInfoUrl = "https://graph.qq.com/user/get_user_info";
	
	
	
	
	String qqAppId = "100444179";
	String aaAppKey = "a060225ee378f6e5fcee1dda43fa5c0f";
	
	String qqAccessToken(String code);
}
