import 'package:chat_app/core/router/router.dart';
import 'package:chat_app/view/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';

class SignUpNowRow extends StatelessWidget {
  const SignUpNowRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Don\'t have account?', style: TextStyle()),
        TextButton(
            onPressed: () => MagicRouter.navigateAndPopAll(const SignUpView()),
            child: const Text('SignUp Now.',
                style: TextStyle(color: Color(0xff4338CA)))),
      ],
    );
  }
}
