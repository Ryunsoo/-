let pcPushOn = () => {
	// Initialize Firebase
    var config = {
          apiKey: "AIzaSyBm8HfRS1qzvn23KxVwDNLbZsOLHMAizBw",
            authDomain: "jachwi-haehyeop.firebaseapp.com",
            projectId: "jachwi-haehyeop",
            storageBucket: "jachwi-haehyeop.appspot.com",
            messagingSenderId: "767605215947",
            appId: "1:767605215947:web:d5c0f17a7829b9f0edc14e",
            measurementId: "G-KQVW6W128C"
    };
    firebase.initializeApp(config);
 
    const messaging = firebase.messaging();
 
    //token값 알아내기
    messaging.requestPermission()
        .then(function(){
            console.log("Have permission");
            return messaging.getToken();
        })
        .then(function(token){
			document.querySelector('#token').innerHTML = token;
            console.log(token);
        })
        .catch(function(arr){
            console.log("Error Occured");
        });
    
    let token = document.querySelector('#token').innerHTML;
    if(token){
       fetch('/경로?token=' + token)
       .then(response => {
       return response.text();
    }).then(text => {
          if(text == 'success'){
             pcPushOnSuccess();
          }else if(text == 'fail'){
             pcPushOnFail();                    
          }
       }).catch(error => {
       		pcPushOnFail();
    })
    }
}