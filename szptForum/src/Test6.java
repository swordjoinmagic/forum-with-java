import ado.DataBaseADO;
import bean.forum.PostComment;

// 向id为x的帖子插入数条评论
public class Test6 {
	public static void main(String[] args) {
		int id = 12;
		for(int i=1;i<=10;i++) {
			DataBaseADO ado = DataBaseADO.getAdo();
			String sql = "insert into post_comment(postid,username,content,agreecount,againstcount) values(?,?,?,?,?)";
			ado.preinsert_auto(sql, id,"sjm","这个作者太帅了吧！！！！！！"+i,100,0);
		}
	}
}
