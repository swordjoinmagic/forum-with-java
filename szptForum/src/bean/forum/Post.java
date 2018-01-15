package bean.forum;

import java.io.*;
import java.util.*;

import com.mysql.fabric.xmlrpc.base.Data;

import java.sql.*;
import ado.DataBaseADO;

public class Post {
	private int id;
	private String creatorname;
	private int plateid;
	private String title;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCreatorname() {
		return creatorname;
	}
	public void setCreatorname(String creatorname) {
		this.creatorname = creatorname;
	}
	public int getPlateid() {
		return plateid;
	}
	public void setPlateid(int plateid) {
		this.plateid = plateid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
	public int getReplycount() {
		return replycount;
	}
	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	private Timestamp createtime;
	private int replycount;
	private int viewcount;
	
	// 根据帖子id，在数据库中查找帖子信息，并且把其他值全部补全了
	public void init() {
		DataBaseADO ado = DataBaseADO.getAdo();
		String sql = "select * from posts where id=?";
		ResultSet rs = ado.prequery_auto(sql, this.id);
		try {
			while(rs.next()) {
				this.creatorname = rs.getString("creatorname");
				this.title = rs.getString("title");
				this.replycount = rs.getInt("replycount");
				this.viewcount = rs.getInt("viewcount");
				this.createtime = rs.getTimestamp("createtime");
				this.plateid = rs.getInt("plateid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
