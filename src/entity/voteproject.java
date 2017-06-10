package entity;

import java.sql.Date;

public class voteproject{

	private String title;
	private String username;
	private Date time;
	private String votetype;
	private String votenumber;
	private int id;
	private String ban;
	
	public String getBan() {
		return ban;
	}

	public void setBan(String ban) {
		this.ban = ban;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getVotetype() {
		return votetype;
	}
	public void setVotetype(String votetype) {
		this.votetype = votetype;
	}
	public String getVotenumber() {
		return votenumber;
	}
	public void setVotenumber(String votenumber) {
		this.votenumber = votenumber;
	}
	
}
