package com.grimreapers.blog;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grimreapers.blog.model.BlogEntry;
import com.grimreapers.blog.ultils.DBOperations;
import com.grimreapers.blog.ultils.DebugOperations;

@Controller
public class AppController {

	/*
	 * Use RequestMethod.GET if the function navigates to a page Use
	 * RequestMethod.POST if the function is handling a form
	 */

	/*
	 * Default Session Attributes List:
	 * 
	 * username - String - The currently logged in user
	 * 
	 * userPosts - ArrayList<BlogEntry> - The blog posts of a user (May or may not
	 * be the currently logged in user)
	 * 
	 * viewSingleEntry - BlogEntry - A single blog post (May or may not be the
	 * currently logged in user)
	 * 
	 * currentblogowner - String - The owner of the blog on display (May or may not
	 * be the currently logged in user).
	 * 
	 * allBlogPosts - ArrayList<BlogEntry> - Every blog post in the website
	 * (Caution: May end up big.)
	 * 
	 * 
	 * Special Session Attributes (Only present in the session in case of Error,
	 * otherwise no.)
	 * 
	 * usernamepassworderror - Boolean(Always True) - Attached when the users
	 * password is wrong
	 * 
	 * repeatpasswordnotmatching - Boolean(Always True) - Attached when the users Repeat
	 * password field doesn't match the password.
	 * 
	 * cannotpostblog - Boolean(Always True) - Attached when the user left the title
	 * or description blank when posting a blog
	 * 
	 * cannoteditblog - Boolean(Always True) - Attached when the user left the title
	 * or description blank when editing a blog
	 * 
	 * cannotdeleteblog - Boolean(Always True) - Attached when the user cannot delete the blog
	 * 
	 * 
	 */

	@Autowired
	DBOperations dbOperations;

	@Autowired
	DebugOperations debug;

	@RequestMapping("/")
	public String homePage(HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: homePage() function used");

		ArrayList<BlogEntry> allblogentries = dbOperations.getAllPosts();
		session.setAttribute("allBlogPosts", allblogentries);

		return "index.jsp";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: loginPage() function used");
		session = dbOperations.sessionCleaner(session);
		return "login.jsp";
	}

	@RequestMapping(value = "/editprofile", method = RequestMethod.GET)
	public String editProfilePage(HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: editProfilePage() function used");
		session = dbOperations.sessionCleaner(session);

		return "editprofile.jsp";
	}

	@RequestMapping(value = "/editprofile", method = RequestMethod.POST)
	public String updateProfilePage(@RequestParam("oldpassword") String oldpassword,
			@RequestParam("newpassword") String newpassword, @RequestParam("repeatpassword") String repeatpassword,
			HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: updateProfilePage() function used");
		session = dbOperations.sessionCleaner(session);
		if (newpassword.equals(repeatpassword)) {
			dbOperations.updateUserPassword(session.getAttribute("username").toString(), oldpassword, newpassword);
		} else {
			session.setAttribute("repeatpasswordnotmatching", true);
		}

		return "editprofile.jsp";
	}

	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public String homepage(HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: homepage() function used");

		ArrayList<BlogEntry> allblogentries = dbOperations.getAllPosts();
		session.setAttribute("allBlogPosts", allblogentries);

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
			ArrayList<BlogEntry> allblogentries = dbOperations.getAllPosts();

			debug.printEntries(allblogentries);

			session.setAttribute("username", username);
			session.setAttribute("currentblogowner", username);
			session.setAttribute("userPosts", blogentries);
			session.setAttribute("allBlogPosts", allblogentries);

		} else {
			HttpSession errorSession = request.getSession();
			errorSession.setAttribute("usernamepassworderror", true);
			session = errorSession;
			errorSession.setAttribute("error", true);
		}

