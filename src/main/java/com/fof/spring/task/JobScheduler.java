package com.fof.spring.task;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.fof.util.FofUtil;



@Component
public class JobScheduler {
	private static final Logger logger = LoggerFactory.getLogger(JobScheduler.class);
	
	FofUtil searchService;
	static int size=0;
	@Scheduled(cron="1 * * * * *") // Every 5 minute
	public void runMe() { 		
		logger.info("Running the schedule !");
		 searchService.randomizedDetection(1, "");
		
	}
	/*doIndexing(){
		
	}*/
}
