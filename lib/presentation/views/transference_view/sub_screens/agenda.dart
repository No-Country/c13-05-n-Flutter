import 'package:flutter/material.dart';

import '../../../../models/card_model.dart';
import '../../../../models/user_models.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Agenda extends StatefulWidget {
  Agenda({super.key, this.user, this.productList});
  final UserModel? user;
  List<CardModel>? productList;

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    print("From agenda: ${widget.productList}");
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Cuenta propia",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            DropdownMenu<String>(
              label: const Text(
                "Seleccionar",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              width: 380,
              onSelected: (String? value) {
                setState(() {
                  // widget.productList?.first.productName = value!;
                  print(value);
                });
              },
              dropdownMenuEntries:
                  widget.productList!.map<DropdownMenuEntry<String>>((item) {
                return DropdownMenuEntry<String>(
                    value: item.productName, label: item.productName);
              }).toList(),
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
              width: 380,
              label: const Text(
                "Seleccionar",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onSelected: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  list.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const Text(
              "Realizar transferencia entre cuentras propias y ya cargadas",
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
