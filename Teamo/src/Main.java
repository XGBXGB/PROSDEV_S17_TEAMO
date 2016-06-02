import connector.MySQLConnector;
import dao.UsersDAO;

public class Main {

	public static void main(String[] args) {
		UsersDAO dao = new UsersDAO();
		System.out.println(dao.login("jankristoffercheng", "asdasd"));
	}
}
