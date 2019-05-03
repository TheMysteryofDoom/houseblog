package com.grimreapers.blog;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
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
			Map<String, Object> claims = new HashMap<>();
			claims.put("pass", password);
			auth.setCustomUserClaims(username, claims);
		} catch (IllegalArgumentException e){
			System.out.println("EXCEPTION: "+e.getMessage());
			return false;
		} catch (FirebaseAuthException e) {
			System.out.println("EXCEPTION: "+e.getErrorCode());
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
		}  catch (IllegalArgumentException e){
			System.out.println("EXCEPTION: "+e.getMessage());
			return false;
		} catch (FirebaseAuthException e) {
			System.out.println("EXCEPTION: "+e.getErrorCode());
			return false;
		}
		return result;
	}
	
}
