package com.grimreapers.blog.model;

import java.time.Instant;

public class BlogEntry {

	private String author;
	private String blogpathvar;
	private String title;
	private String content;
	private Instant timestamp;

	public BlogEntry(String blogpathvar, String title, String content, String author) {
		super();
		this.blogpathvar = blogpathvar;
		this.title = title;
		this.content = content;
		this.timestamp = Instant.now();
		this.author = author;
	}

	public BlogEntry(String blogpathvar, String title, String content, Instant timestamp, String author) {
		super();
		this.blogpathvar = blogpathvar;
		this.title = title;
		this.content = content;
		this.timestamp = timestamp;
		this.author = author;
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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

}
