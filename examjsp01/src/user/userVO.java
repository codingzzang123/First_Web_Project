package user;

public class userVO {
	private String id;
	private String pw;
	private String age;
	private String comment;
	
	public userVO() {}
	
	public userVO(String id, String pw, String age, String comment) {
		super();
		this.id=id;
		this.pw=pw;
		this.age=age;
		this.comment=comment;
	}
	@Override
	public String toString() {
		return "userVO [id=" + id + ", pw=" + pw + ", age=" + age + ", comment=" + comment + "]";
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
}
