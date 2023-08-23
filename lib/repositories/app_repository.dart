import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multi_bank/apis/api_rest.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_bank/presentation/views/login_view/login_view.dart';

import '../infrastructure/modules/main/view/main_view.dart';
import '../models/user_models.dart';

class AppRepository {
  final UserModel? user;

  AppRepository({this.user});

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void firebaseInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<void> singInWithEmailPassword({
    required String email,
    required String password,
    required context,
  }) async {
    UserModel user = await getUser(email);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (currentUser != null) {
        print("Logged in: $currentUser");

        if (currentUser?.emailVerified == true) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MainView(
                    userEmail: currentUser?.email,
                    user: user,
                  )));
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
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
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
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginView(
              user: user,
            )));
  }
}

Future<UserModel> getUser(String userEmail) async {
  List<UserModel> usersList = [];
  var usersData = await ApiCalls().getApiInformation();

  for (var user in usersData) {
    usersList.add(UserModel(
      user["_id"],
      user['name'],
      user['age'],
      user['email'],
      user['address'],
      user['secretPin'],
      user['phone'],
      user['type'],
      user['profileStatus'],
      user['products'] ?? [],
    ));
  }
  UserModel mainUser = usersList.where((user) => user.email == userEmail).first;
  return mainUser;
}

class FireBaseServices {}
