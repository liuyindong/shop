package com.ld.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ld.dao.MyBatisDao;
import com.ld.service.util.SercUtil;
/**
 * 通用的，只实现了查询表的所有数据
 * @author LD
 *
 */
@Service
public class CbmsService extends SercUtil
{
	
	@Autowired
	private MyBatisDao myBatisDao;

	/**
	 * 查询所有
	 * @param dateName
	 * @return
	 */
	public List<Map<String, Object>> listAll(String dateName)
	{
		mapVal(dateName);
		return myBatisDao.selectList("CbmsMapper.list", map);
	}
}
