import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/transference_view/sub_screens/payment_summary_view.dart';

import '../../../../models/card_model.dart';
import '../../../../models/user_models.dart';
import '../../../widgets/navigation_button/navigation_button.dart';

class AmountInputView extends StatefulWidget {
  const AmountInputView({super.key, this.user, this.productList, this.product});
  final UserModel? user;
  final List<CardModel>? productList;
  final CardModel? product;
  @override
  State<AmountInputView> createState() => _AmountInputViewState();
}

class _AmountInputViewState extends State<AmountInputView> {
  TextEditingController textController = TextEditingController();
  String concept = "";
  List<String> concepts = ["Varios", "Remesa", "Ahorro"];
  CardModel paymentFrom = CardModel("", "", 0, true, "", 0, "", []);

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void setProduct(CardModel product) {
    setState(() {
      paymentFrom = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Cuentas propias"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "¿Qué monto deseas enviar?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Introducir un monto \$',
              ),
            ),
            const Text(
              "Realizar transferencia entre cuentras propias y ya cargadas",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Concepto",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            DropdownMenu<String>(
              width: 360,
              label: const Text(
                "Seleccionar",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onSelected: (String? value) {
                setState(() {
                  concept = value!;
                });
              },
              dropdownMenuEntries:
                  concepts.map<DropdownMenuEntry<String>>((item) {
                return DropdownMenuEntry<String>(value: item, label: item);
              }).toList(),
            ),
            const Text(
              "Elegí una opción de la lista",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 270),
            NavigationButton.navigationButton(
                PaymentSummaryView(
                    user: widget.user,
                    productList: widget.productList,
                    product: widget.product,
                    amount: textController.text,
                    concept: concept),
                context),
          ],
        ),
      ),
    );
  }
}
