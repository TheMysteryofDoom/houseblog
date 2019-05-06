package com.grimreapers.blog.model;

import java.time.Instant;

public class BlogEntry {

	private String blogpathvar;
	private String title;
	private String content;
	private Instant timestamp;

	public BlogEntry(String blogpathvar, String title, String content) {
		super();
		this.blogpathvar = blogpathvar;
		this.title = title;
		this.content = content;
		this.timestamp = Instant.now();
	}

	public BlogEntry(String blogpathvar, String title, String content, Instant timestamp) {
		super();
		this.blogpathvar = blogpathvar;
		this.title = title;
		this.content = content;
		this.timestamp = timestamp;
	}

	public Instant getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Instant timestamp) {
		this.timestamp = timestamp;
	}

	public String getBlogpathvar() {
		return blogpathvar;
	}

	public void setBlogpathvar(String blogpathvar) {
		this.blogpathvar = blogpathvar;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
