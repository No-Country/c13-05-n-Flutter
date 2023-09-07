import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/transference_view/sub_screens/pin_view.dart';

import '../../../../models/card_model.dart';
import '../../../../models/user_models.dart';
import '../../../widgets/navigation_button/navigation_button.dart';
import '../../home_view/sub_screens/cards_view.dart';

class PaymentSummaryView extends StatefulWidget {
  const PaymentSummaryView(
      {super.key,
      this.user,
      this.productList,
      this.product,
      this.amount,
      this.concept});
  final UserModel? user;
  final List<CardModel>? productList;
  final CardModel? product;
  final String? amount;
  final String? concept;

  @override
  State<PaymentSummaryView> createState() => _PaymentSummaryViewState();
}

class _PaymentSummaryViewState extends State<PaymentSummaryView> {
  TextEditingController textController = TextEditingController();
  CardModel paymentFrom = CardModel("", "", 0, true, "", 0, "", []);

  void setProduct(CardModel product) {
    setState(() {
      paymentFrom = product;
      print("From payment summary $product");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Cuentas propias"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "TOTAL:",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  Text(
                    "\$${widget.amount ?? "Monto"}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 36,
                    ),
                  ),
                ],
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
                  "Alias",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                Text(
                  widget.user?.name ?? "alias",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                SizedBox(height: 20),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),
            const SizedBox(height: 20),
            const Text(
              "¿Desde qué cuenta se enviará el dinero?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CardsView(
              user: widget.user,
              productList: widget.productList,
              tabFromPayment: false,
              tabFromPaymentInput: true,
              setProduct: setProduct,
            ),
            const SizedBox(height: 20),
            NavigationButton.navigationButton(
                PinView(
                  paymentFrom: widget.product,
                  paymentTo: paymentFrom,
                  user: widget.user,
                  concept: widget.concept,
                  amount: int.tryParse(widget.amount!),
                  productList: widget.productList,
                ),
                context),
          ],
        ),
      ),
    );
  }
}
