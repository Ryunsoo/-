var firebaseConfig = {
	apiKey: "AIzaSyBm8HfRS1qzvn23KxVwDNLbZsOLHMAizBw",
	authDomain: "jachwi-haehyeop.firebaseapp.com",
	projectId: "jachwi-haehyeop",
	storageBucket: "jachwi-haehyeop.appspot.com",
	messagingSenderId: "767605215947",
	appId: "1:767605215947:web:d5c0f17a7829b9f0edc14e",
	measurementId: "G-KQVW6W128C"	
};

firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

messaging.requestPermission()
.then(function(){
    console.log("Have permission");
    return messaging.getToken();
})
.then(function(token){
	document.querySelector('#token').value = token;
    console.log(token);
})
.catch(function(arr){
    console.log("Error Occured");
});