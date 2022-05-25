package vote;

public class VoterVO {
	String user;
	String subject;
	String chname;
	
	public VoterVO() {}
	public VoterVO(String user, String subject, String chname) {
		super();
		this.user = user;
		this.subject = subject;
		this.chname = chname;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getChname() {
		return chname;
	}
	public void setChname(String chname) {
		this.chname = chname;
	}
	
	
}
