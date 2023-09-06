import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmountInputView extends StatefulWidget {
  const AmountInputView({super.key});

  @override
  State<AmountInputView> createState() => _AmountInputViewState();
}

class _AmountInputViewState extends State<AmountInputView> {
TextEditingController textController = TextEditingController();
List<String> concepts = ["Varios, Remesa, Ahorro"];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
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
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Introducir un monto',
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
              "Agenda de contactos",
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
                  // dropdownValue = value!;
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
          ],
        ),
      ),
    );
  }
}
