importScripts('https://www.gstatic.com/firebasejs/4.8.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/4.8.1/firebase-messaging.js');

var config = {
	apiKey: "AIzaSyBm8HfRS1qzvn23KxVwDNLbZsOLHMAizBw",
  authDomain: "jachwi-haehyeop.firebaseapp.com",
  projectId: "jachwi-haehyeop",
  storageBucket: "jachwi-haehyeop.appspot.com",
  messagingSenderId: "767605215947",
  appId: "1:767605215947:web:d5c0f17a7829b9f0edc14e",
  measurementId: "G-KQVW6W128C"
}

firebase.initializeApp(config);

//const messaging = firebase.messaging();
const messaging = getMessaging(firebaseApp);

messaging.setBackgroundMessageHandler(function(payload){

	var notification = payload.notification;
	var notificationTitle = notification.title;
	var notificationOptions = {
		body: notification.body,
		icon: '/resources/image/logo-icon.png'
	};
	
    return self.registration.showNotification(notificationTitle, notificationOptions);
});
