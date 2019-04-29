package com.grimreapers.blog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AppController {
	
	@RequestMapping("/")
	public String homePage(){
		
		return "index.jsp";
	}
	
	@RequestMapping("/login")
	public String loginPage(){
		
		return "login.jsp";
	}
	
	@RequestMapping("/signup")
	public String signupPage(){
		
		return "signup.jsp";
	}
}
