import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/transference_view/sub_screens/payment_confirmation_view.dart';
import 'package:multi_bank/presentation/widgets/navigation_button/navigation_button.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import '../../home_view/sub_screens/home_tab_view.dart';

class ReceiptView extends StatefulWidget {
  const ReceiptView({
    super.key,
    this.paymentFrom,
    this.paymentTo,
    this.user,
    this.concept,
    this.amount,
    this.productList,
  });
  final UserModel? user;
  final CardModel? paymentFrom;
  final CardModel? paymentTo;
  final String? concept;
  final int? amount;
  final List<CardModel>? productList;
  @override
  State<ReceiptView> createState() => _ReceiptViewState();
}

class _ReceiptViewState extends State<ReceiptView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color(0xff8F0000),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          "Transferir dinero",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: const Color(0xff8F0000),
              child: const Center(
                child: Text(
                  "¡Operación exitosa!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Enviar a",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                Text(
                  widget.user?.name ?? "Raul Cespedes",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Monto:",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                Text(
                  "${widget.amount}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Transferido a:",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                Text(
                  widget.user?.name ?? "Nombre",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                const SizedBox(height: 20),
                const Text(
                  "CBU o CVU",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                Text(
                  widget.user?.id ?? "2789567483689687438720",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "CUIT/CUIL:",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                const Text(
                  "2-08567893-7",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Cuenta debitada:",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                Text(
                  "${widget.paymentFrom}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                const SizedBox(height: 20),
                const Text(
                  "Concepto:",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                Text(
                  "${widget.concept}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 100),
                NavigationButton.navigationButton(
                    HomeTabView(
                      user: widget.user,
                      productList: widget.productList,
                    ),
                    context,
                    text: "Salir")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
