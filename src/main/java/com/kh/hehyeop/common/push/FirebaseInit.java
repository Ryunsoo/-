package com.kh.hehyeop.common.push;

import java.io.FileInputStream;
import java.io.IOException;

import javax.annotation.PostConstruct;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

@Component
public class FirebaseInit {

	private static final String path = "/Final_Project/jachwi-haehyeop-firebase-adminsdk-66wup-521e78a4e2.json";
	
	@PostConstruct
	public void init() {
		
		try {
			FileInputStream serviceAccount = new FileInputStream(path);

			FirebaseOptions options = new FirebaseOptions.Builder()
					.setCredentials(GoogleCredentials.fromStream(serviceAccount))
					.build();
			
			if(FirebaseApp.getApps().isEmpty()) {
				FirebaseApp.initializeApp(options);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
