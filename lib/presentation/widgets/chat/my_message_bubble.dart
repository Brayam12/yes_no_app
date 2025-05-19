import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  //variable de la identidad atómica Message
  final Message message;

  const MyMessageBubble({super.key, 
  //Se añade la variable al contructor
  required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(message.text,
            style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}