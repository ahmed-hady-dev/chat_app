import 'package:chat_app/widgets/custom_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
//===============================================================
  bool isPassword = true;
  bool isPasswordConfirm = true;
  bool isChecked = false;
  var auth = FirebaseAuth.instance;
  FocusNode passwordFocusNode = FocusNode();
  FocusNode passwordConfirmFocusNode = FocusNode();
  IconData suffix = Icons.visibility_outlined;
  IconData suffixConfirm = Icons.visibility_outlined;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SignUpChangePasswordVisibilityState());
  }

  //===============================================================

  void changeConfirmPasswordVisibility() {
    isPasswordConfirm = !isPasswordConfirm;
    suffixConfirm = isPasswordConfirm
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(SignUpChangePasswordVisibilityState());
  }

//===============================================================
  void signUpWithEmail() async {
    emit(SignUpLoadingState());
    try {
      if (!formKey.currentState!.validate()) {
        emit(SignUpInitial());
        return;
      }
      if (passwordController.text != confirmPasswordController.text) {
        showSnackBar(
            msg: 'Make sure that password is the same',
            snackBarStates: SnackBarStates.warning);
        emit(SignUpInitial());
        return;
      }
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim().toLowerCase(),
          password: passwordController.text.trim());
      print(userCredential.user);
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailedState(msg: e.message.toString()));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(SignUpFailedState(msg: e.toString()));
    }
  }

//===============================================================
  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordFocusNode.dispose();
    passwordConfirmFocusNode.dispose();
    return super.close();
  }
}
