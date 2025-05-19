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
            backgroundImage: NetworkImage("https://media-qro1-1.cdn.whatsapp.net/v/t61.24694-24/473402901_659118503943741_1382192674907939930_n.jpg?ccb=11-4&oh=01_Q5Aa1QE65hu7To_mXj_sOs7gIe_0V8OgrwSGo_hX2wxyQ8iJkA&oe=6817844C&_nc_sid=5e03e0&_nc_cat=104"),
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
                    ? HerMessageBubble(message: message)
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
