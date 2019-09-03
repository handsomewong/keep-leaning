package com.action;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Admin;
import com.entity.Makeup;
import com.entity.Category;
import com.entity.Indent;
import com.entity.Items;
import com.entity.Users;
import com.service.AdminService;
import com.service.MakeupService;
import com.service.CategoryService;
import com.service.IndentService;
import com.service.UserService;
import com.util.PageUtil;
import com.util.SafeUtil;
import com.util.UploadUtil;

@Namespace("/admin")
@Results({
	@Result(name="login",location="/admin/login.jsp"),
	@Result(name="main",location="/admin/main.jsp"),
	@Result(name="indent",location="/admin/pages/indent-list.jsp"),
	@Result(name="reindent",type="redirect",location="indentList.action?status=${status}&page=${page}"),
	@Result(name="item",location="/admin/pages/item-list.jsp"),
	@Result(name="user",location="/admin/pages/user-list.jsp"),
	@Result(name="useradd",location="/admin/pages/user-add.jsp"),
	@Result(name="userreset",location="/admin/pages/user-reset.jsp"),
	@Result(name="userupdate",location="/admin/pages/user-update.jsp"),
	@Result(name="reuser",type="redirect",location="userList.action?page=${page}"),
	@Result(name="makeup",location="/admin/pages/makeup-list.jsp"),
	@Result(name="makeupadd",location="/admin/pages/makeup-add.jsp"),
	@Result(name="makeupupdate",location="/admin/pages/makeup-update.jsp"),
	@Result(name="remakeup",type="redirect",location="makeupList.action?status=${status}&page=${page}"),
	@Result(name="category",location="/admin/pages/category-list.jsp"),
	@Result(name="categoryupdate",location="/admin/pages/category-update.jsp"),
	@Result(name="recategory",type="redirect",location="categoryList.action?page=${page}"),
	@Result(name="admin",location="/admin/pages/admin-list.jsp"),
	@Result(name="adminadd",location="/admin/pages/admin-add.jsp"),
	@Result(name="adminreset",location="/admin/pages/admin-reset.jsp"),
	@Result(name="readmin",type="redirect",location="adminList.action?page=${page}"),
})	
public class AdminAction extends BaseAction{

	private static final int rows = 10;
	
	@Resource
	private AdminService adminService;
	@Resource
	private IndentService indentService;
	@Resource
	private UserService userService;
	@Resource
	private MakeupService makeupService;
	@Resource
	private CategoryService categoryService;
	
	private List<Indent> indentList;
	private List<Items> itemList;
	private List<Users> userList;
	private List<Makeup> makeupList;
	private List<Category> categoryList;
	private List<Admin> adminList;
	
	private Users user;
	private Makeup makeup;
	private Category category;
	private Admin admin;
	private int status;
	private int flag;
	private int id;
	
	private File photo;		//获取上传文件
    private String photoFileName;	//获取上传文件名称
    private String photoContentType;		//获取上传文件类型
	
    
	/**
	 * 管理员登录
	 * @return
	 */
    @Action("login")
	public String login() {
		if (adminService.checkUser(admin.getUsername(), admin.getPassword())) {
			getSession().setAttribute("admin", admin.getUsername());
			return "main";
		}
		getRequest().setAttribute("msg", "用户名或密码错误!");
		return "login";
	}
	
	
	/**
	 * 订单列表
	 * @return
	 */
    @Action("indentList")
	public String indentList(){
		indentList = indentService.getList(status, page, rows);
		pageTool = PageUtil.getPageToolAdmin(getRequest(), indentService.getTotal(status), page, rows);
		return "indent";
	}
	
	/**
	 * 订单处理
	 * @return
	 */
    @Action("indentDispose")
	public String indentDispose(){
		indentService.dispose(id);
		return "reindent";
	}
	
	/**
	 * 订单删除
	 * @return
	 */
    @Action("indentDelete")
	public String indentDelete(){
		indentService.delete(id);
		return "reindent";
	}
	
	/**
	 * 订单项列表
	 * @return
	 */
    @Action("itemList")
	public String itemList(){
		itemList = indentService.getItemList(id, page, rows);
		pageTool = PageUtil.getPageToolAdmin(getRequest(), indentService.getItemTotal(id), page, rows);
		return "item";
	}
	
	
	/**
	 * 顾客管理
	 * @return
	 */
    @Action("userList")
	public String userList(){
		userList = userService.getList(page, rows);
		pageTool = PageUtil.getPageToolAdmin(getRequest(), userService.getTotal(), page, rows);
		return "user";
	}
	
	/**
	 * 顾客添加
	 * @return
	 */
    @Action("userAdd")
	public String userAdd(){
		if (userService.isExist(user.getUsername())) {
			getRequest().setAttribute("msg", "用户名已存在!");
			return "useradd";
		}
		 userService.add(user);
		 return "reuser";
	}
	
	/**
	 * 顾客密码重置页面
	 * @return
	 */
    @Action("userRe")
	public String userRe(){
		user = userService.get(id);
		return "userreset";
	}
	
	/**
	 * 顾客密码重置
	 * @return
	 */
    @Action("userReset")
	public String userReset(){
		Users old = userService.get(user.getId());
		old.setPassword(SafeUtil.encode(user.getPassword()));
		userService.update(old);
		return "reuser";
	}
	
	/**
	 * 顾客更新
	 * @return
	 */
    @Action("userUp")
	public String userUp(){
		user = userService.get(id);
		return "userupdate";
	}
	
	/**
	 * 顾客更新
	 * @return
	 */
    @Action("userUpdate")
	public String userUpdate(){
		Users old = userService.get(user.getId());
		old.setName(user.getName());
		old.setPhone(user.getPhone());
		old.setAddress(user.getAddress());
		userService.update(old);
		return "reuser";
	}
	
