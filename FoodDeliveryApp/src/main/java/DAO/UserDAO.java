package DAO;

import model.User;

public interface UserDAO {
	//this method is used while login becx login based on email
	User getUser(String email);
	boolean insertUser(User user);
}