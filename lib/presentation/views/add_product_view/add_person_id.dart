import 'package:flutter/material.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/models/user_models.dart';

import 'package:multi_bank/presentation/views/add_product_view/confirm_new_product.dart';

class AddPersonIDView extends StatefulWidget {
  const AddPersonIDView(
      {Key? key,
      required this.cardNumber,
      required this.cardName,
      required this.cvv,
      required this.expire,
      this.user,
      this.productList})
      : super(key: key);
  final String cardNumber;
  final String cardName;
  final String cvv;
  final String expire;
  final UserModel? user;
  final List<CardModel>? productList;

  @override
  State<AddPersonIDView> createState() => _AddPersonIDViewState();
}

class _AddPersonIDViewState extends State<AddPersonIDView> {
  final TextEditingController _idController = TextEditingController();
  bool isButtonEnabled = false;
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _idController.addListener(_checkButtonState);
  }

  void _checkButtonState() {
    final idText = _idController.text;

    if (idText.length >= 7) {
      setState(() {
        isButtonEnabled = true;
      });
    } else {
      setState(() {
        isButtonEnabled = false;
      });
    }
  }

  @override
  void dispose() {
    _idController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final color = Theme.of(context).colorScheme;
    final cardNumber = widget.cardNumber;
    final cardName = widget.cardName;
    final expire = widget.expire;
    // final cvv = widget.cvv;

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
                width: width, // Define el ancho del SizedBox
                height: 230, // Define la altura del SizedBox
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
                                  fontFamily: "monospace", fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            cardName,
                            style: const TextStyle(
                                fontFamily: "monospace", fontSize: 22),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'expire',
                            style: TextStyle(
                                fontFamily: "monospace", fontSize: 13),
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
                          )
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
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Tipo de documento",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 10),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: color
                                            .secondary), // Cambia el color del borde al verde deseado cuando está enfocado
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                value: _selectedOption,
                                items: ["DNI", "CI", "CUIL"]
                                    .map((String value) =>
                                        DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        ))
                                    .toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedOption =
                                        newValue; // Actualiza la opción seleccionada
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Nro de documento",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 10),
                              CustomTextFormField(
                                icon2: Icons.cancel,
                                hint: 'documento',
                                controller: _idController,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
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
                                      builder: (context) => ConfirmProductView(
                                            cardNumber: cardNumber,
                                            cardName: cardName,
                                            expire: expire,
                                            user: widget.user,
                                            productList: widget.productList,
                                          )),
                                );
                              }
                            : null,
                        child: const Text('Siguiente',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Roboto')),
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

class CustomTextFormField extends StatefulWidget {
  final IconData icon2;
  final String hint;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.icon2,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isCheckIcon = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      final text = widget.controller.text;
      if (text.length >= 7) {
        setState(() {
          isCheckIcon = true;
        });
      } else {
        setState(() {
          isCheckIcon = false;
        });
      }
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
    const colorHint = Color.fromRGBO(102, 112, 133, 1);
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number, // Solo permite números
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: Icon(
          isCheckIcon ? Icons.check : widget.icon2,
          color: isCheckIcon ? Colors.green : colorHint, // Color del icono
        ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
            borderSide: BorderSide(
          color: color.secondary,
        )),
      ),
    );
  }
}
