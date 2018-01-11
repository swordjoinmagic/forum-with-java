
import ado.DataBaseADO;

import java.sql.*;

public class Test2 {
	public static void main(String[] args) {
		DataBaseADO ado = DataBaseADO.getAdo();
		String sql = "select * from posts where id=? and name=?";
		Connection conn = ado.getConn();
		try {
//			PreparedStatement pre = conn.prepareStatement(sql);
//			pre.setInt(1, 1);
			ResultSet rs = ado.prequery_auto(sql, 1,"sjm");
			while(rs.next()) {
				System.out.println("id:"+rs.getInt(1));
				System.out.println("name:"+rs.getString(2));
				System.out.println("title:"+rs.getString(3));
				System.out.println("createtiem:"+rs.getTimestamp(4));
				System.out.println("replycount:"+rs.getInt(5));
				System.out.println("viewcount:"+rs.getInt(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}                      
}
