import 'package:flutter/material.dart';

import '../../../widgets/inputs/custom_text_form_field.dart';
import '../../home_view/sub_screens/home_tab_view.dart';

class ComentsView extends StatelessWidget {
  static const name = 'personal-info';
  const ComentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comentarios y sugerencias"),
      ),
      body: Center(
          child: Column(children: [
        const Text('Nombre y Apellido',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )),
        const CustomTextFormField(
          hint: 'Ingresa tu nombre y apellido',
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Correo electronico',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )),
        const CustomTextFormField(
          hint: 'Ingresa una direccion de email valida',
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Deja tu mensaje',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )),
        const CustomTextFormField(
          hint: 'Escribe tu consulta y nos pondremos en contacto.',
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: height * 0.06,
          width: width * 0.95,
          decoration: BoxDecoration(
            color: color.primary,
            borderRadius: BorderRadius.circular(
                8), // Ajusta el valor según tus preferencias
          ),
          child: MaterialButton(
            onPressed: () {
              AlertDialog(
                title: const Text('Actualizar perfil'),
                content: const Text(
                    'Los cambios se veran reflejados en menos de 24horas.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Text('Cerrar'),
                  ),
                ],
              );
            },
            child: const Text('Enviar mensaje',
                style: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Roboto')),
          ),
        ),
      ])),
    );
  }
}
