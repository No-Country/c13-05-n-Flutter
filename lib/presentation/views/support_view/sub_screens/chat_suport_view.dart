import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/support_view/sub_screens/chat_bubble.dart';

class ChatsView extends StatelessWidget {
  static const name = 'personal-info';
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chatea con nosotros"),
        ),
        body: Center(
            child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                    child: ListView(children: const [
                  HerMessageBubble(
                    message:
                        'Hola Estás conversando con el asistente virtual de No Country Wallet',
                  ),
                  HerMessageBubble(
                    message:
                        'Para entregarte ayuda específica, contanos tu duda o problema de la manera más detallada posible. Por ejemplo: no puedo hacer transferencias a terceros desde mi cuenta bancaria.',
                  ),
                ])),
                const MessageFieldBox(),
              ],
            ),
          ),
        )));
  }
}

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    final inputDecoration = InputDecoration(
        hintText: "End your message with '?'",
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              textController.clear();
            },
            icon: const Icon(Icons.send_outlined)));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
