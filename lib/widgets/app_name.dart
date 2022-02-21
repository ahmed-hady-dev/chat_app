import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  const AppName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Chat App',
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Inter', fontSize: 24));
  }
}
