import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/login_view/login_view.dart';

import '../infrastructure/modules/main/view/main_view.dart';

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
        print("Logged in: $currentUser");
        if (currentUser?.emailVerified == true) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const MainView()));
        } else {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Por favor verifique su email'),
                      ElevatedButton(
                        child: const Text('Cerrar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
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
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }

  Future<void> singOut(context) async {
    await _firebaseAuth.signOut();
    print("Logged out");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginView()));
  }
}
