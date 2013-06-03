package com.ld.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ld.service.CbmsService;
import com.ld.service.UploadService;

@Controller
public class FileUpload
{
	/*@Autowired
	private UploadService uploadService;
	
	@Autowired
	private CbmsService cbmsService;
	
	
	@RequestMapping("/toUpload")
	public String toUpload()
	{
		return "upload";
	}

	@RequestMapping("/swfUpload")
	protected void swfUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		uploadService.uploadFile(request);
	}
	@RequestMapping("/ss")
	public void aa()
	{
		cbmsService.listAll("user");
	}*/
}
