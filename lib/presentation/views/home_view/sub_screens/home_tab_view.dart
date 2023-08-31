import 'package:flutter/material.dart';
import 'package:multi_bank/models/activities_model.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/add_product_view/add_product_view.dart';
import 'package:multi_bank/presentation/views/views.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:multi_bank/repositories/app_repository.dart';
import 'package:multi_bank/models/card_model.dart';
import 'cards_view.dart';

class HomeTabView extends StatelessWidget {
  static const name = 'main';
  const HomeTabView({super.key, this.user, this.productList});
  final UserModel? user;
  final List<CardModel>? productList;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileView(
                  user: user!,
                ),
              ));
            },
            child: Text("Hola, ${user?.name}"),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  AppRepository().singOut(context);
                },
                child: const Text("Logout")),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CardsView(
                user: user,
                productList: productList,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddProductView(),
                    ),
                  );
                },
                child: const Text('+ Asociar un nuevo producto',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Roboto')),
              ),
              MenuView(user: user),
              // ActivitiesView(user?.products, activities),
              // ElevatedButton(
              //     onPressed: () {
              //       AppRepository().singOut(context);
              //     },
              //     child: const Text("Logout")),
            ],
          ),
        ));
  }
}
