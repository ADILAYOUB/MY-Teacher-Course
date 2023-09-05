class RegisterState {
  const RegisterState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.confirmpassword = '',
  });
  final String username;
  final String email;
  final String password;
  final String confirmpassword;

  RegisterState copyWith({
    // optimal named parameters bec we use name to assign values in ---_bloc.dart
    String? username,
    String? email,
    String? password,
    String? confirmpassword,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmpassword: confirmpassword ?? this.confirmpassword,
    );
  }
}
