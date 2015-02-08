package com.fof.spring.controller;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fof.spring.model.Friend;
import com.fof.spring.model.Product;
import com.fof.spring.model.Review;
import com.fof.spring.model.UserBean;
import com.fof.spring.service.ProductService;
import com.fof.spring.service.ReviewService;


@Controller
public class ReviewController {
	
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	@Resource(name = "productService")
	private ProductService productService;
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping(value = "/allreviews")
	public ModelAndView allReviews(@ModelAttribute("command") Review review, BindingResult result, HttpServletRequest request,HttpSession session) {
			Map<String, Object> model = new HashMap<String, Object>();
		
		logger.debug("all review");	
		List<Review> list = reviewService.getAllReviews();
		System.out.println(list);
		model.put("reviews", list);
		return new ModelAndView("reviews", model);
		
	}
	
	@RequestMapping(value = "/createReview")
	public ModelAndView createReview(Model model,
			@RequestParam(value="productid", required=false) String productid, @ModelAttribute("command") Review review){
		review = new Review();
				
		model.addAttribute("review", review);
		if(productid==null || productid.equals("-1")) {
			
		} else {
			Product product = productService.getProductsByName(productid).get(0);
			review.setProductId(product.getProductid());
			review.setProductName(product.getProductName());
		}
		return  new ModelAndView("addReview");
		
	}

	@RequestMapping(value = "/editReview")
	public ModelAndView editReview(Model model,
			@RequestParam(value="reviewid", required=false) String reviewid, @ModelAttribute("command") Review review){

		if(reviewid==null || reviewid.equals("-1")) {
			review = new Review();
		} else {
			review = reviewService.getReviewById(Integer.valueOf(reviewid));
			Product product = productService.getProductById(review.getProductId());
			review.setProductId(product.getProductid());
			review.setProductName(product.getProductName());
		}
		model.addAttribute("review", review);
		return  new ModelAndView("addReview");
		
	}
	
	
	
}
