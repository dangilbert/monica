import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../../service/navigation_service.dart';
import 'package:get_it/get_it.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginTapped){
      yield LoginLoadingState();
      await Future.delayed(Duration(seconds: 10));
      if (event.host == "test") {
        NavigationService navigationService = GetIt.instance.get();
        navigationService.navigateToReplacing(Routes.Home);
      } else {
        yield LoginErrorState();
      }
    }
  }
}
