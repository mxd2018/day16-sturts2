package action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import model.Gender;
import model.User;

public class TagsAction extends ActionSupport{
	private String username;
	private Date date;
	private User user;
	private List<Gender> genders;
	
	@Override
	public String execute() throws Exception {
		//username=null;
		username="<h1>这是一级标题</h1>";
		
		date = new Date();
		
		user = new User("张三","222",22);
		
		genders = new ArrayList<>();
		Gender gender1 = new Gender(1, "男");
		Gender gender2 = new Gender(2, "女");
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
	
	
	
}
