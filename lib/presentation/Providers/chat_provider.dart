import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

//El ChangeNotifier es para notificar cuando hay cambios, y con eso podemos redibujar ciertas cosas
class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hi Elon!', fromWho: FromWho.me),
    Message(text: 'Podriamos programar una reunion?', fromWho: FromWho.me),
    Message(text: 'O te gustaria tomar un cafe antes?', fromWho: FromWho.me),
  ];
  Future <void> sendMessge(String text) async {
    //To Do implemetar metodo 
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners();


  }
}
