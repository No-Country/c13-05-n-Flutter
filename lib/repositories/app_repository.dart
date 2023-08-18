import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_bank/modules/login/login_view/login_view.dart';
import 'package:multi_bank/modules/main/view/main_view.dart';

class AppRepository {
  void firebaseInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
}

class FireBaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<void> singInWithEmailPassword({
    required String email,
    required String password,
    required context,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (currentUser != null) {
        print("Logged in");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const MainView()));
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> createUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> singOut(context) async {
    await _firebaseAuth.signOut();
    print("Logged out");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginView()));
  }
}
