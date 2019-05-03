package com.grimreapers.blog;

import org.springframework.stereotype.Service;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord.CreateRequest;

@Service
public class DBOperations {
	
	//private Firestore db = FirestoreClient.getFirestore();
	//private FirebaseAuth auth = FirebaseAuth.getInstance();
	
	public boolean registerNewUser(String username, String password) {
		FirebaseAuth auth = FirebaseAuth.getInstance();
		try {
		CreateRequest request = new CreateRequest().setUid(username).setPassword(password);
			auth.createUser(request);
		} catch (IllegalArgumentException e){
			System.out.println("EXCEPTION: "+e.getMessage());
			return false;
		} catch (FirebaseAuthException e) {
			System.out.println("EXCEPTION: "+e.getErrorCode());
			return false;
		}
		return true;
	}
	
}
