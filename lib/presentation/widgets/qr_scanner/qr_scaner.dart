import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QRViewExample extends StatelessWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: Container(
              color: color.primary,
              child: const FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Escanea el codigo',
                          style: TextStyle(
                              // backgroundColor: color.primary,
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Container(
      color: const Color.fromARGB(255, 220, 230, 239),
      child: Center(
        child: Stack(
          children: [
            Container(
              width: scanArea, // Ancho del recuadro
              height: scanArea, // Alto del recuadro
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                    255, 188, 184, 184), // Color de fondo gris
                borderRadius:
                    BorderRadius.circular(10.0), // Radio de las esquinas
              ),
            ),
            Container(
              width: scanArea, // Ancho del recuadro
              height: scanArea, // Alto del recuadro
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red, // Color del borde (rojo en este caso)
                  width: 2.0, // Ancho del borde
                ),
                borderRadius:
                    BorderRadius.circular(10.0), // Radio de las esquinas
              ),
            ),
          ],
        ),
      ),
    );
  }
}
