import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/add_product_view/add_person_id.dart';

class AddDateView extends StatefulWidget {
  const AddDateView(
      {Key? key, required this.cardNumber, required this.cardName})
      : super(key: key);
  final String cardNumber;
  final String cardName;

  @override
  State<AddDateView> createState() => _AddDateViewState();
}

class _AddDateViewState extends State<AddDateView> {
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _expiryController.addListener(_checkButtonState);
    _cvvController.addListener(_checkButtonState);
  }

  void _checkButtonState() {
    final expiryText = _expiryController.text;
    final cvvText = _cvvController.text;

    if (expiryText.length == 4 && cvvText.length == 3) {
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
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final color = Theme.of(context).colorScheme;
    final cardNumber = widget.cardNumber;
    final cardName = widget.cardName;

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
                          const SizedBox(height: 40),
                          Text(
                            cardName,
                            style: const TextStyle(
                                fontFamily: "monospace", fontSize: 20),
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
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Vencimiento",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 10),
                              CustomTextFormField(
                                icon2: Icons.cancel,
                                hint: 'MM/AA',
                                controller: _expiryController,
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
                                "Codigo de seguridad",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 10),
                              CustomTextFormField(
                                icon2: Icons.cancel,
                                hint: 'CVV',
                                controller: _cvvController,
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
                                print(
                                    'mayor ${_cvvController.value} y ${_expiryController.value}');
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AddPersonIDView(
                                        cardNumber: cardNumber,
                                        cardName: cardName,
                                        expire: _expiryController.value.text,
                                        cvv: _cvvController.value.text),
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
      if (text.length > 3) {
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
