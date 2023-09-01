import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/add_product_view/add_name.dart';
import 'package:multi_bank/presentation/views/add_product_view/add_person_id.dart';

class AddDateView extends StatelessWidget {
  const AddDateView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final controller = TextEditingController();
    String value = controller.text;

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
                    "vencimiento",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  // Note: Same code is applied for the TextFormField as well
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    "codigo de seguridad",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  // Note: Same code is applied for the TextFormField as well
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                    ),
                  ),

                  Container(
                    height: height * 0.06,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      color: const Color(0xFF113CB1),
                      borderRadius: BorderRadius.circular(
                          8), // Ajusta el valor según tus preferencias
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddPersonIDView(),
                          ),
                        );
                      },
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
