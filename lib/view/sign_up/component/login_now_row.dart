import 'package:chat_app/core/router/router.dart';
import 'package:chat_app/view/login/login_view.dart';
import 'package:flutter/material.dart';

class LoginNowRow extends StatelessWidget {
  const LoginNowRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Have an account?', style: TextStyle()),
        TextButton(
            onPressed: () => MagicRouter.navigateAndPopAll(const LoginView()),
            child: const Text('Login Now.',
                style: TextStyle(color: Color(0xff4338CA)))),
      ],
    );
  }
}
