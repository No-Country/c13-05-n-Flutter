import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/add_product_view/add_date.dart';
import 'package:multi_bank/presentation/views/add_product_view/add_person_id.dart';

import '../../widgets/inputs/custom_text_form_field.dart';

class AddNameView extends StatefulWidget {
  const AddNameView({Key? key, required this.cardNumber}) : super(key: key);
  final String cardNumber;

  @override
  State<AddNameView> createState() => _AddNameViewState();
}

class _AddNameViewState extends State<AddNameView> {
  final TextEditingController _controller = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text;

      if (text.length > 8) {
        setState(() {
          isButtonEnabled = true;
        });
      } else {
        setState(() {
          isButtonEnabled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final color = Theme.of(context).colorScheme;
    final cardNumber = insertDashesInNumber(widget.cardNumber);
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
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cardNumber,
                              style: const TextStyle(
                                  fontFamily: "monospace", fontSize: 20),
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
                    const Text(
                      "Nombre del titular",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // Integra el CustomTextFormField aquí
                    CustomTextFormField(
                      icon2: Icons.cancel,
                      hint: 'Igual a como aparece en la tarjeta',
                      controller: _controller,
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
                                print('mayor ${_controller.value}');
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AddDateView(
                                        cardNumber: cardNumber,
                                        cardName: _controller.value.text),
                                  ),
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
      if (text.length > 8) {
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

String insertDashesInNumber(number) {
  final numberStr = number.toString();
  final List<String> groups = [];
  for (int i = 0; i < numberStr.length; i += 4) {
    final end = i + 4;
    groups.add(numberStr.substring(
        i, end > numberStr.length ? numberStr.length : end));
  }
  final maskedGroups = List.generate(groups.length - 1, (_) => 'xxxx');
  maskedGroups.add(groups.last);

  return maskedGroups.join('-');
}
