import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:multi_bank/presentation/views/splash_view/splash_view.dart';
import 'config/routes/app_router.dart';
// import 'package:multi_bank/repositories/app_repository.dart';

import 'config/theme/app_theme.dart';
import 'models/user_models.dart';
// import 'presentation/views/card_view/card_view.dart';

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

    MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      title: 'Multi Bank',
      // home: Scaffold(
      //   body: Center(
      //     child: BlocProvider(
      //       create: (context) => LoginCubit(),
      //       child: const LoginView(),
      //     ),
      //     // child: CardView()
      //   ),
      // ),
    );
  }
}
