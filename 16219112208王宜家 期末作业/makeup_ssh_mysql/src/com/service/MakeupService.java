package com.service;

import java.util.List;
import java.util.Objects;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.MakeupDao;
import com.entity.Makeup;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class MakeupService {

	@Resource	
	private MakeupDao makeupDao;
		
//通过名称搜索

	public List<Makeup> getList(String name, int page, int size) {
		return makeupDao.getList(name, page, size);
	}
	
//分类数量 无记录返回空集合

	public long getTotal(String name){
		return makeupDao.getTotal(name);
	}
	
//通过分类搜索

	public List<Makeup> getCategoryList(int categoryid, int page, int size) {
		return makeupDao.getCategoryList(categoryid, page, size);
	}
	
// 分类数量 无记录返回空集合

	public long getCategoryTotal(int categoryid){
		return makeupDao.getCategoryTotal(categoryid);
	}
	
// 获取特卖列表 无记录返回空集合

	public List<Makeup> getSpecialList(int type, int page, int size){
		return makeupDao.getSpecialList(type, page, size);
	}
	
//获取特卖列表 无记录返回空集合

	public long getSpecialTotal(int type){
		return makeupDao.getSpecialTotal(type);
	}

//通过id获取
	
	public Makeup get(int makeupid) {
		Makeup makeup = makeupDao.get(Makeup.class, makeupid);
		// 只显示前70个字符
		if(Objects.nonNull(makeup) && makeup.getIntro().length() > 70) {
			makeup.setIntro(makeup.getIntro().substring(0, 70) + "...");
		}
		return makeup;
	}

//商品列表

	public List<Makeup> getList(int status, int page, int rows) {
		return makeupDao.getList(status, page, rows);
	}

// 总数

	public long getTotal(int status) {
		return makeupDao.getTotal(status);
	}

//添加

	public Integer add(Makeup makeup) {
		return makeupDao.save(makeup);
	}

//修改

	public boolean update(Makeup makeup) {
		return makeupDao.update(makeup);
	}

//删除

	public boolean delete(Makeup makeup) {
		return makeupDao.delete(makeup);
	}

	
	
}
