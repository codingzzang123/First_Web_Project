package vote;

public class TopicVO {
//	SUBJECT VARCHAR(20) PRIMARY KEY  ,
//    MAKER VARCHAR(20), 1

//    PUBDATE DATE,	 	 3
//    CONTENT_S VARCHAR(200) , 4
//    CONSTRAINT "MK" FOREIGN KEY(MAKER) REFERENCES "USER" ("ID")
//    );
    String subject;
    String maker;
    String date;
    String content_s;
    public TopicVO() {}
	public TopicVO(String subject, String maker, String date, String content_s) {
		super();
		this.subject = subject;
		this.maker = maker;
		this.date = date;
		this.content_s = content_s;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContent_s() {
		return content_s;
	}
	public void setContent_s(String content_s) {
		this.content_s = content_s;
	}
	
}
