package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Makeup;
import com.entity.Category;
import com.service.MakeupService;
import com.service.CategoryService;
import com.service.UserService;
import com.util.PageUtil;

@Namespace("/index")
@Results({
	@Result(name="index",location="/index/index.jsp"),
	@Result(name="about",location="/index/about.jsp"),
	@Result(name="category",location="/index/category.jsp"),
	@Result(name="special",location="/index/special.jsp"),
	@Result(name="new",location="/index/new.jsp"),
	@Result(name="sale",location="/index/sale.jsp"),
	@Result(name="login",location="/index/login.jsp"),
	@Result(name="register",location="/index/register.jsp"),
	@Result(name="detail",location="/index/detail.jsp"),
	@Result(name="right",location="/index/right.jsp"),
	@Result(name="search",location="/index/search.jsp"),
})	
public class IndexAction extends BaseAction{

	private int makeupid;
	private int categoryid;
	private int flag;
	private Makeup makeup;
	private String searchName;
	
	private List<Makeup> makeupList;
	private List<Makeup> specialList;
	private List<Makeup> newList;
	private List<Makeup> saleList;
	private List<Category> categoryList;
	
	@Resource
	private UserService userService;
	@Resource
	private MakeupService makeupService;
	@Resource
	private CategoryService categoryService;
	

	/**
	 * 首页
	 * @return
	 */
	@Action("index")
	public String index(){
		categoryList = categoryService.getList();
		saleList = makeupService.getSpecialList(Makeup.type_sale, 1, 2);
		specialList = makeupService.getSpecialList(Makeup.type_special, 1, 2);
		newList = makeupService.getSpecialList(Makeup.type_new, 1, 6);
		flag = 1;
		return "index";
	}
	
	/**
	 * 简介
	 * @return
	 */
	@Action("about")
	public String about(){
		categoryList = categoryService.getList();
		saleList = makeupService.getSpecialList(Makeup.type_sale, 1, 2);
		flag = 2;
		return "about";
	}
	
	/**
	 * 精品推荐
	 * @return
	 */
	@Action("special")
	public String special(){
		categoryList = categoryService.getList();
		saleList = makeupService.getSpecialList(Makeup.type_sale, 1, 2);
		specialList = makeupService.getSpecialList(Makeup.type_special, page, 3);
		pageTool = PageUtil.getPageTool(super.getRequest(), makeupService.getSpecialTotal(Makeup.type_special), page, 3);
		flag = 3;
		return "special";
	}
	
	/**
	 * 最新出版
	 * @return
	 */
	@Action("new")
	public String news(){
		categoryList = categoryService.getList();
		saleList = makeupService.getSpecialList(Makeup.type_sale, 1, 2);
		newList = makeupService.getSpecialList(Makeup.type_new, page,3);
		pageTool = PageUtil.getPageTool(super.getRequest(), makeupService.getSpecialTotal(Makeup.type_new), page, 3);
		flag = 4;
		return "new";
	}
	
	/**
	 * 优惠促销
	 * @return
	 */
	@Action("sale")
	public String sale(){
		categoryList = categoryService.getList();
		saleList = makeupService.getSpecialList(Makeup.type_sale, 1, 2);
		saleList = makeupService.getSpecialList(Makeup.type_sale, page, 3);
		pageTool = PageUtil.getPageTool(super.getRequest(), makeupService.getSpecialTotal(Makeup.type_sale), page, 3);
		flag = 5;
		return "sale";
	}
	
	/**
	 * 类目搜索
	 * @return
	 */
	@Action("category")
	public String category(){
		categoryList = categoryService.getList();
		saleList = makeupService.getSpecialList(Makeup.type_sale, 1, 2);
		makeupList = makeupService.getCategoryList(categoryid, page, 12);
		pageTool = PageUtil.getPageTool(super.getRequest(), makeupService.getCategoryTotal(categoryid), page, 12);
		return "category";
	}
	
	/**
	 * 名称搜索
	 * @return
	 */
	@Action("search")
	public String search(){
		categoryList = categoryService.getList();
		saleList = makeupService.getSpecialList(Makeup.type_sale, 1, 2);
		if (searchName!=null && !searchName.trim().isEmpty()) {
			makeupList = makeupService.getList(searchName, page, 12);
			pageTool = PageUtil.getPageTool(super.getRequest(), makeupService.getTotal(searchName), page, 12);
		}
		return "search";
	}
	
	/**
	 * 详情
	 * @return
	 */
	@Action("detail")
	public String detail(){
		categoryList = categoryService.getList();
		saleList = makeupService.getSpecialList(Makeup.type_sale, 1, 2);
		categoryList = categoryService.getList();
		saleList = makeupService.getSpecialList(Makeup.type_sale, 1, 2);
		makeup = makeupService.get(makeupid);
		return "detail";
	}


	
	public List<Makeup> getMakeupList() {
		return makeupList;
	}

	public void setMakeupList(List<Makeup> makeupList) {
		this.makeupList = makeupList;
	}

	public List<Makeup> getSpecialList() {
		return specialList;
	}

	public void setSpecialList(List<Makeup> specialList) {
		this.specialList = specialList;
	}

	public List<Makeup> getNewList() {
		return newList;
	}

	public void setNewList(List<Makeup> newList) {
		this.newList = newList;
	}

	public List<Makeup> getSaleList() {
		return saleList;
	}

	public void setSaleList(List<Makeup> saleList) {
		this.saleList = saleList;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public Makeup getMakeup() {
		return makeup;
	}

	public void setMakeup(Makeup makeup) {
		this.makeup = makeup;
	}

	public int getMakeupid() {
		return makeupid;
	}

	public void setMakeupid(int makeupid) {
		this.makeupid = makeupid;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
}
