import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multi_bank/apis/api_rest.dart';
import 'package:multi_bank/models/activities_model.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/presentation/views/login_view/login_view.dart';
import '../presentation/views/home_view/main_view.dart';
import '../presentation/views/home_view/sub_screens/home_tab_view.dart';
import '../models/user_models.dart';
import '../presentation/widgets/modals/alert.dart';
import 'package:localstorage/localstorage.dart';

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
    required bool savedSession,
    required String email,
    required String password,
    required context,
  }) async {
    UserModel user = await getUser(email);
    List<CardModel> productsList = await productList(user.id);

    List<ActivitiesModel> allActivities = [];

    for (var product in productsList) {
      for (var activity in product.activities) {
        allActivities.add(
          ActivitiesModel(
            activity["payment_name"],
            activity["amount"],
            activity["transaction_type"],
            activity["product_numer"],
            activity["payment_date"],
          ),
        );
      }
    }

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (currentUser != null) {
        print("Logged in: $currentUser");
        if (currentUser?.emailVerified == true) {
          savedSession ? setUserLocalStorage(email, password) : null;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MainView(
                user: user,
                productList: productsList,
                allActivities: allActivities,
              ),
            ),
          );
        } else {
          Alert.runAlert('Por favor verifique su email', context);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print("Catcher error: $err");
        Alert.runAlert('Por favor revise su email o contraseña', context);
      }
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
    final LocalStorage storage = LocalStorage('bank_app.json');
    storage.clear();
    await _firebaseAuth.signOut();
    print("Logged out");
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginView(
        user: user,
      ),
    ));
  }

  void setUserLocalStorage(String email, String password) {
    final LocalStorage storage = LocalStorage('bank_app.json');

    storage.setItem("user", {"email": email, "password": password});

    storage.getItem('user');
  }
}

Future<List<CardModel>> productList(String customerId) async {
  List<CardModel> products = [];

  var productsData = await ApiCalls().getProductList(customerId);

  for (var product in productsData) {
    products.add(CardModel(
      product["_id"],
      product["product_name"],
      product["balance"],
      product["status"],
      product["product_type"],
      product["product_number"],
      product["expirationDate"],
      product["activities"],
    ));
  }
  return products;
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
      user['beneficiaries'] ?? [],
    ));
  }
  UserModel mainUser = usersList.where((user) => user.email == userEmail).first;
  return mainUser;
}

class FireBaseServices {}
