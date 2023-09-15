import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/transference_view/sub_screens/payment_confirmation_view.dart';
import 'package:multi_bank/presentation/views/transference_view/sub_screens/receipt_view.dart';
import 'package:multi_bank/presentation/widgets/navigation_button/navigation_button.dart';
import 'package:multi_bank/repositories/app_repository.dart';

class PinView extends StatefulWidget {
  const PinView({
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
  State<PinView> createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
  int newAmount = 0;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    isButtonEnabled = false;
  }

  void setNewAmount() {
    setState(() {
      newAmount = widget.amount! + widget.paymentTo!.balance;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Transferir dinero"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Ingresá tu PIN",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Te pedimos que ingreses tu PIN de seguridad para confirmar la operación",
              style: TextStyle(),
            ),
            const SizedBox(height: 20),
            OtpTextField(
              clearText: true,
              obscureText: true,
              numberOfFields: 4,
              focusedBorderColor: color.secondary,
              fillColor: Colors.white,
              filled: true,

              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                if (verificationCode == widget.user?.secretPin.toString()) {
                  setNewAmount();
                  AppRepository().updateProduct(
                      widget.user!.id,
                      widget.paymentTo!.productId,
                      {"balance": widget.amount! + widget.paymentTo!.balance});

                  AppRepository().updateProduct(
                      widget.user!.id, widget.paymentTo!.productId, {
                    "balance": widget.paymentFrom!.balance - widget.amount!
                  });
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: const Text("Codigo de verificacion"),
                            content: const Text(
                                'PIN Verificado, puede continuar con la trasnferencia'),
                            actions: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(color.primary),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    isButtonEnabled = true;
                                  });
                                },
                                child: const Text(
                                  'Cerrar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ]);
                      });
                } else {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.amber,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('PIN Incorrecto, intente de nuevo'),
                              ElevatedButton(
                                child: const Text('Reintentar'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }, // end onSubmit
            ),
            const SizedBox(height: 250),
            NavigationButton.navigationButton(
              color: isButtonEnabled ? color.primary : Colors.grey,
              ReceiptView(
                amount: widget.amount,
                user: widget.user,
                paymentTo: widget.paymentTo,
                concept: widget.concept,
                paymentFrom: widget.paymentFrom,
                productList: widget.productList,
              ),
              context,
              text: "Confirmar",
            )
          ],
        ),
      ),
    );
  }
}
