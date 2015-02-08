package com.fof.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fof.spring.model.Product;
import com.fof.spring.model.Review;
import com.fof.spring.service.ProductService;

@Controller
public class ProductController {
	@Resource(name = "productService")
	private ProductService productService;
	private static final Logger logger = LoggerFactory
			.getLogger(ProductController.class);
	
	@RequestMapping(value = "/allProducts")
	public ModelAndView allProducts(){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Product> products = productService.getAllProduct();
		model.put("products", products);
		return new ModelAndView("products", model);
		
	}
	
	@RequestMapping(value = "/createProduct", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView createProduct(Model model,
			 @ModelAttribute("command") Product product,BindingResult result){
		Map<String, Object> model1 = new HashMap<String, Object>();
		product = new Product();
		model.addAttribute("product", product);
		return new ModelAndView("addProduct");
	}
	@RequestMapping(value = "/getProducts", method = RequestMethod.GET)
	public @ResponseBody List<ProductBean> getProducts(@RequestParam String productName){
		List<Product> list = productService.getProductsByName(productName);
		List<ProductBean> plist = new ArrayList<ProductBean>();
		for(Product prod:list){
			ProductBean pBean = new ProductBean();
			pBean.setProcudtName(prod.getProductName());
			pBean.setProductId(prod.getProductid());
			plist.add(pBean);
		}
		return plist;
	}
	@RequestMapping(value = "/saveProduct", method = {RequestMethod.POST})
	public String saveProduct(Model model, @ModelAttribute("command") Product product,BindingResult produxt){
		System.out.println(product.getProductName());
		productService.addProduct(product);
		return "redirect:/allProducts";
	}
		
	
}

class ProductBean {
	int productId;
	String procudtName;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProcudtName() {
		return procudtName;
	}
	public void setProcudtName(String procudtName) {
		this.procudtName = procudtName;
	}
	
}