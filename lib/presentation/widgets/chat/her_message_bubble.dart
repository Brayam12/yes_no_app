import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text("Hola mundo", 
            style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(),

        SizedBox(height: 10),


        //Todo:Imagen
      ],
    );
  }
}
class _ImageBubble extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://yesno.wtf/assets/yes/3-422e51268d64d78241720a7de52fe121.gif",
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        ));
  }
}