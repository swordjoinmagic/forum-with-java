package bean.forum;

import java.io.*;
import java.util.*;

import ado.DataBaseADO;

import java.sql.*;

public class PostComment {
	private int postid;
	private String username;
	private Timestamp time;
	private String content;
	private int agreecount;
	private int againstcount;
	private int height;
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAgreecount() {
		return agreecount;
	}
	public void setAgreecount(int agreecount) {
		this.agreecount = agreecount;
	}
	public int getAgainstcount() {
		return againstcount;
	}
	public void setAgainstcount(int againstcount) {
		this.againstcount = againstcount;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	
	// 根据帖子id和发帖人名称初始化一个楼层评论信息
	public PostComment(int postid,String username) {
		DataBaseADO ado = DataBaseADO.getAdo();
		
		this.postid = postid;
		this.username = username;
		String sql = "select * from post_comment where postid=? and username=?";
		ResultSet rs = ado.prequery_auto(sql, postid,username);
		try {
			while(rs.next()) {
				this.time = rs.getTimestamp("time");
				this.content = rs.getString("content");
				this.againstcount = rs.getInt("againstcount");
				this.agreecount = rs.getInt("agreecount");
				this.height = rs.getInt("height");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public PostComment() {
		super();
	}

}
