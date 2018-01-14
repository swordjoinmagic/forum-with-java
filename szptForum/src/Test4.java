
import java.sql.*;
import ado.DataBaseADO;

public class Test4 {
	public static void main(String[] args) {
		DataBaseADO ado = DataBaseADO.getAdo();
		// 批量插入mysql数据
		for(int i=2;i<100;i++) {
			String sql = "insert into posts(id,creatorname,title,replycount,viewcount) values(?,?,?,?,?)";
			if(ado.preinsert_auto(sql,i,"sjm",i,i,i)) {
				System.out.println("插入成功");
			}else {
				System.out.println("插入失败");
			}
		}
	}
}
