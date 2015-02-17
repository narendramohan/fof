package com.fof.spring.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



import com.fof.spring.model.Friend;
import com.fof.spring.model.LoginForm;
import com.fof.spring.model.User;
import com.fof.spring.model.UserBean;
import com.fof.spring.service.UserService;
import com.fof.spring.validator.LoginValidator;

/**
 * Search controller for going to the home page with a search options
 */
@Controller
public class HomeController {
	List<User> users = new ArrayList<User>();
	@Resource(name = "userService")
	private UserService userService;
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	/**
	 * Selects the home page and populates the model with a message
	 */
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Model model, HttpSession session, LoginForm loginForm) {
		logger.info("Welcome to job search page!");
		model.addAttribute("controllerMessage", "Welcome to fof review page!");
		User user1 = (User)session.getAttribute("user");
		if(user1==null)
			return "login-page";
		return "home";
	}
	@RequestMapping(value = "/home", method = {RequestMethod.GET, RequestMethod.POST})
	public String goHome(Model model, HttpSession session, LoginForm loginForm) {
		logger.info("Welcome to job search page!");
		model.addAttribute("controllerMessage", "Welcome to fof review page!");
		User user1 = (User)session.getAttribute("user");
		if(user1==null)
			return "redirect:login-user";
		return "home";
	}	
	
	@RequestMapping(value = "/details", method = {RequestMethod.GET, RequestMethod.POST})
	public String getDetails(Model model, HttpSession session, LoginForm loginForm) {
		logger.info("Welcome to job search page!");
		model.addAttribute("controllerMessage", "Welcome to fof review page!");
		User user1 = (User)session.getAttribute("user");
		if(user1==null)
			return "redirect:login-user";
		return "details";
	}
	
	@RequestMapping(value = "/login-user")
	public String loginUser(@RequestParam(value="error", required=false) boolean error, ModelMap model, LoginForm loginForm,
			BindingResult model1, HttpServletRequest request, HttpSession session) {
		String submit = request.getParameter("submit");
		logger.debug("submit: "+submit);
		if(session==null || request.isRequestedSessionIdValid())
			session = request.getSession(true);

		User user1 = (User)session.getAttribute("user");
		if(user1!=null)
			return "redirect:home";
		if(submit!=null) {
		LoginValidator validator = new LoginValidator();
		validator.validate(loginForm, model1);
		}
		
		if(model1.hasErrors()){
            loginForm.setUserId("");
            loginForm.setPassword("");
            logger.debug(model1.getAllErrors().toString());
            
            return "login-page";
        } else if (loginForm.getUserId() != null && loginForm.getPassword() != null) {
			User user = userService.loginUser(loginForm);
			logger.debug(user+"");
			
			if (user != null && user.getStatus()!=1) {
				if (session.getAttribute("userName") == null) {
					session = request.getSession(true);
					session.setAttribute("user", user);
					session.setAttribute("userName", user.getLoginId());
					session.setAttribute("username", user.getName());
					users.add(user);
					
					logger.debug(user.toString());
					
				}
				return "redirect:home";
			} else if(user != null && user.getStatus()==1){
				model.addAttribute("error", "You have been blocked due to unauthorized activity. please contact administrator.");
			} else {
				
				model.addAttribute("error", "You have entered an invalid username or password!");				
			}
		}
		return "login-page";
	}
	
	/**
	 * Handles and retrieves the denied JSP page. This is shown whenever a regular user
	 * tries to access an admin only page.
	 * 
	 * @return the name of the JSP page
	 */
	@RequestMapping(value = "/denied", method = RequestMethod.GET)
 	public String getDeniedPage() {
		logger.debug("Received request to show denied page");
		
		// This will resolve to /WEB-INF/jsp/deniedpage.jsp
		return "deniedpage";
	}
	@RequestMapping(value = "/register", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView registerUser(@RequestParam(value="error", required=false) boolean error, ModelMap model, @ModelAttribute("command") UserBean userBean,
			BindingResult result) {
		User user = prepareModel(userBean);
		user.setType(0);
		try {
			if(user.getLoginId()==null) {
				return new ModelAndView("register");
			}
			boolean exists = userService.isUserExists(user.getLoginId());
			if(exists) {		
				model.addAttribute("error", "User already exists.");
				return new ModelAndView("register");	
			} else {
				
				userService.addUser(user);
				return new ModelAndView("registerSuccess");
			}
			
		} catch(Exception e){
			e.printStackTrace();
			return new ModelAndView("registerFailure");
		}
		
	}

	private User prepareModel(UserBean userBean) {
		User user = new User();
		user.setName(userBean.getName());
		user.setPassword(userBean.getPassword());
		user.setEmail(userBean.getEmail());
		user.setLoginId(userBean.getLoginId());
		user.setType(userBean.getType());
		user.setId(userBean.getId()!=null?userBean.getId():-1);
		user.setStatus(userBean.getStatus());
		return user;
	}
	@RequestMapping(value = "/logout")
	public String logout(Model model,HttpSession session, LoginForm loginForm) {
		session.invalidate();
		return "/login-page";
	}
	/**
	 * Send a request for friend
	 * @param userBean
	 * @param result
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "invite", method = RequestMethod.GET)
	public ModelAndView invite(
			@ModelAttribute("command") UserBean userBean, BindingResult result, HttpServletRequest request,HttpSession session) {
		Friend friend = new Friend();
		friend.setFriendUserName(request.getParameter("user"));
		friend.setUserName((String)session.getAttribute("username"));
		Map<String, Object> model = new HashMap<String, Object>();
		boolean alreadyExists = userService.checkUserAleadyinvited(friend);
		model.remove("error");
		if(!alreadyExists){
			model.put("msg", "User Invitation sent");
			friend.setStatus("Invited");
			userService.inviteUser(friend);
			session.setAttribute("invited","1");
		} else {
			model.put("error", "User has been already your friend");
		}
		
		//model.put("user", prepareUserBean(userService.getUser(userBean.getId())));
		model.put("users", prepareListofBean(userService.listUser()));
		return new ModelAndView("inviteFriend", model);
	}
	@RequestMapping(value = "onlineUsers", method = RequestMethod.GET)
	public String onlineUsers() {
		return "onlineUsers";
	}
	
	/**
	 * Send a request for friend
	 * @param userBean
	 * @param result
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "invites", method = RequestMethod.GET)
	public ModelAndView invites(
			@ModelAttribute("command") UserBean userBean, BindingResult result, HttpServletRequest request,HttpSession session) {
		Friend friend = new Friend();
		friend.setFriendUserName(request.getParameter("user"));
		friend.setUserName((String)session.getAttribute("username"));
		Map<String, Object> model = new HashMap<String, Object>();
		List<Friend> friendList = userService.getInviteeList((String)session.getAttribute("username"));
		System.out.println(friendList);
		model.put("invites", friendList);
		return new ModelAndView("acceptReject", model);
	}
	
	/**
	 * Send a request for friend
	 * @param userBean
	 * @param result
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "accept", method = RequestMethod.GET)
	public ModelAndView accept(
			@ModelAttribute("command") UserBean userBean, BindingResult result, HttpServletRequest request,HttpSession session) {
		Friend friend = new Friend();
		friend.setFriendUserName(request.getParameter("userName"));
		friend.setUserName((String)session.getAttribute("username"));
		Map<String, Object> model = new HashMap<String, Object>();
		userService.accept(friend);
		List<Friend> friendList = userService.getInviteeList((String)session.getAttribute("username"));
		//emailService.sendMailForNode(request.getParameter("userName"), (String)session.getAttribute("username"));
		model.put("invites", friendList);
		return new ModelAndView("acceptReject", model);
	}
	
	/**
	 * Send a request for friend
	 * @param userBean
	 * @param result
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "reject", method = RequestMethod.GET)
	public ModelAndView reject(
			@ModelAttribute("command") UserBean userBean, BindingResult result, LoginForm loginForm, HttpServletRequest request,HttpSession session) {
		Friend friend = new Friend();
		friend.setIdfriend(Integer.parseInt(request.getParameter("userName")));
		friend.setUserName((String)session.getAttribute("username"));
		Map<String, Object> model = new HashMap<String, Object>();
		friend = userService.reject(friend);
		
		
		List<Friend> friendList = userService.getInviteeList((String)session.getAttribute("username"));
		model.put("invites", friendList);
		return new ModelAndView("acceptReject", model);
	}	
	
	@RequestMapping(value = "friends", method = RequestMethod.GET)
	public ModelAndView friends(
			@ModelAttribute("command") UserBean userBean, BindingResult result, HttpServletRequest request,HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Friend> friendList = userService.friends((String)session.getAttribute("username"));
		model.put("friends", friendList);
		return new ModelAndView("friends", model);
	}

	@RequestMapping(value = "findHonestUsers", method = RequestMethod.GET)
	public ModelAndView honestUsers(
			@ModelAttribute("command") UserBean userBean, BindingResult result, HttpServletRequest request,HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Friend> friendList = userService.friends((String)session.getAttribute("username"));
		model.put("friends", friendList);
		return new ModelAndView("friends", model);
	}
	
	
	@RequestMapping(value = "findDihonestUsers", method = RequestMethod.GET)
	public ModelAndView dihonestUsers(
			@ModelAttribute("command") UserBean userBean, BindingResult result, HttpServletRequest request,HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Friend> friendList = userService.friends((String)session.getAttribute("username"));
		model.put("friends", friendList);
		return new ModelAndView("friends", model);
	}	

	@RequestMapping(value = "findSuspisiousUsers", method = RequestMethod.GET)
	public ModelAndView findSuspisiousUsers(
			@ModelAttribute("command") UserBean userBean, BindingResult result, HttpServletRequest request,HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Friend> friendList = userService.friends((String)session.getAttribute("username"));
		model.put("friends", friendList);
		return new ModelAndView("friends", model);
	}	
	
	private List<UserBean> prepareListofBean(List<User> users) {
		List<UserBean> beans = null;
		if (users != null && !users.isEmpty()) {
			beans = new ArrayList<UserBean>();
			UserBean bean = null;
			for (User user : users) {
				bean = new UserBean();
				bean.setName(user.getName());
				bean.setId(user.getId());
				bean.setPassword(user.getPassword());
				bean.setEmail(user.getEmail());
				bean.setType(user.getType());
				bean.setLoginId(user.getLoginId());
				bean.setStatus(user.getStatus());
				beans.add(bean);
			}
		}
		return beans;
	}
}

