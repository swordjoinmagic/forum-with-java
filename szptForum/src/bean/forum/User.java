package bean.forum;

import java.io.*;
import java.util.*;

import com.mysql.fabric.xmlrpc.base.Data;

import ado.DataBaseADO;
import java.sql.*;

public class User {
	private String name;
	private String password;
	private String email;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	// 通过name初始化一个用户类
	public void init(String name) {
		this.name = name;
		DataBaseADO ado = DataBaseADO.getAdo();
		String sql = "select * from user where name=?";
		ResultSet rs = ado.prequery_auto(sql, this.name);
		try {
			while(rs.next()) {
				this.email = rs.getString("email");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
