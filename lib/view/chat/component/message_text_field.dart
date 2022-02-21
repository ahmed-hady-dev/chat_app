import 'package:chat_app/constants/app_colors.dart';
import 'package:chat_app/core/scroll_service/scroll_service.dart';
import 'package:chat_app/view/chat/controller/chat_cubit.dart';
import 'package:flutter/material.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({
    Key? key,
    required this.controller,
    required this.scrollController,
  }) : super(key: key);
  final TextEditingController controller;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    void sendMessage() {
      if (controller.text.isEmpty) return;
      ChatCubit.get(context).sendMessage();
    }

    return Padding(
      padding:
          const EdgeInsets.only(top: 12.0, bottom: 4.0, right: 8.0, left: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: 'Send Message',
            suffixIcon: IconButton(
                onPressed: sendMessage,
                icon: const Icon(Icons.send, color: AppColors.primaryColor))),
        onSubmitted: (_) => sendMessage,
        onTap: () => ScrollService.scrollToEnd(
            scrollController: scrollController, reversed: true),
      ),
    );
  }
}
