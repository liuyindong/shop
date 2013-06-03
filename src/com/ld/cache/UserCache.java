package com.ld.cache;

import java.util.List;

import com.ld.cache.util.OsCacheMethods;
import com.ld.domain.User;

public class UserCache
{
	private OsCacheMethods osCacheMethods;
	private static User lock = new User();
	private static UserCache instance;

	private UserCache (String name,Integer time)
	{
		// 这个根据配置文件来，初始BaseCache而已;
		osCacheMethods = new OsCacheMethods(name, time);
	}
	
	public static UserCache getInstance(String name,Integer time)
	{
		if (instance == null)
		{
			synchronized (lock)
			{
				if (instance == null)
				{
					instance = new UserCache(name,time);
				}
			}
		}
		return instance;
	}

	public void putMsgList(List<?> listSearch,String name)
	{
		osCacheMethods.put(name, listSearch);
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> listNews(String name)
	{
		List<Object> listObject;
		try
		{
			listObject = (List<Object>) osCacheMethods.get(name);
			return listObject;
		}
		catch (Exception e)
		{
			return null;
		}
	}
}
