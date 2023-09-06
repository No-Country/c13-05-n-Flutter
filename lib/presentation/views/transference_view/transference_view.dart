import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/transference_view/sub_screens/agenda.dart';
import 'package:multi_bank/presentation/views/transference_view/sub_screens/transference_accounts_view.dart';
import '../../../models/card_model.dart';
import '../../../models/user_models.dart';

class TransferenceView extends StatelessWidget {
  static const name = 'hepl';
  const TransferenceView({super.key, this.user, this.productList});
  final UserModel? user;
  final List<CardModel>? productList;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Transferir dinero",
            ),
            bottom: const TabBar(
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Column(
                  children: [
                    Text(
                      "Nuevo destino",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Agenda",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ],
            ),
          ),
          body: Center(
            child: TabBarView(children: [
              const Center(
                child: Text("Nuevo destino"),
              ),
              Center(
                child: TransferenceAccountsView(user: user, productList: productList,),
              ),
            ]),
          ),
        ));
  }
}
