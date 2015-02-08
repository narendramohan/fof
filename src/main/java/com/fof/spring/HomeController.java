package com.fof.spring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fof.spring.dao.UserDAO;
import com.fof.spring.model.User;

/**
 * Handles requests for the application home page.
 */
//@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(value="/")
	public ModelAndView home() {
		//List<User> listUsers = userDao.list();
		ModelAndView model = new ModelAndView("home");
	//	model.addObject("userList", listUsers);
		return model;
	}
	
}
