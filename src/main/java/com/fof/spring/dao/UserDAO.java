package com.fof.spring.dao;

import java.util.List;

import com.fof.spring.model.LoginForm;
import com.fof.spring.model.User;

public interface UserDAO { 
	//public List<User> list();
	public User loginUser(LoginForm loginForm);
	public User getEmail(LoginForm loginForm);
	public User updatUser(LoginForm loginForm);
	public void addUser(User user);
	public void editUser(User user);
	public List<User> listUser();
	public void deleteUser(User user);
	public User getUser(Integer id);
	public User getUser(String userName);
	public boolean isUserExists(String userName);
	public void activateUser(User user);
	public boolean isEmailExists(String email);
	public void blockUser(String user);
}
