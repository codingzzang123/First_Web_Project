package vote;

public class ChoiceVO {
	String topic;
	String chname;
	String chcom;
	int count;
//	String [] voter;
	public ChoiceVO() {}
	public ChoiceVO(String topic , String chname, String chcom , int count) {
		super();
		this.topic = topic;
		this.count=count;
		this.chname = chname;
		this.chcom = chcom;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getChname() {
		return chname;
	}
	public void setChname(String chname) {
		this.chname = chname;
	}
	public String getChcom() {
		return chcom;
	}
	public void setChcom(String chcom) {
		this.chcom = chcom;
	}
	
}
