import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/pages/register/bloc/register_event.dart';
import 'package:myteacher/pages/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmpasswordEvent>(_confirmpasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _confirmpasswordEvent(
      ConfirmpasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(confirmpassword: event.confirmpassword));
  }
}
