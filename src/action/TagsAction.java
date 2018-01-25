package action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

import model.Citys;
import model.Gender;
import model.Province;
import model.User;

public class TagsAction extends ActionSupport{
	private String username;
	private Date date;
	private User user;
	private List<Gender> genders;
	private Map<Province, List<Citys>> map;
	
	@Override
	public String execute() throws Exception {
		//username=null;
		username="<h1>这是一级标题</h1>";
		
		date = new Date();
		
		user = new User("张三","222",22);
		
		genders = new ArrayList<>();
		Gender gender1 = new Gender(1, "男");
		Gender gender2 = new Gender(2, "女");
		genders.add(gender1);
		genders.add(gender2);
		
		//省市联动
		map = new HashMap<>();
		
		Province p1 = new Province(1,"浙江");
		Citys c1 = new Citys(1,"杭州");
		Citys c2 = new Citys(2,"宁波");
		Citys c3= new Citys(3,"萧山");
		
		List list1 = new ArrayList<>();
		list1.add(c1);
		list1.add(c2);
		list1.add(c3);
		
		Province p2 = new Province(2,"江苏");
		Citys c21 = new Citys(1,"南京");
		Citys c22 = new Citys(2,"苏州");
		Citys c23 = new Citys(3,"无锡");
		
		List list2 = new ArrayList<>();
		list2.add(c21);
		list2.add(c22);
		list2.add(c23);
		
		map.put(p1, list1);
		map.put(p2, list2);
		
		return SUCCESS;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Gender> getGenders() {
		return genders;
	}

	public void setGenders(List<Gender> genders) {
		this.genders = genders;
	}

	public Map<Province, List<Citys>> getMap() {
		return map;
	}

	public void setMap(Map<Province, List<Citys>> map) {
		this.map = map;
	}
	
	
	
}
