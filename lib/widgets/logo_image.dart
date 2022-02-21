import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36.0),
      child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Image.asset('assets/images/logo.png')),
    );
  }
}
