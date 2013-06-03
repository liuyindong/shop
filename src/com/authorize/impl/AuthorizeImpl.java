package com.authorize.impl;

import com.authorize.AuthorizeList;

public class AuthorizeImpl implements AuthorizeList
{

	@Override
	public String qqAccessToken(String code)
	{
		String returnToken = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id="+qqAppId+"&client_secret "+aaAppKey+"&code="+code+"&redirect_uri="+qqRedirectUri;
		return returnToken;
	}

}
