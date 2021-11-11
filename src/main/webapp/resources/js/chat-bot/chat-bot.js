// Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyDKo0FhGVf9xseS-lVTWRT8liObSiIY2VY",
    authDomain: "final-798e2.firebaseapp.com",
    projectId: "final-798e2",
    storageBucket: "final-798e2.appspot.com",
    messagingSenderId: "289485279357",
    appId: "1:289485279357:web:6bc6848db80c2e6c14e114",
    measurementId: "G-2RM5Q7BS9T"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);