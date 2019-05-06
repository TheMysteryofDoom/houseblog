package com.grimreapers.blog;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AppController {

	/*
	 * Use RequestMethod.GET if the function navigates to a page Use
	 * RequestMethod.POST if the function is handling a form
	 */

	@Autowired
	DBOperations dbOperations;

	@RequestMapping("/")
	public String homePage() {
		System.out.println("DEBUG: homePage() function used");

		return "index.jsp";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		System.out.println("DEBUG: loginPage() function used");

		return "login.jsp";
	}

	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public String homepage(HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: homepage() function used");

		return "homepage.jsp";
	}

	@RequestMapping(value = "/homepage", method = RequestMethod.POST)
	public String loginUser(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: loginUser() function used");

		session.invalidate();

		if (dbOperations.passCheck(username, password)) {

			HttpSession newSession = request.getSession();
			session = newSession;
			session.setAttribute("username", username);

		}

		return "homepage.jsp";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutUser(HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: logoutUser() function used");
		session.invalidate();
		return "index.jsp";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signupPage() {
		System.out.println("DEBUG: signupPage() function used");

		return "signup.jsp";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signupUser(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("repeatpassword") String repeatpassword) {
		System.out.println("DEBUG: signupUser() function used");
		System.out.println("DEBUG: Username:" + username);
		System.out.println("DEBUG: Password:" + password);
		System.out.println("DEBUG: Repeated Password:" + repeatpassword);

		if (!password.equals(repeatpassword)) {
			System.out.println("DEBUG:" + "Password and Repeat Password do not match.");
			return "signup.jsp";
		}

		boolean createdUser = dbOperations.registerNewUser(username, password);
		boolean initializedBlog = dbOperations.initializeuserblog(username);

		if (createdUser && initializedBlog) {
			return "login.jsp";
		} else {
			return "signup.jsp";
		}
	}

	@RequestMapping("/blog")
	public String blogPage() {
		System.out.println("DEBUG: blogPage() function used");

		return "blog.jsp";
	}

	@RequestMapping(value = "/postblogentry", method = RequestMethod.POST)
	public String postBlogEntry(@RequestParam("title") String title, @RequestParam("content") String content,
			HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: postBlogEntry() function used");
		
		if (!title.equals("")&&!content.equals("")) {
			dbOperations.postBlog(session.getAttribute("username").toString(), title, content);
		}

		return "homepage.jsp";
	}

}
