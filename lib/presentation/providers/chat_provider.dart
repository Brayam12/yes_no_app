import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';



class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  //Controlador que maneja la posición del scroll
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList =[
    
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me, sentAt: DateTime.now(), );
    //Aagregar un nuevo mensaje a la lista
    messageList.add(newMessage);

    //Detectar si el usuario hizo una pregunta
    if(text.endsWith('?')) {
      herReply();
    }

    
    
    
    

    //Notifica a provider que algo cambio 
    notifyListeners();
    moveScrollToBottom();
    // Mueve el scroll hacia abajo
  }
  Future <void> moveScrollToBottom() async{
        //animación de scroll
    await Future.delayed(const Duration(milliseconds: 100));
      chatScrollController.animateTo(
          //offset: posición del maximo scroll posible
        chatScrollController.position.maxScrollExtent, 
        duration: const Duration(milliseconds: 300), 
        curve: Curves.easeOut
    );
  }
  //Crear la respuesta de ella
  Future <void> herReply () async {
    //obtener el mensaje de la petición
    final herMessage = await getYesNoAnswer.getAnswer();

    //Añadimos el mensaje de ella a lista de mensajes
    messageList.add(herMessage);

    //Notifica a provider que algo cambio
    notifyListeners();

    //Mover el scroll hasta el ultimo mensaje
    moveScrollToBottom();
  }
}