import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationButton{
  static Widget navigationButton(Widget rout, BuildContext context, {Color color = const Color(0xff8F0000), String text = "Continuar"}){
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(
              Size.fromHeight(50)),
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape:
          MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ))),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => rout ));
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}