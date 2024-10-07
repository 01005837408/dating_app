import 'package:dating_app/feature/chat/data/chat_cubit/chat_cubit.dart';
import 'package:dating_app/feature/chat/data/chat_cubit/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/chat/screen/chat_screen.dart';

class ChatUserCard extends StatelessWidget {
  final UserModel user;

  const ChatUserCard(
      {required this.user, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatCubit()..fetchUserProfileAndLastMessage(user.uid),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          if (state is ChatLoading) {
            return const ListTile(
              title: Align(
                  alignment: Alignment.centerRight,
                  child: CircularProgressIndicator()),
            );
          } else if (state is UserProfileAndLastMessageLoaded) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(user: user),
                  ),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: state.profilePicture.isNotEmpty
                      ? NetworkImage(state.profilePicture)
                      : const AssetImage('assets/images/Home Screen-image.jpg')
                          as ImageProvider,
                ),
                title: Text('${user.fname} ${user.lname}',
                style:const TextStyle(
                  fontWeight: FontWeight.bold,
                   fontSize: 18,
                ),
                ),
                subtitle: Row(
                  children: [
                    
                     
                    Text(
                     // "last message",
                       state.lastMessage, // Show the last message and timestamp
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        color: Color(0xff424242),
                        fontSize: 12,
                    
                      ),
                    ),
                    Spacer(),
                     Text(state.lastMessageTime,style:const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                    
                      ),),
                  ],
                ),
                isThreeLine: true,
                
              ),
            );
          } else if (state is ChatError) {
            return  ListTile(
              leading: const CircleAvatar(
                backgroundImage:  AssetImage('assets/images/Home Screen-image.jpg')
                       
              ),
              title: Text(user.fname),
              subtitle: const Text('No message'),
              isThreeLine: true,
            );
          }
          return const SizedBox.shrink(); // Fallback widget
        },
      ),
    );
  }
}
