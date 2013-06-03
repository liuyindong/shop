package com.ld.util;

public class InterUtil
{
	public static String returnLogMsg(Integer num)
	{
		switch(num)
		{
		case -1:
			return "用户名密码错误...";
		default:
			return Interface.serverException;
		}
	}


}