import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD60FREqefJzd90JRBNuvxxfXJRYfvOD0Q",
            authDomain: "regulars-99bea.firebaseapp.com",
            projectId: "regulars-99bea",
            storageBucket: "regulars-99bea.firebasestorage.app",
            messagingSenderId: "620208797000",
            appId: "1:620208797000:web:2bfb0ed3ed9606160bef7d",
            measurementId: "G-1DB0X4TKJK"));
  } else {
    await Firebase.initializeApp();
  }
}
