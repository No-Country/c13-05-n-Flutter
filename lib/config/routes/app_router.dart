import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_bank/infrastructure/modules/login/login_cubit.dart';
import 'package:multi_bank/presentation/views/views.dart';

BlocProvider<LoginCubit> createLoginCubit(BuildContext context) {
  return BlocProvider(
    create: (context) => LoginCubit(),
    child: const LoginView(),
  );
}

final appRouter = GoRouter(
    initialLocation: '/login',
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: [
      GoRoute(
        path: '/login',
        name: LoginView.name,
        builder: (context, state) => createLoginCubit(context),
      ),
      // GoRoute(
      //   path: '/home',
      //   name: HomeView.name,
      //   builder: (context, state) => createLoginCubit(context),
      // ),
      GoRoute(
        path: '/signup',
        name: SignupView.name,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoginCubit(),
            child: const SignupView(),
          );
        },
      ),
    ]);
