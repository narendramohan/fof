package com.fof.spring.task;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.fof.spring.model.User;
import com.fof.spring.service.UserService;
import com.fof.util.FofUtil;



@Component
public class JobScheduler {
	private static final Logger logger = LoggerFactory.getLogger(JobScheduler.class);
	@Resource(name = "userService")
	UserService userService;
	
	FofUtil fofUtil;
	static int size=0;
	@Scheduled(cron="1 * * * * *") // Every 5 minute
	public void runRandomizedDetection() { 		
		logger.info("Running the schedule !");
		 fofUtil.randomizedDetection(1, "","0");
		 		
	}
	
	@Scheduled(cron="1 * * * * *") // Every 5 minute
	public void runCompleteDetection() { 		
		logger.info("Running the schedule !");
		List<User>  users =  userService.listUser();
		for(User user:users) {
		 fofUtil.completeDetection(1, user);
		}
		
	}
	
	
	@Scheduled(cron="1 * * * * *") // Every 5 minute
	public void runMe() { 		
		logger.info("Running the schedule !");
		 fofUtil.cooperativeDetection(1, "0");
		 
		
	}
	/*doIndexing(){
		
	}*/
}
