import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

//El ChangeNotifier es para notificar cuando hay cambios, y con eso podemos redibujar ciertas cosas
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  List<Message> messageList = [
    Message(text: 'Hi Elon!', fromWho: FromWho.me),
    Message(text: 'Podriamos programar una reunion?', fromWho: FromWho.me),
    Message(text: 'O te gustaria tomar un cafe antes?', fromWho: FromWho.me),
  ];
  Future<void> sendMessge(String text) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if(text.isEmpty)return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners();
    moveScrollBottom();
  }

  void moveScrollBottom(){
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
       duration: const Duration( milliseconds: 300 ),
        curve: Curves.easeOut
        );
  }

}

