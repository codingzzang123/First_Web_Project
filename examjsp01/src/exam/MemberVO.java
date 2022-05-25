package exam;

public class MemberVO {
	private int num;
	private String id;
	private String password;
	private String name;
	private String e_mail;
	private String phone;
	private String zipcode;
	private String job;
	
	public MemberVO(){}
	MemberVO(int a, String a2, String a3, String a4, String a5, String a6, String a7, String a8){
		super();
		this.num=a;
		this.id=a2;
		this.password=a3;
		this.name=a4;
		this.e_mail=a5;
		this.phone=a6;
		this.zipcode=a7;
		this.job=a8;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	
}
