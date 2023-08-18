import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multi_bank/modules/login/login_view/login_view.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import 'config/theme/app_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      title: 'Multi Bank',
      home: const Scaffold(
        body: Center(
          child: LoginView(),
        ),
      ),
    );
  }
}
