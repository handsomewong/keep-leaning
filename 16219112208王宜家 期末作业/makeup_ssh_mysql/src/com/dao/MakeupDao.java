package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Makeup;

@Repository // 注册dao层bean等同于@Component
public class MakeupDao extends BaseDao{

//	通过名称搜索

	public List<Makeup> getList(String name, int page, int size){
		return getSession().createQuery("from Makeup where name like '%"+name+"%'", Makeup.class)
				.setFirstResult((page-1)*size).setMaxResults(size).list();
	}
	
//	获取名称总数

	public long getTotal(String name){
		return getSession().createQuery("select count(*) from Makeup where name like '%"+name+"%'", Long.class)
				.uniqueResult();
	}
	
//  通过分类搜索

	public List<Makeup> getCategoryList(int categoryid, int page, int size){
		return getSession().createQuery("from Makeup where category_id=:categoryid", Makeup.class)
				.setParameter("categoryid", categoryid).setFirstResult((page-1)*size).setMaxResults(size).list();
	}
	
//获取分类总数

	public long getCategoryTotal(int categoryid){
		return getSession().createQuery("select count(*) from Makeup where category_id=:categoryid", Long.class)
				.setParameter("categoryid", categoryid).uniqueResult();
	}
	

//	 	获取特卖列表
//	  type 1推荐/2新品/3特价

	public List<Makeup> getSpecialList(int type, int page, int size){
		return getSession().createQuery("from Makeup "+packWhereSql(type), Makeup.class)
				.setFirstResult((page-1)*size).setMaxResults(size).list();
	}
	
//获取特卖总数

	public long getSpecialTotal(int type){
		return getSession().createQuery("select count(*) from Makeup "+packWhereSql(type), Long.class).uniqueResult();
	}
	
//封装sql

	private String packWhereSql(int type) {
		String sql = "";
		switch (type) {
		case Makeup.type_special:
			sql += "where special=1";
			break;
		case Makeup.type_new:
			sql += "where news=1";
			break;
		case Makeup.type_sale:
			sql += "where sale=1";
			break;
		}
		return sql;
	}

//获取列表

	public List<Makeup> getList(int status, int page, int rows){
		return getSession().createQuery("from Makeup "+packSql(status)+" order by id desc", Makeup.class)
				.setFirstResult(rows*(page-1)).setMaxResults(rows).list();
	}

// 总数

	public long getTotal(int status) {
		return getSession().createQuery("select count(*) from Makeup "+packSql(status), Long.class).uniqueResult();
	}
	
//封装sql

	private String packSql(int status) {
		String sql = "";
		switch (status) {
		case 1:
			sql += " where special=1";
			break;
		case 2:
			sql += " where news=1";
			break;
		case 3:
			sql += " where sale=1";
			break;
		}
		return sql;
	}
	
}
