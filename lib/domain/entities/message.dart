enum FromWho { me, hers }


//Identidad atomica: La entidad mas pequeña
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({
  required this.text, 
  this.imageUrl,
  required this.fromWho
  });
}