		return "homepage.jsp";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutUser(HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: logoutUser() function used");
		session.invalidate();
		return "/";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signupPage(HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: signupPage() function used");
		session.invalidate();
		return "signup.jsp";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signupUser(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("repeatpassword") String repeatpassword, HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: signupUser() function used");
		System.out.println("DEBUG: Username:" + username);
		System.out.println("DEBUG: Password:" + password);
		System.out.println("DEBUG: Repeated Password:" + repeatpassword);

		session.invalidate();

		if (!password.equals(repeatpassword)) {
			System.out.println("DEBUG:" + "Password and Repeat Password do not match.");
			session.setAttribute("repeatpasswordnotmatching", true);
			HttpSession errorSession = request.getSession();
			session = errorSession;
			session.setAttribute("error", 1);
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

	@RequestMapping(value = "/postblogentry", method = RequestMethod.POST)
	public String postBlogEntry(@RequestParam("title") String title, @RequestParam("content") String content,
			HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: postBlogEntry() function used");

		if (!title.equals("") && !content.equals("")) {
			dbOperations.postBlog(session.getAttribute("username").toString(), title, content);
		} else {
			session.setAttribute("cannotpostblog", true);
		}
		ArrayList<BlogEntry> blogentries = dbOperations.retriveUserPosts(session.getAttribute("username").toString());
		session.setAttribute("userPosts", blogentries);
		ArrayList<BlogEntry> allblogentries = dbOperations.getAllPosts();
		session.setAttribute("allBlogPosts", allblogentries);

		return "homepage.jsp";
	}

	// TODO Dynamic Link Marker

	/*
	 * Reminder: These are dynamic links. Please parse them by using the appropriate
	 * paramete. In case you haven't figured it out yet:
	 * 
	 * BlogEntry parameter name - URL path variable author -> username blogpathvar
	 * -> blogpathvar
	 * 
	 * Dynamic URL Construction Guide
	 * 
	 * GET Map
	 * 
	 * 0) /myblog - View your own Blog
	 * 
	 * 1) /myblog/{username} - View a User's Entire Blog (Can also be used as an
	 * alternative to the above if you write your own username
	 * 
	 * 2) /myblog/{username}/{blogpathvar} - View a User's Blog Post
	 * 
	 * 3) /myblog/{username}/{blogpathvar}/edit - Go to the Edit Blog Page for a
	 * specific Blog Post.
	 * 
	 * POST Map
	 * 
	 * 1) /myblog/{username}/{blogpathvar}/edit - Submit the new details of a blog
	 * post and change the entry.
	 * 
	 * DELETE Map
	 * 
	 * 1) /myblog/{username}/{blogpathvar}/delete - Delete a blog post
	 * 
	 */

	@RequestMapping(value = "/myblog", method = RequestMethod.GET)
	public String myBlogs(HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: homepage() function used");

		session.setAttribute("currentblogowner", session.getAttribute("username").toString());
		session = dbOperations.sessionCleaner(session);

		return "myblogs.jsp";
	}

	@RequestMapping(value = "/myblog/{username}", method = RequestMethod.GET)
	public String viewUserBlog(@PathVariable String username, HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: viewUserBlog() function used");
		session = dbOperations.sessionCleaner(session);

		if (dbOperations.doesUserExist(username) == false) {
			session.setAttribute("currentblogowner", session.getAttribute("username"));
			session.setAttribute("userPosts",
					dbOperations.retriveUserPosts(session.getAttribute("username").toString()));
			return "redirect:/myblogs.jsp"; // If we can remap this into a 404 page that would be nice - Nolan.
		}

		session.setAttribute("currentblogowner", username);
		session.setAttribute("userPosts", dbOperations.retriveUserPosts(username));
		return "redirect:/myblogs.jsp";
	}

	@RequestMapping(value = "/myblog/{username}/{blogpathvar}", method = RequestMethod.GET)
	public String viewUserBlogPost(@PathVariable String username, @PathVariable String blogpathvar,
			HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: viewUserBlogPost() function used");
		session = dbOperations.sessionCleaner(session);

		session.setAttribute("currentblogowner", username);
		session.setAttribute("viewSingleEntry", dbOperations.viewBlogEntry(username, blogpathvar));

		return "redirect:/blog.jsp";
	}

	// Use this link on edit buttons found outside of editblog.jsp.
	@RequestMapping(value = "/myblog/{username}/{blogpathvar}/edit", method = RequestMethod.GET)
	public String goToEditBlogPage(@PathVariable String username, @PathVariable String blogpathvar,
			HttpServletRequest request, HttpSession session) {

		System.out.println("DEBUG: goToEditBlogPage() function used");
		session = dbOperations.sessionCleaner(session);
		session.setAttribute("currentblogowner", username);

		if (!session.getAttribute("username").toString().equals(username)) {
			System.out.println("DEBUG: Cannot edit someone else's blog entry.");
			session.setAttribute("userPosts",
					dbOperations.retriveUserPosts(session.getAttribute("username").toString()));
			return "myblogs.jsp";
		}

		session.setAttribute("viewSingleEntry", dbOperations.viewBlogEntry(username, blogpathvar));

		return "redirect:/editblog.jsp";
	}

	// Use this link on the edit button found inside editblog.jsp.
	@RequestMapping(value = "/myblog/{username}/{blogpathvar}/edit", method = RequestMethod.POST)
	public String editUserBlogPost(@PathVariable String username, @PathVariable String blogpathvar,
			@RequestParam("title") String title, @RequestParam("content") String content, HttpServletRequest request,
			HttpSession session) {
		System.out.println("DEBUG: editUserBlogPost() function used");
		session = dbOperations.sessionCleaner(session);

		if (!title.equals("") && !content.equals("")) {
			dbOperations.editBlog(username, blogpathvar, title, content);
		} else {
			session.setAttribute("cannoteditblog", true);
		}

		session.setAttribute("currentblogowner", session.getAttribute("username"));
		session.setAttribute("userPosts", dbOperations.retriveUserPosts(session.getAttribute("username").toString()));

		return "redirect:/myblog";
	}

	@RequestMapping(value = "/myblog/{username}/{blogpathvar}/delete", method = RequestMethod.GET)
	public String deleteUserBlogPost(@PathVariable String username, @PathVariable String blogpathvar,
			HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: deleteUserBlogPost() function used");
		session = dbOperations.sessionCleaner(session);

		if (session.getAttribute("username").toString().equals(username)) {
			dbOperations.deleteBlogPost(username, blogpathvar);
		} else {
			System.out.println("DEBUG: Cannot delete someone else's blog entry.");
			session.setAttribute("cannotdeleteblog", true);
		}

		session.setAttribute("currentblogowner", session.getAttribute("username"));
		session.setAttribute("userPosts", dbOperations.retriveUserPosts(session.getAttribute("username").toString()));

		return "redirect:/myblog";
	}

}
