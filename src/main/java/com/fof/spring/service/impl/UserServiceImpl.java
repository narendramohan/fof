package com.fof.spring.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fof.spring.dao.FriendDao;
import com.fof.spring.dao.UserDAO;
import com.fof.spring.model.Friend;
import com.fof.spring.model.LoginForm;
import com.fof.spring.model.User;
import com.fof.spring.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@SuppressWarnings("restriction")
	@Resource(name = "userDao")
	UserDAO userDao;

	@Autowired
	private FriendDao friendDao;

	public User getUser() {
		// TODO Auto-generated method stub
		return null;
	}

	public User loginUser(LoginForm loginForm) {
		return userDao.loginUser(loginForm);
	}

	public User getEmail(LoginForm loginForm) {
		return userDao.getEmail(loginForm);
	}

	public User updatUser(LoginForm loginForm) {
		return userDao.updatUser(loginForm);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addUser(User user) {
		userDao.addUser(user);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void editUser(User user) {
		userDao.editUser(user);
	}

	public List<User> listUser() {

		return userDao.listUser();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void deleteUser(User prepareModel) {
		userDao.deleteUser(prepareModel);

	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public User getUser(Integer id) {

		return userDao.getUser(id);
	}

	public User getUser(String userName) {
		return userDao.getUser(userName);
	}

	public boolean isUserExists(String userName) {
		return userDao.isUserExists(userName);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void activateUser(User user) {
		userDao.activateUser(user);

	}

	public boolean isEmailExists(String email) {
		return userDao.isEmailExists(email);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void blockUser(String user) {
		userDao.blockUser(user);

	}

	public int getRejectedRequestCount(String userName) {
		return 0;
	}

	// /////////

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void inviteUser(Friend friend) {
		friendDao.inviteUser(friend);

	}

	public List<Friend> getInviteeList(String userName) {
		return friendDao.getInviteeList(userName);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void accept(Friend friend) {
		friendDao.accept(friend);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public Friend reject(Friend friend) {
		return friendDao.reject(friend);
	}

	public List<Friend> friends(String userName) {
		return friendDao.getFriends(userName);
	}

	public boolean checkUserAleadyinvited(Friend friend) {
		return friendDao.checkUserAleadyinvited(friend);
		
	}
}
