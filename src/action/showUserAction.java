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
		flag="ֵջ�д��Action��ʵ��";
		
		user = new User();
		user.setUsername("����ͨ��OGNL������Actionʵ���е�����ֵ");
		
		request.put("req", "����Map��ʽ��request����Ҫʵ��RequestAware�ӿ�");
		
		list = new ArrayList<>();
		list.add("ʹ��list������Ҫ�Լ�new һ��ArrayList����Ȼ�ͱ���ָ��");
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
		User user1 = new User("�û�1","123",20);
		User user2 = new User("�û�2","123",21);
		User user3 = new User("�û�3","123",22);
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
