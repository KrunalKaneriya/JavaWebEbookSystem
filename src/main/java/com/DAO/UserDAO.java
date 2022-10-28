package com.DAO;

import com.entity.User;

public interface UserDAO {
	public boolean userRegister(User user);
	
	public User userLogin(String email,String password);
}
