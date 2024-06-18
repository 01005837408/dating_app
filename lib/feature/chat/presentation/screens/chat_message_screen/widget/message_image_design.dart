import 'package:dating_app/feature/chat/data/chat_message_modal/chat_message_modal.dart';
import 'package:flutter/material.dart';

class MessageImageDesign extends StatelessWidget {
  MessageImageDesign({
    super.key,
    required this.message,
    required this.index,
  });

  final ChatMessageModal message;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.imageUrl != null && message.imageUrl!.isNotEmpty)
            ClipRect(
              child: Image.network(
                message.imageUrl!,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image);
                },
              ),
            )
          else
            const Icon(Icons.image_not_supported),
        ],
      ),
    );
  }
}

// import 'package
// /feature/chat/data/chat_message_modal/chat_message_modal.dart';
// import 'package
// /material.dart';
//
// class MessageImageDesign extends StatelessWidget {
//   MessageImageDesign({
//     super.key,
//     required this.message,
//     required this.index,
//   });
//   ChatMessageModal message ;
//   final int index ;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 150,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
// // ClipRect(
// // child: Image.network(message.imageUrl ?? "", fit: BoxFit.fitWidth,),
// // )
//         ],
//       ),
//     );
//   }
// }
