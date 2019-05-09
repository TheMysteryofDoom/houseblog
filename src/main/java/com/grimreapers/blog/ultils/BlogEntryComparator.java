package com.grimreapers.blog.ultils;

import java.util.Comparator;

import com.grimreapers.blog.model.BlogEntry;

public class BlogEntryComparator implements Comparator<BlogEntry> {

	@Override
	public int compare(BlogEntry o1, BlogEntry o2) {
		// TODO Auto-generated method stub
		return o1.getTimestamp().compareTo(o2.getTimestamp());
	}

}
