package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;

import model.User;

public class showUserAction extends ActionSupport implements RequestAware{
	private String flag;
	private User user;
	private Map<String, Object> request;
	private List<String> list;
	private Set<String> set;
	private Map<String, String> map;
	private List<User> users;
 
	@Override
	public String execute() throws Exception {
		flag="值栈中存放Action的实例";
		
		user = new User();
		user.setUsername("可以通过OGNL来访问Action实例中的属性值");
		
		request.put("req", "这是Map方式的request域，需要实现RequestAware接口");
		
		list = new ArrayList<>();
		list.add("使用list属性需要自己new 一个ArrayList，不然就报空指针");
		list.add("list2");
		list.add("list3");
		
		set = new HashSet<>();
		set.add("set1");
		set.add("set2");
		set.add("set3");
		
		map = new HashMap<>();
		map.put("map1", "map111");
		map.put("map2", "map222");
		map.put("map3", "map333");
		
		users = new ArrayList<>();
		User user1 = new User("用户1","123",20);
		User user2 = new User("用户2","123",21);
		User user3 = new User("用户3","123",22);
		users.add(user1);
		users.add(user2);
		users.add(user3);
		
		return SUCCESS;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request=arg0;
		
	}

	public List<String> getList() {
		return list;
	}

	public void setList(List<String> list) {
		this.list = list;
	}

	public Set<String> getSet() {
		return set;
	}

	public void setSet(Set<String> set) {
		this.set = set;
	}

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	
	
	
	
}
