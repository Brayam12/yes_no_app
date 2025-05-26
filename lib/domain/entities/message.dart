enum FromWho { me, hers }

// Identidad atómica: La entidad más pequeña
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime sentAt;
  

  Message({
    required this.text, 
    this.imageUrl,
    required this.fromWho,
    required this.sentAt, 
   
  });
}
