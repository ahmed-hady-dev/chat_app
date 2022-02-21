import 'package:flutter/material.dart';

class ChatAppText extends StatelessWidget {
  const ChatAppText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Chat App',
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Inter', fontSize: 24));
  }
}
