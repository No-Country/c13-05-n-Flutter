import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentBill {
  static void showBill(context, singleActivity) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.90,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 1000,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          height: 65,
                          width: 65,
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaO71OBlcDuI10mkTzSd9KXgQ_Y279buEPyfSYBl2CWQ&s",
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("No \ncountry \nwallet")
                      ],
                    ),
                    const SizedBox(height: 20),
                    Divider(
                      height: 2,
                      color: Colors.grey[500],
                    ),
                    const Text(
                      "Detalles de transferencias a terceros",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fecha \n ${singleActivity["payment_date"]}")
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text("Hora \n14:38")],
                        ),
                        const Column(
                            children: [Text("Comprobante \n3896484900")]),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Divider(
                      height: 2,
                      color: Colors.grey[500],
                    ),
                    const SizedBox(height: 20),
                    const Text('Monto'),
                    Text(singleActivity["amount"]),
                    const SizedBox(height: 20),
                    const Text('Transferencia a:'),
                    Text(singleActivity["payment_name"]),
                    const SizedBox(height: 20),
                    const Text('CUB de destinatario:'),
                    const Text('278567483689687438720'),
                    const SizedBox(height: 20),
                    const Text('Cuenta en:'),
                    const Text('Banco Galicia'),
                    const SizedBox(height: 20),
                    const Text('Originante:'),
                    const Text("Ronald Ramirez"),
                    const SizedBox(height: 20),
                    const Text('CUIT/CUL:'),
                    const Text('21-08567893-7'),
                    const SizedBox(height: 20),
                    const Text('Cuenta debitada:'),
                    const Text('CA\$8794628 9 777-0'),
                    ElevatedButton(
                      child: const Text('Descargar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
