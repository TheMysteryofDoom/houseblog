package com.grimreapers.blog.ultils;

import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.SetOptions;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord.CreateRequest;
import com.google.firebase.cloud.FirestoreClient;
import com.grimreapers.blog.model.BlogEntry;

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

	public boolean updateUserPassword(String username, String oldPassword, String newPassword) {

		FirebaseAuth auth = FirebaseAuth.getInstance();
		boolean result = false;
		try {
			Map<String, Object> claims = new HashMap<>(auth.getUser(username).getCustomClaims());
			String correctPass = claims.get("pass").toString();

			if (oldPassword.equals(correctPass)) {
				System.out.println("DEBUG: Changing password.");
				claims.put("pass", newPassword);
				auth.setCustomUserClaims(username, claims);

			} else {
				System.out.println("DEBUG: ");
			}

		} catch (Exception e) {
			System.out.println("Couldn't Change Password.");
			return false;
		}
		return result;
	}

	public boolean initializeuserblog(String username) {

		Firestore db = FirestoreClient.getFirestore();
		try {
			DocumentReference user = db.collection("blogdata").document(username);
			// ApiFuture<DocumentSnapshot> queryDocument = user.get();
			// DocumentSnapshot document = queryDocument.get();

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
			DocumentReference blogposts = db.collection("blogdata").document(username).collection("blogposts")
					.document(blogpathvar);
			for (int i = 2;; i++) {
				ApiFuture<DocumentSnapshot> queryDocument = blogposts.get();
				DocumentSnapshot document = queryDocument.get();
				if (document.exists() == false) {
					break;
				} else {
					blogpathvar = title.toLowerCase().replace(" ", "-") + "-" + i;
					blogposts = db.collection("blogdata").document(username).collection("blogposts")
							.document(blogpathvar);
				}
			}
			// ApiFuture<DocumentSnapshot> queryDocument = blogposts.get();

			Map<String, Object> data = new HashMap<>();
			data.put("blogpathvar", blogpathvar);
			data.put("title", title);
			data.put("content", content);
			data.put("timestamp", Instant.now().toString());

			ApiFuture<WriteResult> writeResult = blogposts.set(data, SetOptions.merge());
			writeResult.get();

		} catch (Exception e) {
			System.out.println("DEBUG: Something went wrong while writing your blog post.");
		}
	}

	public void editBlog(String username, String blogpathvar, String title, String content) {
		Firestore db = FirestoreClient.getFirestore();
		try {
			DocumentReference blogposts = db.collection("blogdata").document(username).collection("blogposts")
					.document(blogpathvar);

			Map<String, Object> data = new HashMap<>();
			data.put("title", title);
			data.put("content", content);
			data.put("timestamp", Instant.now().toString());

			ApiFuture<WriteResult> writeResult = blogposts.set(data, SetOptions.merge());
			writeResult.get();

		} catch (Exception e) {
			System.out.println("DEBUG: Something went wrong while writing your blog post.");
		}
	}

	public BlogEntry viewBlogEntry(String username, String blogpathvar) {
		Firestore db = FirestoreClient.getFirestore();
		BlogEntry blogentry = null;
		try {
			DocumentReference blog = db.collection("blogdata").document(username).collection("blogposts")
					.document(blogpathvar);
			ApiFuture<DocumentSnapshot> queryDocument = blog.get();
			DocumentSnapshot document = queryDocument.get();
			blogentry = new BlogEntry(document.getString("blogpathvar"), document.getString("title"),
					document.getString("content"), Instant.parse(document.get("timestamp").toString()), username);

		} catch (Exception e) {
			System.out.println("DEBUG: Error retrieving post");
		}
		return blogentry;
	}

	public boolean doesUserExist(String username) {
		Firestore db = FirestoreClient.getFirestore();
		try {
			DocumentReference user = db.collection("blogdata").document(username);
			ApiFuture<DocumentSnapshot> queryDocument = user.get();
			DocumentSnapshot document = queryDocument.get();

			if (document.exists()) {
				System.out.println(username + "'s blog found.");
				return true;
			}

		} catch (Exception e) {
			System.out.println("DEBUG: Unknown Exception");
		}

		return false;
	}

	public void deleteBlogPost(String username, String blogpathvar) {
		Firestore db = FirestoreClient.getFirestore();

		try {
			DocumentReference blogposts = db.collection("blogdata").document(username).collection("blogposts")
					.document(blogpathvar);
			ApiFuture<WriteResult> writeResult = blogposts.delete();
			writeResult.get();
		} catch (Exception e) {

		}
	}

	public ArrayList<BlogEntry> retriveUserPosts(String username) {
		Firestore db = FirestoreClient.getFirestore();
		ArrayList<BlogEntry> blogentries = new ArrayList<BlogEntry>();
		try {

			ApiFuture<QuerySnapshot> future = db.collection("blogdata").document(username).collection("blogposts")
					.get();

			List<QueryDocumentSnapshot> documents;
			documents = future.get().getDocuments();
			System.out.println("DEBUG: Found " + documents.size() + " blog posts for " + username);
			for (QueryDocumentSnapshot document : documents) {
				blogentries.add(new BlogEntry(document.getString("blogpathvar"), document.getString("title"),
						document.getString("content"), Instant.parse(document.get("timestamp").toString()), username));
			}

			blogentries.sort(new BlogEntryComparator());

		} catch (Exception e) {
			System.out.println("DEBUG: Error retrieving Blog Entries");
		}

		return blogentries;
	}

	public ArrayList<BlogEntry> getAllPosts() {
		Firestore db = FirestoreClient.getFirestore();
		ArrayList<BlogEntry> blogentries = new ArrayList<BlogEntry>();
		try {
			ApiFuture<QuerySnapshot> future = db.collection("blogdata").get();

			List<QueryDocumentSnapshot> documents;
			documents = future.get().getDocuments();
			for (QueryDocumentSnapshot document : documents) {
				System.out.println("DEBUG: User: " + document.getId());
				String bloguser = document.getId();
				ApiFuture<QuerySnapshot> future2 = db.collection("blogdata").document(bloguser).collection("blogposts")
						.get();

				List<QueryDocumentSnapshot> documents2;
				documents2 = future2.get().getDocuments();
				for (QueryDocumentSnapshot document2 : documents2) {
					blogentries.add(new BlogEntry(document2.getString("blogpathvar"), document2.getString("title"),
							document2.getString("content"), Instant.parse(document2.get("timestamp").toString()),
							bloguser));
				}
			}
			blogentries.sort(new BlogEntryComparator());
		} catch (Exception e) {
			System.out.println("DEBUG: " + e.getMessage());
		}
		return blogentries;
	}

}
