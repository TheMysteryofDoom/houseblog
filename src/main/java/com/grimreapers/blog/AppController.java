package com.grimreapers.blog;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.grimreapers.blog.model.BlogEntry;

@Controller
public class AppController {

	/*
	 * Use RequestMethod.GET if the function navigates to a page Use
	 * RequestMethod.POST if the function is handling a form
	 */

	/*
	 * Session Attributes List:
	 * 
	 * username - String - The currently logged in user
	 * 
	 * selfUserPosts - ArrayList<BlogEntry> - The blog posts of the currently logged
	 * in user
	 * 
	 * viewSingleEntry - BlogEntry - A single blog post (May or may not be the
	 * currently logged in user)
	 * 
	 * currentblogowner - String - The owner of the blog on display (May or may not
	 * be the currently logged in user).
	 * 
	 * 
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

		session.setAttribute("currentblogowner", session.getAttribute("username"));

		return "homepage.jsp";
	}

	@RequestMapping(value = "/{username}", method = RequestMethod.GET)
	public String homepage(@PathVariable String username, HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: variablehomepage() function used");

		if (dbOperations.doesUserExist(username)==false) {
			return "homepage.jsp"; // If we can remap this into a 404 page that would be nice - Nolan.
		}
		
		session.setAttribute("currentblogowner", username);
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
			ArrayList<BlogEntry> blogentries = dbOperations.retriveUserPosts(username);

			session.setAttribute("username", username);
			session.setAttribute("currentblogowner", username);
			session.setAttribute("selfUserPosts", blogentries);

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

	@RequestMapping(value = "/{username}/{blogpathvar}", method = RequestMethod.GET)
	public String blogPage(@PathVariable String username, @PathVariable String blogpathvar, HttpServletRequest request,
			HttpSession session) {
		System.out.println("DEBUG: variableBlogPage() function used");

		session.setAttribute("viewSingleEntry", dbOperations.viewBlogEntry(username, blogpathvar));

		return "blog.jsp";
	}

	@RequestMapping(value = "/postblogentry", method = RequestMethod.POST)
	public String postBlogEntry(@RequestParam("title") String title, @RequestParam("content") String content,
			HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: postBlogEntry() function used");

		if (!title.equals("") && !content.equals("")) {
			dbOperations.postBlog(session.getAttribute("username").toString(), title, content);
		}
		ArrayList<BlogEntry> blogentries = dbOperations.retriveUserPosts(session.getAttribute("username").toString());
		session.setAttribute("selfUserPosts", blogentries);

		return "homepage.jsp";
	}

}
