import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';



class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  //Controlador que maneja la posición del scroll
  List<Message> messageList =[
    Message(text: "Hola Salazar", fromWho: FromWho.me),
    Message(text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me),
    Message(text: "Hola Brayam", fromWho: FromWho.hers),
    
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    
    
    
    final newMessage = Message(text: text, fromWho: FromWho.me);
    // Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    print("Mensaje número: ${messageList.length}");

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
}