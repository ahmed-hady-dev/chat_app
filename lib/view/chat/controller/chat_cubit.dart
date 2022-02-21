import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/core/router/router.dart';
import 'package:chat_app/core/scroll_service/scroll_service.dart';
import 'package:chat_app/view/login/login_view.dart';
import 'package:chat_app/widgets/custom_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
//===============================================================
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser!;
  CollectionReference users =
      FirebaseFirestore.instance.collection(AppConstants.users);
  CollectionReference messages =
      FirebaseFirestore.instance.collection(AppConstants.messages);
  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();
//===============================================================
  void signOut() async {
    emit(SignOutLoading());
    try {
      await firebaseAuth.signOut();
      showSnackBar(msg: 'Signed out', snackBarStates: SnackBarStates.success);
      MagicRouter.navigateAndPopAll(const LoginView());
      emit(SignOutSuccess());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      showSnackBar(
          msg: e.code.toString(), snackBarStates: SnackBarStates.error);
      emit(SignOutFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      showSnackBar(msg: e.toString(), snackBarStates: SnackBarStates.error);
      emit(SignOutFailed());
    }
  }

//===============================================================
  void sendMessage() async {
    emit(SendMessageLoading());
    try {
      await messages.add({
        AppConstants.message: messageController.text.trim(),
        AppConstants.createdAt: DateTime.now(),
        'id': user.email.toString(),
      });
      messageController.clear();
      ScrollService.scrollToEnd(
          scrollController: scrollController, reversed: true);
      emit(SendMessageSuccess());
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      showSnackBar(
          msg: e.code.toString(), snackBarStates: SnackBarStates.error);
      emit(SendMessageFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      showSnackBar(msg: e.toString(), snackBarStates: SnackBarStates.error);
      emit(SendMessageFailed());
    }
  }

//===============================================================

  @override
  Future<void> close() {
    scrollController.dispose();
    messageController.dispose();
    return super.close();
  }
}
