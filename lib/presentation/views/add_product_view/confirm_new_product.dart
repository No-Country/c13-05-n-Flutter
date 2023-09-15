import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/home_view/main_view.dart';

class ConfirmProductView extends StatefulWidget {
  const ConfirmProductView({
    Key? key,
    this.user,
    required this.cardNumber,
    required this.cardName,
    required this.expire,
    this.productList,
  }) : super(key: key);

  final UserModel? user;
  final String cardNumber;
  final String cardName;
  final String expire;
  final List<CardModel>? productList;

  @override
  State<ConfirmProductView> createState() => _ConfirmProductViewState();
}

class _ConfirmProductViewState extends State<ConfirmProductView> {
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    isButtonEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final cardNumber = widget.cardNumber;
    final cardName = widget.cardName;
    final expire = widget.expire;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Nueva tarjeta"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: width,
                height: 230,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/Card.png',
                      fit: BoxFit.contain,
                      scale: 0.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                              child: Image.asset(
                                'assets/images/Visa.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cardNumber,
                              style: const TextStyle(
                                fontFamily: "monospace",
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            cardName,
                            style: const TextStyle(
                              fontFamily: "monospace",
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'expire',
                            style: TextStyle(
                              fontFamily: "monospace",
                              fontSize: 13,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: expire.substring(0, 2),
                                  style: const TextStyle(
                                    fontFamily: "monospace",
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                                const TextSpan(
                                  text: "/",
                                  style: TextStyle(
                                    fontFamily: "monospace",
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: expire.substring(2),
                                  style: const TextStyle(
                                    fontFamily: "monospace",
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "PIN de seguridad",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
                        if (verificationCode ==
                            widget.user?.secretPin.toString()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Codigo de verificacion"),
                                content: const Text(
                                  'PIN Verificado, puede continuar, su tarjeta se agregará en las próximas horas',
                                ),
                                actions: [
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              color.primary),
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
                                ],
                              );
                            },
                          );
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
                                      const Text(
                                        'PIN Incorrecto, intente de nuevo',
                                      ),
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
                      },
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: height * 0.06,
                      width: width * 0.95,
                      decoration: BoxDecoration(
                        color: isButtonEnabled ? color.primary : Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MaterialButton(
                        onPressed: isButtonEnabled
                            ? () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MainView(
                                      user: widget.user,
                                      productList: widget.productList,
                                    ),
                                  ),
                                );
                              }
                            : null,
                        child: const Text(
                          'Confirmar',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
