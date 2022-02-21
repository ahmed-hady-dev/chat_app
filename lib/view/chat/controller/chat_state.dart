part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

//===============================================================
class SendMessageLoading extends ChatState {}

class SendMessageSuccess extends ChatState {}

class SendMessageFailed extends ChatState {}

//===============================================================
class SignOutLoading extends ChatState {}

class SignOutSuccess extends ChatState {}

class SignOutFailed extends ChatState {}
