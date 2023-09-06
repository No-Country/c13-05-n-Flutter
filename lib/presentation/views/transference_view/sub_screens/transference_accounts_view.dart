import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/home_view/sub_screens/cards_view.dart';
import '../../../../models/card_model.dart';
import '../../../../models/user_models.dart';
import '../../my_acconts_view/my_accounts_view.dart';

class TransferenceAccountsView extends StatelessWidget {
  const TransferenceAccountsView({super.key,this.user,this.productList});
  final UserModel? user;
  final List<CardModel>? productList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Seleccione un destinatario",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyAccountsView(
                    user: user,
                    productList: productList,
                  ),
                ));
              },
              child: Card(
                color: Colors.white,
                child: Container(
                  height: 64,
                  width: 420,
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.contacts_sharp),
                            SizedBox(width: 20),
                            Text("Cuentas Propias"),
                          ],
                        ),

                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onLongPress: (){},
              child: Card(
                child: Container(
                  height: 64,
                  width: 420,
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.menu_book_sharp),
                            SizedBox(width: 20),
                            Text("Agenda de contactos"),
                          ],
                        ),

                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
