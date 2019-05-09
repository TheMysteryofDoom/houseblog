package com.grimreapers.blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grimreapers.blog.ultils.DBOperations;
import com.grimreapers.blog.ultils.DebugOperations;

@Controller
@RequestMapping("/myblog")
public class DynamicLinkController {

	/*
	 * Reminder: These are dynamic links. Please parse them by using the appropriate paramete.
	 * In case you haven't figured it out yet:
	 * 
	 * BlogEntry parameter name - URL path variable
	 * author -> username
	 * blogpathvar -> blogpathvar
	 * 
	 * Dynamic URL Construction Guide
	 * 
	 * GET Map
	 * 1) /{username} - View a User's Entire Blog
	 * 2) /{username}/{blogpathvar} - View a User's Blog Post
	 * 3) /{username}/{blogpathvar}/edit - Go to the Edit Blog Page for a specific Blog Post.
	 * 
	 * POST Map
	 * 1) /{username}/{blogpathvar}/edit - Submit the new details of a blog post and change the entry.
	 * 
	 * DELETE Map
	 * 1) /{username}/{blogpathvar}/delete - Delete a blog post
	 * 
	 */

	@Autowired
	DBOperations dbOperations;

	@Autowired
	DebugOperations debug;

	@GetMapping("/{username}")
	public String viewUserBlog(@PathVariable String username, HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: viewUserBlog() function used");
		session.removeAttribute("allBlogPosts");

		if (dbOperations.doesUserExist(username) == false) {
			session.setAttribute("currentblogowner", session.getAttribute("username"));
			session.setAttribute("userPosts",
					dbOperations.retriveUserPosts(session.getAttribute("username").toString()));
			return "myblogs.jsp"; // If we can remap this into a 404 page that would be nice - Nolan.
		}

		session.setAttribute("currentblogowner", username);
		session.setAttribute("userPosts", dbOperations.retriveUserPosts(username));
		return "myblogs.jsp";
	}

	@GetMapping("/{username}/{blogpathvar}")
	public String viewUserBlogPost(@PathVariable String username, @PathVariable String blogpathvar,
			HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: viewUserBlogPost() function used");
		session.removeAttribute("allBlogPosts");

		session.setAttribute("currentblogowner", username);
		session.setAttribute("viewSingleEntry", dbOperations.viewBlogEntry(username, blogpathvar));

		return "blog.jsp";
	}

	// Use this link on edit buttons found outside of editblog.jsp.
	@GetMapping("/{username}/{blogpathvar}/edit")
	public String goToEditBlogPage(@PathVariable String username, @PathVariable String blogpathvar,
			HttpServletRequest request, HttpSession session) {

		System.out.println("DEBUG: goToEditBlogPage() function used");
		session.removeAttribute("allBlogPosts");
		session.setAttribute("currentblogowner", username);
		
		if (!session.getAttribute("username").toString().equals(username)) {
			System.out.println("DEBUG: Cannot edit someone else's blog entry.");
			session.setAttribute("userPosts", dbOperations.retriveUserPosts(session.getAttribute("username").toString()));	
			return "myblogs.jsp";
		}
		
		session.setAttribute("viewSingleEntry", dbOperations.viewBlogEntry(username, blogpathvar));

		return "editblog.jsp";
	}

	// Use this link on the edit button found inside editblog.jsp.
	@PostMapping("/{username}/{blogpathvar}/edit")
	public String editUserBlogPost(@PathVariable String username, @PathVariable String blogpathvar,
			@RequestParam("title") String title, @RequestParam("content") String content, HttpServletRequest request,
			HttpSession session) {
		System.out.println("DEBUG: editUserBlogPost() function used");
		session.removeAttribute("allBlogPosts");
		
		dbOperations.editBlog(username, blogpathvar, title, content);

		session.setAttribute("currentblogowner", session.getAttribute("username"));
		session.setAttribute("userPosts", dbOperations.retriveUserPosts(session.getAttribute("username").toString()));

		return "myblogs.jsp";
	}

	@DeleteMapping("/{username}/{blogpathvar}/delete")
	public String deleteUserBlogPost(@PathVariable String username, @PathVariable String blogpathvar,
			HttpServletRequest request, HttpSession session) {
		System.out.println("DEBUG: deleteUserBlogPost() function used");
		session.removeAttribute("allBlogPosts");
		
		if (session.getAttribute("username").toString().equals(username)) {
			dbOperations.deleteBlogPost(username, blogpathvar);
		} else {
			System.out.println("DEBUG: Cannot delete someone else's blog entry.");
		}
		
		session.setAttribute("currentblogowner", session.getAttribute("username"));
		session.setAttribute("userPosts", dbOperations.retriveUserPosts(session.getAttribute("username").toString()));

		return "myblogs.jsp";
	}

}
