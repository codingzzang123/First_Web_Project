package user;

public class userVO {
	private String id;
	private String pw;
	private String age;
	private String comment;
	private String img;
	private String code;
	
	public userVO() {}
	
	public userVO(String id, String pw, String age, String comment,String img, String code) {
		super();
		this.id=id;
		this.pw=pw;
		this.age=age;
		this.comment=comment;
		this.img = img;
		this.code = code;
	}
	@Override
	public String toString() {
		return "userVO [id=" + id + ", pw=" + pw + ", age=" + age + ", comment=" + comment + "]";
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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
