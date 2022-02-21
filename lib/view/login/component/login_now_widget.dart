import 'package:flutter/material.dart';

class LoginNowWidget extends StatelessWidget {
  const LoginNowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Login Now',
        style: TextStyle(fontFamily: 'Inter', fontSize: 20),
        textAlign: TextAlign.start,
      ),
    );
  }
}
