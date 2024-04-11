import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged <String> onValue;
  const MessageFieldBox({
    super.key,
    required this.onValue
    });

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final textController = TextEditingController();
    final outlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(color: Colors.transparent));
    final inputDecoration = InputDecoration(
        hintText: 'Escriba aqui su mensaje',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              // final textValue = textController.value.text; 
              final textValue = textController.value.text;
              textController.clear();
              onValue(textValue);
            }, icon: const Icon(Icons.send_outlined)));
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      decoration: inputDecoration,
      controller: textController,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        //Se puede usar onValue
        onValue(value);
        //aunque textController.value.text tambien regresa el valor
      },
    );
  }
}
