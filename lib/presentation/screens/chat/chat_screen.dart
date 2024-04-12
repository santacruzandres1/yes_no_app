import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/Providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/him_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn.urbantecno.com/urbantecno/s/2023-01-05-11-27-elon-musk.png'),
          ),
        ),
        title: const Text('Elon '),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.yours)
                    ?  HimMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),
            //Caja de texto de mensajeria
            //  MessageFieldBox(onValue: (value) => chatProvider.sendMessge(value),), //manera larga
            MessageFieldBox(
              onValue: chatProvider.sendMessge,
            ), //Forma corta
            //const Text('Roble Sistemas © ')
          ],
        ),
      ),
    );
  }
}
