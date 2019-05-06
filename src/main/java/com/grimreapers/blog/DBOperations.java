package com.grimreapers.blog;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.SetOptions;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import com.google.firebase.auth.UserRecord.CreateRequest;
import com.google.firebase.cloud.FirestoreClient;

@Service
public class DBOperations {

	// private Firestore db = FirestoreClient.getFirestore();
	// private FirebaseAuth auth = FirebaseAuth.getInstance();

	public boolean registerNewUser(String username, String password) {
		FirebaseAuth auth = FirebaseAuth.getInstance();
		try {
			CreateRequest request = new CreateRequest().setUid(username).setPassword(password);
			auth.createUser(request);
			Map<String, Object> claims = new HashMap<>();
			claims.put("pass", password);
			auth.setCustomUserClaims(username, claims);
		} catch (IllegalArgumentException e) {
			System.out.println("EXCEPTION: " + e.getMessage());
			return false;
		} catch (FirebaseAuthException e) {
			System.out.println("EXCEPTION: " + e.getErrorCode());
			return false;
		}
		return true;
	}

	public boolean passCheck(String username, String password) {
		FirebaseAuth auth = FirebaseAuth.getInstance();
		boolean result = false;
		try {
			Map<String, Object> claims = new HashMap<>(auth.getUser(username).getCustomClaims());
			String correctPass = claims.get("pass").toString();

			if (password.equals(correctPass)) {
				System.out.println("DEBUG: Correct Password");
				result = true;
			} else {
				System.out.println("DEBUG: Wrong Password");
			}
		} catch (IllegalArgumentException e) {
			System.out.println("EXCEPTION: " + e.getMessage());
			return false;
		} catch (FirebaseAuthException e) {
			System.out.println("EXCEPTION: " + e.getErrorCode());
			return false;
		}
		return result;
	}

	public boolean initializeuserblog(String username) {

		Firestore db = FirestoreClient.getFirestore();
		try {
			DocumentReference user = db.collection("blogdata").document(username);
			ApiFuture<DocumentSnapshot> queryDocument = user.get();
			//DocumentSnapshot document = queryDocument.get();
			
			Map<String, Object> data = new HashMap<>();
			
			data.put("profiledesc", "Write something about yourself");
			data.put("name", username);
			
			ApiFuture<WriteResult> writeResult = user.set(data, SetOptions.merge());
			writeResult.get();
			data.clear();
			
//			DocumentReference blogposts = db.collection("blogdata").document(username).collection("blogposts").document("sampleentry");
//			queryDocument = blogposts.get();
//			//document = queryDocument.get();
//			
//			data.put("blogpathvar", "sampleentry");
//			data.put("title","Welcome to your new blog");
//			data.put("content", "Why don't you try writing something above and then pressing post.");
//			
//			writeResult = blogposts.set(data, SetOptions.merge());
//			writeResult.get();
			
			
		} catch (Exception e) {
			return false;
		}

		return true;
	}
	
	public void postBlog(String username, String title, String content) {
		Firestore db = FirestoreClient.getFirestore();
		try {
			String blogpathvar = title.toLowerCase().replace(" ", "-");
			DocumentReference blogposts = db.collection("blogdata").document(username).collection("blogposts").document(blogpathvar);
			ApiFuture<DocumentSnapshot> queryDocument = blogposts.get();
			
			Map<String, Object> data = new HashMap<>();
			data.put("blogpathvar", blogpathvar);
			data.put("title", title);
			data.put("content", content);
			
			ApiFuture<WriteResult> writeResult = blogposts.set(data, SetOptions.merge());
			writeResult.get();
			
		} catch (Exception e) {
			System.out.println("DEBUG: Something went wrong while writing your blog post.");
		}
		
	}

}
