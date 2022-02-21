import 'package:flutter/material.dart';

class SignUpNowWidget extends StatelessWidget {
  const SignUpNowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'SigUp Now',
        style: TextStyle(fontFamily: 'Inter', fontSize: 20),
        textAlign: TextAlign.start,
      ),
    );
  }
}
