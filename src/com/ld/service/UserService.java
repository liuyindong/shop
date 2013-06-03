package com.ld.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ld.dao.MyBatisDao;
import com.ld.domain.User;
import com.ld.service.util.SercUtil;

/** 用户 **/
@Service("UserService")
public class UserService extends SercUtil
{

	@Autowired
	private MyBatisDao myBatisDao;
	
	public User login(String username,String password)
	{
		map.put("username", username);
		map.put("password", password);
		return myBatisDao.selectOne("UserMapper.userLogin",map);
	}
	
}