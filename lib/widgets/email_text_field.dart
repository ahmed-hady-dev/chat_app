import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required this.controller,
    this.onFieldSubmitted,
  }) : super(key: key);

  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          onFieldSubmitted: onFieldSubmitted,
          decoration: const InputDecoration(hintText: 'Enter your email'),
          validator: (value) {
            if (value!.isEmpty) {
              return "Email must not be empty";
            } else if (!value.contains('@')) {
              return "Please enter a valid email!";
            } else {
              return null;
            }
          }),
    );
  }
}
