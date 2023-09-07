import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String message;
  const HerMessageBubble({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 156, 191, 208),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text(message),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
      ),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Container(
        decoration: BoxDecoration(
            color: colors.primary, borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'kkk',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }
}
