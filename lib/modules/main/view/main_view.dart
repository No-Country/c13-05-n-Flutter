import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bank/models/user_model.dart';
import 'package:multi_bank/modules/main/main_bloc/main_bloc.dart';
import 'package:multi_bank/repositories/app_repository.dart';

class MainView extends StatelessWidget {
  MainView({required this.user, super.key});

  UserModel? user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainBloc(user),
      child: Builder(builder: (context) => _buildView(context)),
    );
  }

  Widget _buildView(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Main page"),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<MainBloc>(context)
                        .add(LogOutEvent(user, context));
                  },
                  child: const Text("Logout")),
            ],
          )),
        );
      },
    );
  }
}
