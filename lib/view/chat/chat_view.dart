import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/core/router/router.dart';
import 'package:chat_app/core/theme/theme_cubit.dart';
import 'package:chat_app/view/chat/controller/chat_cubit.dart';
import 'package:chat_app/view/chat/component/message_text_field.dart';
import 'package:chat_app/view/login/login_view.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/custom_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ChatCubit(),
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            final cubit = ChatCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: ThemeCubit.get(context).changeTheme,
                      icon: const Icon(Icons.dark_mode, color: Colors.black38)),
                  IconButton(
                      onPressed: cubit.signOut,
                      icon: const Icon(Icons.logout, color: Colors.black38)),
                ],
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', height: 50),
                    Text('chat', style: Theme.of(context).textTheme.subtitle1!)
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: cubit.messages
                          .orderBy(AppConstants.createdAt, descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text('there is some error happened'));
                        }
                        return ListView.builder(
                          controller: cubit.scrollController,
                          itemCount: snapshot.data!.docs.length,
                          reverse: true,
                          itemBuilder: (context, index) {
                            var message = snapshot.data!.docs[index]['message']
                                .toString();
                            return snapshot.data!.docs[index]['id'] ==
                                    cubit.user.email.toString()
                                ? ChatBubble(message: message)
                                : ChatBubbleForFriend(message: message);
                          },
                        );
                      },
                    ),
                  ),
                  MessageTextField(
                      controller: cubit.messageController,
                      scrollController: cubit.scrollController)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
