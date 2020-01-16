import 'package:meta/meta.dart';

@immutable
abstract class LoginState {}
  
class InitialLoginState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {}


