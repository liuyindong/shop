package com.ld.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController
{
	@RequestMapping("/index")
	public String homeIndex()
	{
		return "index";
	}
	
	@RequestMapping("/toViewPage")
	public String toViewPage()
	{
		return "view_page";
	}
	
	@RequestMapping("/toList")
	public String toList()
	{
		return "list";
	}
	@RequestMapping("/toMyAttention")
	public String myAttention()
	{
		return "my_attention";
	}
	@RequestMapping("/toMyAlbum")
	public String toMyAlbum()
	{
		return "my_album";
	}
	@RequestMapping("/toMmessagecenter")
	public String messagecenter()
	{
		return "messagecenter";
	}
	@RequestMapping("/starchannel")
	public String starchannel()
	{
		return "starchannel";
	}
	@RequestMapping("/starApply")
	public String starchannelApply()
	{
		return "starchannel_apple";
	}
	@RequestMapping("/sheAlbum")
	public String sheAlbum()
	{
		return "she_album";
	}
	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}
	
	
	
}
