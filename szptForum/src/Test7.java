
import ado.DataBaseADO;

public class Test7 {
	public static void main(String[] args) {
		DataBaseADO ado = DataBaseADO.getAdo();
		System.out.println(ado.getIDPostLast(1));
	}
}
