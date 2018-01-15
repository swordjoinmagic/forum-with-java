package bean.forum;

// 一个单独的板块内容
public class Plates {
	private int id;
	private String name;
	private int bigplatesid;	//对应的大板块id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBigplatesid() {
		return bigplatesid;
	}
	public void setBigplatesid(int bigplatesid) {
		this.bigplatesid = bigplatesid;
	}
	
}
