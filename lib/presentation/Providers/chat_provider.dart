import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

//El ChangeNotifier es para notificar cuando hay cambios, y con eso podemos redibujar ciertas cosas
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnser getYesNoAnser = GetYesNoAnser();
  List<Message> messageList = [
    Message(text: 'Hi Elon!', fromWho: FromWho.me),
    Message(text: 'Podriamos programar una reunion?', fromWho: FromWho.me),
    Message(text: 'O te gustaria tomar un cafe antes?', fromWho: FromWho.me),
  ];
  Future<void> sendMessge(String text) async {
    if(text.isEmpty)return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    if(text.endsWith('?')){
      yourReply();
    }
    notifyListeners();
    moveScrollBottom();
  }

  Future <void> yourReply() async{
    final yourMessage = await getYesNoAnser.getAnswer();
    messageList.add(yourMessage);
    notifyListeners();
    moveScrollBottom();
  }

  Future <void> moveScrollBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
       duration: const Duration( milliseconds: 300 ),
        curve: Curves.easeOut
        );
  }

}

