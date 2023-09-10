import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/add_product_view/add_person_id.dart';

import '../../widgets/inputs/custom_text_form_field.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({Key? key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
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
    final controller = TextEditingController();
    String value = controller.text;
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Nueva tarjeta"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 176,
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Numero de tarjeta",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  // Integra el CustomTextFormField aquí
                  CustomTextFormField(
                    icon2: Icons.cancel,
                    hint: 'Ingresael numero de tu tarjeta',
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
                              print('mayor');
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AddPersonIDView(
                                      cardNumber: controller.value),
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
