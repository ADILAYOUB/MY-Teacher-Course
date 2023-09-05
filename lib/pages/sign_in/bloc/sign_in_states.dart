class SignInState {
  const SignInState({this.email = '', this.password = ''});
  final String email;
  final String password;
// class is immutable and object are also. final and const => veribales can't be changes

// in general if you have immutable class then you can use copywith to create more new objects
  SignInState copyWith({
    // optional named parameters => optional parameters => you can pass some
    String? email,
    String? password,
  }) {
    // returns object
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
