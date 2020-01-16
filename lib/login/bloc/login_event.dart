import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {}

class LoginTapped extends LoginEvent {

  LoginTapped(this.host, this.token);

  final String host;
  final String token;
}
