import 'package:chat_app/core/router/router.dart';
import 'package:chat_app/view/chat/chat_view.dart';
import 'package:chat_app/view/sign_up/controller/sign_up_cubit.dart';
import 'package:chat_app/view/sign_up/component/login_now_row.dart';
import 'package:chat_app/view/sign_up/component/sign_up_now_widget.dart';
import 'package:chat_app/widgets/chat_app_text.dart';
import 'package:chat_app/widgets/confirm_password_text_field.dart';
import 'package:chat_app/widgets/custom_snack_bar.dart';
import 'package:chat_app/widgets/email_text_field.dart';
import 'package:chat_app/widgets/loading_widget.dart';
import 'package:chat_app/widgets/logo_image.dart';
import 'package:chat_app/widgets/main_button.dart';
import 'package:chat_app/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpFailedState) {
              showSnackBar(
                  msg: state.msg, snackBarStates: SnackBarStates.error);
            }
            if (state is SignUpSuccessState) {
              showSnackBar(
                  msg: 'SignUp Successfully',
                  snackBarStates: SnackBarStates.success);

              MagicRouter.navigateAndPopAll(const ChatView());
            }
          },
          builder: (context, state) {
            final cubit = SignUpCubit.get(context);
            return Scaffold(
              body: Form(
                key: cubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    const LogoImage(),
                    const ChatAppText(),
                    const SignUpNowWidget(),
                    const SizedBox(height: 12),
                    EmailTextField(
                        controller: cubit.emailController,
                        onFieldSubmitted: (p0) =>
                            cubit.passwordFocusNode.requestFocus()),
                    PasswordTextField(
                        controller: cubit.passwordController,
                        obscureText: cubit.isPassword,
                        onPressed: cubit.changePasswordVisibility,
                        icon: cubit.suffix,
                        focusNode: cubit.passwordFocusNode,
                        onFieldSubmitted: (p0) =>
                            cubit.passwordConfirmFocusNode.requestFocus()),
                    ConfirmPasswordTextField(
                        controller: cubit.confirmPasswordController,
                        obscureText: cubit.isPasswordConfirm,
                        onPressed: cubit.changeConfirmPasswordVisibility,
                        focusNode: cubit.passwordConfirmFocusNode,
                        icon: cubit.suffixConfirm,
                        onFieldSubmitted: (p0) {
                          cubit.signUpWithEmail();
                          FocusScope.of(context).unfocus();
                        }),
                    MainButton(
                      onPressed: () {
                        cubit.signUpWithEmail();
                        FocusScope.of(context).unfocus();
                      },
                      child: state is SignUpLoadingState
                          ? const LoadingWidget()
                          : const Text('SignUp',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    const LoginNowRow()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
