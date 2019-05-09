package com.grimreapers.blog.ultils;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.grimreapers.blog.model.BlogEntry;

@Service
public class DebugOperations {
	
	public void printEntries (ArrayList<BlogEntry> blogentries) {
		System.out.println("Parsing Blog List");
		for (BlogEntry blogEntry : blogentries) {
			System.out.println(blogEntry.getTitle());
			System.out.println(blogEntry.getContent());
			System.out.println("=========================");
		}
		
	}

}
