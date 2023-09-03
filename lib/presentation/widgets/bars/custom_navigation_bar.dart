import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/views.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xff8F0000),
          currentIndex: currentIndex,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_rounded), label: 'Actividad'),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle_rounded),
                label: ProfileView.name),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc), label: SettingsView.name),
          ],
        ),
        const Positioned(
          top: 0, // Coloca el semicírculo en la parte superior
          left: 0,
          right: 0,
          child: SemicircleContainer(),
        ),
      ],
    );
  }
}

class SemicircleContainer extends StatelessWidget {
  const SemicircleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2, // Altura del semicírculo
      child: CustomPaint(
        painter: SemicirclePainter(),
      ),
    );
  }
}

class SemicirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2C3E50) // Color del fondo
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(
          0, size.height) // Inicia el trazo en la esquina inferior izquierda
      ..lineTo(size.width, size.height) // Dibuja una línea horizontal
      ..lineTo(size.width, size.height / 2) // Dibuja una línea hacia arriba
      ..arcTo(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 4, // Radio del semicírculo
        ),
        0,
        -3.1416, // Ángulo de 180 grados en radianes (semicírculo)
        false,
      )
      ..lineTo(
          0,
          size.height /
              2); // Dibuja una línea hacia la izquierda para cerrar el camino

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
