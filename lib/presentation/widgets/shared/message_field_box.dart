import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(color: Colors.transparent));
    final inputDecoration = InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {}, icon: const Icon(Icons.send_outlined)));
    return TextFormField(
      decoration: inputDecoration,
    );
  }
}