	/**
	 * 顾客删除
	 * @return
	 */
    @Action("userDelete")
	public String userDelete(){
		userService.delete(id);
		return "reuser";
	}
	
	
	/**
	 * 图书列表
	 * @return
	 */
    @Action("makeupList")
	public String makeupList(){
		makeupList = makeupService.getList(status, page, rows);
		pageTool = PageUtil.getPageToolAdmin(getRequest(), makeupService.getTotal(status), page, rows);
		return "makeup";
	}
	
	/**
	 * 图书添加
	 * @return
	 */
    @Action("makeupAd")
	public String makeupAd(){
		categoryList = categoryService.getList();
		return "makeupadd";
	}
	
	/**
	 * 图书添加
	 * @return
	 */
    @Action("makeupAdd")
	public String makeupAdd(){
		makeup.setCover(UploadUtil.fileUpload(photo, photoFileName));
		makeupService.add(makeup);
		return "remakeup";
	}
	
	/**
	 * 图书更新
	 * @return
	 */
    @Action("makeupUp")
	public String makeupUp(){
		categoryList = categoryService.getList();
		makeup = makeupService.get(id);
		return "makeupupdate";
	}
	
	/**
	 * 图书更新
	 * @return
	 */
    @Action("makeupUpdate")
	public String makeupUpdate(){
		if (photo != null) {
			makeup.setCover(UploadUtil.fileUpload(photo, photoFileName));
		}
		makeupService.update(makeup);
		return "remakeup";
	}
	
	/**
	 * 图书删除
	 * @return
	 */
    @Action("makeupDelete")
	public String makeupDelete(){
		makeupService.delete(makeup);
		return "remakeup";
	}
	
	/**
	 * 图书设置
	 * @return
	 */
    @Action("makeupSet")
	public String makeupSet(){
		makeup = makeupService.get(id);
		switch (flag) {
		case 10:
			makeup.setSpecial(false);
			break;
		case 11:
			makeup.setSpecial(true);
			break;
		case 20:
			makeup.setNews(false);
			break;
		case 21:
			makeup.setNews(true);
			break;
		case 30:
			makeup.setSale(false);
			break;
		case 31:
			makeup.setSale(true);
			break;
		}
		makeupService.update(makeup);
		return "remakeup";
	}
	
	
	/**
	 * 类目列表
	 * @return
	 */
    @Action("categoryList")
	public String categoryList(){
		categoryList = categoryService.getList(page, rows);
		pageTool = PageUtil.getPageToolAdmin(getRequest(), categoryService.getTotal(), page, rows);
		return "category";
	}
	
	/**
	 * 类目添加
	 * @return
	 */
    @Action("categoryAdd")
	public String categoryAdd(){
		categoryService.add(category);
		return "recategory";
	}
	
	/**
	 * 类目更新
	 * @return
	 */
    @Action("categoryUp")
	public String categoryUp(){
		category = categoryService.get(id);
		return "categoryupdate";
	}
	
	/**
	 * 类目更新
	 * @return
	 */
    @Action("categoryUpdate")
	public String categoryUpdate(){
		categoryService.update(category);
		return "recategory";
	}
	
	/**
	 * 类目删除
	 * @return
	 */
    @Action("categoryDelete")
	public String categoryDelete(){
		categoryService.delete(category);
		return "recategory";
	}
	
	
	/**
	 * 管理员列表
	 * @return
	 */
    @Action("adminList")
	public String adminList(){
		adminList = adminService.getList(page, rows);
		pageTool = PageUtil.getPageToolAdmin(getRequest(), adminService.getTotal(), page, rows);
		return "admin";
	}
	
	/**
	 * 管理员添加
	 * @return
	 */
    @Action("adminAdd")
	public String adminAdd(){
		if (adminService.isExist(admin.getUsername())) {
			getRequest().setAttribute("msg", "用户名已存在!");
			return "adminadd";
		}
		adminService.add(admin);
		return "readmin";
	}
	
	/**
	 * 重置密码页面
	 * @return
	 */
    @Action("adminRe")
	public String adminRe(){
		admin = adminService.get(id);
		return "adminreset";
	}
	
	/**
	 * 重置密码
	 * @return
	 */
    @Action("adminReset")
	public String adminReset(){
		admin.setPassword(SafeUtil.encode(admin.getPassword()));
		adminService.update(admin);
		return "readmin";
	}
	
	/**
	 * 管理员删除
	 * @return
	 */
    @Action("adminDelete")
	public String adminDelete(){
		adminService.delete(admin);
		return "readmin";
	}
	
	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public List<Makeup> getMakeupList() {
		return makeupList;
	}

	public void setMakeupList(List<Makeup> makeupList) {
		this.makeupList = makeupList;
	}

	public List<Indent> getIndentList() {
		return indentList;
	}

	public void setIndentList(List<Indent> indentList) {
		this.indentList = indentList;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Items> getItemList() {
		return itemList;
	}

	public void setItemList(List<Items> itemList) {
		this.itemList = itemList;
	}

	public List<Users> getUserList() {
		return userList;
	}

	public void setUserList(List<Users> userList) {
		this.userList = userList;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Makeup getMakeup() {
		return makeup;
	}

	public List<Admin> getAdminList() {
		return adminList;
	}

	public void setAdminList(List<Admin> adminList) {
		this.adminList = adminList;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

	public String getPhotoContentType() {
		return photoContentType;
	}

	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}

	public void setMakeup(Makeup makeup) {
		this.makeup = makeup;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

}
