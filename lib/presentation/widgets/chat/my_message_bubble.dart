import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  //variable de la identidad atómica Message
  final String message;

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
            child: Text(message, 
            style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}