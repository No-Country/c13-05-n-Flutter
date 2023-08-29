import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:multi_bank/presentation/views/splash_view/splash_view.dart';
import 'config/theme/app_theme.dart';
import 'models/user_models.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const SplashView(),
    );
  }
}
