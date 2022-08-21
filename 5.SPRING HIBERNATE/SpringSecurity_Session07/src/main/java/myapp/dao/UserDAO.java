package myapp.dao;
import myapp.entities.User;

public interface UserDAO {
	public User findByUserName(String username);
}
