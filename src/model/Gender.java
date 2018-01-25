package model;

public class Gender {
	private Integer id;
	private String sex;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Gender(Integer id, String sex) {
		super();
		this.id = id;
		this.sex = sex;
	}
	
}
