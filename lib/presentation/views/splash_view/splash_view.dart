import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bank/infrastructure/modules/login/login_bloc/login_bloc.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/login_view/login_view.dart';

class SplashView extends StatefulWidget {
  static const name = 'splash';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  UserModel? get user => null;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const LoginView(),
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(user),
      child: _viewBuilder(),
    );
  }

  Widget _viewBuilder() {
    final color = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, color.secondary],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/Logo.png',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "NoContry Bank",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              letterSpacing: 2,
              decoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
