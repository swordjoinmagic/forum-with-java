
import ado.*;
import java.sql.*;

public class text8 {
	public static void main(String[] args) {
		DataBaseADO ado = DataBaseADO.getAdo();
		String sql = "select * from bigplates";
		ResultSet rs = ado.queryselect(sql);
		try {
			while(rs.next()) {
				System.out.println(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
