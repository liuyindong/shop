package com.ld.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Service;

import com.ld.util.DateUtil;

@Service
public class UploadService
{
	public void uploadFile(HttpServletRequest request)
	{
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存缓冲区，超过后写入临时文件
		factory.setSizeThreshold(10240000);
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 设置单个文件的最大上传值
		upload.setFileSizeMax(10002400000l);
		// 设置整个request的最大值
		upload.setSizeMax(10002400000l);
		upload.setHeaderEncoding("UTF-8");

		try
		{
			List<?> items = upload.parseRequest(request);
			FileItem item = null;
			for (int i = 0; i < items.size(); i++)
			{
				item = (FileItem) items.get(i);
				// 保存文件
				if (!item.isFormField() && item.getName().length() > 0)
				{
					String savePath = DateUtil.addressRadom() + DateUtil.generateFileName(item.getName());

					File dirname = new File(savePath);

					if (!dirname.isDirectory())
					{
						dirname.getParentFile().mkdirs();
						dirname.createNewFile();
					}

					item.write(new File(savePath));
					BufferedImage bi = ImageIO.read(new File(savePath));
					bi.getType();
					int srcWidth = bi.getWidth(); // 源图宽度
					int srcHeight = bi.getHeight(); // 源图高度
				}
			}
		}
		catch (FileUploadException e)
		{
			e.printStackTrace();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
