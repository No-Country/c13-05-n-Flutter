import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/home_view/sub_screens/cards_view.dart';
import '../../../models/card_model.dart';
import '../../../models/user_models.dart';

class MyAccountsView extends StatefulWidget {
  const MyAccountsView({super.key,this.user, this.productList});
  final UserModel? user;
  final List<CardModel>? productList;
  @override
  State<MyAccountsView> createState() => _MyAccountsViewState();
}

class _MyAccountsViewState extends State<MyAccountsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Cuentas popias"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 16,right: 16),
            child: Text(
                "¿A qué cuenta vas a transferir?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          CardsView(user: widget.user,productList: widget.productList, tabFromPayment: true,),
        ],
      ),
    );
  }
}
