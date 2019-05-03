package com.grimreapers.blog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AppController {
	
	@RequestMapping("/")
	public String homePage(){
		System.out.println("DEBUG: homePage() function used");
		
		return "index.jsp";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(){
		System.out.println("DEBUG: loginPage() function used");
		
		return "login.jsp";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(){
		System.out.println("DEBUG: loginUser() function used");
		
		return "login.jsp";
	}
	
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signupPage(){
		System.out.println("DEBUG: signupPage() function used");
		
		return "signup.jsp";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signupUser(){
		System.out.println("DEBUG: signupUser() function used");
		
		return "signup.jsp";
	}
}
