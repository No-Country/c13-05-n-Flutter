// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:multi_bank/infrastructure/modules/login/login_cubit.dart';
// import 'package:multi_bank/presentation/views/home_view/main_view.dart';
// import 'package:multi_bank/presentation/views/views.dart';

// BlocProvider<LoginCubit> createLoginCubit(BuildContext context) {
//   return BlocProvider(
//     create: (context) => LoginCubit(),
//     child: const LoginView(),
//   );
// }

// final appRouter = GoRouter(
//   initialLocation: '/main',
//   navigatorKey: GlobalKey<NavigatorState>(),
//   routes: [
//     GoRoute(
//       path: '/login',
//       name: LoginView.name,
//       builder: (context, state) => createLoginCubit(context),
//     ),
//     GoRoute(
//       path: '/signup',
//       name: SignupView.name,
//       builder: (context, state) {
//         return BlocProvider(
//           create: (context) => LoginCubit(),
//           child: const SignupView(),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/settings',
//       name: SettingsView.name,
//       builder: (context, state) => const SettingsView(),
//     ),
//     GoRoute(
//       path: '/main',
//       name: MainView.name,
//       builder: (context, state) => const MainView(),
//     ),
//     GoRoute(
//       path: '/personal-info',
//       name: PersonalInfoView.name,
//       builder: (context, state) => const PersonalInfoView(),
//     ),
//     // GoRoute(
//     //   path: '/perfil',
//     //   name: ProfileView.name,
//     //   builder: (context, state) => const ProfileView(required UserModel? user}),
//     // ),
//     // GoRoute(
//     //   path: '/snackbar',
//     //   name: SnackbarScreen.name,
//     //   builder: (context, state) => const SnackbarScreen(),
//     // ),
//     // GoRoute(
//     //   path: '/animated',
//     //   name: AnimatedScreen.name,
//     //   builder: (context, state) => const AnimatedScreen(),
//     // ),
//     // GoRoute(
//     //   path: '/ui-controls',
//     //   name: UiControlsScreen.name,
//     //   builder: (context, state) => const UiControlsScreen(),
//     // ),
//     // GoRoute(
//     //   path: '/tutorial',
//     //   name: AppTutorialScreen.name,
//     //   builder: (context, state) => const AppTutorialScreen(),
//     // ),
//     // GoRoute(
//     //   path: '/infinite',
//     //   name: InfiniteScrollScreen.name,
//     //   builder: (context, state) => const InfiniteScrollScreen(),
//     // ),
//     // GoRoute(
//     //   path: '/counter-screen',
//     //   name: CounterScreen.name,
//     //   builder: (context, state) => const CounterScreen(),
//     // ),
//     // GoRoute(
//     //   path: '/theme',
//     //   name: ThemeChangerScreen.name,
//     //   builder: (context, state) => const ThemeChangerScreen(),
//     // ),
//   ],
// );
