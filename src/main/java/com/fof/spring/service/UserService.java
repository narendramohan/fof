package com.fof.spring.service;

import java.util.List;



import com.fof.spring.model.Friend;
import com.fof.spring.model.LoginForm;
import com.fof.spring.model.User;

public interface UserService {
	public User getUser();

	public User loginUser(LoginForm loginForm);

	public User updatUser(LoginForm loginForm);
	public void addUser(User user);
	public void editUser(User user);
	public List<User> listUser();

	public void deleteUser(User prepareModel);

	public User getUser(Integer id);
	public User getUser(String userName);
	public boolean isUserExists(String userName);
	public void activateUser(User user);
	public void blockUser(String user);

	public boolean isEmailExists(String email);
	public int getRejectedRequestCount(String userName);
	public void inviteUser(Friend friend);
	public boolean checkUserAleadyinvited(Friend friend);
	public List<Friend> getInviteeList(String userName);
	public void accept(Friend friend);
	public Friend reject(Friend friend);
	public List<Friend> friends(String userName);

}
