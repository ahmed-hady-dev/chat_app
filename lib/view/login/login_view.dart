import 'package:chat_app/core/router/router.dart';
import 'package:chat_app/view/chat/chat_view.dart';
import 'package:chat_app/view/login/controller/login_cubit.dart';
import 'package:chat_app/view/login/component/login_now_widget.dart';
import 'package:chat_app/view/login/component/sign_up_now_row.dart';
import 'package:chat_app/widgets/app_name.dart';
import 'package:chat_app/widgets/custom_snack_bar.dart';
import 'package:chat_app/widgets/email_text_field.dart';
import 'package:chat_app/widgets/loading_widget.dart';
import 'package:chat_app/widgets/logo_image.dart';
import 'package:chat_app/widgets/main_button.dart';
import 'package:chat_app/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginFailedState) {
                showSnackBar(
                    msg: state.msg, snackBarStates: SnackBarStates.error);
              }
              if (state is LoginSuccessState) {
                showSnackBar(
                    msg: 'Login Successfully',
                    snackBarStates: SnackBarStates.success);
                MagicRouter.navigateAndPopAll(const ChatView());
              }
            },
            builder: (context, state) {
              final cubit = LoginCubit.get(context);
              return Form(
                key: cubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    const LogoImage(),
                    const AppName(),
                    const LoginNowWidget(),
                    const SizedBox(height: 12),
                    EmailTextField(
                        controller: cubit.emailController,
                        onFieldSubmitted: (_) =>
                            cubit.passwordFocusNode.requestFocus()),
                    PasswordTextField(
                        controller: cubit.passwordController,
                        obscureText: cubit.isPassword,
                        onPressed: cubit.changePasswordVisibility,
                        icon: cubit.suffix,
                        focusNode: cubit.passwordFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).unfocus();
                          cubit.loginWithEmail();
                        }),
                    MainButton(
                        onPressed: () {
                          cubit.loginWithEmail();
                          FocusScope.of(context).unfocus();
                        },
                        child: state is LoginLoadingState
                            ? const LoadingWidget()
                            : const Text('Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))),
                    const SignUpNowRow()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
