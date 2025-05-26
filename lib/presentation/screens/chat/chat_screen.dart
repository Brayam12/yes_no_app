import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/Chat_Provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('lib/images/Karina.jpeg'),
          )
        ),
        title: Text("Mi amor💓"),
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
                //enlaza el controlador creado en chatprovider
                controller: chatProvider.chatScrollController, 
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  //Instancia que sabra de quien es el mensaje
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message, icon: Icon,)
                    : MyMessageBubble(message: message);
                },
              ),
            ),
            // Aquí iría el MessageFieldBox si deseas escribir mensajes
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
              ),
          ],
        ),
      ),
    );
  }
}
