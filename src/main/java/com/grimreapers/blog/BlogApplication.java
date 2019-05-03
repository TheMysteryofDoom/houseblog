package com.grimreapers.blog;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.io.ClassPathResource;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

@SpringBootApplication
public class BlogApplication {

	public static void main(String[] args) {
		SpringApplication.run(BlogApplication.class, args);
		// Initialize Firebase =============================
		System.out.println("DEBUG: FIREBASE INIT");
		try {

			String serviceAccount = "/houseblog-firebase-admin.json";

			FirebaseOptions options = new FirebaseOptions.Builder()
					.setCredentials(
							GoogleCredentials.fromStream(new ClassPathResource(serviceAccount).getInputStream()))
					.setDatabaseUrl("https://houseblog-61426.firebaseio.com").build();

			FirebaseApp.initializeApp(options);
		} catch (IOException s) {
			s.printStackTrace();
		}
	}

}
