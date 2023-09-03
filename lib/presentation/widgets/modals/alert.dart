import 'package:flutter/material.dart';

class Alert {
  static void runAlert(String message, BuildContext context) {
    showModalBottomSheet<void>(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final color = Theme.of(context).colorScheme.primary;
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(message),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff8f0000))),
                  child: const Text(
                    'Cerrar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
